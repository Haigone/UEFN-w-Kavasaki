# R3 batch 02 / GATE F: replace R3_FURNISH blockout boxes with first-party Fortnite/UEFN props.
# Runs inside the UEFN editor:  ns={}; exec(open(path).read(), ns); print(ns['place_props'](dry=True))
# For every room_furnishing_schedule.csv row it:
#   * picks the mapped Epic prop (PROPS table; front = prop local +Y, measured in batch 02),
#   * finds the item's back by tracing both ways along the blockout depth axis to the nearest greybox wall,
#   * scales the prop to the scheduled Width x Depth x Height (proportions kept within MAXR, never wider
#     or deeper than the schedule + 5 %), and puts its back face on the blockout's back face, bottom on Z_m,
#   * tags it R3_PROPS + Asset_ID, then (dry=False) deletes the replaced blockout.
# Rows mapped to KEEP keep their blockout (documented logical/gameplay items). place_furnishing.py can
# always rebuild the blockout from the CSV, so the replacement is reversible.
import csv, json, math, os, unreal

REPO = r"C:\Users\utente\AppData\Local\Temp\claude\3c5725dd4b11b696\8a0d6a33-3541-4d51-a0c1-4135f1b817d3\scratchpad\repo_cs\r\Horror Motel Fable"
PROBE = 'C:/Users/utente/AppData/Local/Temp/claude/3c5725dd4b11b696/8a0d6a33-3541-4d51-a0c1-4135f1b817d3/scratchpad/probe.json'
LOG = 'C:/Users/utente/AppData/Local/Temp/claude/3c5725dd4b11b696/8a0d6a33-3541-4d51-a0c1-4135f1b817d3/scratchpad/props_log.json'
TAG, FTAG = 'R3_PROPS', 'R3_FURNISH'
Z0 = 386.0
MAXR = 1.35
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
SUB = '/Game/Athena/Apollo/Environments/BuildingActors/Suburban/Props/'
PROPS = {
    'BED': SUB + 'Apollo_Suburban_Bed_01',
    'CHILD_BED': '/Game/Building/ActorBlueprints/Neo/Props/NeoTilted_SingleBed',
    'NIGHT_L': SUB + 'Apollo_Suburban_NightStand_01',
    'NIGHT_R': SUB + 'Apollo_Suburban_NightStand_01',
    'WARDROBE': '/Game/Athena/Apollo/Environments/BuildingActors/Tinfoil/Props/Apollo_Tinfoil_Wardrobe_01',
    'DESK': SUB + 'Apollo_Suburban_Desk_01_NoLight',
    'CRT': SUB + 'Apollo_Suburban_TV_03',
    'CHAIR': SUB + 'Apollo_Suburban_DiningChair_01',
    'PHONE': '/CRG_Props/SetupAssets/Blueprints/CP_PhoneItIn_01',
    'LAMP': SUB + 'Apollo_Suburban_Light_02_Off',
    'VANITY': SUB + 'Apollo_Suburban_Sink_01',
    'TOILET': SUB + 'Apollo_Suburban_Toilet_01',
    'SHOWER': SUB + 'Apollo_Suburban_Shower_01',
    'MIRROR': SUB + 'Apollo_Suburban_MedicineCabinet_01',
    'SUITCASE': '/Game/Athena/BuildingActors/Props/Building/ActorBlueprints/Containers/Athena_Prop_Storage_Suitcases_01',
    'PHOTO_WALL': SUB + 'Apollo_Suburban_Picture_Frame_04_Wood',
    'DIARY': '/Game/Athena/Apollo/Environments/BuildingActors/Agency/Props/Apollo_Agency_Midas_Book_02',
    'TOYBOX': '/Game/Building/ActorBlueprints/Neo/Props/NeoTilted_HopeChest',
    'PHOTO_1': SUB + 'Apollo_Suburban_Picture_Frame_01',
    'CLOCK': '/Game/Athena/BuildingActors/Props/Building/ActorBlueprints/Containers/Athena_Prop_WildWest_WallClock_01',
    'OWNER_PORTRAIT': SUB + 'Apollo_Suburban_Picture_Frame_01',
    'HEADBOARD': 'MERGE',       # part of the bed prop
    'BATTERY': 'KEEP',          # 8 x 5 x 14 cm pickup marker; no first-party battery prop exists
    'SECRET_PANEL': 'KEEP',     # gameplay wall panel (wallpaper material), must stay a flush box
}
for k in ('PHOTO_2', 'PHOTO_3', 'PHOTO_4'):
    PROPS[k] = PROPS['PHOTO_1']
# vertical stacking: (copies, gap) for wide boards
STACK = {'PHOTO_WALL': 2}


def kind(aid):
    k = aid.split('_', 1)[1]
    return k


def W(x, y, z):
    return unreal.Vector((y - 36.0) * 100.0, (x - 42.0) * 100.0, Z0 + z * 100.0)


