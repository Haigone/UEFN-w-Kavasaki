# Spawn each candidate prop far below the map at yaw 0, record local bounds (cm), then destroy it.
import unreal, json
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)
OUT = 'C:/Users/utente/AppData/Local/Temp/claude/3c5725dd4b11b696/8a0d6a33-3541-4d51-a0c1-4135f1b817d3/scratchpad/probe.json'


def cls_of(pkg):
    name = pkg.split('/')[-1]
    return unreal.load_class(None, pkg + '.' + name + '_C')


REDO = False


def probe(pkgs):
    res = {}
    try:
        res = json.load(open(OUT))
    except Exception:
        pass
    for i, p in enumerate(pkgs):
        if p in res and not REDO:
            continue
        c = cls_of(p)
        if not c:
            res[p] = 'NOCLASS'
            continue
        a = EAS.spawn_actor_from_class(c, unreal.Vector(0, 0, -20000 - i * 1000), unreal.Rotator(0, 0, 0))
        if not a:
            res[p] = 'NOSPAWN'
            continue
        loc = a.get_actor_location()
        mn = [1e9]*3; mx = [-1e9]*3; nt = 0
        for cc in a.get_components_by_class(unreal.StaticMeshComponent):
            if not cc.is_visible() or not cc.static_mesh:
                continue
            b = c.get_editor_property('bounds') if False else None
            o2, e2, r2 = unreal.SystemLibrary.get_component_bounds(cc)
            for k, (oo, ee) in enumerate(((o2.x, e2.x), (o2.y, e2.y), (o2.z, e2.z))):
                mn[k] = min(mn[k], oo - ee); mx[k] = max(mx[k], oo + ee)
            nt += 1
        if nt == 0:
            o, e = a.get_actor_bounds(False)
            mn = [o.x - e.x, o.y - e.y, o.z - e.z]; mx = [o.x + e.x, o.y + e.y, o.z + e.z]
        o = unreal.Vector((mn[0]+mx[0])/2, (mn[1]+mx[1])/2, (mn[2]+mx[2])/2)
        e = unreal.Vector((mx[0]-mn[0])/2, (mx[1]-mn[1])/2, (mx[2]-mn[2])/2)
        res[p] = {'cx': round(o.x - loc.x, 1), 'cy': round(o.y - loc.y, 1), 'cz': round(o.z - loc.z, 1),
                  'ex': round(e.x * 2, 1), 'ey': round(e.y * 2, 1), 'ez': round(e.z * 2, 1),
                  'cls': a.get_class().get_name(), 'nsm': nt}
        EAS.destroy_actor(a)
    json.dump(res, open(OUT, 'w'), indent=0)
    return {k: v for k, v in res.items() if k in pkgs}
