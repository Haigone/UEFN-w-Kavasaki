# R3 CURRENT STATUS AND REMAINING WORK
Project: THE MOTEL: ROOM 13
Branch: main
Baseline: 2026-11-16
Authority: this file consolidates current documentary status. It does not replace the detailed controlling specifications linked below.

## 1. Executive status

**DOCUMENTATION BASELINE: substantially complete for the defined game systems.**
**NATIVE UEFN IMPLEMENTATION: NOT EVIDENCED.**
**VERSE COMPILE / EDITOR TEST / PLAYTEST / PERFORMANCE / ISLAND VALIDATION: NOT RUN OR NOT EVIDENCED IN THIS repository.**
**PUBLICATION: NOT AUTHORIZED.**

The repository is the production specification and execution plan. It is not the native UEFN project and must not be represented as a playable island.

## 2. Canonical current counts

The following are current static repository counts. Re-run the integrity checks before changing them.

| Register | Current count | Meaning |
|---|---:|---|
| ROOM_COORDINATE_REGISTER.csv | 57 data rows | R2.3 coordinate authority |
| room_furnishing_schedule.csv | 183 data rows | Current furnishing placement schedule; lowercase filename is intentional |
| DOOR_WINDOW_SCHEDULE.csv | 51 openings | R2.3 opening schedule; uppercase filename is intentional |
| wall_schedule.csv | 72 rows | Wall register |
| INTERACTION_MASTER_REGISTER.csv | 32 interactions | IN-001–IN-032 |
| EVENT_AND_STATE_TRANSITION_CATALOG_R2.md | 51 events | EVT-001–EVT-051 |
| EVENT_INTERACTION_VERSE_CROSSWALK_R1.md | 32 interaction mappings | Each interaction maps once |
| PUZZLE_MASTER_REGISTER.csv | 5 puzzles | PZ-01–PZ-05 |
| UEFN_DEVICE_BINDINGS.csv | 50 device rows | Current uppercase device register; 8 columns |
| INTERACTION_ANCHOR_SCHEDULE_R1.csv | 58 anchors | 56 numeric world anchors plus 2 UI/dynamic anchors |
| AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv | 25 anchors | One spawn plus patrol/stair/reveal anchors |
| UI_STRING_TABLE.csv | 100 strings | Stable English UI/subtitle IDs |
| AUDIO_REGISTER.csv | 24 audio IDs | Audio source register |
| AUDIO_CUE_SHEET.csv | 25 cues | Audio cue schedule |
| LIGHTING_REGISTER.csv | 10 light IDs | Lighting source register |
| LIGHTING_CUE_SHEET.csv | 9 cues | Lighting state cues |
| asset_manifest.csv | 99 assets | Canonical master inventory |
| ASSET_MANIFEST_EXECUTIVE.csv | 99 assets | Must remain byte-identical to master |
| ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv | 99 rows | One rights/source record per master asset |
| ASSET_PRODUCTION_BACKLOG_R1.csv | 65 packages | Production packages; not the same thing as unique asset count |

All 99 asset rights rows currently remain NOT SOURCED unless an individual row is updated with exact source, license, commercial-use, UEFN publishing and archived proof. Do not infer a license from a marketplace listing or asset name.

## 3. Owner-approved design and fixed decisions

- Geometry baseline: LD-GEO R2.3, GEO-A01–GEO-A21, approved as design. It is not editor-verified. No structural change without an R2.4 proposal and owner approval.
- Narrative proposals NCP-A01–A09 and ending design END-A01/END-A02 are approved under the owner's delegation. Exact player-facing content and ending conditions are in the canonical narrative and ending files.
- END-A02 truth chain requires exactly the Room 06 missing-guest archive, Room 09 night-manager diary and Room 11 child's drawing.
- PZ-01 solution: 02-13-86. PZ-02 photo chronology: 1974 / 1978 / 1982 / 1986. PZ-04 chronology: 1968 / 1974 / 1981 / 1986.
- PZ-05 service route prerequisite is PowerRestored + ServiceKeyObtained + Room13RevealComplete. FinaleReady is derived only after GatePowered and ServiceRouteReady are also true; it must never be a PZ-05 prerequisite. CarKeys and ignition are required only for ESCAPE.
- FinaleReady = PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete.
- CoreEscapeReady = FinaleReady AND CarKeysObtained AND VehicleIgnitionSucceeded.
- THE_TRUTH requires FinaleReady AND TruthChainComplete; it does not require CarKeys.
- THE_NEW_GUEST requires FinaleReady and explicit unanimous acceptance; NewGuestAccepted is an EndingManager output, not an eligibility prerequisite.
- Service Control Bay is GF-SERVICE-BAY, accessed through D-G16 using ServiceKey. U-SERVICE remains sealed, non-playable and without gameplay actors/navmesh.
- Team progression and quest inventory are session-shared; flashlight charge and transient UI state are per-player.
- No minimap, GPS route, through-wall markers or mandatory audio-only clues.

