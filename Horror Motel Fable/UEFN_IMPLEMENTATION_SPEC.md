# UEFN IMPLEMENTATION SPECIFICATION
## THE MOTEL: ROOM 13

This document describes the intended implementation. It is not a claim that any device or Verse API has already been compiled. Confirm every current API, device property, event and NPC capability against the actual target UEFN version.

## 1. Project and folder organisation
Suggested Outliner:
- `01_ENVIRONMENT`
  - Exterior, Parking, Motel_Ground_Floor, Motel_Upper_Floor, Courtyard, Reception, Office, Utility, Rooms_01_12, Room_13, Service_Route
- `02_LIGHTING`
  - Exterior, Interior, Practical_Lights, Neon, Emergency, Post_Process, Fog
- `03_AUDIO`
  - Ambience, Music, Creature, Stingers, VO, Room_Tones
- `04_MONSTER`
  - NPC, Patrol_Points, Investigation_Points, Chase_Volumes, Capture_Zones, Scripted_Appearances
- `05_GAMEPLAY`
  - Spawners, Interactions, Puzzles, Items, Checkpoints, Endings, Objective_Volumes
- `06_VERSE`
  - Managers, State, Interfaces, Puzzle_Logic, AI_Logic, Tests
- `07_CINEMATICS`
  - Intro, Capture, Reveal, Escape, Endings

## 2. Conceptual Verse modules
These are architecture names; adapt naming and syntax to current Verse conventions.

### Game_Manager
Owns:
- Session phase and act progression.
- Team objective state.
- Checkpoint identifier.
- Ending eligibility and selected ending.
- Initialisation and reset orchestration.

### Player_Manager
Owns:
- Per-player state: ACTIVE, THREATENED, CAPTURED, RESCUE_PENDING, RESCUED, SOLO_ESCAPE, SAFE.
- Player join/leave handling.
- Team membership and rescue eligibility.
- Preventing duplicate capture/rescue transitions.

### Puzzle_Manager
Owns:
- Register code state.
- Office photo puzzle.
- Fuse inventory and installation state.
- ROOM 13 photo ordering.
- Puzzle completion flags and reset/recovery logic.

### Monster_Controller
Owns:
- Creature state: IDLE, PATROL, OBSERVE, INVESTIGATE, CHASE, ATTACK/CAPTURE, SEARCH, RETREAT.
- Target selection.
- Last-known player location.
- Patrol/investigation points.
- Chase eligibility and cooldown.
- Separation between scripted scares and systemic AI.

### Difficulty_Manager
Owns:
- TensionLevel (0–100).
- Inputs, smoothing, thresholds and cooldowns.
- Difficulty state DORMANT / UNEASY / HUNTING / RELENTLESS.
- Team-size and capture balancing.

### Audio_Manager
Owns:
- Ambient state by act/area.
- Threat cue selection.
- Stingers and cooldowns.
- Subtitles/VO triggers where appropriate.

### Cinematic_Manager
Owns:
- Intro, scripted sightings, capture/reveal/ending presentation.
- Safe entry/exit from sequences.
- Multiplayer consistency and skip/recovery policy.

### Interaction_Manager
Owns:
- Contextual interaction validation.
- Range checks, item requirements, concurrency locks.
- Team-shared completion and feedback.

## 3. Device families to evaluate
Potential devices (verify exact current support, properties and Verse events):
- Player Spawner: 4.
- NPC Spawner: 1 or the verified NPC approach selected.
- Trigger: roughly 20–25.
- Timer: roughly 5–7.
- Tracker: roughly 5.
- Conditional Button: roughly 5–8.
- Button: roughly 8–12.
- Item Granter: roughly 3–4.
- Barrier: roughly 8–12.
- Audio Player: roughly 12–18.
- VFX Spawner: roughly 4–6.
- HUD Message: roughly 5–8.
- Cinematic Sequence: roughly 3–4.
- Prop Mover: roughly 3–5.

These are early estimates, not a fixed device bill. Prefer fewer devices with clear state ownership over duplicated logic. Do not create every estimated device if the final design does not need it.

## 4. Shared inventory and objective state
Team quest items:
- Room 13 Key
- Office Key
- Fuse A
- Fuse B
- Fuse C
- Screwdriver
- Car Keys
- Service Key

Represent required quest progress in authoritative team state. A pickup should update the team state exactly once. If a player disconnects, the objective remains valid. Do not rely on an item remaining physically held by one player. Ensure UI reflects team ownership.

Suggested puzzle flags:
- RegisterSolved
- OfficeAccessGranted
- UpperFloorAccessGranted
- FuseAFound / FuseBFound / FuseCFound
- PowerRestored
- DiaryFound
- ChildRoomClueFound
- SecretPanelOpened
- Room13Unlocked
- PhotoSequenceSolved
- OwnerIdentityRevealed
- ServiceKeyObtained
- GatePowered
- CarKeysObtained
- TruthChainComplete
- EndingChosen

