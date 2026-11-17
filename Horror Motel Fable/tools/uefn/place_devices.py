# R3 GATE E device map for THE MOTEL: ROOM 13. Runs inside the UEFN editor Python interpreter.
# Idempotent: removes every actor tagged R3_DEVICE first. Button order == interaction index in motel_game_manager.verse.
import json, unreal, toolset_registry, asyncio

DT = 'ValkyrieFortniteToolset.DeviceToolset'
PROJ = '/1b9a97d9-c7de-416c-b046-aeb97e125690'
TAG = 'R3_DEVICE'
Z0 = 386.0
EAS = unreal.get_editor_subsystem(unreal.EditorActorSubsystem)

A_BUTTON = '/CreativeCoreDevices/SetupAssets/PID_Device_Button.PID_Device_Button'
A_LIGHT = '/CRD_PointLight/SetupAssets/PID_Device_PointLight.PID_Device_PointLight'
A_END = '/CRD_GameEnd/SetupAssets/PID_Device_EndGame_V2.PID_Device_EndGame_V2'
A_MGR = PROJ + '/_Verse.motel_game_manager'

def W(x, y, z):
    return ((y - 36.0) * 100.0, (x - 42.0) * 100.0, Z0 + z * 100.0)

# (label, x, y, z, hold seconds)
BUTTONS = [
    ('IN-001 sign', 42.0, 15.0, 1.2, 0), ('IN-002 phone', 28.2, 55.0, 1.05, 0), ('IN-003 room13 key', 31.2, 56.8, 1.3, 1),
    ('IN-004 register', 28.9, 55.6, 1.05, 0), ('IN-005 dial 1', 29.6, 55.0, 1.05, 0), ('IN-005 dial 2', 29.9, 55.0, 1.05, 0),
    ('IN-005 dial 3', 30.2, 55.0, 1.05, 0), ('IN-005 submit', 30.6, 55.0, 1.05, 0), ('IN-006 office key', 30.2, 55.6, 0.8, 1),
    ('D-G08 office reader', 37.55, 54.9, 1.2, 0),
    ('IN-007 photo 1982', 41.0, 59.55, 1.5, 0), ('IN-007 photo 1974', 42.0, 59.55, 1.5, 0),
    ('IN-007 photo 1986', 43.0, 59.55, 1.5, 0), ('IN-007 photo 1978', 44.0, 59.55, 1.5, 0),
    ('IN-008 R03 note', 15.8, 38.75, 0.9, 0), ('IN-008 R04 note', 70.8, 20.75, 0.9, 0), ('IN-008 R06 note', 64.6, 40.3, 1.4, 0),
    ('IN-010 panel cover', 64.0, 59.4, 1.15, 1), ('IN-011 socket A', 65.0, 59.4, 1.2, 2), ('IN-011 socket B', 65.85, 59.4, 1.2, 2),
    ('IN-011 socket C', 66.7, 59.4, 1.2, 2), ('IN-012 breaker', 68.4, 59.4, 1.2, 1),
    ('IN-013 diary', 16.0, 43.2, 4.5, 0), ('IN-014 drawing', 71.2, 35.7, 4.9, 0), ('IN-015 secret panel', 68.6, 47.2, 4.7, 2),
    ('D-13B room13 door', 57.3, 50.6, 4.7, 0),
    ('IN-016 photo 1981', 51.0, 59.55, 5.0, 0), ('IN-016 photo 1968', 52.0, 59.55, 5.0, 0),
    ('IN-016 photo 1986', 53.0, 59.55, 5.0, 0), ('IN-016 photo 1974', 54.0, 59.55, 5.0, 0),
    ('IN-017 service key', 58.9, 52.75, 4.5, 1), ('SVC-DOOR-READER', 52.9, 53.5, 1.1, 0), ('IN-018 gate console', 49.7, 59.4, 1.1, 2),
    ('IN-028 car keys', 36.4, 8.6, 0.9, 1), ('IN-019 ignition', 37.6, 8.0, 1.0, 2),
    ('IN-020 vote ESCAPE', 51.2, 59.4, 1.2, 0), ('IN-020 vote TRUTH', 52.0, 59.4, 1.2, 0),
    ('IN-020 vote NEW GUEST', 52.8, 59.4, 1.2, 0), ('IN-020 leave the key', 53.6, 59.4, 1.2, 0),
    ('IN-032 night audit', 54.6, 59.4, 1.1, 2),
    ('IN-024 fuse A', 16.8, 34.2, 0.5, 1), ('IN-025 fuse B', 52.0, 49.0, 0.95, 1), ('IN-026 fuse C', 68.0, 44.6, 0.95, 1),
    ('IN-027 screwdriver', 60.2, 55.2, 1.05, 1), ('IN-029 archive', 64.75, 41.5, 1.5, 0), ('IN-030 CRT', 15.8, 21.25, 0.8, 0),
    ('IN-031 R04 recording', 71.4, 20.75, 0.9, 0),
    ('IN-021 hide R01', 11.7, 26.1, 1.0, 1), ('IN-021 hide R02', 11.7, 35.1, 1.0, 1), ('IN-021 hide R03', 11.7, 44.1, 1.0, 1),
    ('IN-021 hide R04', 66.0, 26.1, 1.0, 1), ('IN-021 hide R05', 66.0, 35.1, 1.0, 1), ('IN-021 hide R06', 66.0, 44.1, 1.0, 1),
    ('IN-021 hide R07', 10.4, 26.1, 4.6, 1), ('IN-021 hide R08', 10.4, 35.1, 4.6, 1), ('IN-021 hide R09', 10.4, 45.4, 4.6, 1),
    ('IN-021 hide R10', 67.3, 26.1, 4.6, 1), ('IN-021 hide R11', 67.3, 35.1, 4.6, 1), ('IN-021 hide R12', 67.3, 45.4, 4.6, 1),
    ('IN-021 hide R13', 53.5, 58.1, 4.6, 1),
    ('IN-009 battery R02', 17.2, 30.2, 0.9, 1), ('IN-009 battery STORAGE', 49.2, 52.6, 0.95, 1),
    ('IN-009 battery R10', 71.4, 20.75, 4.45, 1),
]