def cls_of(pkg):
    n = pkg.split('/')[-1]
    return unreal.load_class(None, pkg + '.' + n + '_C')


def trace(world, a, b, ignore):
    h = unreal.SystemLibrary.line_trace_single(world, a, b, unreal.TraceTypeQuery.TRACE_TYPE_QUERY1, False, ignore,
                                               unreal.DrawDebugTrace.NONE, True)
    if h is None:
        return None
    t = h.to_tuple()
    return t[3] if t[0] else None


def place_props(dry=True, only=None):
    world = unreal.EditorLevelLibrary.get_editor_world()
    probe = json.load(open(PROBE))
    rows = {r['Asset_ID']: r for r in csv.DictReader(open(os.path.join(REPO, 'room_furnishing_schedule.csv'), encoding='utf-8'))}
    acts = EAS.get_all_level_actors()
    box = {}
    ignore = []
    for a in acts:
        tg = [str(t) for t in a.tags]
        if FTAG in tg:
            box[[t for t in tg if t != FTAG][0]] = a
        if FTAG in tg or TAG in tg or 'R3_DEVICE' in tg:
            ignore.append(a)
        if TAG in tg and not dry and (only is None or [t for t in tg if t != TAG][0] in only):
            EAS.destroy_actor(a)
    log, placed = [], 0
    for aid, r in rows.items():
        if only and aid not in only:
            continue
        k = kind(aid)
        pkg = PROPS.get(k)
        if pkg is None:
            log.append([aid, 'NO MAPPING'])
            continue
        if pkg in ('KEEP', 'MERGE'):
            log.append([aid, pkg])
            continue
        x, y, z = float(r['X_m']), float(r['Y_m']), float(r['Z_m'])
        w, d, h = float(r['Width_m']) * 100, float(r['Depth_m']) * 100, float(r['Height_m']) * 100
        psi = 90.0 - float(r['Yaw_deg'])
        c = W(x, y, z)
        if k == 'BED':  # union with headboard
            hb = rows[aid.replace('BED', 'HEADBOARD')]
            hc = W(float(hb['X_m']), float(hb['Y_m']), 0)
            c = unreal.Vector((c.x + hc.x) / 2.0, (c.y + hc.y) / 2.0, c.z)
            d = d + float(hb['Depth_m']) * 100
            h = float(hb['Height_m']) * 100
        # Yaw_deg is the facing direction in plan (0 = north/+Y design, 90 = east/+X design).
        # Engine X = design north, engine Y = design east, so facing = (cos yaw, sin yaw) in engine XY.
        th = math.radians(float(r['Yaw_deg']))
        face = unreal.Vector(math.cos(th), math.sin(th), 0)
        bv = face * -1.0
        phi = float(r['Yaw_deg']) - 90.0  # props face local +Y
        # report only: free space behind the back face (wall check)
        zc = c.z + min(h / 2.0, 100.0)
        o = unreal.Vector(c.x, c.y, zc)
        db = trace(world, o, o + bv * (d / 2.0 + 120.0), ignore)
        df = trace(world, o, o + face * (d / 2.0 + 120.0), ignore)
        how = 'back%s front%s' % ('-' if db is None else '%.0f' % (db - d / 2.0), '-' if df is None else '%.0f' % (df - d / 2.0))
        pr = probe[pkg]
        ex, ey, ez = pr['ex'], pr['ey'], pr['ez']
        sx, sy, sz = w / ex, d / ey, h / ez
        g = (sx * sy * sz) ** (1.0 / 3.0)
        sx, sy, sz = [min(max(s, g / MAXR), g * MAXR) for s in (sx, sy, sz)]
        kfit = min(1.0, w * 1.05 / (sx * ex), d * 1.05 / (sy * ey))
        sx, sy, sz = sx * kfit, sy * kfit, sz * kfit
        n = STACK.get(k, 1)
        if n > 1:
            sz = h / (ez * n)
        rx = unreal.Vector(math.cos(math.radians(phi)), math.sin(math.radians(phi)), 0)
        ry = unreal.Vector(-math.sin(math.radians(phi)), math.cos(math.radians(phi)), 0)
        # desired bounds centre: back face of prop on back face of blockout
        target = c + bv * (d / 2.0) - bv * (ey * sy / 2.0)
        made = []
        for i in range(n):
            bottom = c.z + (h / n) * i
            off = rx * (pr['cx'] * sx) + ry * (pr['cy'] * sy)
            loc = unreal.Vector(target.x - off.x, target.y - off.y, bottom - (pr['cz'] - ez / 2.0) * sz)
            made.append(dict(loc=[round(loc.x, 1), round(loc.y, 1), round(loc.z, 1)], yaw=round(phi, 1),
                             scale=[round(sx, 3), round(sy, 3), round(sz, 3)]))
            if not dry:
                a = EAS.spawn_actor_from_class(cls_of(pkg), loc, unreal.Rotator(0, 0, phi))
                a.set_actor_scale3d(unreal.Vector(sx, sy, sz))
                a.set_actor_label('PROP ' + aid + ('' if n == 1 else '_%d' % (i + 1)))
                a.set_folder_path('R3/Props/' + r['Room_ID'].replace(' ', '_'))
                a.tags = [TAG, aid]
                if r['Collision'].strip().lower() != 'yes':
                    for cc in a.get_components_by_class(unreal.PrimitiveComponent):
                        cc.set_collision_enabled(unreal.CollisionEnabled.NO_COLLISION)
                placed += 1
        log.append([aid, pkg.split('/')[-1], how, made])
        if not dry:
            for rid in ([aid] + ([aid.replace('BED', 'HEADBOARD')] if k == 'BED' else [])):
                if rid in box:
                    EAS.destroy_actor(box[rid])
    json.dump(log, open(LOG, 'w'), indent=0)
    from collections import Counter
    return 'placed=%d %s' % (placed, Counter(l[1] if len(l) < 3 else 'mapped' for l in log))