## 4. Canonical source hierarchy and legacy filename traps

Use the current files exactly as named:
- Uppercase DOOR_WINDOW_SCHEDULE.csv, not lowercase door_window_schedule.csv.
- Lowercase room_furnishing_schedule.csv, not uppercase ROOM_FURNISHING_SCHEDULE.csv.
- Uppercase UEFN_DEVICE_BINDINGS.csv, not lowercase uefn_device_bindings.csv.
- Separate AUDIO_REGISTER.csv / AUDIO_CUE_SHEET.csv and LIGHTING_REGISTER.csv / LIGHTING_CUE_SHEET.csv; lighting_audio_schedule.csv is historical and non-authoritative.
- R2.3 geometry authority is LD_GEO_R2.3_APPROVAL_RECORD.md, LEVEL_DESIGN_R2.3_INDEX.md, LEVEL_DESIGN_GEOMETRY.md and the controlled R2.3 schedules.
- R3 execution order is CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md. Historical R2.2/R2.3 packets are not the overall execution order.

## 5. Documentation deliverables already present

The repository includes:
- Complete game design, six-act narrative, approved clue copy, objective/event logic and ending rules.
- Five puzzle execution contracts and master register.
- Interaction execution contracts for IN-001–IN-032, event catalog and interaction/Verse crosswalk.
- HUD, objective tracker, journal, evidence, inventory, prompt, ending selector, accessibility and screen/widget layout specifications.
- Player state, capture/rescue, checkpoint/recovery, solo/co-op/disconnect/reconnect and session edge-case specifications.
- THE GUEST behavior/state machine, proposed numeric tuning, spawn/patrol/stair anchors and model production specification.
- UEFN feature compatibility matrix, official reference register, device binding register and explicit fallback routes.
- Audio, lighting, cinematic, asset pipeline, room fit-out and service-control location specifications.
- QA acceptance suites, performance/release baseline and R3 static integrity report.
- Claude autonomous execution addendum with explicit decision hierarchy, batch loop, stop conditions and missing THE GUEST model/rig/animation production route.
- GitHub Actions workflow for repeatable static repository validation on pushes and pull requests.

Presence of a document closes only the corresponding documentation-authoring gap. It does not close implementation or evidence gates.

## 6. Remaining work in strict dependency order

### GATE A — native project baseline (P0, BLOCKING)
1. Locate the actual native UEFN project and confirm the target UEFN version/build.
2. Record project/map/island identity, source-control state, Verse files, devices, imported assets and project settings.
3. Create and verify a recoverable backup before edits.
4. If the native project/editor is unavailable, stop implementation and report the exact missing access. Do not substitute this documentation repository for the UEFN project.

**Acceptance evidence:** project inventory, target version, map/project open in editor, backup location and restore proof.

### GATE B — re-run data and design integrity (P0)
1. Re-run R3_INTEGRATION_INTEGRITY_REPORT.md checks on the current branch head.
2. Validate all CSV row widths, unique IDs, enum values, numeric fields and cross-register references.
3. Validate 51 openings ↔ 72 walls, all furniture footprints and door swings, 32 interactions ↔ 51 events, all device anchors, all UI/audio/lighting string references and 99 asset IDs ↔ 99 rights rows.
4. Resolve every defect with synchronized edits to all dependent files; record exact changed rows.
5. Never alter R2.3 structural geometry silently.

**Acceptance evidence:** updated static report with exact current commit, checks, row IDs and unresolved exceptions.

