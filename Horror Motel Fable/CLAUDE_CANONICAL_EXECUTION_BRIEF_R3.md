# CLAUDE CANONICAL EXECUTION BRIEF R3
**Project:** THE MOTEL: ROOM 13  
**Status:** Documentation baseline ready; native UEFN project/editor evidence still absent. This brief supersedes obsolete R2.2 and pre-R2.3 execution instructions. It does not authorize publication.

## 1. Mission and responsibility

Deliver the complete playable Fortnite island in UEFN, 1–4 players, first-person normal gameplay, six acts, three endings and full solo completion. Shipped content is English. Claude performs all UEFN/editor/Verse/asset work and tests. This repository defines decisions and exact instructions. Do not ask the owner to repeat or decide anything already recorded here. Do not claim compile, import, playtest, profile or publish without evidence.

## 2. Read order

1. README.md; CLAUDE_EXECUTION_PROTOCOL.md; PRODUCTION_CONTROL_MASTER_SPEC.md; this brief.
2. LD_GEO_R2.3_APPROVAL_RECORD.md; LEVEL_DESIGN_R2.3_INDEX.md; LEVEL_DESIGN_GEOMETRY.md; GEOMETRY_VALIDATION_REPORT.md; all uppercase controlled geometry CSVs; stair/roof/section plans.
3. GAME_DESIGN_BIBLE.md; NARRATIVE_MASTER_SCRIPT.md; NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md; GAMEPLAY_NARRATIVE_DECISIONS_R1.md; ACT_AND_OBJECTIVE_MATRIX.md; OBJECTIVE_AND_EVENT_CATALOG.md.
4. INTERACTION_MASTER_REGISTER.csv; INTERACTION_EXECUTION_SPEC.md; EVENT_AND_STATE_TRANSITION_CATALOG_R2.md; EVENT_INTERACTION_VERSE_CROSSWALK_R1.md; PUZZLE_MASTER_REGISTER.csv; PUZZLE_EXECUTION_DETAIL_R2.md; ITEM_AND_INVENTORY_SPEC.md.
5. ENDING_IMPLEMENTATION_SPEC.md; ENDING_DESIGN_SPEC.md; PLAYER_STATE_MACHINE.md; CAPTURE_AND_RESCUE_SPEC.md; CHECKPOINT_AND_RECOVERY_SPEC.md; MULTIPLAYER_SESSION_EDGE_CASE_SPEC_R1.md.
6. MONSTER_AI_BEHAVIOUR_SPEC.md; THE_GUEST_NUMERIC_TUNING_R1.md; AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv; GUEST_MODEL_SPEC.md; UEFN_FEATURE_COMPATIBILITY_MATRIX_R1.md; UEFN_VERIFIED_REFERENCE_REGISTER_R1.md; UEFN_DEVICE_BINDINGS.csv.
7. GAMEPLAY_UI_UX_SPEC.md; EXEC_UI_UX_SPEC_R1.md in repository root; UI_SCREEN_LAYOUTS_AND_WIDGET_STATES_R1.md; UI_STRING_TABLE.csv; INPUT_AND_INTERACTION_BINDING_SPEC_R1.md in root.
8. CINEMATIC_AND_PRESENTATION_SPEC.md; AUDIO_REGISTER.csv; AUDIO_CUE_SHEET.csv; AUDIO_MIX_POLICY.md; LIGHTING_REGISTER.csv; LIGHTING_CUE_SHEET.csv; LIGHTING_STATE_SPEC.md.
9. ASSET_AND_CONTENT_REGISTER.md; ASSET_PRODUCTION_PIPELINE_SPEC.md; ASSET_PRODUCTION_BACKLOG_R1.csv; ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv; asset_manifest.csv; ASSET_MANIFEST_EXECUTIVE.csv; room_furnishing_schedule.csv; ROOM_INTERIOR_FITOUT_SPEC_R1.md; SERVICE_CONTROL_BAY_LOCATION_AND_INTERACTION_SPEC_R1.md; exterior_prop_schedule.csv.
10. PERFORMANCE_AND_RELEASE_QA_BASELINE_R1.md in root; QA_ACCEPTANCE_MATRIX.md; GAMEPLAY_ACCEPTANCE_TESTS.md; NARRATIVE_ACCEPTANCE_TESTS.md; MISSING_DELIVERABLES_REGISTER.md; MASTER_TASK_REGISTER.md.

## 3. Binding decisions — no further owner questions

- Geometry: LD-GEO R2.3, GEO-A01–GEO-A21, owner-approved design. R2.2 and earlier are historical. No structural changes without R2.4 owner approval.
- END-A01: ESCAPE/THE_TRUTH strict majority of currently connected eligible players; THE_NEW_GUEST unanimous explicit affirmative; tie/timeout selects ESCAPE only if eligible, else reopen; disconnect removes voter and recalculates; NEW_GUEST remaining players reconfirm; solo direct.
- END-A02: TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound exactly. ROOM 09 diary, ROOM 11 drawing, ROOM 06 missing-guest archive. Mandatory only for THE_TRUTH.
- NCP-A01–A09: exact canonical English content in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md. No rewriting or invented dialogue.
- M. Harrow is the identity in the 1968 photograph and the owner/THE GUEST identity or manifestation; no second antagonist.
- PZ-01 code 02-13-86; PZ-02 1974/1978/1982/1986; PZ-04 1968/1974/1981/1986.
- CarKeys and vehicle ignition are required only for ESCAPE. THE_TRUTH and THE_NEW_GUEST do not require either.
- FinaleReady = PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete.
- CoreEscapeReady = FinaleReady AND CarKeysObtained AND VehicleIgnitionSucceeded.
- Night Audit IN-032 is a one-shot action after THE_TRUTH commit, never an ending selector.
- No minimap, GPS route or through-wall markers. Mandatory information is readable; no audio-only clue.
- Team progression and quest items are shared/session-authoritative; flashlight charge is per-player.

