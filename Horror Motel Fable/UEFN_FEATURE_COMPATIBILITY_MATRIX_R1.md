# UEFN FEATURE COMPATIBILITY MATRIX R1

**Purpose:** Convert game systems into implementation routes that can be checked in the target UEFN editor.  
**Status:** Engineering plan; no row is considered editor-verified by this document. UEFN APIs, device options and Verse signatures change. Claude must inspect the installed editor/API digest and official documentation before coding against a specific symbol.

## Status vocabulary

- **DESIGN-READY:** behavior contract exists.
- **API-CHECK REQUIRED:** likely implementation route; exact API/device support must be checked in target release.
- **EDITOR-VERIFY:** must be built and exercised in UEFN.
- **BLOCKED:** no acceptable implementation until dependency is resolved.
- Never convert a planned route into ENGINE-VERIFIED or TEST-PASS without reproducible evidence.

## Compatibility matrix

| System | Intended implementation route | Dependencies | Verification procedure | Fallback |
|---|---|---|---|---|
| Session GameManager | Verse-authored manager with session-scoped authoritative state | Verse persistence/session lifecycle model | Compile; start solo and 4-player; verify single writer and one-shot commits | Reduce to one manager device/script authority; never duplicate writers |
| Objective tracker | Verse state + HUD Message/UI widgets | Current UI API and player UI access | Show/hide, update text/count, reconnect refresh, device switch | HUD Message device with limited formatting |
| Journal/evidence | Custom UI canvas/widgets with per-player open state and session-shared data | Current Verse UI widget API; text/image asset constraints | Open/close, scroll, readable transcripts, controller focus, reconnect | Diegetic readable props + HUD message pages |
| Interaction prompts | Conditional Button devices and/or Verse interaction interface | Button event subscriptions, player attribution, hold behavior | Range, line-of-sight, concurrent activation, cancel, device changes | Button device per interaction; server-side validation still required |
| Puzzle keypad | Verse input widget or button-grid device assembly | Numeric input widget support | Format validation, simultaneous input, reset, reconnect | 10-digit button grid plus confirm/cancel |
| Photo arrangement | Custom UI slot selection or world-space button slots | UI events or button devices | All permutations, lock concurrency, replicated display | Physical numbered slots + four selection buttons |
| Shared inventory | Verse map/struct state owned by InventoryManager | Player/session identity and replication | Pickup race, disconnect, checkpoint restore, duplicate grant | One device/manager state with explicit flag mapping |
| Personal flashlight charge | Per-player Verse state + flashlight device/light actor | Per-player state and light control | 1P/4P charge independence, battery swap, reconnect policy | Flashlight device per player if supported; otherwise controlled light actor |
| Fuse slots / breaker | Button devices or Verse interaction actors | Event subscriptions, device state control | Correct/wrong slot, simultaneous installation, breaker gating | One button per slot + manager validation |
| Doors / gates | Door/prop manipulation devices or Verse-controlled props | Prop/door control APIs | Open/close, collision, persistence, replicated state | Static door prop plus alternate route trigger |
| Room entry / trigger volumes | Mutator Zone/Trigger devices or Verse volume events | Trigger event APIs | Entry/exit, player attribution, duplicate event prevention | Multiple overlapping triggers feeding one deduplicating manager |
| THE GUEST NPC | NPC Spawner + Character Definition/behavior route if supported; otherwise custom device/Verse behavior | NPC capability, navigation, perception, animation, damage/capture APIs | Spawn, pathfinding, stairs, LOS, hearing, target change, capture, recovery | Authored patrol waypoint loop and scripted investigation; no unsupported dynamic chase claim |
| Navigation | NPC navigation/pathfinding only after target release check | Navmesh generation, agent dimensions, navigation APIs | Route all rooms, stairs, doorways, stuck recovery | Hand-authored waypoint graph with safe route fallback |
| Audio cues | Audio Player devices / audio components | Asset import, spatialization, concurrency | 1P/4P mix, attenuation, ducking, looping, trigger dedupe | Preplaced audio devices controlled by event manager |
| Dynamic lighting | Light devices/props and material emissive parameters | Device control and replication behavior | State transitions, flicker, reset, performance | Static lighting variants and controlled prop visibility |
| Cinematics | Sequencer/Level Sequence where supported, cinematic sequence devices, or authored in-world events | Sequence device support and player participation control | Solo/4P synchronization, skip, late join, failure fallback | Short in-world event with subtitle rail and deterministic state |
| Subtitles | Custom UI text or HUD Message events | UI support and text table | timing, localization-safe wrapping, audio-off playthrough | Persistent readable transcript in journal |
| Checkpoints | Verse state snapshot + checkpoint/spawn devices where appropriate | Island session lifecycle and persistence boundaries | Restore every committed flag; no duplicate grants/cinematics | Session-only checkpoint flags and deterministic actor reconstruction |
| Co-op vote | Verse state machine + UI controls/buttons | Player roster and disconnect events | majority, unanimous consent, timeout, tie, disconnect | Physical voting stations with same manager contract |
| Player capture/rescue | Verse player state + UI + rescue interaction devices | Player movement/input state control and player identity | solo self-rescue, duo rescue, all-captured reset | Teleport/capture-room device sequence only if player control is verified |
| Item pickups | Item Spawner / Conditional Button / Verse transaction | Item device event semantics | pickup attribution, duplicate actor, shared vs personal ownership | Interaction proxy that commits manager flag |
| Input remapping | Native Fortnite input mapping / semantic actions where exposed | Target release input APIs | keyboard/controller/touch and glyph mapping | Use device-provided prompt labels; avoid hardcoded glyphs |
| Performance/memory | UEFN island memory and runtime profiling tools | Target platform/editor | Worst-case rooms, NPC, audio, UI, lighting, 4 players | Reduce dynamic actors/effects and simplify simultaneous presentation |