### GATE C — R2.3 greybox and navigation proof (P0)
Build from the approved R2.3 schedules. Include all rooms, shared walls once, openings, floor/ceiling/slab voids, stair flights/landings, continuous balcony/clipped pads/guardrails, ROOM 12–13 secret route, exterior and sealed U-SERVICE boundary. Apply interaction and AI anchor schedules. Test player capsule clearances, door swings, all mandatory routes, solo/2P/4P and no softlocks.

**Acceptance evidence:** top-down/elevation/section screenshots, Outliner, route recordings, collision proof and completed editor traversal matrix.

### GATE D — minimal UEFN/Verse capability proofs (P0/P1)
Before full integration, compile and test minimal isolated proofs for:
- Session authority, player join/leave and idempotent shared state.
- Every device family and exact property/event in UEFN_DEVICE_BINDINGS.csv.
- Custom UI, focus/input, per-player refresh and reconnect.
- NPC Spawner/custom character/behavior, animation import, navigation on both floors and stair traversal.
- Interaction attribution, hold/cancel, concurrency and recovery.
Use the target editor's API digest and official references. NPC Spawner is Beta. Do not infer project-specific support from an official feature page alone.

**Acceptance evidence:** exact editor build, source, compile logs, device property screenshots and minimal proof recordings.

### GATE E — integrated gameplay (P1)
Implement in this order:
1. Session GameManager and PlayerStateManager; join-in-progress, disconnect and reconnect.
2. Shared inventory, personal flashlight and item grant idempotency.
3. Interaction framework, locks, cancel/timeout, focus and recovery.
4. Objective tracker, journal, evidence and readable clue presentation.
5. PZ-01 through PZ-05 in register order.
6. THE GUEST spawn, perception, patrol, investigation, chase, capture and fair reacquisition.
7. Capture/rescue, solo recovery and checkpoints.
8. Six-act progression and ROOM 13 reveal.
9. Service route, ending resolver, voting, three endings and Night Audit.
10. UI, subtitles, audio, lighting, VFX and cinematic fallback.
Pass solo first, then 2-player, then 4-player. Keep one authoritative writer per progression flag.

**Acceptance evidence:** compiled Verse source, device map, event logs, end-to-end runs and per-suite test results.

### GATE F — source, create and import assets (P1/P2)
1. Resolve every row in the 99-asset rights register with source and proof or replace with original/licensed work.
2. Execute the 65 backlog packages in priority/dependency order.
3. Produce THE GUEST model sheet, mesh, rig, materials, LODs, collision and animation set.
4. Import and verify all mandatory props, clue documents, interaction devices, audio, VFX and materials.
5. Validate scale, pivots, collisions, LODs, memory and performance in target editor.

**Acceptance evidence:** source/licence archive, import logs, measured asset metadata, screenshots and accepted manifest states.

### GATE G — QA, validation and release (P0 final)
Run all gameplay, narrative, UI, interaction, puzzle, AI, cinematic, audio, lighting, asset, multiplayer, recovery and performance suites. Test solo/2P/4P full runs, simultaneous interactions, disconnects at transaction boundaries, duplicate events, all-captured recovery and all endings. Profile supported targets, resolve validation blockers and request explicit owner publication authorization.

**Acceptance evidence:** full test matrix, build/version, recordings, logs, defect closure, memory/performance reports, island validation output and explicit publication approval.

## 7. Stop conditions

- No native project/editor access: no implementation claims.
- Unsupported API/device: use the documented fallback and update compatibility matrix and tests.
- NPC route failure: use the specified authored waypoint/investigation fallback; never teleport a visible NPC to hide navigation failure.
- Unknown asset rights: reject and replace the asset.
- Structural geometry change: stop and submit an R2.4 proposal.
- No compile, test, performance or publication claim without reproducible evidence.
- Never publish without explicit owner authorization.

## 8. Mandatory return package

The implementation executor must return:
- CLAUDE_ENVIRONMENT_BASELINE.md
- Updated R3_INTEGRATION_INTEGRITY_REPORT.md
- API/device minimal proof log
- Current Verse source tree and device/actor map
- Geometry and traversal evidence pack
- Per-suite QA report and defect register
- Performance/memory and island validation evidence
- Exact next tasks, each with file/actor, operation, dependency and acceptance test

## 9. Final rule

When an old status row, historical packet or duplicate file conflicts with this current status and the controlling source documents, follow the canonical hierarchy above. Preserve historical records but mark them superseded; never leave two active contradictory instructions.