# (label, x0, x1, y0, y1, z0, z1)
DOORS = [
    ('DOOR D-G08 office', 37.75, 37.95, 53.475, 54.525, 0.0, 2.25),
    ('DOOR stair gate', 22.65, 23.85, 52.35, 52.45, 0.0, 2.2),
    ('DOOR D-13A room12 panel', 69.425, 70.475, 47.40, 47.55, 3.6, 5.85),
    ('DOOR D-13B room13', 55.825, 56.875, 50.85, 51.05, 3.6, 5.85),
    ('DOOR D-G16 service', 51.625, 52.675, 53.70, 53.85, 0.0, 2.25),
]

LIGHTS = [(15.4, 23.5, 2.8), (15.4, 32.5, 2.8), (15.4, 41.5, 2.8), (68.6, 23.5, 2.8), (68.6, 32.5, 2.8), (68.6, 41.5, 2.8),
          (9.55, 26.0, 2.8), (9.55, 40.0, 2.8), (74.45, 26.0, 2.8), (74.45, 40.0, 2.8), (9.55, 54.0, 2.8), (74.45, 54.0, 2.8),
          (15.5, 54.0, 2.8), (26.0, 50.0, 2.8), (33.0, 55.0, 2.8), (42.5, 54.0, 2.8), (52.0, 51.0, 2.8), (52.0, 56.8, 2.8),
          (65.0, 54.0, 2.8), (12.6, 23.5, 6.1), (12.6, 32.5, 6.1), (12.6, 42.7, 6.1), (71.3, 23.5, 6.1), (71.3, 32.5, 6.1),
          (71.3, 42.7, 6.1), (56.3, 55.4, 6.1), (24.4, 55.0, 6.1), (18.4, 33.0, 6.1), (65.6, 33.0, 6.1), (42.0, 49.5, 6.1)]

def clear():
    n = 0
    for a in EAS.get_all_level_actors():
        if TAG in [str(t) for t in a.tags]:
            EAS.destroy_actor(a); n += 1
    return n

async def place(asset, x, y, z, label, folder):
    wx, wy, wz = W(x, y, z)
    r = await toolset_registry.execute_tool(DT, 'PlaceDevice', {'assetPath': {'refPath': asset}, 'transform': {
        'location': {'x': wx, 'y': wy, 'z': wz}, 'rotation': {'pitch': 0, 'yaw': 0, 'roll': 0}, 'scale': {'x': 1, 'y': 1, 'z': 1}}})
    ref = r['returnValue']
    a = unreal.load_object(None, ref['refPath'])
    a.set_actor_label(label)
    a.set_folder_path('R3/Devices/' + folder)
    a.tags = [TAG]
    return ref

