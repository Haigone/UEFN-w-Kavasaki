# UEFN VERIFIED REFERENCE REGISTER R1
Checked: 2026-11-16. Official references establish documented platform features, not successful integration in this island.

## 1. NPC Spawner and custom behavior

Epic documents NPC Spawner in UEFN under Beta and explicitly warns that changes may break islands and require intervention. The device supports custom NPC character definitions, imported meshes, behavior scripts, spawn/despawn configuration and Verse control.

Epic's Custom NPC Behavior tutorial documents the npc_behavior route, custom character definitions and navigation to a navigation_target. The navigatable interface is documented for Custom, Guard and Wildlife NPC types; NavigateTo returns a navigation_result. Focus control is also documented.

**Project decision:** THE GUEST will be prototyped as a custom NPC with a behavior script and navigatable route. This is a viable documented route, not proof that the character will navigate the R2.3 stair, vestibule, balcony, doors or every room. Project-specific navigation must be tested. Hearing/suspicion is not assumed to be a built-in feature matching our design; use authored noise stimuli and validated perception/LOS logic. Keep waypoint patrol and last-known-stimulus search as fallback.

Sources:
- https://dev.epicgames.com/documentation/fortnite/using-npc-spawner-devices-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/fortnite/create-custom-npc-behavior-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/en-us/fortnite/ai-and-npcs
- https://dev.epicgames.com/documentation/fortnite/understanding-npc-behavior-in-unreal-editor-for-fortnite

## 2. Skeletal mesh and animation import

Epic documents importing skeletal meshes and associated animations, materials and textures through the Content Browser, inspecting the skeleton and animation assets, and playing Animation Sequences on the island. The Animated Mesh device can be paired with an animation and triggered by events.

**Project decision:** THE GUEST custom skeletal mesh and animation pipeline is supported as an import/playback direction. The combined NPC Character Definition + custom mesh + behavior + required animation state transitions still needs a minimal project proof. Do not assume arbitrary animation blueprints, cloth, physics or root-motion workflows are supported.

Source:
- https://dev.epicgames.com/documentation/fortnite/import-and-play-mesh-animations-in-unreal-editor-for-fortnite

## 3. Custom UI

Epic documents per-player custom UI built with Verse and UMG. The UI is associated with an individual player and must be created/refreshed for each player. Epic documents widget add/remove and player_ui focus. The interactable widget tutorial describes Button and Slider as supported interactable widgets in the documented workflow.

**Project decision:** HUD, journal, evidence and ending selector will be per-player UI driven by authoritative shared session state. A widget does not become shared merely because its underlying game state is shared. Verify controller/keyboard/touch focus and the actual controls available in the target release. For numeric keypad/photo selection if widget input is insufficient, use world-space button grids/slots.

Sources:
- https://dev.epicgames.com/documentation/en-us/fortnite/ingame-user-interfaces-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/fortnite/creating-and-removing-widgets-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/fortnite/making-widgets-interactable-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/fortnite/verse-api/unrealenginedotcom/temporary/ui/player_ui

## 4. Capability classification

| Feature | Documented evidence | Project status | Required proof |
|---|---|---|---|
| NPC Spawner custom NPC | Official docs; Beta warning | API-DOCUMENTED / PROJECT TEST REQUIRED | Spawn, despawn, 1/2/4 player |
| Custom NPC behavior | Official Verse behavior tutorial | API-DOCUMENTED / COMPILE REQUIRED | Compile script and lifecycle |
| NPC navigation to position/agent | navigatable and NavigateTo documented | API-DOCUMENTED / ROUTE TEST REQUIRED | Ground/upper floor, stair, secret route |
| Custom skeletal mesh import | Official import guide | API-DOCUMENTED / IMPORT TEST REQUIRED | Import exact Guest mesh and inspect skeleton |
| Animation Sequence playback | Official import/play guide | API-DOCUMENTED / ANIMATION TEST REQUIRED | Required clips and transitions |
| Animated Mesh device | Official device workflow | API-DOCUMENTED / DEVICE TEST REQUIRED | Trigger, pause and multiplayer playback |
| Per-player Verse UI | Official UMG/Verse UI guide | API-DOCUMENTED / UI TEST REQUIRED | Build HUD for every client and refresh join/reconnect |
| Interactable UI Button/Slider | Official widget tutorial | API-DOCUMENTED / INPUT TEST REQUIRED | Focus, controller, keyboard, touch |
| Native numeric text entry | Not established by cited references | API-CHECK REQUIRED | Prove or use 10-button grid |
| Arbitrary custom hearing/perception | Not established as a complete matching system | API-CHECK REQUIRED | Verify exact API or use authored noise events |
| THE GUEST stair navigation | No project proof | BLOCKED pending route test | Traverse both flights and landing without teleport |
| Dynamic mirror/reflection | No project proof | API-CHECK REQUIRED | Build reflection proof or use CRT/reflection composition |
| Multi-client cinematic synchronization | No project proof | API-CHECK REQUIRED | Solo/2P/4P sync, skip and reconnect |
| Per-player battery charge | Logical Verse design only | API-CHECK REQUIRED | Two players independently collect same spawn |
| Cross-session persistence | Not needed by approved design | OUT OF SCOPE | Never assume persistence between sessions |

## 5. Verification record rule

Record exact target UEFN version/build, API/device, minimal proof project, compile output, editor test, multiplayer party size, fallback and date. Only the feature described by Epic is API-DOCUMENTED; the island implementation remains TEST REQUIRED until evidence exists. Recheck Beta status and docs before production if editor version changes.