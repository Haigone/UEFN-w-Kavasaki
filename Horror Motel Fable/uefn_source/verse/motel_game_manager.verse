# THE MOTEL: ROOM 13 - session-authoritative game manager (R3 GATE E).
# One writer per progression flag: every flag below is written only inside this device.
# Interaction indices are the placement order used by tools/uefn/place_devices.py (R3 device map).
using { /Fortnite.com/Devices }
using { /Fortnite.com/AI }
using { /Fortnite.com/Characters }
using { /Fortnite.com/Game }
using { /Fortnite.com/Playspaces }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Random }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/UI }
using { motel_text }

motel_log := class(log_channel){}

# Per-player transient state (never progression).
motel_player := class:
    var Hidden:logic = false
    var Captured:logic = false
    var CapturedAt:float = 0.0
    var RescueProgress:float = 0.0
    var ProtectedUntil:float = 0.0
    var Vote:int = 0
    var ToastSerial:int = 0
    var ReaderSerial:int = 0
    var DiaryPage:int = 0
    # IN-009 personal flashlight (GAMEPLAY_SYSTEMS_SPEC §5): seconds of light left, on/off, battery spawns claimed
    var Charge:float = 180.0
    var LightOn:logic = false
    var LowWarned:logic = false
    var Claimed:[int]logic = map{}
    var JournalPage:int = 0
    var HeartAt:float = 0.0

motel_hud := class:
    Canvas:canvas
    TitleText:text_block
    BodyText:text_block
    ToastText:text_block
    ReaderBack:color_block
    ReaderText:text_block
    LightText:text_block

button_handler := class:
    Manager:motel_game_manager
    Index:int
    OnInteract(Agent:agent):void =
        Manager.HandleInteraction(Agent, Index)