async def opt(ref, name, value):
    await toolset_registry.execute_tool(DT, 'SetClassicDeviceOption', {'devicePath': ref, 'optionName': name, 'value': value})

def prop(bp_name, label, x0, x1, y0, y1, z0, z1, folder):
    bp = unreal.load_asset(PROJ + '/R3/Props/' + bp_name)
    wx, wy, wz = W((x0 + x1) / 2, (y0 + y1) / 2, (z0 + z1) / 2)
    a = EAS.spawn_actor_from_object(bp, unreal.Vector(wx, wy, wz))
    a.set_actor_scale3d(unreal.Vector(y1 - y0, x1 - x0, z1 - z0))
    a.set_actor_label(label)
    a.set_folder_path('R3/Devices/' + folder)
    a.tags = [TAG]
    return {'refPath': a.get_path_name()}

# LIGHTING_REGISTER.csv lights (R3 batch 01d). (verse field, label, x, y, z, colour RGB, intensity %, size %, shadows, rhythm)
REG_LIGHTS = [
    ('L_ParkA', 'LREG L_EXT_PARK_01', 25, 12, 3.5, (0.55, 0.70, 1.0), 30, 100, 'True', 'Constant'),
    ('L_ParkB', 'LREG L_EXT_PARK_02', 59, 12, 3.5, (0.55, 0.70, 1.0), 30, 100, 'True', 'Constant'),
    ('L_CourtA', 'LREG L_COURTYARD_01', 25, 43, 3.5, (0.55, 0.70, 1.0), 20, 85, 'True', 'Constant'),
    ('L_CourtB', 'LREG L_COURTYARD_02', 59, 43, 3.5, (0.55, 0.70, 1.0), 20, 85, 'True', 'Constant'),
    ('L_ReceptionMain', 'LREG L_RECEPTION_MAIN', 31, 54.5, 2.8, (1.0, 0.72, 0.42), 65, 70, 'False', 'Constant'),
    ('L_CorridorW', 'LREG L_CORRIDOR_W', 9.55, 33, 2.7, (0.60, 0.80, 1.0), 15, 60, 'False', 'Constant'),
    ('L_CorridorE', 'LREG L_CORRIDOR_E', 74.45, 33, 2.7, (0.60, 0.80, 1.0), 15, 60, 'False', 'Constant'),
    ('L_Room13Red', 'LREG L_ROOM13_RED', 56, 55, 5.8, (1.0, 0.08, 0.05), 40, 45, 'True', 'Wave'),
    ('L_EscapeRed', 'LREG L_ESCAPE_RED', 42, 18, 2.5, (1.0, 0.05, 0.03), 35, 75, 'True', 'Constant'),
    ('L_Neon', 'LREG L_NEON_SIGN', 42, 15, 2.2, (1.0, 0.15, 0.25), 80, 35, 'False', 'Wave'),
]


async def place_register_lights():
    have = {a.get_actor_label() for a in EAS.get_all_level_actors() if TAG in [str(t) for t in a.tags]}
    done = []
    for field, label, x, y, z, rgb, inten, size, shadows, rhythm in REG_LIGHTS:
        if label in have:
            continue
        ref = await place(A_LIGHT, x, y, z, label, 'LightsRegister')
        for k, v in (('LightColor', '(R=%f,G=%f,B=%f,A=1.000000)' % rgb), ('LightIntensityPercentage', '%0.1f' % inten),
                     ('LightSizePercentage', '%0.1f' % size), ('CastShadows', shadows), ('RhythmPreset', rhythm),
                     ('InitialState', 'False')):
            await opt(ref, k, v)
        done.append(label)
    return done


async def place_journal_input():
    have = {a.get_actor_label() for a in EAS.get_all_level_actors() if TAG in [str(t) for t in a.tags]}
    if 'JOURNAL INPUT' in have:
        return 'exists'
    ref = await place('/CRD_InputTrigger/SetupAssets/PID_Device_InputTrigger.PID_Device_InputTrigger', 52, 2, 1.0, 'JOURNAL INPUT', 'Core')
    await opt(ref, 'CreativeInput', 'Custom 12 (Harvesting Tool)')
    await opt(ref, 'HUD Description', 'Journal')
    return 'placed'


