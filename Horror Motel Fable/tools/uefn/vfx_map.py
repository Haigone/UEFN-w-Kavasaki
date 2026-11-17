# R3 batch 02 (R3-DEC-021): first-party VFX Spawner V2 / Post Process devices for LIGHTING_CUE_SHEET + CINEMATIC gaps.
# (verse field or None, label, design x, y, z, preset label, start enabled, enabled time label or None)
VFX = [
    (None, 'VFX rain courtyard', 42, 33, 9, 'PIOGGIA', True, None),
    (None, 'VFX rain parking', 42, 10, 9, 'PIOGGIA', True, None),
    (None, 'VFX rain west', 24, 30, 9, 'PIOGGIA', True, None),
    (None, 'VFX rain east', 60, 30, 9, 'PIOGGIA', True, None),
    (None, 'VFX fog parking', 42, 10, 0.2, 'NEBBIA LEGGERA', True, None),
    (None, 'VFX fog courtyard', 42, 33, 0.2, 'NEBBIA LEGGERA', True, None),
    (None, 'VFX flies dumpster', 77.8, 22, 1.3, 'MOSCHE SUL CESTINO', True, None),
    (None, 'VFX dust room13', 56.3, 55.4, 4.8, 'POLVERE AMBIENTALE', True, None),
    (None, 'VFX dust storage', 52, 51, 1.5, 'POLVERE AMBIENTALE', True, None),
    ('Vfx_Lightning', 'VFX lightning', 42, 75, 22, 'LIGHTNINGBOLT_01', False, '1,0 SECONDO'),
    ('Vfx_RevealGhosts', 'VFX reveal ghosts', 56.5, 55.5, 4.2, 'FANTASMI DA BRIVIDI', False, None),
]
# burst effects: (field, label, x, y, z, burst preset)
VFX_BURST = [
    ('Vfx_GuestAppear', 'VFX guest appear', 18, 36, 0.5, 'NUVOLA DI POLVERE'),
]
# post process: (field or None, label, preset, starting strength, blend-in strength, blend in s, blend out s, priority)
PP = [
    (None, 'PP base vignette', 'VIGNETTA', 0.6, 0.6, 0.5, 0.5, 0),
    ('Pp_Capture', 'PP capture red', 'ROSSO', 0.0, 0.8, 0.4, 1.5, 5),
    ('Pp_Reveal', 'PP reveal spooky', 'DA BRIVIDI', 0.0, 1.0, 1.0, 2.0, 6),
    ('Pp_Truth', 'PP truth VHS', 'FILTRO VIDEOCASSETTA', 0.0, 1.0, 1.5, 1.5, 7),
    ('Pp_NewGuest', 'PP new guest desolation', 'DESOLAZIONE', 0.0, 1.0, 2.0, 2.0, 7),
]
