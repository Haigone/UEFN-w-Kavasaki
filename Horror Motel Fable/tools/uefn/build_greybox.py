# R3 GATE C greybox builder for THE MOTEL: ROOM 13 (LD-GEO R2.3).
# Runs inside the UEFN editor Python interpreter. Idempotent: removes every actor tagged R3_GREYBOX first.
# Mapping decision (R3-DEC-001): design X(east) -> engine Y, design Y(north) -> engine X, 1 m = 100 uu,
# site centre (42,36) -> engine origin, building datum Z0 -> engine Z 386 (2 cm above template asphalt at 384).
import csv, os, unreal

REPO = r"C:\Users\utente\AppData\Local\Temp\claude\3c5725dd4b11b696\8a0d6a33-3541-4d51-a0c1-4135f1b817d3\scratchpad\repo_cs\r\Horror Motel Fable"
TAG = "R3_GREYBOX"
Z0 = 386.0
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
CUBE = unreal.load_asset('/Engine/BasicShapes/Cube')
MATS = {}

def mat(name):
    if name not in MATS:
        MATS[name] = unreal.load_asset('/1b9a97d9-c7de-416c-b046-aeb97e125690/R3/Materials/' + name) if name else None
    return MATS[name]

def rows(fn):
    with open(os.path.join(REPO, fn), encoding='utf-8', newline='') as f:
        return list(csv.DictReader(f))

def to_world(x, y, z):
    return unreal.Vector((y - 36.0) * 100.0, (x - 42.0) * 100.0, Z0 + z * 100.0)

COUNT = [0]
def box(label, x0, x1, y0, y1, z0, z1, folder, material=None):
    if x1 - x0 < 0.005 or y1 - y0 < 0.005 or z1 - z0 < 0.005:
        return None
    a = EAS.spawn_actor_from_object(CUBE, to_world((x0 + x1) / 2, (y0 + y1) / 2, (z0 + z1) / 2))
    a.set_actor_scale3d(unreal.Vector(y1 - y0, x1 - x0, z1 - z0))
    a.set_actor_label(label)
    a.set_folder_path('R3/Greybox/' + folder)
    a.tags = [TAG, folder.split('/')[0]]
    m = mat(material)
    if m:
        a.get_component_by_class(unreal.StaticMeshComponent).set_material(0, m)
    COUNT[0] += 1
    return a

def clear():
    n = 0
    for a in EAS.get_all_level_actors():
        if TAG in [str(t) for t in a.tags]:
            EAS.destroy_actor(a); n += 1
    return n

WALL_MAT = {'MAT_STUCCO': 'M_R3_Stucco', 'MAT_WALLPAPER': 'M_R3_Wallpaper', 'MAT_CONCRETE': 'M_R3_Concrete', 'MAT_METAL_RAIL': 'M_R3_Metal'}

def build_slabs():
    # U footprint 8 18;20 18;20 48;64 48;64 18;76 18;76 60;8 60 decomposed into three non-overlapping rectangles.
    U = [('W', 8, 20, 18, 48), ('E', 64, 76, 18, 48)]
    for lvl, zb, zt, m in (('GF-SLAB', -0.20, 0.0, 'M_R3_Floor'), ('ROOF-SLAB', 6.40, 6.65, 'M_R3_Concrete')):
        for n, x0, x1, y0, y1 in U + [('N', 8, 76, 48, 60)]:
            box('%s_%s' % (lvl, n), x0, x1, y0, y1, zb, zt, 'Slabs', m)
    for n, x0, x1, y0, y1 in U:
        box('UF-SLAB_%s' % n, x0, x1, y0, y1, 3.35, 3.60, 'Slabs', 'M_R3_FloorUpper')
    # north bar with UF-STAIR-OPENING X22.50-25.50, Y52.30-56.32 removed
    box('UF-SLAB_N_west', 8, 22.5, 48, 60, 3.35, 3.60, 'Slabs', 'M_R3_FloorUpper')
    box('UF-SLAB_N_east', 25.5, 76, 48, 60, 3.35, 3.60, 'Slabs', 'M_R3_FloorUpper')
    box('UF-SLAB_N_stairS', 22.5, 25.5, 48, 52.30, 3.35, 3.60, 'Slabs', 'M_R3_FloorUpper')
    box('UF-SLAB_N_stairN', 22.5, 25.5, 56.32, 60, 3.35, 3.60, 'Slabs', 'M_R3_FloorUpper')