async def place_missing_buttons():
    # adds Button devices that are in BUTTONS but not yet in the level (keeps existing actors and bindings)
    have = {a.get_actor_label() for a in EAS.get_all_level_actors() if TAG in [str(t) for t in a.tags]}
    made = []
    for label, x, y, z, hold in BUTTONS:
        if 'BTN ' + label in have:
            continue
        ref = await place(A_BUTTON, x, y, z, 'BTN ' + label, 'Buttons')
        await opt(ref, 'InteractionRadius', '1.6')
        if hold:
            await opt(ref, 'InteractTime', '%0.1f' % hold)
        made.append(label)
    return made


async def wire():
    """Re-binds every placed R3 device to the manager by label (UEFN tool cannot set Verse arrays, so fields are individual)."""
    acts = {a.get_actor_label(): a for a in EAS.get_all_level_actors() if TAG in [str(t) for t in a.tags]}
    mgr = {'refPath': acts['MOTEL GAME MANAGER'].get_path_name()}
    schema = json.loads((await toolset_registry.execute_tool(DT, 'ListDeviceProperties', {'device': mgr}))['returnValue'])
    keys = {k.lower(): k for k in schema.keys()}
    pairs = [('btn%02d' % i, 'BTN ' + b[0]) for i, b in enumerate(BUTTONS)]
    pairs += [('door%02d' % i, d[0]) for i, d in enumerate(DOORS)]
    pairs += [('light%02d' % i, 'LIGHT %02d' % i) for i in range(len(LIGHTS))]
    pairs += [('guestprop', 'THE GUEST proxy'), ('endgame', 'END GAME'), ('flashlightgranter', 'FLASHLIGHT GRANTER'),
              ('flashlightremover', 'FLASHLIGHT REMOVER'), ('flashlightinput', 'FLASHLIGHT TOGGLE INPUT')]
    pairs += [(f.lower(), lab) for f, lab, *_ in REG_LIGHTS]
    pairs += [('journalinput', 'JOURNAL INPUT'), ('guestspawner', 'GUEST NPC SPAWNER')]
    ok, bad = 0, []
    for key, label in pairs:
        try:
            await toolset_registry.execute_tool(DT, 'SetDeviceProperty', {'device': mgr, 'propertyName': keys[key],
                                                'value': json.dumps({'refPath': acts[label].get_path_name()})})
            ok += 1
        except Exception as e:
            bad.append('%s:%s' % (key, str(e)[:80]))
        await asyncio.sleep(0)
    return 'wired=%d/%d failed=%s' % (ok, len(pairs), bad[:5])

async def build_all():
    out = ['removed=%d' % clear()]
    buttons = []
    for label, x, y, z, hold in BUTTONS:
        ref = await place(A_BUTTON, x, y, z, 'BTN ' + label, 'Buttons')
        await opt(ref, 'InteractionRadius', '1.6')
        if hold:
            await opt(ref, 'InteractTime', '%0.1f' % hold)
        buttons.append(ref)
        await asyncio.sleep(0)
    doors = [prop('BP_R3_DoorLeaf', *d, 'Doors') for d in DOORS]
    guest = prop('BP_R3_Guest', 'THE GUEST proxy', 42.2, 42.8, 53.8, 54.2, 0.0, 2.1, 'Guest')
    lights = []
    for i, (x, y, z) in enumerate(LIGHTS):
        lights.append(await place(A_LIGHT, x, y, z, 'LIGHT %02d' % i, 'Lights'))
        await asyncio.sleep(0)
    end = await place(A_END, 42.0, 2.0, 1.0, 'END GAME', 'Core')
    mgr = await place(A_MGR, 44.0, 2.0, 1.0, 'MOTEL GAME MANAGER', 'Core')
    for name, val in (('buttons', buttons), ('doors', doors), ('guestProp', guest), ('endGame', end), ('lights', lights)):
        await toolset_registry.execute_tool(DT, 'SetDeviceProperty', {'device': mgr, 'propertyName': name, 'value': json.dumps(val)})
    r = await toolset_registry.execute_tool(DT, 'GetDeviceProperties', {'device': mgr, 'propertyNames': ['buttons', 'doors', 'guestProp', 'endGame', 'lights']})
    got = json.loads(r['returnValue'])
    out.append('buttons=%d doors=%d lights=%d guest=%s end=%s' % (len(got.get('buttons', [])), len(got.get('doors', [])),
               len(got.get('lights', [])), bool(got.get('guestProp')), bool(got.get('endGame'))))
    return ' '.join(out)