# ---------------- batch 02: non-room areas (area_dressing_schedule_R1.csv) ----------------
ATAG = 'R3_DRESSING'
ASSETS = 'C:/Users/utente/AppData/Local/Temp/claude/3c5725dd4b11b696/8a0d6a33-3541-4d51-a0c1-4135f1b817d3/scratchpad/asset_list.json'


def resolve(name, _cache={}):
    if not _cache:
        for p in json.load(open(ASSETS))['BGC']:
            _cache.setdefault(p.split('/')[-1], p)
    return _cache[name]


def spawn_fit(pkg, c, w, d, h, yaw, label, folder, tags, collide, probe):
    """c = floor-centre of the scheduled box (engine cm), w/d/h in cm, yaw = facing (plan degrees)."""
    th = math.radians(yaw)
    bv = unreal.Vector(-math.cos(th), -math.sin(th), 0)
    phi = yaw - 90.0
    pr = probe[pkg]
    ex, ey, ez = pr['ex'], pr['ey'], pr['ez']
    sx, sy, sz = w / ex, d / ey, h / ez
    g = (sx * sy * sz) ** (1.0 / 3.0)
    sx, sy, sz = [min(max(s, g / MAXR), g * MAXR) for s in (sx, sy, sz)]
    kfit = min(1.0, w * 1.05 / (sx * ex), d * 1.05 / (sy * ey), h * 1.10 / (sz * ez))
    sx, sy, sz = sx * kfit, sy * kfit, sz * kfit
    rx = unreal.Vector(math.cos(math.radians(phi)), math.sin(math.radians(phi)), 0)
    ry = unreal.Vector(-math.sin(math.radians(phi)), math.cos(math.radians(phi)), 0)
    target = c + bv * (d / 2.0) - bv * (ey * sy / 2.0)
    off = rx * (pr['cx'] * sx) + ry * (pr['cy'] * sy)
    loc = unreal.Vector(target.x - off.x, target.y - off.y, c.z - (pr['cz'] - ez / 2.0) * sz)
    a = EAS.spawn_actor_from_class(cls_of(pkg), loc, unreal.Rotator(0, 0, phi))
    a.set_actor_scale3d(unreal.Vector(sx, sy, sz))
    a.set_actor_label(label)
    a.set_folder_path(folder)
    a.tags = tags
    if not collide:
        for cc in a.get_components_by_class(unreal.PrimitiveComponent):
            cc.set_collision_enabled(unreal.CollisionEnabled.NO_COLLISION)
    return a, (round(sx, 3), round(sy, 3), round(sz, 3))


def place_dressing(only=None):
    probe = json.load(open(PROBE))
    rows = list(csv.DictReader(open(os.path.join(REPO, 'area_dressing_schedule_R1.csv'), encoding='utf-8')))
    for a in EAS.get_all_level_actors():
        tg = [str(t) for t in a.tags]
        if ATAG in tg and (only is None or [t for t in tg if t != ATAG][0] in only):
            EAS.destroy_actor(a)
    out = []
    for r in rows:
        if only and r['Dressing_ID'] not in only:
            continue
        fz = 3.6 if r['Area'].startswith('U-') else 0.0
        c = W(float(r['X_m']), float(r['Y_m']), fz + float(r['Z_m']))
        pkg = resolve(r['Prop_Key'])
        a, s = spawn_fit(pkg, c, float(r['Width_m']) * 100, float(r['Depth_m']) * 100, float(r['Height_m']) * 100,
                         float(r['Yaw_deg']), 'DRESS ' + r['Dressing_ID'], 'R3/Dressing/' + r['Area'],
                         [ATAG, r['Dressing_ID']], r['Collision'].strip().lower() == 'yes', probe)
        out.append((r['Dressing_ID'], s))
    return out