motel_game_manager := class(creative_device):

    Logger:motel_log = motel_log{}

    @editable Btn00:button_device = button_device{}
    @editable Btn01:button_device = button_device{}
    @editable Btn02:button_device = button_device{}
    @editable Btn03:button_device = button_device{}
    @editable Btn04:button_device = button_device{}
    @editable Btn05:button_device = button_device{}
    @editable Btn06:button_device = button_device{}
    @editable Btn07:button_device = button_device{}
    @editable Btn08:button_device = button_device{}
    @editable Btn09:button_device = button_device{}
    @editable Btn10:button_device = button_device{}
    @editable Btn11:button_device = button_device{}
    @editable Btn12:button_device = button_device{}
    @editable Btn13:button_device = button_device{}
    @editable Btn14:button_device = button_device{}
    @editable Btn15:button_device = button_device{}
    @editable Btn16:button_device = button_device{}
    @editable Btn17:button_device = button_device{}
    @editable Btn18:button_device = button_device{}
    @editable Btn19:button_device = button_device{}
    @editable Btn20:button_device = button_device{}
    @editable Btn21:button_device = button_device{}
    @editable Btn22:button_device = button_device{}
    @editable Btn23:button_device = button_device{}
    @editable Btn24:button_device = button_device{}
    @editable Btn25:button_device = button_device{}
    @editable Btn26:button_device = button_device{}
    @editable Btn27:button_device = button_device{}
    @editable Btn28:button_device = button_device{}
    @editable Btn29:button_device = button_device{}
    @editable Btn30:button_device = button_device{}
    @editable Btn31:button_device = button_device{}
    @editable Btn32:button_device = button_device{}
    @editable Btn33:button_device = button_device{}
    @editable Btn34:button_device = button_device{}
    @editable Btn35:button_device = button_device{}
    @editable Btn36:button_device = button_device{}
    @editable Btn37:button_device = button_device{}
    @editable Btn38:button_device = button_device{}
    @editable Btn39:button_device = button_device{}
    @editable Btn40:button_device = button_device{}
    @editable Btn41:button_device = button_device{}
    @editable Btn42:button_device = button_device{}
    @editable Btn43:button_device = button_device{}
    @editable Btn44:button_device = button_device{}
    @editable Btn45:button_device = button_device{}
    @editable Btn46:button_device = button_device{}
    @editable Btn47:button_device = button_device{}
    @editable Btn48:button_device = button_device{}
    @editable Btn49:button_device = button_device{}
    @editable Btn50:button_device = button_device{}
    @editable Btn51:button_device = button_device{}
    @editable Btn52:button_device = button_device{}
    @editable Btn53:button_device = button_device{}
    @editable Btn54:button_device = button_device{}
    @editable Btn55:button_device = button_device{}
    @editable Btn56:button_device = button_device{}
    @editable Btn57:button_device = button_device{}
    @editable Btn58:button_device = button_device{}
    @editable Btn59:button_device = button_device{}
    @editable Btn60:button_device = button_device{}
    @editable Btn61:button_device = button_device{}
    @editable Btn62:button_device = button_device{}
    AllButtons()<transacts>:[]button_device = array{Btn00, Btn01, Btn02, Btn03, Btn04, Btn05, Btn06, Btn07, Btn08, Btn09, Btn10, Btn11, Btn12, Btn13, Btn14, Btn15, Btn16, Btn17, Btn18, Btn19, Btn20, Btn21, Btn22, Btn23, Btn24, Btn25, Btn26, Btn27, Btn28, Btn29, Btn30, Btn31, Btn32, Btn33, Btn34, Btn35, Btn36, Btn37, Btn38, Btn39, Btn40, Btn41, Btn42, Btn43, Btn44, Btn45, Btn46, Btn47, Btn48, Btn49, Btn50, Btn51, Btn52, Btn53, Btn54, Btn55, Btn56, Btn57, Btn58, Btn59, Btn60, Btn61, Btn62}
    # 0 D-G08 office door, 1 stair gate, 2 D-13A Room 12 panel, 3 D-13B Room 13 door, 4 D-G16 service door
    @editable Door00:creative_prop = creative_prop{}
    @editable Door01:creative_prop = creative_prop{}
    @editable Door02:creative_prop = creative_prop{}
    @editable Door03:creative_prop = creative_prop{}
    @editable Door04:creative_prop = creative_prop{}
    AllDoors()<transacts>:[]creative_prop = array{Door00, Door01, Door02, Door03, Door04}
    @editable GuestProp:creative_prop = creative_prop{}
    # QA only: runs the scripted critical-path self-test with the first connected player. Must be false in release.
    @editable SelfTest:logic = false
    # QA only: ending exercised by the self-test (1 ESCAPE, 2 THE TRUTH, 3 THE NEW GUEST).
    @editable SelfTestEnding:int = 2
    @editable EndGame:end_game_device = end_game_device{}
    @editable L_ParkA:customizable_light_device = customizable_light_device{}
    @editable L_ParkB:customizable_light_device = customizable_light_device{}
    @editable L_CourtA:customizable_light_device = customizable_light_device{}
    @editable L_CourtB:customizable_light_device = customizable_light_device{}
    @editable L_ReceptionMain:customizable_light_device = customizable_light_device{}
    @editable L_CorridorW:customizable_light_device = customizable_light_device{}
    @editable L_CorridorE:customizable_light_device = customizable_light_device{}
    @editable L_Room13Red:customizable_light_device = customizable_light_device{}
    @editable L_EscapeRed:customizable_light_device = customizable_light_device{}
    @editable L_Neon:customizable_light_device = customizable_light_device{}
    @editable Aud_Wind:audio_player_device = audio_player_device{}
    @editable Aud_Neon:audio_player_device = audio_player_device{}
    @editable Aud_Room13:audio_player_device = audio_player_device{}
    @editable Aud_Thunder:audio_player_device = audio_player_device{}
    @editable Aud_Threat:audio_player_device = audio_player_device{}
    @editable Aud_Capture:audio_player_device = audio_player_device{}
    @editable Aud_Power:audio_player_device = audio_player_device{}
    @editable Aud_Gate:audio_player_device = audio_player_device{}
    @editable Aud_Reveal:audio_player_device = audio_player_device{}
    @editable Aud_Evidence:audio_player_device = audio_player_device{}
    @editable Aud_Pickup:audio_player_device = audio_player_device{}
    @editable Aud_Fail:audio_player_device = audio_player_device{}
    @editable Aud_EndEscape:audio_player_device = audio_player_device{}
    @editable Aud_EndTruth:audio_player_device = audio_player_device{}
    @editable Aud_EndNewGuest:audio_player_device = audio_player_device{}
    @editable Aud_Heartbeat:audio_player_device = audio_player_device{}
    @editable Aud_Rain:audio_player_device = audio_player_device{}
    @editable Aud_Fluor:audio_player_device = audio_player_device{}
    @editable Aud_CRT:audio_player_device = audio_player_device{}
    @editable Aud_Generator:audio_player_device = audio_player_device{}
    @editable Aud_Breaker:audio_player_device = audio_player_device{}
    @editable Aud_GuestBreath:audio_player_device = audio_player_device{}
    @editable Aud_Whisper:audio_player_device = audio_player_device{}
    @editable Aud_Page:audio_player_device = audio_player_device{}
    @editable Aud_Keypad:audio_player_device = audio_player_device{}
    @editable Aud_Door:audio_player_device = audio_player_device{}
    @editable Vfx_Lightning:vfx_spawner_device = vfx_spawner_device{}
    @editable Vfx_RevealGhosts:vfx_spawner_device = vfx_spawner_device{}
    @editable Vfx_GuestAppear:vfx_spawner_device = vfx_spawner_device{}
    @editable Pp_Capture:post_process_device = post_process_device{}
    @editable Pp_Reveal:post_process_device = post_process_device{}
    @editable Pp_Truth:post_process_device = post_process_device{}
    @editable Pp_NewGuest:post_process_device = post_process_device{}
    @editable GuestSpawner:npc_spawner_device = npc_spawner_device{}
    # QA only (GATE D): spawn one NPC and walk it across the R2.3 route including both stair flights.
    @editable NpcNavProof:logic = false
    @editable FlashlightGranter:item_granter_device = item_granter_device{}
    @editable FlashlightRemover:item_remover_device = item_remover_device{}
    @editable FlashlightInput:input_trigger_device = input_trigger_device{}
    @editable JournalInput:input_trigger_device = input_trigger_device{}
    @editable Light00:customizable_light_device = customizable_light_device{}
    @editable Light01:customizable_light_device = customizable_light_device{}
    @editable Light02:customizable_light_device = customizable_light_device{}
    @editable Light03:customizable_light_device = customizable_light_device{}
    @editable Light04:customizable_light_device = customizable_light_device{}
    @editable Light05:customizable_light_device = customizable_light_device{}
    @editable Light06:customizable_light_device = customizable_light_device{}
    @editable Light07:customizable_light_device = customizable_light_device{}
    @editable Light08:customizable_light_device = customizable_light_device{}
    @editable Light09:customizable_light_device = customizable_light_device{}
    @editable Light10:customizable_light_device = customizable_light_device{}
    @editable Light11:customizable_light_device = customizable_light_device{}
    @editable Light12:customizable_light_device = customizable_light_device{}
    @editable Light13:customizable_light_device = customizable_light_device{}
    @editable Light14:customizable_light_device = customizable_light_device{}
    @editable Light15:customizable_light_device = customizable_light_device{}
    @editable Light16:customizable_light_device = customizable_light_device{}
    @editable Light17:customizable_light_device = customizable_light_device{}
    @editable Light18:customizable_light_device = customizable_light_device{}
    @editable Light19:customizable_light_device = customizable_light_device{}
    @editable Light20:customizable_light_device = customizable_light_device{}
    @editable Light21:customizable_light_device = customizable_light_device{}
    @editable Light22:customizable_light_device = customizable_light_device{}
    @editable Light23:customizable_light_device = customizable_light_device{}
    @editable Light24:customizable_light_device = customizable_light_device{}
    @editable Light25:customizable_light_device = customizable_light_device{}
    @editable Light26:customizable_light_device = customizable_light_device{}
    @editable Light27:customizable_light_device = customizable_light_device{}
    @editable Light28:customizable_light_device = customizable_light_device{}
    @editable Light29:customizable_light_device = customizable_light_device{}
    AllLights()<transacts>:[]customizable_light_device = array{Light00, Light01, Light02, Light03, Light04, Light05, Light06, Light07, Light08, Light09, Light10, Light11, Light12, Light13, Light14, Light15, Light16, Light17, Light18, Light19, Light20, Light21, Light22, Light23, Light24, Light25, Light26, Light27, Light28, Light29}

    # ---- team progression flags (session shared) ----
    var ArrivalClueSeen:logic = false
    var ReceptionEntered:logic = false
    var PhoneMessageHeard:logic = false
    var Room13Key:logic = false
    var RegisterCluesSeen:logic = false
    var RegisterSolved:logic = false
    var OfficeKey:logic = false
    var OfficeOpen:logic = false
    var UpperFloorAccessGranted:logic = false
    var FuseA:logic = false
    var FuseB:logic = false
    var FuseC:logic = false
    var Screwdriver:logic = false
    var PanelCoverOpen:logic = false
    var SlotA:logic = false
    var SlotB:logic = false
    var SlotC:logic = false
    var PowerRestored:logic = false
    var DiaryFound:logic = false
    var ChildRoomClueFound:logic = false
    var MissingGuestEvidenceFound:logic = false
    var SecretPanelOpened:logic = false
    var Room13Unlocked:logic = false
    var PhotoSequenceSolved:logic = false
    var Room13RevealComplete:logic = false
    var ServiceKey:logic = false
    var ServiceDoorOpen:logic = false
    var GatePowered:logic = false
    var ServiceRouteReady:logic = false
    var CarKeys:logic = false
    var VehicleIgnitionSucceeded:logic = false
    var NightAuditActivated:logic = false
    # 0 NONE, 1 ESCAPE, 2 THE_TRUTH, 3 THE_NEW_GUEST
    var Ending:int = 0
    var GameOver:logic = false
    var Checkpoint:int = 0

    var Dial1:int = 0
    var Dial2:int = 0
    var Dial3:int = 0
    var OfficePhotoProgress:int = 0
    var Room13PhotoProgress:int = 0
    var VoteOpenedAt:float = -1.0
    var VoteSerial:int = 0
    var CurrentObjective:int = 0

    var Players:[player]motel_player = map{}
    var Huds:[player]motel_hud = map{}

    # ---- THE GUEST (authored-waypoint fallback, see UEFN_FEATURE_COMPATIBILITY_MATRIX_R1.md) ----
    var GuestActive:logic = false
    var GuestPos:vector3 = vector3{}
    var GuestNode:int = 54
    var GuestDir:int = 1
    var GuestRecoverUntil:float = 0.0
    var GuestPauseUntil:float = 0.0

    # Design metres (X east, Y north, Z up) -> engine centimetres. R3-DEC-001.
    P(X:float, Y:float, Z:float)<transacts>:vector3 =
        vector3{X := (Y - 36.0) * 100.0, Y := (X - 42.0) * 100.0, Z := 386.0 + Z * 100.0}

    Now():float = GetSimulationElapsedTime()

    Dial1Values:[]int = array{7, 2, 13, 11}
    Dial2Values:[]int = array{12, 14, 2, 13}
    Dial3Values:[]int = array{74, 13, 86, 68}

    Path():[]vector3 = array:
        P(26.9, 56.6, 0.0)
        P(27.0, 51.5, 0.0)
        P(21.5, 51.5, 0.0)
        P(20.0, 54.0, 0.0)
        P(15.0, 54.0, 0.0)
        P(10.95, 54.0, 0.0)
        P(9.55, 54.0, 0.0)
        P(9.55, 47.5, 0.0)
        P(9.55, 41.5, 0.0)
        P(9.55, 32.5, 0.0)
        P(9.55, 23.5, 0.0)
        P(9.55, 32.5, 0.0)
        P(9.55, 41.5, 0.0)
        P(9.55, 47.5, 0.0)
        P(9.55, 54.0, 0.0)
        P(10.95, 54.0, 0.0)
        P(15.0, 54.0, 0.0)
        P(20.0, 54.0, 0.0)
        P(21.5, 51.5, 0.0)
        P(23.25, 52.0, 0.0)
        P(23.25, 55.0, 1.8)
        P(24.75, 55.5, 1.8)
        P(24.75, 52.3, 3.6)
        P(24.75, 51.6, 3.6)
        P(24.0, 50.95, 3.6)
        P(24.0, 49.5, 3.6)
        P(18.4, 49.5, 3.6)
        P(18.4, 41.5, 3.6)
        P(18.4, 32.5, 3.6)
        P(18.4, 23.5, 3.6)
        P(18.4, 32.5, 3.6)
        P(18.4, 41.5, 3.6)
        P(18.4, 49.5, 3.6)
        P(42.0, 49.5, 3.6)
        P(65.6, 49.5, 3.6)
        P(65.6, 41.5, 3.6)
        P(65.6, 32.5, 3.6)
        P(65.6, 23.5, 3.6)
        P(65.6, 32.5, 3.6)
        P(65.6, 41.5, 3.6)
        P(65.6, 49.5, 3.6)
        P(42.0, 49.5, 3.6)
        P(24.0, 49.5, 3.6)
        P(24.0, 50.95, 3.6)
        P(24.75, 51.6, 3.6)
        P(24.75, 52.3, 3.6)
        P(24.75, 55.5, 1.8)
        P(23.25, 55.0, 1.8)
        P(23.25, 52.0, 0.0)
        P(21.5, 51.5, 0.0)
        P(27.0, 51.5, 0.0)
        P(26.9, 56.6, 0.0)
        P(37.0, 54.0, 0.0)
        P(37.85, 54.0, 0.0)
        P(42.5, 54.0, 0.0)
        P(42.5, 51.0, 0.0)
        P(47.15, 51.0, 0.0)
        P(52.0, 52.4, 0.0)
        P(57.15, 51.0, 0.0)
        P(65.0, 54.0, 0.0)
        P(73.05, 54.0, 0.0)
        P(74.45, 54.0, 0.0)
        P(74.45, 47.5, 0.0)
        P(74.45, 41.5, 0.0)
        P(74.45, 32.5, 0.0)
        P(74.45, 23.5, 0.0)
        P(74.45, 32.5, 0.0)
        P(74.45, 41.5, 0.0)
        P(74.45, 47.5, 0.0)
        P(74.45, 54.0, 0.0)
        P(73.05, 54.0, 0.0)
        P(65.0, 54.0, 0.0)
        P(57.15, 51.0, 0.0)
        P(52.0, 52.4, 0.0)
        P(47.15, 51.0, 0.0)
        P(42.5, 51.0, 0.0)
        P(42.5, 54.0, 0.0)
        P(37.85, 54.0, 0.0)
        P(37.0, 54.0, 0.0)

    CheckpointPos(I:int)<transacts>:vector3 =
        case (I):
            1 => P(29.0, 56.0, 0.1)
            2 => P(64.5, 53.5, 0.1)
            3 => P(24.4, 51.6, 3.7)
            4 => P(56.0, 55.5, 3.7)
            _ => P(42.0, 14.0, 0.1)

    # ================= lifecycle =================
    OnBegin<override>()<suspends>:void =
        for (I -> B : AllButtons()):
            B.InteractedWithEvent.Subscribe(button_handler{Manager := Self, Index := I}.OnInteract)
            B.SetInteractionText(M(PromptFor(I)))
        GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerAdded)
        GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerRemoved)
        for (Pl : GetPlayspace().GetPlayers()):
            OnPlayerAdded(Pl)
        GuestProp.Hide()
        for (L : AllLights()):
            L.TurnOff()
        RefreshObjective()
        FlashlightInput.PressedEvent.Subscribe(OnFlashlightKey)
        JournalInput.PressedEvent.Subscribe(OnJournalKey)
        LightingStart()
        AudioStart()
        if (NpcNavProof?):
            GuestSpawner.SpawnedEvent.Subscribe(OnProofNpcSpawned)
            spawn{ NpcProofStart() }
        spawn{ FlashlightLoop() }
        spawn{ TickLoop() }
        spawn{ GuestLoop() }
        Print("[R3] OnBegin buttons={AllButtons().Length} doors={AllDoors().Length} lights={AllLights().Length}")
        if (SelfTest?):
            spawn{ SelfTestRun() }

    OnPlayerAdded(Pl:player):void =
        if (not Players[Pl]):
            if (set Players[Pl] = motel_player{}) {}
            BuildHud(Pl)
            ShowObjectiveTo(Pl)

    OnPlayerRemoved(Pl:player):void =
        # END-A01: a disconnect removes the voter and the quorum is recalculated.
        var NewPlayers:[player]motel_player = map{}
        for (K -> V : Players, K <> Pl):
            if (set NewPlayers[K] = V) {}
        set Players = NewPlayers
        if (VoteOpenedAt >= 0.0, Ending = 0):
            ResolveVotes(false)

    BuildHud(Pl:player):void =
        if (UI := GetPlayerUI[Pl]):
            T1 := text_block{DefaultText := M(""), DefaultTextColor := NamedColors.Orange}
            T2 := text_block{DefaultText := M(""), DefaultTextColor := NamedColors.White}
            T3 := text_block{DefaultText := M(""), DefaultTextColor := NamedColors.White, DefaultJustification := text_justification.Center}
            RB := color_block{DefaultColor := NamedColors.Black, DefaultOpacity := 0.85}
            RT := text_block{DefaultText := M(""), DefaultTextColor := NamedColors.White}
            LT := text_block{DefaultText := M("FLASHLIGHT 100%  [OFF]"), DefaultTextColor := NamedColors.White}
            RB.SetVisibility(widget_visibility.Collapsed)
            RT.SetVisibility(widget_visibility.Collapsed)
            C := canvas:
                Slots := array:
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.02, Y := 0.20}, Maximum := vector2{X := 0.02, Y := 0.20}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.0, Y := 0.0}
                        SizeToContent := true
                        Widget := T1
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.02, Y := 0.24}, Maximum := vector2{X := 0.02, Y := 0.24}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.0, Y := 0.0}
                        SizeToContent := true
                        Widget := T2
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.72}, Maximum := vector2{X := 0.5, Y := 0.72}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.5, Y := 0.5}
                        SizeToContent := true
                        Widget := T3
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.18, Y := 0.12}, Maximum := vector2{X := 0.82, Y := 0.66}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.0, Y := 0.0}
                        SizeToContent := false
                        Widget := RB
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.21, Y := 0.15}, Maximum := vector2{X := 0.21, Y := 0.15}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.0, Y := 0.0}
                        SizeToContent := true
                        Widget := RT
                    canvas_slot:
                        Anchors := anchors{Minimum := vector2{X := 0.02, Y := 0.90}, Maximum := vector2{X := 0.02, Y := 0.90}}
                        Offsets := margin{Left := 0.0, Top := 0.0, Right := 0.0, Bottom := 0.0}
                        Alignment := vector2{X := 0.0, Y := 0.0}
                        SizeToContent := true
                        Widget := LT
            UI.AddWidget(C)
            if (set Huds[Pl] = motel_hud{Canvas := C, TitleText := T1, BodyText := T2, ToastText := T3, ReaderBack := RB, ReaderText := RT, LightText := LT}) {}

    # ================= presentation helpers =================
    ToastTo(Pl:player, S:string):void =
        if (H := Huds[Pl], D := Players[Pl]):
            set D.ToastSerial += 1
            H.ToastText.SetText(M(S))
            spawn{ ClearToast(Pl, D.ToastSerial) }

    ClearToast(Pl:player, Serial:int)<suspends>:void =
        Sleep(5.0)
        if (H := Huds[Pl], D := Players[Pl], D.ToastSerial = Serial):
            H.ToastText.SetText(M(""))

    ToastAll(S:string):void =
        PushEvent(S)
        for (Pl -> D : Players):
            ToastTo(Pl, S)

    ReaderTo(Pl:player, S:string, Seconds:float):void =
        if (H := Huds[Pl], D := Players[Pl]):
            set D.ReaderSerial += 1
            Aud_Page.Play(Pl)
            H.ReaderText.SetText(M(S))
            H.ReaderBack.SetVisibility(widget_visibility.Visible)
            H.ReaderText.SetVisibility(widget_visibility.Visible)
            spawn{ ClearReader(Pl, D.ReaderSerial, Seconds) }

    ClearReader(Pl:player, Serial:int, Seconds:float)<suspends>:void =
        Sleep(Seconds)
        if (H := Huds[Pl], D := Players[Pl], D.ReaderSerial = Serial):
            H.ReaderBack.SetVisibility(widget_visibility.Collapsed)
            H.ReaderText.SetVisibility(widget_visibility.Collapsed)

    ReaderAll(S:string, Seconds:float):void =
        for (Pl -> D : Players):
            ReaderTo(Pl, S, Seconds)

    ComputeObjective():int =
        if (not ReceptionEntered?):
            1
        else if (not OfficeKey?):
            2
        else if (not UpperFloorAccessGranted?):
            3
        else if (not PowerRestored?):
            4
        else if (not Room13Unlocked?):
            5
        else if (not Room13RevealComplete? or not ServiceKey?):
            6
        else if (not FinaleReady[]):
            7
        else:
            8

    RefreshObjective():void =
        N := ComputeObjective()
        if (N <> CurrentObjective):
            set CurrentObjective = N
            for (Pl -> D : Players):
                ShowObjectiveTo(Pl)
        UpdateCheckpoint()

    ShowObjectiveTo(Pl:player):void =
        if (H := Huds[Pl]):
            H.TitleText.SetText(M(ObjTitle(CurrentObjective)))
            H.BodyText.SetText(M(ObjBody(CurrentObjective)))

    UpdateCheckpoint():void =
        var C:int = 0
        if (OfficeKey?):
            set C = 1
        if (PowerRestored?):
            set C = 2
        if (PowerRestored?, UpperFloorAccessGranted?):
            set C = 3
        if (Room13RevealComplete?):
            set C = 4
        if (C > Checkpoint):
            set Checkpoint = C
            ToastAll("CHECKPOINT REACHED")

    # ================= derived predicates =================
    FinaleReady()<transacts><decides>:void =
        PowerRestored?
        ServiceKey?
        GatePowered?
        ServiceRouteReady?
        Room13RevealComplete?

    CoreEscapeReady()<transacts><decides>:void =
        FinaleReady[]
        CarKeys?
        VehicleIgnitionSucceeded?

    TruthChainComplete()<transacts><decides>:void =
        DiaryFound?
        ChildRoomClueFound?
        MissingGuestEvidenceFound?

    TruthFound():int =
        var N:int = 0
        if (DiaryFound?):
            set N += 1
        if (ChildRoomClueFound?):
            set N += 1
        if (MissingGuestEvidenceFound?):
            set N += 1
        N

    StopAfter(A:audio_player_device, T:float)<suspends>:void =
        Sleep(T)
        A.Stop()

    OpenDoor(I:int):void =
        if (D := AllDoors()[I]):
            if (Aud_Door.TeleportTo[D.GetTransform().Translation, IdentityRotation()]) {}
            Aud_Door.Play()
            spawn{ StopAfter(Aud_Door, 2.5) }
            D.Hide()

    Pad(N:int):string =
        if (N < 10):
            "0{N}"
        else:
            "{N}"

    PromptFor(I:int):string =
        case (I):
            0 => "Look at the motel sign"
            1 => "Answer the telephone"
            2 => "Inspect the Room 13 key"
            3 => "Inspect the guest register"
            4 => "Turn the first dial"
            5 => "Turn the second dial"
            6 => "Turn the third dial"
            7 => "Enter the combination"
            8 => "Take the Office Key"
            9 => "Unlock the office"
            10 => "Photograph - 1982"
            11 => "Photograph - 1974"
            12 => "Photograph - 1986"
            13 => "Photograph - 1978"
            14 => "Inspect"
            15 => "Inspect"
            16 => "Inspect"
            17 => "Open the electrical cover"
            18 => "Install Fuse A"
            19 => "Install Fuse B"
            20 => "Install Fuse C"
            21 => "Activate the breaker"
            22 => "Read the diary"
            23 => "Inspect the drawing"
            24 => "Open the concealed panel"
            25 => "Unlock Room 13"
            26 => "Photograph - 1981"
            27 => "Photograph - 1968"
            28 => "Photograph - 1986"
            29 => "Photograph - 1974"
            30 => "Take the Service Key"
            31 => "Use the Service Key"
            32 => "Unlock the service control"
            33 => "Collect the car keys"
            34 => "Start the vehicle"
            35 => "Choose: ESCAPE"
            36 => "Choose: THE TRUTH"
            37 => "Choose: THE NEW GUEST - ACCEPT THE ROOM"
            38 => "LEAVE THE KEY"
            39 => "ACTIVATE NIGHT AUDIT"
            40 => "Collect Fuse A"
            41 => "Collect Fuse B"
            42 => "Collect Fuse C"
            43 => "Collect the screwdriver"
            44 => "Inspect the missing-guest photographs"
            45 => "Watch the CRT"
            46 => "Listen to the recording / Read transcript"
            60 => "Collect the battery"
            61 => "Collect the battery"
            62 => "Collect the battery"
            _ => "Hide / Leave hiding place"

    # ================= interactions =================
    HandleInteraction(Agent:agent, I:int):void =
        if (Pl := player[Agent], D := Players[Pl], not GameOver?):
            if (D.Captured?):
                ToastTo(Pl, "You cannot do that right now.")
            else if (I >= 60):
                BatteryPickup(Pl, D, I)
            else if (I >= 47):
                ToggleHide(Pl, D)
            else if (D.Hidden?):
                ToastTo(Pl, "You cannot do that right now.")
            else:
                Interact(Pl, D, I)
                RefreshObjective()

    Missing(Pl:player):void =
        ToastTo(Pl, "Something is still missing.")

    Pickup(Pl:player):void =
        ToastAll("Added to group inventory.")

    Interact(Pl:player, D:motel_player, I:int):void =
        case (I):
            0 =>
                set ArrivalClueSeen = true
                ToastTo(Pl, "RAVEN MOTEL - the neon reads 02:13.")
            1 =>
                set PhoneMessageHeard = true
                ReaderTo(Pl, PhoneWelcome, 6.0)
            2 =>
                if (Room13Key?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set Room13Key = true
                    ToastAll("ROOM 13 key - added to group inventory.")
                    Aud_Pickup.Play()
            3 =>
                set RegisterCluesSeen = true
                ReaderTo(Pl, Register, 25.0)
            4 =>
                set Dial1 = Mod[Dial1 + 1, 4] or 0
                ShowDials(Pl)
            5 =>
                set Dial2 = Mod[Dial2 + 1, 4] or 0
                ShowDials(Pl)
            6 =>
                set Dial3 = Mod[Dial3 + 1, 4] or 0
                ShowDials(Pl)
            7 =>
                if (RegisterSolved?):
                    ToastTo(Pl, "Already recorded.")
                else if (Dial1Values[Dial1] = 2, Dial2Values[Dial2] = 13, Dial3Values[Dial3] = 86):
                    set RegisterSolved = true
                    ToastAll("Puzzle solved. The desk drawer opens.")
                else:
                    ToastTo(Pl, "That combination is incorrect.")
                    Aud_Fail.Play(Pl)
            8 =>
                if (not RegisterSolved?):
                    Missing(Pl)
                else if (OfficeKey?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set OfficeKey = true
                    ToastAll("Office Key - added to group inventory.")
                    Aud_Pickup.Play()
            9 =>
                if (not OfficeKey?):
                    Missing(Pl)
                else if (not OfficeOpen?):
                    set OfficeOpen = true
                    OpenDoor(0)
                    ToastAll("Access unlocked.")
            10 => OfficePhotoPress(Pl, 1982, 2)
            11 => OfficePhotoPress(Pl, 1974, 0)
            12 => OfficePhotoPress(Pl, 1986, 3)
            13 => OfficePhotoPress(Pl, 1978, 1)
            14 => ReaderTo(Pl, "HE WAITS OUTSIDE THE DOOR.", 6.0)
            15 => ReaderTo(Pl, "If the sign is lit, do not answer the desk phone.", 6.0)
            16 => ReaderTo(Pl, "NO CHECK-OUT RECORDED.", 6.0)
            17 =>
                if (PanelCoverOpen?):
                    ToastTo(Pl, "Already recorded.")
                else if (not Screwdriver?):
                    ReaderTo(Pl, "MAIN POWER - STAFF ONLY.", 5.0)
                    Missing(Pl)
                else:
                    set PanelCoverOpen = true
                    ToastAll("Panel opened.")
            18 => InstallFuse(Pl, 0)
            19 => InstallFuse(Pl, 1)
            20 => InstallFuse(Pl, 2)
            21 =>
                if (PowerRestored?):
                    ToastTo(Pl, "Already recorded.")
                else if (SlotA?, SlotB?, SlotC?):
                    set PowerRestored = true
                    for (L : AllLights()):
                        L.TurnOn()
                    # LCS-004: emergency corridor state ends once; normal corridor practicals are in AllLights
                    L_CorridorW.TurnOff()
                    L_CorridorE.TurnOff()
                    Aud_Power.Play()
                    Aud_Breaker.Play()
                    Aud_Generator.Play()
                    ToastAll("POWER RESTORED")
                else:
                    Missing(Pl)
            22 =>
                if (not UpperFloorAccessGranted?):
                    Missing(Pl)
                else if (D.DiaryPage = 0):
                    set D.DiaryPage = 1
                    ReaderTo(Pl, DiaryA, 40.0)
                else:
                    set D.DiaryPage = 0
                    ReaderTo(Pl, DiaryB, 40.0)
                    Evidence(Pl, 0)
            23 =>
                if (not UpperFloorAccessGranted?):
                    Missing(Pl)
                else:
                    ReaderTo(Pl, ChildDrawing, 25.0)
                    Evidence(Pl, 1)
            24 =>
                if (SecretPanelOpened?):
                    ToastTo(Pl, "Already recorded.")
                else if (not UpperFloorAccessGranted?):
                    Missing(Pl)
                else if (not Screwdriver?):
                    ReaderTo(Pl, "The room was never built. It was always here.", 6.0)
                    Missing(Pl)
                else:
                    set SecretPanelOpened = true
                    OpenDoor(2)
                    ToastAll("Panel opened.")
            25 =>
                if (Room13Unlocked?):
                    ToastTo(Pl, "Already recorded.")
                else if (SecretPanelOpened?, Room13Key?):
                    set Room13Unlocked = true
                    OpenDoor(3)
                    ToastAll("Access unlocked.")
                else:
                    Missing(Pl)
            26 => Room13PhotoPress(Pl, 1981, 2)
            27 => Room13PhotoPress(Pl, 1968, 0)
            28 => Room13PhotoPress(Pl, 1986, 3)
            29 => Room13PhotoPress(Pl, 1974, 1)
            30 =>
                if (not Room13RevealComplete?):
                    Missing(Pl)
                else if (ServiceKey?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set ServiceKey = true
                    ToastAll("Service Key - added to group inventory.")
                    Aud_Pickup.Play()
            31 =>
                if (not ServiceKey?):
                    Missing(Pl)
                else if (not ServiceDoorOpen?):
                    set ServiceDoorOpen = true
                    OpenDoor(4)
                    ToastAll("Access unlocked.")
            32 =>
                if (GatePowered?):
                    ToastTo(Pl, "Already recorded.")
                else if (PowerRestored?, ServiceKey?, Room13RevealComplete?):
                    set GatePowered = true
                    Aud_Gate.Play()
                    set ServiceRouteReady = true
                    ToastAll("Service route unlocked.")
                else:
                    Missing(Pl)
            33 =>
                if (CarKeys?):
                    ToastTo(Pl, "Already secured by the group.")
                else if (FinaleReady[]):
                    set CarKeys = true
                    ToastAll("Car Keys - added to group inventory.")
                    Aud_Pickup.Play()
                else:
                    Missing(Pl)
            34 =>
                if (VehicleIgnitionSucceeded?):
                    ToastTo(Pl, "Vehicle ready.")
                else if (FinaleReady[], CarKeys?):
                    set VehicleIgnitionSucceeded = true
                    ToastAll("Vehicle ready.")
                else:
                    Missing(Pl)
            35 => CastVote(Pl, D, 1)
            36 => CastVote(Pl, D, 2)
            37 => CastVote(Pl, D, 3)
            38 => CastVote(Pl, D, 4)
            39 =>
                if (Ending = 2, not NightAuditActivated?):
                    set NightAuditActivated = true
                    spawn{ TruthSequence(Pl) }
                else:
                    ToastTo(Pl, "This cannot be used right now.")
            40 =>
                if (FuseA?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set FuseA = true
                    ReaderTo(Pl, FuseTagA, 6.0)
                    ToastAll("Fuse A - added to group inventory.")
                    Aud_Pickup.Play()
            41 =>
                if (FuseB?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set FuseB = true
                    ReaderTo(Pl, FuseTagB, 6.0)
                    ToastAll("Fuse B - added to group inventory.")
                    Aud_Pickup.Play()
            42 =>
                if (FuseC?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set FuseC = true
                    ReaderTo(Pl, FuseTagC, 6.0)
                    ToastAll("Fuse C - added to group inventory.")
                    Aud_Pickup.Play()
            43 =>
                if (Screwdriver?):
                    ToastTo(Pl, "Already secured by the group.")
                else:
                    set Screwdriver = true
                    ToastAll("Screwdriver - added to group inventory.")
                    Aud_Pickup.Play()
            44 =>
                ReaderTo(Pl, Room06Archive, 40.0)
                Evidence(Pl, 2)
            45 => ToastTo(Pl, "The CRT shows the corridor outside this room. It is empty.")
            46 =>
                set Room04TranscriptRead = true
                ReaderTo(Pl, Room04Transcript, 30.0)
            _ => {}

    ShowDials(Pl:player):void =
        Aud_Keypad.Play()
        if (A := Dial1Values[Dial1], B := Dial2Values[Dial2], C := Dial3Values[Dial3]):
            ToastAll("{Pad(A)} - {Pad(B)} - {Pad(C)}")

    Evidence(Pl:player, Which:int):void =
        var First:logic = false
        if (Which = 0, not DiaryFound?):
            set DiaryFound = true
            set First = true
        if (Which = 1, not ChildRoomClueFound?):
            set ChildRoomClueFound = true
            set First = true
        if (Which = 2, not MissingGuestEvidenceFound?):
            set MissingGuestEvidenceFound = true
            set First = true
        if (First?):
            Aud_Evidence.Play()
            ToastAll("Evidence added to journal. Truth evidence: {TruthFound()}/3")

    OfficePhotoPress(Pl:player, Year:int, Order:int):void =
        if (not OfficeOpen?):
            Missing(Pl)
        else if (UpperFloorAccessGranted?):
            ReaderTo(Pl, OfficePhoto(Year), 8.0)
        else if (Order = OfficePhotoProgress):
            set OfficePhotoProgress += 1
            ReaderTo(Pl, OfficePhoto(Year), 8.0)
            if (OfficePhotoProgress >= 4):
                set UpperFloorAccessGranted = true
                OpenDoor(1)
                ToastAll("Puzzle solved. Access unlocked.")
            else:
                ToastAll("Photograph placed ({OfficePhotoProgress}/4).")
        else:
            # wrong placement resets the board; a first-position photo immediately starts a new attempt
            if (Order = 0):
                set OfficePhotoProgress = 1
            else:
                set OfficePhotoProgress = 0
            ReaderTo(Pl, OfficePhoto(Year), 8.0)
            ToastAll("The photographs do not fit.")
            Aud_Fail.Play(Pl)

    Room13PhotoPress(Pl:player, Year:int, Order:int):void =
        if (not Room13Unlocked?):
            Missing(Pl)
        else if (PhotoSequenceSolved?):
            ReaderTo(Pl, Room13Photo(Year), 10.0)
        else if (Order = Room13PhotoProgress):
            set Room13PhotoProgress += 1
            ReaderTo(Pl, Room13Photo(Year), 10.0)
            if (Room13PhotoProgress >= 4):
                set PhotoSequenceSolved = true
                ToastAll("Puzzle solved.")
                spawn{ RevealSequence() }
            else:
                ToastAll("Photograph placed ({Room13PhotoProgress}/4).")
        else:
            if (Order = 0):
                set Room13PhotoProgress = 1
            else:
                set Room13PhotoProgress = 0
            ReaderTo(Pl, Room13Photo(Year), 10.0)
            ToastAll("The photographs do not fit.")
            Aud_Fail.Play(Pl)

    InstallFuse(Pl:player, Slot:int):void =
        if (not PanelCoverOpen?):
            Missing(Pl)
        else:
            var Have:logic = false
            var Filled:logic = false
            if (Slot = 0):
                set Have = FuseA
                set Filled = SlotA
            if (Slot = 1):
                set Have = FuseB
                set Filled = SlotB
            if (Slot = 2):
                set Have = FuseC
                set Filled = SlotC
            if (Filled?):
                ToastTo(Pl, "Already recorded.")
            else if (Have?):
                if (Slot = 0):
                    set SlotA = true
                if (Slot = 1):
                    set SlotB = true
                if (Slot = 2):
                    set SlotC = true
                ToastAll("Fuse installed.")
            else if (FuseA? or FuseB? or FuseC?):
                ToastTo(Pl, "That fuse does not fit this socket.")
                Aud_Fail.Play(Pl)
            else:
                Missing(Pl)

    ToggleHide(Pl:player, D:motel_player):void =
        if (FC := Pl.GetFortCharacter[]):
            if (D.Hidden?):
                set D.Hidden = false
                FC.ReleaseFromStasis()
                FC.Show()
                ToastTo(Pl, "You left the hiding place.")
            else:
                set D.Hidden = true
                FC.PutInStasis(stasis_args{AllowTurning := true, AllowFalling := false, AllowEmotes := false})
                FC.Hide()
                ToastTo(Pl, "You are hidden.")

    # ================= ROOM 13 reveal =================
    RevealSequence()<suspends>:void =
        # Reveal presentation must finish before Room13RevealComplete commits (PZ-04 contract).
        RevealPos := P(56.5, 55.5, 3.6)
        # The silhouette mark is used only while THE GUEST is not already roaming; a visible Guest is never teleported.
        if (not GuestActive?, GuestProp.TeleportTo[RevealPos, IdentityRotation()]):
            GuestProp.Show()
        Aud_Reveal.Play()
        Aud_Whisper.Play()
        Pp_Reveal.BlendInForAll()
        Vfx_RevealGhosts.Enable()
        ReaderAll(Room13Photo(1986), 9.0)
        Sleep(9.0)
        Pp_Reveal.BlendOutForAll()
        Vfx_RevealGhosts.Disable()
        if (not GuestActive?):
            GuestProp.Hide()
        set Room13RevealComplete = true
        ToastAll("The hidden compartment opens.")
        RefreshObjective()

    # ================= endings (END-A01 / END-A02) =================
    ActiveCount():int =
        var N:int = 0
        for (Pl -> D : Players):
            set N += 1
        N

    CastVote(Pl:player, D:motel_player, Choice:int):void =
        if (Ending <> 0):
            ToastTo(Pl, "This cannot be used right now.")
        else if (not FinaleReady[]):
            Missing(Pl)
        else if (Choice = 4):
            set D.Vote = 0
            ToastAll("The invitation was declined.")
        else if (Choice = 1, not CoreEscapeReady[]):
            Missing(Pl)
        else if (Choice = 2, not TruthChainComplete[]):
            ToastTo(Pl, "The evidence is incomplete.")
        else:
            if (Choice = 3):
                ReaderTo(Pl, NewGuestInvite, 10.0)
            set D.Vote = Choice
            ToastTo(Pl, "Vote submitted.")
            if (VoteOpenedAt < 0.0):
                set VoteOpenedAt = Now()
                set VoteSerial += 1
                spawn{ VoteTimeout(VoteSerial) }
            ResolveVotes(false)

    VoteTimeout(Serial:int)<suspends>:void =
        Sleep(20.0)
        if (Serial = VoteSerial, Ending = 0, VoteOpenedAt >= 0.0):
            ResolveVotes(true)

    ClearVotes():void =
        for (Pl -> D : Players):
            set D.Vote = 0
        set VoteOpenedAt = -1.0
        set VoteSerial += 1

    ResolveVotes(TimedOut:logic):void =
        N := ActiveCount()
        var E:int = 0
        var T:int = 0
        var G:int = 0
        var Voted:int = 0
        for (Pl -> D : Players):
            if (D.Vote = 1):
                set E += 1
            if (D.Vote = 2):
                set T += 1
            if (D.Vote = 3):
                set G += 1
            if (D.Vote <> 0):
                set Voted += 1
        if (N > 0):
            if (G = N):
                CommitEnding(3)
            else if (E * 2 > N, CoreEscapeReady[]):
                CommitEnding(1)
            else if (T * 2 > N, TruthChainComplete[]):
                CommitEnding(2)
            else if (Voted = N or TimedOut?):
                # tie / timeout: ESCAPE only if eligible, otherwise reopen the selector
                if (CoreEscapeReady[]):
                    CommitEnding(1)
                else:
                    ClearVotes()
                    ToastAll("No decision was reached. Choose again.")
            else:
                ToastAll("Waiting for the group...")

    CommitEnding(Which:int):void =
        if (Ending = 0):
            set Ending = Which
            set VoteOpenedAt = -1.0
            if (Which = 1):
                Aud_EndEscape.Play()
                spawn{ EscapeSequence() }
            else if (Which = 2):
                Aud_EndTruth.Play()
                Pp_Truth.BlendInForAll()
                ReaderAll(TruthRecorder, 30.0)
                ToastAll("THE TRUTH")
            else:
                Aud_EndNewGuest.Play()
                spawn{ NewGuestSequence() }

    FinishGame(Title:string)<suspends>:void =
        ReaderAll(Title, 8.0)
        Sleep(8.0)
        set GameOver = true
        Print("[R3] ENDING COMMITTED: {Title} (Ending={Ending})")
        for (Pl -> D : Players):
            EndGame.Activate(Pl)

    EscapeSequence()<suspends>:void =
        ReaderAll(EscapeRadio, 8.0)
        Sleep(8.0)
        FinishGame("ESCAPE")

    TruthSequence(Pl:player)<suspends>:void =
        ToastAll("Night audit complete.")
        set GuestActive = false
        GuestProp.Hide()
        Aud_GuestBreath.Stop()
        # LCS-009: interior practicals out room by room; parking, courtyard and neon stay on at 02:13
        for (L : array{L_ReceptionMain, L_CorridorW, L_CorridorE, L_Room13Red, L_EscapeRed}):
            L.TurnOff()
        for (L : AllLights()):
            L.TurnOff()
            Sleep(0.4)
        ReaderAll(TruthPrint, 8.0)
        Sleep(8.0)
        FinishGame("THE TRUTH")

    NewGuestSequence()<suspends>:void =
        Pp_NewGuest.BlendInForAll()
        set GuestActive = false
        GuestProp.Hide()
        Aud_GuestBreath.Stop()
        for (L : AllLights()):
            L.TurnOn()
            Sleep(0.4)
        ReaderAll("The ROOM 13 key returns to the rack.\nThe register gains a blank line under NEXT GUEST.", 8.0)
        Sleep(8.0)
        FinishGame("THE NEW GUEST")

    # ================= periodic player state =================
    TickLoop()<suspends>:void =
        loop:
            Sleep(0.5)
            if (GameOver?):
                break
            T := Now()
            LightingTick()
            HeartbeatTick(T)
            if (not ReceptionEntered?):
                for (Pl -> D : Players, FC := Pl.GetFortCharacter[]):
                    L := FC.GetTransform().Translation
                    A := P(20.15, 48.3, 0.0)
                    B := P(37.7, 59.7, 0.0)
                    if (L.X >= A.X, L.X <= B.X, L.Y >= A.Y, L.Y <= B.Y):
                        set ReceptionEntered = true
                if (ReceptionEntered?):
                    L_ReceptionMain.TurnOn()
                    RefreshObjective()
            # capture recovery and rescue (IN-022)
            var AnyFree:logic = false
            for (Pl -> D : Players, not D.Captured?):
                set AnyFree = true
            for (Pl -> D : Players, D.Captured?, FC := Pl.GetFortCharacter[]):
                Loc := FC.GetTransform().Translation
                var Helper:logic = false
                for (Other -> OD : Players, Other <> Pl, not OD.Captured?, not OD.Hidden?, OFC := Other.GetFortCharacter[]):
                    if (Distance(OFC.GetTransform().Translation, Loc) < 200.0):
                        set Helper = true
                        ToastTo(Other, "Helping teammate...")
                if (Helper?):
                    set D.RescueProgress += 0.5
                else:
                    set D.RescueProgress = 0.0
                Waited := T - D.CapturedAt
                # 5 s uninterrupted rescue; 90 s self-recovery; 15 s when nobody is free to help
                if (D.RescueProgress >= 5.0):
                    Release(Pl, D, false)
                    ToastAll("Teammate rescued.")
                else if (Waited >= 90.0):
                    Release(Pl, D, true)
                else if (not AnyFree?, Waited >= 15.0):
                    Release(Pl, D, true)

    Release(Pl:player, D:motel_player, ToCheckpoint:logic):void =
        set D.Captured = false
        Pp_Capture.BlendOut(Pl)
        set D.RescueProgress = 0.0
        set D.ProtectedUntil = Now() + 8.0
        if (FC := Pl.GetFortCharacter[]):
            FC.ReleaseFromStasis()
            if (ToCheckpoint?):
                if (FC.TeleportTo[CheckpointPos(Checkpoint), IdentityRotation()]) {}

    # ================= THE GUEST =================
    GuestLoop()<suspends>:void =
        loop:
            if (PowerRestored?):
                break
            Sleep(1.0)
        Pts := Path()
        N := Pts.Length
        if (N > 0, Start := Pts[54]):
            set GuestPos = Start
            set GuestNode = 55
            set GuestActive = true
            if (GuestProp.TeleportTo[Start, IdentityRotation()]) {}
            GuestProp.Show()
            if (Aud_GuestBreath.TeleportTo[Start + vector3{X := 0.0, Y := 0.0, Z := 180.0}, IdentityRotation()]) {}
            Aud_GuestBreath.Play()
            if (Vfx_GuestAppear.TeleportTo[Start, IdentityRotation()]) {}
            Vfx_GuestAppear.Restart()
            loop:
                if (GameOver? or not GuestActive?):
                    break
                GuestStep(Pts, N)

    GuestStep(Pts:[]vector3, N:int)<suspends>:void =
        Dt := 0.3
        T := Now()
        var Target:?vector3 = false
        var TargetPlayer:?player = false
        var Best:float = 1200.0
        if (T >= GuestRecoverUntil):
            for (Pl -> D : Players, not D.Hidden?, not D.Captured?, T >= D.ProtectedUntil, FC := Pl.GetFortCharacter[]):
                L := FC.GetTransform().Translation
                Flat := Distance(vector3{X := L.X, Y := L.Y, Z := 0.0}, vector3{X := GuestPos.X, Y := GuestPos.Y, Z := 0.0})
                if (Abs(L.Z - GuestPos.Z) < 220.0, Flat < Best):
                    set Best = Flat
                    set Target = option{L}
                    set TargetPlayer = option{Pl}
        var Speed:float = 260.0
        var Dest:vector3 = GuestPos
        if (TL := Target?, TP := TargetPlayer?):
            set Speed = 540.0
            if (Best <= 140.0):
                Capture(TP)
                set GuestRecoverUntil = T + 18.0
                Sleep(2.5)
                return
            else if (Best < 400.0):
                set Dest = vector3{X := TL.X, Y := TL.Y, Z := GuestPos.Z}
            else:
                # follow the authored route toward the node nearest to the target
                var NearIdx:int = GuestNode
                var NearD:float = 1000000.0
                for (I -> Pt : Pts):
                    DD := Distance(Pt, TL)
                    if (DD < NearD):
                        set NearD = DD
                        set NearIdx = I
                Fwd := Mod[NearIdx - GuestNode + N, N] or 0
                if (Fwd * 2 <= N):
                    set GuestDir = 1
                else:
                    set GuestDir = -1
                if (Pt := Pts[GuestNode]):
                    set Dest = Pt
        else:
            if (T < GuestPauseUntil):
                Sleep(Dt)
                return
            if (Pt := Pts[GuestNode]):
                set Dest = Pt
        Delta := Dest - GuestPos
        Len := Delta.Length()
        StepLen := Speed * Dt
        var NewPos:vector3 = Dest
        if (Len > StepLen, Len > 0.01):
            set NewPos = GuestPos + Delta * (StepLen / Len)
        else if (not Target?):
            # reached a patrol node: advance and pause briefly at corridor ends
            set GuestNode = Mod[GuestNode + GuestDir + N, N] or 0
        else:
            set GuestNode = Mod[GuestNode + GuestDir + N, N] or 0
        var Yaw:float = 0.0
        if (Len > 1.0):
            set Yaw = RadiansToDegrees(ArcTan(Delta.Y, Delta.X))
        set GuestPos = NewPos
        if (Aud_GuestBreath.TeleportTo[NewPos + vector3{X := 0.0, Y := 0.0, Z := 180.0}, IdentityRotation()]) {}
        GuestProp.MoveTo(NewPos, MakeRotationFromYawPitchRollDegrees(Yaw + 90.0, 0.0, 0.0), Dt)

    Capture(Pl:player):void =
        if (D := Players[Pl], FC := Pl.GetFortCharacter[]):
            set D.Captured = true
            Aud_Capture.Play(Pl)
            Pp_Capture.BlendIn(Pl)
            set D.CapturedAt = Now()
            set D.RescueProgress = 0.0
            FC.PutInStasis(stasis_args{AllowTurning := true, AllowFalling := false, AllowEmotes := false})
            ReaderTo(Pl, "YOU HAVE BEEN TAKEN\n\nA teammate can free you. Otherwise the motel lets go in time.", 8.0)

    # ================= Journal (GAMEPLAY_UI_UX_SPEC §5) =================
    # R3-DEC-016: one key (Harvesting Tool) cycles Overview -> Evidence -> Items & Access -> full text of each
    # discovered document -> closed. Per-player view of shared state; it never changes progression or pauses threat.
    var Room04TranscriptRead:logic = false
    var RecentEvents:[]string = array{}

    PushEvent(S:string):void =
        var Keep:[]string = array{S}
        for (I -> E : RecentEvents, I < 9):
            set Keep += array{E}
        set RecentEvents = Keep

    Mark(B:logic):string =
        if (B?):
            "SECURED"
        else:
            "not found"

    FuseState(Have:logic, Slot:logic):string =
        if (Slot?):
            "INSTALLED"
        else if (Have?):
            "SECURED"
        else:
            "not found"

    Access(B:logic):string =
        if (B?):
            "OPEN"
        else:
            "LOCKED"

    JournalDocs():[]string =
        var Docs:[]string = array{}
        if (RegisterCluesSeen?):
            set Docs += array{Register}
        if (PhoneMessageHeard?):
            set Docs += array{"RECEPTION TELEPHONE\n\n" + PhoneWelcome}
        if (UpperFloorAccessGranted?):
            set Docs += array{"OWNER'S OFFICE PHOTOGRAPHS\n\n" + OfficePhoto(1974) + "\n\n" + OfficePhoto(1978) + "\n\n" + OfficePhoto(1982) + "\n\n" + OfficePhoto(1986)}
        if (Room04TranscriptRead?):
            set Docs += array{Room04Transcript}
        if (MissingGuestEvidenceFound?):
            set Docs += array{Room06Archive}
        if (DiaryFound?):
            set Docs += array{DiaryA, DiaryB}
        if (ChildRoomClueFound?):
            set Docs += array{ChildDrawing}
        if (PhotoSequenceSolved?):
            set Docs += array{"ROOM 13 PHOTOGRAPHS\n\n" + Room13Photo(1968) + "\n\n" + Room13Photo(1974) + "\n\n" + Room13Photo(1981) + "\n\n" + Room13Photo(1986)}
        Docs

    JournalOverview():string =
        var S:string = "JOURNAL - OVERVIEW   (journal key: next page)\n\nCURRENT OBJECTIVE\n{ObjTitle(CurrentObjective)}\n{ObjBody(CurrentObjective)}\n\nTruth evidence: {TruthFound()}/3\n\nRECENT EVENTS"
        if (RecentEvents.Length = 0):
            set S += "\n(none yet)"
        for (E : RecentEvents):
            set S += "\n- " + E
        S

    JournalEvidence():string =
        var S:string = "JOURNAL - EVIDENCE\n"
        var N:int = 0
        if (RegisterCluesSeen?):
            set S += "\n- Night register (Reception)"
            set N += 1
        if (PhoneMessageHeard?):
            set S += "\n- Reception telephone"
            set N += 1
        if (UpperFloorAccessGranted?):
            set S += "\n- Owner's office photographs"
            set N += 1
        if (Room04TranscriptRead?):
            set S += "\n- Recorded Telephone Message (Room 04)"
            set N += 1
        if (MissingGuestEvidenceFound?):
            set S += "\n- Missing Guest Photographs (Room 06)"
            set N += 1
        if (DiaryFound?):
            set S += "\n- Night Manager's Diary (Room 09)"
            set N += 1
        if (ChildRoomClueFound?):
            set S += "\n- The Child's Drawing (Room 11)"
            set N += 1
        if (PhotoSequenceSolved?):
            set S += "\n- ROOM 13 photographs"
            set N += 1
        if (N = 0):
            set S += "\nNo evidence recorded yet."
        set S += "\n\nTruth evidence: {TruthFound()}/3\nFull texts follow on the next pages."
        S

    JournalItems():string =
        "JOURNAL - ITEMS & ACCESS (team)\n\nRoom 13 key: {Mark(Room13Key)}\nOffice key: {Mark(OfficeKey)}\nScrewdriver: {Mark(Screwdriver)}\nService key: {Mark(ServiceKey)}\nCar keys: {Mark(CarKeys)}\n\nFuse A: {FuseState(FuseA, SlotA)}\nFuse B: {FuseState(FuseB, SlotB)}\nFuse C: {FuseState(FuseC, SlotC)}\nPower: {Access(PowerRestored)}\n\nOffice: {Access(OfficeOpen)}\nUpper floor: {Access(UpperFloorAccessGranted)}\nROOM 13: {Access(Room13Unlocked)}\nService gate: {Access(GatePowered)}"

    OnJournalKey(Agent:agent):void =
        if (Pl := player[Agent], D := Players[Pl]):
            Docs := JournalDocs()
            Total := 3 + Docs.Length
            set D.JournalPage = D.JournalPage + 1
            if (D.JournalPage > Total):
                set D.JournalPage = 0
            ShowJournal(Pl, D, Docs)

    ShowJournal(Pl:player, D:motel_player, Docs:[]string):void =
        if (D.JournalPage = 0):
            if (H := Huds[Pl]):
                set D.ReaderSerial += 1
                H.ReaderBack.SetVisibility(widget_visibility.Collapsed)
                H.ReaderText.SetVisibility(widget_visibility.Collapsed)
        else if (D.JournalPage = 1):
            ReaderTo(Pl, JournalOverview(), 600.0)
        else if (D.JournalPage = 2):
            ReaderTo(Pl, JournalEvidence(), 600.0)
        else if (D.JournalPage = 3):
            ReaderTo(Pl, JournalItems(), 600.0)
        else if (Doc := Docs[D.JournalPage - 4]):
            ReaderTo(Pl, Doc, 600.0)

    # ================= GATE D: NPC Spawner navigation proof =================
    NpcProofStart()<suspends>:void =
        Sleep(4.0)
        Print("[R3-NPC] spawning proof NPC")
        GuestSpawner.Enable()
        GuestSpawner.Spawn()

    OnProofNpcSpawned(Npc:agent):void =
        spawn{ NpcProofRun(Npc) }

    NpcProofRun(Npc:agent)<suspends>:void =
        Print("[R3-NPC] spawned")
        Sleep(2.0)
        if (FC := Npc.GetFortCharacter[], Nav := FC.GetNavigatable[]):
            Names:[]string = array{"reception", "stair foot", "landing", "upper landing", "north balcony", "east balcony N", "east balcony S", "west balcony S", "back to stair top", "back to ground", "storage", "east corridor"}
            Pts:[]vector3 = array{P(26.9, 56.6, 0.0), P(23.25, 51.7, 0.0), P(24.0, 55.6, 1.8), P(24.75, 51.7, 3.6), P(24.0, 49.5, 3.6), P(65.6, 49.5, 3.6), P(65.6, 23.5, 3.6), P(18.4, 23.5, 3.6), P(24.75, 51.7, 3.6), P(23.25, 51.7, 0.0), P(52.0, 52.4, 0.0), P(74.45, 32.5, 0.0)}
            var Ok:int = 0
            for (I -> Target : Pts, Name := Names[I]):
                Start := Now()
                R := Nav.NavigateTo(MakeNavigationTarget(Target), ?MovementType := movement_type.Running, ?ReachRadius := 80.0)
                Pos := FC.GetTransform().Translation
                Miss := Distance(Pos, Target)
                var Res:string = "other"
                case (R):
                    navigation_result.Reached => set Res = "Reached"
                    navigation_result.PartiallyReached => set Res = "PartiallyReached"
                    navigation_result.Blocked => set Res = "Blocked"
                    navigation_result.Unreachable => set Res = "Unreachable"
                    navigation_result.Interrupted => set Res = "Interrupted"
                    _ => {}
                if (Res = "Reached"):
                    set Ok += 1
                Print("[R3-NPC] leg {Name}: {Res} in {Now() - Start}s, miss {Miss}cm, z={Pos.Z}")
            Print("[R3-NPC] DONE reached {Ok}/{Pts.Length}")
        else:
            Print("[R3-NPC] FAIL no fort_character or navigatable on spawned NPC")

    # ================= audio cues (AUDIO_CUE_SHEET.csv, first-party Fortnite sounds) =================
    # R3-DEC-017: beds and stingers use the Audio Player device's built-in Fortnite sound list.
    AudioStart():void =
        Aud_Wind.Play()
        Aud_Neon.Play()
        Aud_Rain.Play()
        Aud_Fluor.Play()
        Aud_CRT.Play()
        spawn{ ThunderLoop() }

    ThunderLoop()<suspends>:void =
        loop:
            Sleep(GetRandomFloat(45.0, 90.0))
            if (GameOver?):
                break
            Vfx_Lightning.Enable()
            Sleep(GetRandomFloat(0.4, 1.6))
            Aud_Thunder.Play()

    HeartbeatTick(T:float):void =
        if (GuestActive?):
            for (Pl -> D : Players, not D.Captured?, T >= D.HeartAt, FC := Pl.GetFortCharacter[]):
                L := FC.GetTransform().Translation
                if (Distance(L, GuestPos) < 800.0, Abs(L.Z - GuestPos.Z) < 250.0):
                    set D.HeartAt = T + 8.0
                    Aud_Heartbeat.Play(Pl)

    # ================= lighting cues (LIGHTING_CUE_SHEET.csv) =================
    var Room13Lit:logic = false
    var EscapeLit:logic = false

    # LCS-001/002/005: exterior, courtyard and neon on at session start; LCS-004 corridors in emergency state before power.
    LightingStart():void =
        for (L : array{L_ParkA, L_ParkB, L_CourtA, L_CourtB, L_Neon, L_CorridorW, L_CorridorE}):
            L.TurnOn()
        for (L : array{L_ReceptionMain, L_Room13Red, L_EscapeRed}):
            L.TurnOff()

    # LCS-006 while any player is inside ROOM 13; LCS-007 once the finale route is ready.
    LightingTick():void =
        if (Ending = 0):
            var Inside:logic = false
            A := P(49.0, 51.1, 3.0)
            B := P(63.7, 59.7, 3.0)
            for (Pl -> D : Players, FC := Pl.GetFortCharacter[]):
                L := FC.GetTransform().Translation
                if (L.X >= A.X, L.X <= B.X, L.Y >= A.Y, L.Y <= B.Y, L.Z > A.Z):
                    set Inside = true
            if (Inside?, not Room13Lit?):
                set Room13Lit = true
                L_Room13Red.TurnOn()
                Aud_Room13.Play()
            else if (not Inside?, Room13Lit?):
                set Room13Lit = false
                L_Room13Red.TurnOff()
                Aud_Room13.Stop()
            if (not EscapeLit?, FinaleReady[]):
                set EscapeLit = true
                L_EscapeRed.TurnOn()
                Aud_Threat.Play()

    # ================= IN-009 personal flashlight =================
    # R3-DEC-013: Fortnite "Torcia" item (WID_Ranged_Flashlight) granted while the light is ON and removed when OFF or empty.
    # The input trigger (Place Marker key) toggles it, so charge drains only during active use.
    LightPct(D:motel_player)<transacts>:int =
        if (V := Int[D.Charge * 100.0 / 180.0]):
            V
        else:
            0

    ShowLight(Pl:player, D:motel_player):void =
        if (H := Huds[Pl]):
            Pct := LightPct(D)
            var State:string = "OFF"
            if (D.LightOn?):
                set State = "ON"
            if (D.Charge <= 0.0):
                H.LightText.SetText(M("FLASHLIGHT EMPTY - find a battery"))
            else if (Pct < 15):
                H.LightText.SetText(M("FLASHLIGHT {Pct}%  [{State}]  - LOW"))
            else:
                H.LightText.SetText(M("FLASHLIGHT {Pct}%  [{State}]"))

    SetLight(Pl:player, D:motel_player, On:logic):void =
        if (On?):
            if (D.Charge > 0.0, not D.Captured?, not D.Hidden?):
                set D.LightOn = true
                FlashlightGranter.GrantItem(Pl)
        else:
            set D.LightOn = false
            FlashlightRemover.Remove(Pl)
        ShowLight(Pl, D)

    OnFlashlightKey(Agent:agent):void =
        if (Pl := player[Agent], D := Players[Pl], not GameOver?):
            if (D.LightOn?):
                SetLight(Pl, D, false)
            else if (D.Charge <= 0.0):
                ToastTo(Pl, "The flashlight is empty.")
                ShowLight(Pl, D)
            else:
                SetLight(Pl, D, true)

    FlashlightLoop()<suspends>:void =
        loop:
            Sleep(1.0)
            if (GameOver?):
                break
            for (Pl -> D : Players):
                if (D.LightOn?):
                    if (D.Captured? or D.Hidden?):
                        SetLight(Pl, D, false)
                    else:
                        set D.Charge = Max(0.0, D.Charge - 1.0)
                        if (D.Charge <= 0.0):
                            SetLight(Pl, D, false)
                            ToastTo(Pl, "The flashlight went out.")
                        else:
                            if (LightPct(D) < 15, not D.LowWarned?):
                                set D.LowWarned = true
                                ToastTo(Pl, "Flashlight battery low.")
                            ShowLight(Pl, D)

    # One claim per player per authored battery spawn; only the collector's charge changes (UI-015).
    BatteryPickup(Pl:player, D:motel_player, I:int):void =
        if (D.Claimed[I]):
            ToastTo(Pl, "You already took this battery.")
        else if (D.Charge >= 180.0):
            ToastTo(Pl, "Flashlight already fully charged.")
        else:
            if (set D.Claimed[I] = true) {}
            set D.Charge = 180.0
            set D.LowWarned = false
            ToastTo(Pl, "Flashlight fully charged.")
            ShowLight(Pl, D)

    # ================= QA self-test (GATE D/E runtime evidence) =================
    B2S(B:logic):string =
        if (B?):
            "1"
        else:
            "0"

    Dump(Tag:string):void =
        Print("[R3-TEST] {Tag} obj={CurrentObjective} cp={Checkpoint} rec={B2S(ReceptionEntered)} reg={B2S(RegisterSolved)} okey={B2S(OfficeKey)} odoor={B2S(OfficeOpen)} up={B2S(UpperFloorAccessGranted)} fA={B2S(FuseA)} fB={B2S(FuseB)} fC={B2S(FuseC)} sd={B2S(Screwdriver)} cov={B2S(PanelCoverOpen)} sA={B2S(SlotA)} sB={B2S(SlotB)} sC={B2S(SlotC)} pwr={B2S(PowerRestored)} truth={TruthFound()} panel={B2S(SecretPanelOpened)} r13={B2S(Room13Unlocked)} pz4={B2S(PhotoSequenceSolved)} reveal={B2S(Room13RevealComplete)} skey={B2S(ServiceKey)} sdoor={B2S(ServiceDoorOpen)} gate={B2S(GatePowered)} ckeys={B2S(CarKeys)} ign={B2S(VehicleIgnitionSucceeded)} ending={Ending} audit={B2S(NightAuditActivated)} over={B2S(GameOver)}")

    Press(Pl:player, Seq:[]int)<suspends>:void =
        for (I : Seq):
            HandleInteraction(Pl, I)
            Sleep(0.2)

    SelfTestRun()<suspends>:void =
        var Tester:?player = false
        loop:
            if (Pl := GetPlayspace().GetPlayers()[0]):
                set Tester = option{Pl}
                break
            Sleep(1.0)
        Sleep(3.0)
        if (Pl := Tester?, FC := Pl.GetFortCharacter[]):
            Dump("T00 start")
            # negative cases first: nothing may commit without prerequisites
            Press(Pl, array{8, 9, 11, 17, 18, 21, 24, 25, 30, 31, 32, 33, 34, 35, 36, 37, 39})
            Dump("T01 negative-prereq (expect all 0)")
            if (FC.TeleportTo[P(29.0, 53.0, 0.3), IdentityRotation()]) {}
            Sleep(2.0)
            Dump("T02 reception entered (expect rec=1 obj=2)")
            if (D0 := Players[Pl]):
                OnFlashlightKey(Pl)
                Sleep(3.2)
                Print("[R3-TEST] F01 light on after 3s: on={B2S(D0.LightOn)} charge={D0.Charge} (expect on=1 charge 176-177)")
                OnFlashlightKey(Pl)
                Sleep(2.0)
                Print("[R3-TEST] F02 light off: on={B2S(D0.LightOn)} charge={D0.Charge} (expect on=0, charge unchanged)")
                HandleInteraction(Pl, 60)
                Print("[R3-TEST] F03 battery: charge={D0.Charge} (expect 180)")
                set D0.Charge = 10.0
                HandleInteraction(Pl, 60)
                Print("[R3-TEST] F04 same battery again: charge={D0.Charge} (expect 10, already taken)")
                HandleInteraction(Pl, 61)
                Print("[R3-TEST] F05 second battery: charge={D0.Charge} (expect 180)")
                set D0.Charge = 2.0
                OnFlashlightKey(Pl)
                Sleep(3.2)
                Print("[R3-TEST] F06 run empty: on={B2S(D0.LightOn)} charge={D0.Charge} (expect on=0 charge=0)")
                OnFlashlightKey(Pl)
                Print("[R3-TEST] F07 key while empty: on={B2S(D0.LightOn)} (expect 0)")
                HandleInteraction(Pl, 62)
                Print("[R3-TEST] F08 third battery: charge={D0.Charge} (expect 180)")
            Press(Pl, array{0, 1, 2, 3, 7})
            Dump("T03 wrong code (expect reg=0)")
            Press(Pl, array{4, 5, 5, 5, 6, 6, 7, 7, 8, 8})
            Dump("T04 PZ-01 02-13-86 + office key (expect reg=1 okey=1 cp=1 obj=3)")
            Press(Pl, array{9, 10, 11, 13})
            Dump("T05 PZ-02 wrong order (expect up=0)")
            Press(Pl, array{11, 13, 10, 12})
            Dump("T06 PZ-02 solved (expect up=1 obj=4)")
            Press(Pl, array{40, 18})
            Dump("T07 fuse without cover (expect sA=0)")
            Press(Pl, array{43, 17, 19})
            Dump("T08 wrong socket B with only fuse A (expect sB=0 cov=1)")
            if (FC.TeleportTo[P(52.0, 57.0, 0.3), IdentityRotation()]) {}
            Press(Pl, array{41, 42, 18, 19, 20, 18, 21})
            Dump("T09 PZ-03 power (expect pwr=1 cp=2 obj=5)")
            Press(Pl, array{22, 22, 23, 44, 44})
            Dump("T10 truth evidence (expect truth=3)")
            Press(Pl, array{24, 25})
            Dump("T11 panel + room 13 (expect panel=1 r13=1 obj=6)")
            Press(Pl, array{27, 26})
            Dump("T12 PZ-04 wrong order (expect pz4=0)")
            Press(Pl, array{27, 29, 26, 28, 30})
            Dump("T13 PZ-04 solved, key before reveal (expect pz4=1 reveal=0 skey=0)")
            Sleep(11.0)
            Press(Pl, array{30, 30, 31, 32})
            Dump("T14 reveal + service route (expect reveal=1 skey=1 sdoor=1 gate=1 cp=4 obj=8)")
            Press(Pl, array{35})
            Dump("T15 ESCAPE vote without vehicle (expect ending=0)")
            Press(Pl, array{33, 34})
            Dump("T16 car keys + ignition (expect ckeys=1 ign=1)")
            if (DJ := Players[Pl]):
                set DJ.JournalPage = 0
                var Pages:int = 0
                loop:
                    OnJournalKey(Pl)
                    if (DJ.JournalPage = 0):
                        break
                    set Pages += 1
                    if (Pages > 30):
                        break
                Print("[R3-TEST] J01 journal pages={Pages} docs={JournalDocs().Length} events={RecentEvents.Length} (expect pages = 3 + docs, docs 9, events 10)")
                Print("[R3-TEST] J02 items page: {JournalItems()}")
            Print("[R3-TEST] L01 finale lighting: escapeRed={B2S(EscapeLit)} room13Red={B2S(Room13Lit)} (expect escapeRed=1 room13Red=0)")
            if (FC.TeleportTo[P(56.0, 55.5, 3.75), IdentityRotation()]) {}
            Sleep(1.5)
            Print("[R3-TEST] L02 inside ROOM 13: room13Red={B2S(Room13Lit)} (expect 1)")
            if (FC.TeleportTo[P(52.0, 57.0, 0.3), IdentityRotation()]) {}
            Sleep(1.5)
            Print("[R3-TEST] L03 left ROOM 13: room13Red={B2S(Room13Lit)} (expect 0)")
            # capture and solo recovery: stand on the Guest route
            if (FC.TeleportTo[P(52.0, 51.0, 0.3), IdentityRotation()]) {}
            var Waited:float = 0.0
            loop:
                Sleep(1.0)
                set Waited += 1.0
                if (D := Players[Pl], D.Captured?):
                    Print("[R3-TEST] T17 captured after {Waited}s guest=({GuestPos.X},{GuestPos.Y},{GuestPos.Z})")
                    break
                if (Waited > 150.0):
                    Print("[R3-TEST] T17 FAIL not captured in 150s guest=({GuestPos.X},{GuestPos.Y},{GuestPos.Z}) node={GuestNode}")
                    break
            set Waited = 0.0
            loop:
                Sleep(1.0)
                set Waited += 1.0
                if (D := Players[Pl], not D.Captured?):
                    Print("[R3-TEST] T18 solo recovery after {Waited}s (expect about 15s)")
                    break
                if (Waited > 40.0):
                    Print("[R3-TEST] T18 FAIL still captured")
                    break
            if (FC.TeleportTo[P(52.0, 57.0, 0.3), IdentityRotation()]) {}
            Press(Pl, array{47, 1, 47})
            Dump("T19 hide toggle")
            if (SelfTestEnding = 1):
                Press(Pl, array{35})
                Dump("T20 ESCAPE committed (expect ending=1; ending print follows)")
            else if (SelfTestEnding = 3):
                Press(Pl, array{37, 38})
                Dump("T20a NEW GUEST declined with LEAVE THE KEY (expect ending=0)")
                Press(Pl, array{37})
                Dump("T20b NEW GUEST accepted unanimously (expect ending=3; ending print follows)")
            else:
                Press(Pl, array{39, 36})
                Dump("T20 THE TRUTH committed (expect ending=2 audit=0)")
                Press(Pl, array{39})
                Sleep(1.0)
                Dump("T21 night audit activated (expect audit=1; ending print follows)")
