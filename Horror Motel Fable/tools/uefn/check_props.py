# R3 batch 02 checks after prop dressing (editor-side, no play session):
#  door_clearance(): every Door in door_window_schedule.csv keeps a 1.2 m deep clear zone (opening width + 0.3 m)
#                    on both sides, from floor to 2.0 m, free of any colliding R3_PROPS / R3_FURNISH actor.
#  device_reach():   every interactive R3_DEVICE button can be reached: at least one of 16 stand points
#                    (1.0-1.6 m away, floor height, capsule-free) has an unobstructed eye-level line to it.
#  envelope():       every prop's bounds stay inside its room envelope (ROOM_COORDINATE_REGISTER.csv) + 5 cm.
import csv, math, os, unreal

REPO = r"C:\Users\utente\AppData\Local\Temp\claude\3c5725dd4b11b696\8a0d6a33-3541-4d51-a0c1-4135f1b817d3\scratchpad\repo_cs\r\Horror Motel Fable"
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
Z0 = 386.0


def E(x, y, z):
    return unreal.Vector((y - 36.0) * 100.0, (x - 42.0) * 100.0, Z0 + z * 100.0)


def tagged(*tags):
    return [a for a in EAS.get_all_level_actors() if set(str(t) for t in a.tags) & set(tags)]


def colliding_bounds(a):
    out = []
    for c in a.get_components_by_class(unreal.PrimitiveComponent):
        if c.get_collision_enabled() == unreal.CollisionEnabled.NO_COLLISION:
            continue
        if isinstance(c, unreal.StaticMeshComponent) and (not c.static_mesh or not c.is_visible()):
            continue
        o, e, r = unreal.SystemLibrary.get_component_bounds(c)
        out.append((o.x - e.x, o.x + e.x, o.y - e.y, o.y + e.y, o.z - e.z, o.z + e.z))
    return out


def door_clearance():
    props = tagged('R3_PROPS', 'R3_FURNISH', 'R3_DRESSING')
    pb = [(a.get_actor_label(), b) for a in props for b in colliding_bounds(a)]
    bad, n = [], 0
    for r in csv.DictReader(open(os.path.join(REPO, 'door_window_schedule.csv'), encoding='utf-8')):
        if r['Type'].strip().lower() != 'door':
            continue
        n += 1
        fz = 3.6 if r['Floor'] == 'UF' else 0.0
        c = E(float(r['Center_X_m']), float(r['Center_Y_m']), fz)
        half = (float(r['Clear_Width_m']) + 0.3) * 50.0
        o = r['Orientation'].strip().lower()
        if o in ('east', 'west'):   # normal along design X = engine Y
            box = (c.x - half, c.x + half, c.y - 120, c.y + 120)
        else:
            box = (c.x - 120, c.x + 120, c.y - half, c.y + half)
        z0, z1 = c.z + 5, c.z + 200
        for lab, b in pb:
            if b[0] < box[1] - 2 and b[1] > box[0] + 2 and b[2] < box[3] - 2 and b[3] > box[2] + 2 and b[4] < z1 and b[5] > z0:
                bad.append((r['Opening_ID'], lab))
    return n, bad


