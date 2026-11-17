# R3-DEC-017 audio map: Verse field, label, design x, y, z, sound cue suffix, volume, loop, heard by, spatial, min m, falloff m
# R3-DEC-020 (batch 02): a cue starting with '/' is a first-party Creative sound asset (/Game/Sounds/Creative/...) assigned
# through the Audio Player's 'audio' property. The project's asset reference policy refuses every other Fortnite sound root.
AUDIO = [
    ('Aud_Wind', 'AUD SFX_WIND_ROADSIDE', 42, 30, 3, 'Amb_Purgatory_Spot_06_Cue', 0.35, 'True', 'Everyone', 'True', 30, 40),
    ('Aud_Neon', 'AUD SFX_NEON', 42, 15, 2.2, 'Amb_Church_Spot_09_Cue', 0.25, 'True', 'Everyone', 'True', 2, 10),
    ('Aud_Room13', 'AUD SFX_ROOM13_DRONE', 56, 55, 4.8, 'Amb_Underwater_Spot_05_Cue', 0.4, 'True', 'Everyone', 'True', 3, 8),
    ('Aud_Thunder', 'AUD SFX_RAIN thunder', 42, 30, 8, 'Amb_Purgatory_Spot_01_Cue', 0.5, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Threat', 'AUD SFX_CHASE_STINGER', 42, 18, 2, 'Stinger_Threat_01_Cue', 0.8, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Capture', 'AUD SFX_CAPTURE_STINGER', 44, 4, 1, 'Stinger_Halloween_Scare_01_Cue', 0.9, 'False', 'Instigator Only', 'False', 4, 32),
    ('Aud_Power', 'AUD SFX_BREAKER_ACTIVATE', 68.4, 59.2, 1.2, 'Stinger_Unlock_01_Cue', 0.8, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Gate', 'AUD SFX_GATE_MOTOR', 49.7, 59.2, 1.1, 'Stinger_Transition_01_Cue', 0.7, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Reveal', 'AUD ROOM13 reveal', 56.5, 55.5, 4.6, 'Stinger_Scare_02_Cue', 0.9, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Evidence', 'AUD evidence', 46, 4, 1, 'Stinger_Halloween_Discovery_01_Cue', 0.6, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Pickup', 'AUD pickup', 48, 4, 1, 'Stinger_BlackMonday_Bonus_01_Cue', 0.5, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Fail', 'AUD fail', 50, 4, 1, 'Stinger_Halloween_Negative_01_Cue', 0.5, 'False', 'Instigator Only', 'False', 4, 32),
    ('Aud_EndEscape', 'AUD ending ESCAPE', 52, 4, 1, 'Stinger_End_01_Cue', 0.9, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_EndTruth', 'AUD ending THE TRUTH', 54, 4, 1, 'Stinger_Halloween_End_01_Cue', 0.9, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_EndNewGuest', 'AUD ending NEW GUEST', 56, 4, 1, 'Stinger_Halloween_Secret_01_Cue', 0.9, 'False', 'Everyone', 'False', 4, 32),
    ('Aud_Heartbeat', 'AUD guest proximity heartbeat', 58, 4, 1, 'sfx_Horror_Carnival_Scared_Heartbeat_01_Cue', 0.8, 'False', 'Instigator Only', 'False', 4, 32),
    # ---- batch 02 additions (AUDIO_CUE_SHEET gaps) ----
    ('Aud_Rain', 'AUD SFX_RAIN loop', 42, 36, 6, '/Game/Sounds/Creative/Gadgets/Radio/Sound_Loops/Suvival_Horror/Graveyard/Amb_Graveyard_Rain_Loop_Cue', 0.3, 'True', 'Everyone', 'False', 4, 32),
    ('Aud_Fluor', 'AUD SFX_FLUORESCENT reception', 29, 57, 2.7, '/Game/Sounds/Creative/Toys/DamageRails/DamageRails_Loop_Electricity_Cue', 0.15, 'True', 'Everyone', 'True', 2, 9),
    ('Aud_CRT', 'AUD SFX_CRT room01', 15.55, 20.75, 1.1, '/Game/Sounds/Creative/Toys/Locks/LockDevice_Screen_Loop_Cue_Creative', 0.35, 'True', 'Everyone', 'True', 1, 5),
    ('Aud_Generator', 'AUD SFX_GENERATOR', 70.2, 57.5, 0.8, '/Game/Sounds/Creative/Gadgets/DamageAmplifier/DamageAmplifier_PoweredLoop_Cue', 0.45, 'True', 'Everyone', 'True', 2, 14),
    ('Aud_Breaker', 'AUD SFX_BREAKER lever', 68.4, 59.2, 1.2, '/Game/Sounds/Creative/Toys/ActionTrigger/ActionTrigger_PowerOn_Cue', 0.9, 'False', 'Everyone', 'True', 3, 20),
    ('Aud_GuestBreath', 'AUD SFX_GUEST_FOOTSTEPS', 18, 36, 1.8, '/Game/Sounds/Creative/Gadgets/Radio/Sound_Loops/Halloween/Halloween_Floorboards_01_Cue', 0.8, 'True', 'Everyone', 'True', 1.5, 9),
    ('Aud_Whisper', 'AUD ROOM13 whispers', 56.5, 55.5, 4.8, '/Game/Sounds/Creative/Gadgets/Speaker/Halloween/Halloween_Whispers_Cue', 0.6, 'False', 'Everyone', 'True', 2, 10),
    ('Aud_Page', 'AUD page turn', 60, 4, 1, '/Game/Sounds/Creative/Toys/Locks/LockDevice_Show_Cue', 0.6, 'False', 'Instigator Only', 'False', 4, 32),
    ('Aud_Keypad', 'AUD keypad press', 29.8, 55, 1.1, '/Game/Sounds/Creative/Toys/Floor_Siren/Timer_UI_Tick_Minigame_Cue', 0.6, 'False', 'Everyone', 'True', 1, 8),
    ('Aud_Door', 'AUD door open', 37.85, 54, 1.2, '/Game/Sounds/Creative/Gadgets/Radio/Sound_Loops/Halloween/Halloween_Creaking_01_Cue', 0.8, 'False', 'Everyone', 'True', 2, 14),
]