Persist only what the target experience actually supports. Distinguish session checkpoints from cross-session persistence; do not promise cross-session save without verifying the supported persistence model.

## 5. Checkpoint rules
- CP01 — Reception/register: register puzzle completion and office access.
- CP02 — Power restored: fuse state and restored electrical system.
- CP03 — Second floor: upper-floor access and completed core objectives.
- CP04 — ROOM 13 photos: photo puzzle and revelation state.

On team defeat, return to the last checkpoint and restore the associated objective flags. Completed mandatory puzzles should not unexpectedly reset. A disconnect must not remove a required team item. Make all interactions restartable.

## 6. Creature AI state machine
Conceptual states:
- IDLE: wait, listen, minimal movement.
- PATROL: move between valid patrol points.
- OBSERVE: brief sighting / evaluate.
- INVESTIGATE: move toward sound's last known location.
- CHASE: pursue a valid reachable target.
- ATTACK/CAPTURE: execute capture transition.
- SEARCH: inspect plausible hiding locations or last-known area.
- RETREAT: disengage and recover.

Rules:
- No omniscient wall tracking.
- Sound points to a last-known position, not a continuously updated target.
- Chase only if navigation and target reachability are valid.
- Do not block the only mandatory route.
- Do not capture during required protected interactions or non-interruptible story beats.
- Avoid simultaneous multi-capture race conditions.
- Scripted appearances do not require the normal AI to be active.
- Test NPC movement on every stair, corridor, doorway and secret passage.

If the chosen NPC type cannot support required behaviours in the current UEFN release, document the limitation and select a verified UEFN-compatible solution. Never silently replace THE GUEST with an unrelated creature or a non-UEFN game system.

## 7. Adaptive tension implementation
TensionLevel 0–100 with four bands:
- DORMANT 0–24
- UNEASY 25–49
- HUNTING 50–74
- RELENTLESS 75–100

Potential inputs:
- Time without progress.
- Recent capture count.
- Puzzle duration (with cap and grace period).
- Detection/chase frequency.
- Team dispersion and player count.

Rules:
- Exploration alone does not increase tension.
- Do not change band abruptly; smooth and add cooldown.
- Suspend or clamp tension during scripted narrative.
- Reduce pressure after a difficult puzzle or chase.
- Ensure solo does not become unfairly harder than co-op.

Initial tuning targets:
| Parameter | DORMANT | RELENTLESS |
|---|---:|---:|
| Patrol interval | 35 s | 18 s |
| Investigation window | 12 s | 8 s |
| Hiding search window | 5 s | 10 s |
| Post-chase recovery | 25 s | 12 s |

All values require playtesting.

## 8. Capture and rescue flow
1. Validate target is ACTIVE/THREATENED and capture is permitted.
2. Lock capture transition to prevent a second event.
3. Play a short capture presentation if supported; otherwise use a clear, tested gameplay state transition.
4. Mark player CAPTURED and provide an English rescue objective to teammates.
5. Teammate within 2 m interacts for 5 seconds.
6. Validate captor/target states and interaction lock.
7. Mark RESCUED; grant about 8 seconds of protection if technically supported.
8. In solo, activate a self-rescue escape interaction/route.
9. If all players are captured, trigger defeat/recovery and restore checkpoint.
10. Clear locks and timers on reset, disconnect and checkpoint restore.

A 90-second emergency threshold may initiate an assistance mechanic; it must not silently kill or permanently remove a player.

## 9. First-person and interaction standards
- Interact range target: approximately 2 m.
- Use clear focus/reticle feedback and a short English action label.
- Ensure a readable interaction target and adequate collision.
- Avoid requiring precision aiming on small objects.
- Test flashlight clipping through doorways, mirrors, props and player hands.
- Validate crouch and sprint camera behaviour and audio.
- Keep required documents legible at normal gameplay distance.
- All mandatory interactions should be recoverable if interrupted.

## 10. Audio cue sheet
- Exterior: rain, wind, distant road, sign transformer hum.
- Reception: fluorescent buzz, phone ring, bell, paper/register handling.
- Rooms: low room tone, CRT hiss, isolated creaks.
- Power room: electrical hum, fuse click, breaker thump.
- THE GUEST: long-footstep rhythm, cloth movement, low breath, directional warning cue.
- Chase: rising rhythmic pressure without masking navigation cues.
- ROOM 13: reduced ambience, low electrical tone, phone/clock motif.
- Ending: unique audio identity per branch.

Every threat cue should be spatially interpretable and not depend solely on loudness. Include subtitles for important voice/radio information.

## 11. Materials, lighting and effects
Material palette:
- Burgundy worn carpet.
- Yellowed beige wallpaper.
- Dark timber.
- Cream bathroom tile.
- Wet asphalt.
- Aged concrete.
- Rusted metal.
- Dirty glass.
- Red and blue emissive neon.