def device_reach(btags=('R3_PROPS', 'R3_FURNISH', 'R3_GREYBOX', 'R3_DRESSING'), why=False):
    world = unreal.EditorLevelLibrary.get_editor_world()
    devs = [a for a in tagged('R3_DEVICE') if a.get_class().get_name().startswith('Device_Button')
            or 'Button' in a.get_class().get_name()]
    blockers = tagged(*btags)
    pb = [b for a in blockers for b in colliding_bounds(a)]
    bad = []
    for d in devs:
        p = d.get_actor_location()
        ok = False
        blk = {}
        for k in range(16):
            ang = math.radians(k * 22.5)
            for dist in (100.0, 160.0):
                sx, sy = p.x + math.cos(ang) * dist, p.y + math.sin(ang) * dist
                # floor under the stand point: nearest slab below device + 0..1.9 m
                hit = unreal.SystemLibrary.line_trace_single(world, unreal.Vector(sx, sy, p.z + 50), unreal.Vector(sx, sy, p.z - 300),
                                                             unreal.TraceTypeQuery.TRACE_TYPE_QUERY1, False, [d],
                                                             unreal.DrawDebugTrace.NONE, True)
                if hit is None or not hit.to_tuple()[0]:
                    continue
                fz = hit.to_tuple()[4].z
                if p.z - fz > 220:
                    continue
                # capsule (r 35 cm, 1.8 m) must not overlap colliding prop/greybox bounds
                if any(b[0] < sx + 35 and b[1] > sx - 35 and b[2] < sy + 35 and b[3] > sy - 35 and b[4] < fz + 180 and b[5] > fz + 10 for b in pb):
                    continue
                eye = unreal.Vector(sx, sy, fz + 150)
                h2 = unreal.SystemLibrary.line_trace_single(world, eye, p, unreal.TraceTypeQuery.TRACE_TYPE_QUERY1, False, [],
                                                            unreal.DrawDebugTrace.NONE, True)
                t2 = h2.to_tuple() if h2 else None
                if t2 is None or not t2[0] or t2[9] == d or t2[3] > (p - eye).length() - 30:
                    ok = True
                    break
                blk[t2[9].get_actor_label() if t2[9] else '?'] = blk.get(t2[9].get_actor_label() if t2[9] else '?', 0) + 1
            if ok:
                break
        if not ok:
            bad.append((d.get_actor_label(), max(blk, key=blk.get) if blk else 'no stand point') if why else d.get_actor_label())
    return len(devs), bad


def envelope():
    env = {}
    for r in csv.DictReader(open(os.path.join(REPO, 'ROOM_COORDINATE_REGISTER.csv'), encoding='utf-8')):
        if r['ID'].startswith('ROOM-'):
            env['ROOM ' + r['ID'][5:]] = tuple(float(r[k]) for k in ('X_Min_m', 'X_Max_m', 'Y_Min_m', 'Y_Max_m'))
    rooms = {r['Asset_ID']: r['Room_ID'] for r in csv.DictReader(open(os.path.join(REPO, 'room_furnishing_schedule.csv'), encoding='utf-8'))}
    bad = []
    for a in tagged('R3_PROPS'):
        aid = [str(t) for t in a.tags if str(t) != 'R3_PROPS'][0]
        x0, x1, y0, y1 = env[rooms[aid]]
        for b in colliding_bounds(a) or [None]:
            if b is None:
                continue
            # engine X -> design Y, engine Y -> design X
            dx0, dx1 = b[2] / 100 + 42, b[3] / 100 + 42
            dy0, dy1 = b[0] / 100 + 36, b[1] / 100 + 36
            if dx0 < x0 - 0.05 or dx1 > x1 + 0.05 or dy0 < y0 - 0.05 or dy1 > y1 + 0.05:
                bad.append((a.get_actor_label(), round(dx0, 2), round(dx1, 2), round(dy0, 2), round(dy1, 2)))
                break
    return bad


def wall_penetration(tags=('R3_PROPS', 'R3_DRESSING'), tol=6.0):
    walls = [(a.get_actor_label(), b) for a in tagged('R3_GREYBOX')
             if not set(str(t) for t in a.tags) & {'Slabs', 'Roof'} for b in colliding_bounds(a)]
    bad = []
    for a in tagged(*tags):
        for b in colliding_bounds(a):
            for wl, w in walls:
                dx = min(b[1], w[1]) - max(b[0], w[0]); dy = min(b[3], w[3]) - max(b[2], w[2]); dz = min(b[5], w[5]) - max(b[4], w[4])
                if dx > tol and dy > tol and dz > tol:
                    bad.append((a.get_actor_label(), wl, round(min(dx, dy))))
    return sorted(set(bad))


def stair_clear():
    # STAIR_PLAN_R2: assembly X22.65-25.35 Y52.45-56.17 + approaches Y51.10-52.45 (X22.50-25.50), both floors
    zones = [(22.5, 25.5, 51.1, 56.32)]
    bad = []
    for a in tagged('R3_PROPS', 'R3_DRESSING'):
        for b in colliding_bounds(a):
            x0, x1, y0, y1 = b[2] / 100 + 42, b[3] / 100 + 42, b[0] / 100 + 36, b[1] / 100 + 36
            for z in zones:
                if x0 < z[1] and x1 > z[0] and y0 < z[3] and y1 > z[2]:
                    bad.append(a.get_actor_label())
    return sorted(set(bad))