## 4. Ordered execution gates

### GATE A — environment and backup (P0)
Locate the native UEFN project; this GitHub repository is documentation, not proof of a UEFN project. Record project identity, UEFN build, island ID, maps, Verse files, devices, imported assets, source-control state and available tools. Create and verify a recoverable backup before writes. Return CLAUDE_ENVIRONMENT_BASELINE.md. If project/editor unavailable, report exactly and do not claim implementation.

### GATE B — R2.3 and cross-system integrity (P0)
Parse all controlled CSVs: row widths, IDs, required fields, numbers and enums. Cross-check 51 openings to exactly one of 72 wall IDs; validate coordinate references, slab/void unions, clipped balcony pads, stairwell, sealed reserves and U-SERVICE. Check furniture footprints/door clearance without changing structural geometry. Cross-map IN-001–IN-032 to EVT-001–EVT-051; validate puzzle outputs, flag writers, item grants and derived predicates. Cross-check String IDs, Audio IDs and lighting cue IDs. Read the existing R3_INTEGRATION_INTEGRITY_REPORT.md, rerun its checks against the actual current commit, then return an updated report with exact row references and recommended corrections. Never silently change R2.3.

### GATE C — greybox and traversal (P0)
Build R2.3 geometry only: shared walls once, all scheduled openings, stair and landing, slab voids, continuous balcony and clipped pads, guardrails, ROOM 12–13 route, sealed reserves and U-SERVICE collision policy. Test all mandatory routes solo/2P/4P. Capture top-down, elevations, sections, stair, balcony, secret route and Outliner. Owner accepts implemented geometry separately from design approval.

### GATE D — platform capability proofs (P0/P1)
Use UEFN_VERIFIED_REFERENCE_REGISTER_R1.md. Prove NPC Spawner/custom character/behavior, imported Guest skeletal mesh and animations, stair/route navigation, UI widgets/focus/per-player refresh and every device/event/property in UEFN_DEVICE_BINDINGS.csv. NPC Spawner is Beta. Compile minimal proofs before integrating. One authoritative writer per flag. Record exact editor version and logs.

### GATE E — gameplay (P1)
Implement in order: session/player state and join/leave; shared inventory and per-player flashlight; interaction locks/cancel/retry; objective and evidence journal; PZ-01 through PZ-05; THE GUEST states and navigation; capture/rescue/solo recovery/checkpoints; all six acts and Room13 reveal; service route; three endings and Night Audit; UI/subtitles/audio/lighting/VFX and readable fallbacks. Pass solo before co-op.

### GATE F — assets and polish (P2)
Produce/import from ASSET_PRODUCTION_BACKLOG_R1.csv by priority. Verify source/license rights before use. Apply room fit-out schedule without structural changes. Integrate THE GUEST only after NPC route proof. Add audio, lighting, rain, reflection and cinematics. No required gameplay asset may remain placeholder at release.

### GATE G — QA and release (P0 final)
Run QA-001–025 and all objective, interaction, AI, cinematic, audio, lighting, asset, UI and ending suites. Test solo/2P/4P full runs, disconnects at transaction boundaries, duplicate and simultaneous interactions, capture/rescue and all-captured recovery. Profile memory/performance on supported targets, run island validation and fix blockers. Request explicit owner publication authorization; never publish without it.

## 5. Evidence contract

ENGINE-VERIFIED, EDITOR-VERIFIED or TEST-PASS requires exact UEFN build, date, project/map, reproducible steps, expected/actual result, screenshot/video/log, party size, source revision, defects and retest. Compile pass is not gameplay pass. Design approval is not editor validation.

## 6. Fallbacks and stop conditions

- No editor/project access: documentation and API research only; no implementation claims.
- Unsupported API/device: use compatibility-matrix fallback and update affected tests.
- NPC navigation failure: authored waypoint patrol/investigation and encounter beats; never teleport a visible NPC or claim full systemic chase.
- UI input limitation: world-space button/grid actors with the same authoritative manager.
- Cinematic failure: readable subtitle/text and deterministic in-world fallback; commit progression only after fallback presentation.
- Unknown asset rights: reject and replace with original or verified licensed asset.
- Structural geometry change: stop and submit R2.4 proposal.
- This brief and the controlling records above supersede historical conflicting task/roadmap text.

## 7. Required return package

CLAUDE_ENVIRONMENT_BASELINE.md; R3_INTEGRATION_INTEGRITY_REPORT.md; API proof log; current Verse source tree; device map; geometry evidence; per-suite QA report; defect list and next exact tasks.