## Mandatory target-editor verification checklist

Before committing to an implementation:
1. Record exact UEFN version/build and Fortnite Creative release context.
2. Inspect current Verse API digest and official documentation for every used class, function, event and editable property.
3. Confirm the API is available to the island type and not editor-only, deprecated or restricted.
4. Create a minimal isolated proof project/device for each uncertain capability.
5. Compile the smallest Verse test before integrating it into the full island.
6. Record exact API names, property defaults, event timing and replication behavior in a compatibility note.
7. Test on the actual supported player platforms and party sizes.
8. If unsupported, choose the listed fallback and update this matrix plus dependent system specs.

## Hard constraints

- Do not assume arbitrary Fortnite NPCs can navigate every custom geometry layout.
- Do not assume Verse can read arbitrary player input or remap all native controls.
- Do not assume UI widgets, cinematic playback or player movement control replicate identically across clients.
- Do not use client-side visual state as authoritative puzzle/progression state.
- Do not rely on a device's visible state as the only saved state; reconstruct it from manager flags.
- Do not claim persistence across sessions unless the chosen UEFN persistence model explicitly supports it and the design has been approved for that scope.
- Every system has a defined degraded fallback; if fallback changes gameplay, mark the dependent acceptance tests as required.

## Evidence record template

| Field | Required value |
|---|---|
| System / feature | Exact matrix row |
| UEFN version | Exact build string |
| API/device | Exact verified class/device and member |
| Proof project | Project path or reproducible setup |
| Compile result | Pass/fail + log reference |
| Editor test | Steps + result |
| Multiplayer test | Party size + result |
| Fallback selected | None or exact fallback |
| Date / owner | Name/role and date |
| Status | API-CHECK REQUIRED / ENGINE-VERIFIED / EDITOR-VERIFIED / TEST-PASS / BLOCKED |

No evidence row means status remains API-CHECK REQUIRED or EDITOR-VERIFY.