Lighting:
- Parking: cold blue.
- Reception: dim warm yellow.
- Corridors: low dirty amber.
- Rooms: muted orange.
- Upper floor: night blue.
- ROOM 13: dark red.
- Final escape: emergency red.

Use local lights, emissive signs, post-processing and fog with performance budgets. Treat Lumen as optional and verify platform compatibility. Avoid expensive shadow casting on every decorative light. Test visibility and gameplay readability in actual Fortnite rendering.

## 12. Performance and memory
- Build geometry modularly.
- Use repeated modular room kits and shared materials.
- Keep collision simple and intentional.
- Cull unseen areas and decorative clutter where possible.
- Limit dynamic lights, shadow casters, high-cost VFX and overlapping audio.
- Use texture resolution appropriate to asset size and viewing distance.
- Profile memory and performance in UEFN and run island validation.
- Do not invent a memory budget result; record actual measurements.

## 13. QA matrix
| Test | Expected result |
|---|---|
| Solo full run | All acts completable, including self-rescue |
| Two-player rescue | Captured player can be rescued reliably |
| Four-player sync | Shared items and puzzle flags stay consistent |
| Simultaneous interaction | No duplicate or corrupt state |
| Player disconnect | No required item or objective is lost |
| Puzzle wrong input | Clear feedback; retry possible |
| Checkpoint restore | Correct state and access restored |
| Creature navigation | No stuck route, wall tracking or unavoidable block |
| Capture all players | Defeat/recovery works |
| Three endings | Each branch reachable and distinct |
| English text audit | No unintended non-English in-game text |
| First-person clipping | No critical camera/flashlight clipping |
| Performance | Target platform validation passes |

## 14. Required code quality
- Use small modules and explicit state transitions.
- Avoid circular dependencies.
- Guard repeated events and race conditions.
- Add debug logging that can be disabled for release.
- Document each device binding.
- Comment all unverified assumptions.
- Keep pseudocode out of files presented as compilable Verse.
- Include a compile/test report with exact editor version and date when actually run.


## 13. Current controlling gameplay contracts — R2.3 documentation update

For the exact six-act objective predicates, stable ObjectiveIds, flag ownership and IN-001–IN-031 event mapping, use [OBJECTIVE_AND_EVENT_CATALOG.md](OBJECTIVE_AND_EVENT_CATALOG.md). It supersedes informal objective assumptions in older narrative-flow summaries where they conflict.

For THE GUEST's full state machine, perception, noise stimuli, target selection, navigation, capture handoff, solo/co-op fairness, recovery and AI acceptance tests, use [MONSTER_AI_BEHAVIOUR_SPEC.md](MONSTER_AI_BEHAVIOUR_SPEC.md). This dedicated specification is API-neutral. It does not assert that the target UEFN release supports a particular NPC perception, pathfinding, animation or control API.

Ending resolver must follow END-A01 in OWNER_DECISION_GATE_R2.2.md and ENDING_IMPLEMENTATION_SPEC.md: majority for ESCAPE/THE_TRUTH, unanimous explicit consent for THE_NEW_GUEST, defined tie/timeout/disconnect handling and one atomic session-wide commit. END-A02 remains pending owner approval.

Before full implementation, Claude must return a target-version feasibility table for every module and capability: supported device/API, exact signature/property, replication/authority behaviour, known limitations, minimal test result and fallback. A conceptual module name or device family in this document is not proof of availability.


### Presentation and cue registers
- [UI_STRING_TABLE.csv](UI_STRING_TABLE.csv) is the stable English copy baseline for objectives, interactions, feedback, endings and required subtitles. Every new player-facing string must receive a StringId before integration.
- [AUDIO_CUE_SHEET.csv](AUDIO_CUE_SHEET.csv) maps authored game events to audio assets, priorities, cooldowns, concurrency groups, spatial policy and fallback.
- [LIGHTING_CUE_SHEET.csv](LIGHTING_CUE_SHEET.csv) maps act/gameplay events to lighting states and readability constraints.
- [AUDIO_REGISTER.csv](AUDIO_REGISTER.csv) and [LIGHTING_REGISTER.csv](LIGHTING_REGISTER.csv) remain the asset/emitter source registers. Cue sheets do not prove assets have been created or imported.


### Cinematic and asset production references
- [CINEMATIC_AND_PRESENTATION_SPEC.md](CINEMATIC_AND_PRESENTATION_SPEC.md) defines sequence lifecycle, co-op synchronization, capture/reveal/ending presentation, subtitles and fallback behaviour. It is not proof of camera/sequencer/NPC animation support.
- [ASSET_PRODUCTION_PIPELINE_SPEC.md](ASSET_PRODUCTION_PIPELINE_SPEC.md) defines source/licensing, naming, metadata, import, collision, LOD, performance and acceptance. The asset manifest records target assets; it does not mean they have been sourced or imported.