def build_walls():
    ops = {}
    for o in rows('DOOR_WINDOW_SCHEDULE.csv'):
        ops.setdefault(o['Wall_ID'], []).append(o)
    report = []
    for w in rows('wall_schedule.csv'):
        sx, sy, ex, ey = float(w['Start_X_m']), float(w['Start_Y_m']), float(w['End_X_m']), float(w['End_Y_m'])
        t, zb, zt = float(w['Thickness_m']), float(w['Bottom_Z_m']), float(w['Top_Z_m'])
        along_y = abs(sx - ex) < 1e-6
        u0, u1 = (min(sy, ey), max(sy, ey)) if along_y else (min(sx, ex), max(sx, ex))
        u0 -= t / 2; u1 += t / 2
        c = sx if along_y else sy
        m = WALL_MAT.get(w['Material_ID'], 'M_R3_Wallpaper')
        folder = {'Guardrail': 'Guardrails', 'Parapet': 'Roof'}.get(w['Wall_Type'], 'Walls/' + w['Floor'])
        def seg(tag, a, b, z_a, z_b, mm=None):
            if along_y:
                box('%s_%s' % (w['Wall_ID'], tag), c - t / 2, c + t / 2, a, b, z_a, z_b, folder, mm or m)
            else:
                box('%s_%s' % (w['Wall_ID'], tag), a, b, c - t / 2, c + t / 2, z_a, z_b, folder, mm or m)
        cur = u0; i = 0
        olist = sorted(ops.get(w['Wall_ID'], []), key=lambda o: float(o['Center_Y_m'] if along_y else o['Center_X_m']))
        for o in olist:
            cu = float(o['Center_Y_m'] if along_y else o['Center_X_m'])
            rw, rh, ob = float(o['Rough_Width_m']), float(o['Rough_Height_m']), float(o['Bottom_Z_m'])
            a, b = cu - rw / 2, cu + rw / 2
            if a < cur - 1e-6 or b > u1 + 1e-6:
                report.append('DEFECT opening %s outside/overlapping on %s' % (o['Opening_ID'], w['Wall_ID']))
            seg('s%d' % i, cur, a, zb, zt); i += 1
            seg('sill_' + o['Opening_ID'], a, b, zb, ob)
            seg('head_' + o['Opening_ID'], a, b, min(ob + rh, zt), zt)
            if o['Collision_Behaviour'] == 'Fixed glazing':
                # 4 cm pane, blocks movement
                if along_y:
                    box('GLASS_' + o['Opening_ID'], c - 0.02, c + 0.02, a, b, ob, ob + rh, 'Glazing', 'M_R3_Glass')
                else:
                    box('GLASS_' + o['Opening_ID'], a, b, c - 0.02, c + 0.02, ob, ob + rh, 'Glazing', 'M_R3_Glass')
            cur = b
        seg('s%d' % i, cur, u1, zb, zt)
    return report

def build_stair():
    f = 'Stair'
    m = 'M_R3_Concrete'
    # West (lower) flight rises south->north: 9 goings of 0.28 from Y52.45, 10 risers of 0.18 to landing Z1.80
    for i in range(1, 10):
        y0 = 52.45 + 0.28 * (i - 1)
        box('STAIR-01_W_step%02d' % i, 22.65, 23.85, y0, y0 + 0.28, 0.0, 0.18 * i, f, m)
    box('STAIR-01_landing', 22.65, 25.35, 54.97, 56.17, 1.60, 1.80, f, m)
    # East (upper) flight returns north->south from landing to Z3.60
    for j in range(1, 10):
        y1 = 54.97 - 0.28 * (j - 1)
        top = 1.80 + 0.18 * j
        box('STAIR-01_E_step%02d' % j, 24.15, 25.35, y1 - 0.28, y1, max(0.0, top - 0.45), top, f, m)
    box('STAIR-01_E_nosing', 24.15, 25.35, 52.30, 52.45, 3.35, 3.60, f, m)
    # central 0.30 m band between flights: divider to 1.0 m above the higher adjacent tread line
    box('STAIR-01_divider', 23.90, 24.10, 52.45, 54.97, 0.0, 3.60, f, m)
    # closes the west side of the opening under UF so players cannot drop from landing side gaps
    box('STAIR-01_rail_landing_N', 22.65, 25.35, 56.17, 56.22, 1.80, 2.80, f, 'M_R3_Metal')
    box('STAIR-01_rail_W', 22.60, 22.65, 52.45, 56.17, 0.0, 2.80, f, 'M_R3_Metal')
    box('STAIR-01_rail_E', 25.35, 25.40, 52.45, 56.17, 0.0, 3.35, f, 'M_R3_Metal')

def build_all():
    removed = clear()
    COUNT[0] = 0
    build_slabs()
    rep = build_walls()
    build_stair()
    return 'removed=%d spawned=%d defects=%s' % (removed, COUNT[0], rep)
