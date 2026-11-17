# R3 GATE C/F step: greybox fit-out from room_furnishing_schedule.csv (183 rows). Runs inside the UEFN editor.
# Idempotent: removes every actor tagged R3_FURNISH first. Uses R3-DEC-001 mapping and the R3 flat materials.
# Each row becomes one box: footprint Width x Depth rotated by Yaw, from Z_m to Z_m + Height_m (Z_m is absolute).
# Rows with Collision=No get no collision. This is blockout only; real props replace these in GATE F.
#   exec(open(path).read()); print(build_furnishing())
import csv, os, unreal

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))) if '__file__' in globals() else \
    r"C:\Users\utente\AppData\Local\Temp\claude\3c5725dd4b11b696\8a0d6a33-3541-4d51-a0c1-4135f1b817d3\scratchpad\repo_cs\r\Horror Motel Fable"
TAG = 'R3_FURNISH'
Z0 = 386.0
MAT_ROOT = '/1b9a97d9-c7de-416c-b046-aeb97e125690/R3/Materials/'
MAT_MAP = {'MAT_DARK_WOOD': 'M_R3_Door', 'MAT_BURGUNDY': 'M_R3_FloorUpper', 'MAT_METAL': 'M_R3_Metal',
           'MAT_METAL_RAIL': 'M_R3_Metal', 'MAT_GLASS': 'M_R3_Glass', 'MAT_CONCRETE': 'M_R3_Concrete'}
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
CUBE = unreal.load_asset('/Engine/BasicShapes/Cube')


def W(x, y, z):
    return unreal.Vector((y - 36.0) * 100.0, (x - 42.0) * 100.0, Z0 + z * 100.0)


def num(v, d=0.0):
    try:
        return float(v)
    except (TypeError, ValueError):
        return d


def build_furnishing():
    removed = 0
    for a in EAS.get_all_level_actors():
        if TAG in [str(t) for t in a.tags]:
            EAS.destroy_actor(a)
            removed += 1
    with open(os.path.join(REPO, 'room_furnishing_schedule.csv'), encoding='utf-8', newline='') as f:
        rows = list(csv.DictReader(f))
    mats, made, skipped = {}, 0, []
    for r in rows:
        w, d, h = num(r['Width_m']), num(r['Depth_m']), num(r['Height_m'])
        if w <= 0 or d <= 0 or h <= 0:
            skipped.append(r['Asset_ID'])
            continue
        z = num(r['Z_m'])
        a = EAS.spawn_actor_from_object(CUBE, W(num(r['X_m']), num(r['Y_m']), z + h / 2.0))
        # design yaw is measured in the plan; plan X/Y are swapped into engine Y/X, so engine yaw = 90 - design yaw
        a.set_actor_rotation(unreal.Rotator(0.0, 0.0, 90.0 - num(r['Yaw_deg'])), False)
        a.set_actor_scale3d(unreal.Vector(w, d, h))
        a.set_actor_label('FURN ' + r['Asset_ID'])
        a.set_folder_path('R3/Furnishing/' + r['Room_ID'].replace(' ', '_'))
        a.tags = [TAG, r['Asset_ID']]
        c = a.get_component_by_class(unreal.StaticMeshComponent)
        name = MAT_MAP.get(r['Material_ID'], 'M_R3_Prop')
        if name not in mats:
            mats[name] = unreal.load_asset(MAT_ROOT + name)
        if mats[name]:
            c.set_material(0, mats[name])
        if r['Collision'].strip().lower() != 'yes':
            c.set_collision_enabled(unreal.CollisionEnabled.NO_COLLISION)
        made += 1
    return 'removed=%d placed=%d skipped=%s' % (removed, made, skipped)
