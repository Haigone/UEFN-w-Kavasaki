# MISSING DELIVERABLES REGISTER

> **CURRENT AUTHORITY — 2026-11-16:** For present-day counts, approved decisions, canonical filenames, current documentary closure and dependency-ordered remaining work, use [R3_CURRENT_STATUS_AND_REMAINING_WORK.md](R3_CURRENT_STATUS_AND_REMAINING_WORK.md). Older MD-001–MD-077 rows and historical audit sections are retained as history; they do not override the current R3 status. Engine/editor implementation and evidence gates remain open until reproducible evidence is committed.

> **CURRENT STATUS ADDENDUM — 2026-11-16:** NCP-A01–A09 and END-A02 are now APPROVED under the owner's express delegation. Exact canonical content is in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md; END-A02's three required evidence flags and THE_TRUTH ending sequence are in ENDING_IMPLEMENTATION_SPEC.md; IN-032 Night Audit is in INTERACTION_MASTER_REGISTER.csv and INTERACTION_EXECUTION_SPEC.md. Historical entries below that say these decisions are pending are superseded. Documentation approval does not mean props, audio, assets, Verse or UEFN tests are implemented.

 — THE MOTEL: ROOM 13
**Baseline:** repository main, 2026-11-16

| ID | Missing / incomplete deliverable | Current evidence | Status | Required completion evidence | Dependency | Owner |
|---|---|---|---|---|---|---|
| MD-001 | Native UEFN project baseline | No .uproject/.umap/.uasset or project structure in repo | INCOMPLETO | Openable UEFN project, version and editor screenshots | Editor/project access | UEFN Technical Director |
| MD-002 | Canonical reconciled ground-floor plan | Multiple competing coordinates | BLOCCATO | Approved dimensioned plan + coordinate schedule | Geometry decision | Level Design |
| MD-003 | Canonical reconciled upper-floor plan | Dossier/CSV/SVG disagree on rooms 07–13 | BLOCCATO | Approved plan + section + schedules | Geometry decision | Level Design |
| MD-004 | ROOM 12–ROOM 13 continuous route | Conceptual path only; geometry report flags discontinuity | BLOCCATO | Plan/section plus playable editor traversal | MD-002/003 | Level Design |
| MD-005 | Complete wall/floor/ceiling schedule | wall_schedule.csv is partial | INCOMPLETO | Every structural segment, thickness, height, material, openings and collision | MD-002/003 | Technical Level Designer |
| MD-006 | Verified stair and balcony package | Schematic section and target dimensions only | INCOMPLETO | Two-flight stair plan/section, landings, rails, headroom and test | MD-002/003 | Level Design |
| MD-007 | Reconciled door/window schedule | Proposed centres/orientations; host wall mismatch risk | INCOMPLETO | Each opening tied to one host wall, swing and collision test | MD-005 | Technical Level Designer |
| MD-008 | Final furniture placements | Schedule is proposed and based on inconsistent room geometry | PRESENTE MA NON VERIFICATO | Updated coordinates, collision clearance and editor proof | MD-002/003/007 | Environment Art |
| MD-009 | UEFN-ready asset inventory with sources/licenses | Initial manifests are proposal-only | INCOMPLETO | Canonical manifest with asset source, license and import status | Geometry baseline | Art Lead |
| MD-010 | THE GUEST model sheet | Specification exists; image pack absent | INCOMPLETO | Consistent front/side/back/3-4/scale/rig sheet | Character art approval | Character Art |
| MD-011 | THE GUEST mesh, rig, textures and LODs | No mesh or import files | INCOMPLETO | Imported character with measured scale, skeleton, LOD and collision proof | MD-010; MD-001 | Character Art / Technical Art |
| MD-012 | THE GUEST animations | List only; no animation assets | INCOMPLETO | Imported/tested animation set or documented verified fallback | MD-011; NPC feasibility | Animation / Technical Art |
| MD-013 | Compilable Verse source | VERSE_SYSTEM_DESIGN.md is pseudocode/logical contract | INCOMPLETO | .verse modules compile in target UEFN release | MD-001; API verification | Verse Lead |
| MD-014 | Verified NPC implementation | Conceptual NPC Spawner binding only | INCOMPLETO | Working NPC pathing, perception, animation and capture tests | MD-001; MD-011 | UEFN / AI Lead |
| MD-015 | Configured UEFN devices and bindings | CSV targets only; editor tests required | PRESENTE MA NON VERIFICATO | Device Outliner/properties and functional binding evidence | MD-001; geometry | UEFN Implementer |
| MD-016 | Imported audio, VFX and material library | Names and schedules only | INCOMPLETO | Imported assets, licenses, trigger tests and profiling | MD-001; asset pipeline | Audio / Art |
| MD-017 | Working six-act progression and puzzles | Written flow only | PRESENTE MA NON VERIFICATO | End-to-end playable session with objective flags and recovery | MD-013/015 | Game / Verse |
| MD-018 | Capture/rescue and solo recovery | Behaviour spec only | PRESENTE MA NON VERIFICATO | Solo, 2-player and all-captured recovery recordings | MD-013/014 | Verse / QA |
| MD-019 | Three implemented endings | Narrative conditions only | PRESENTE MA NON VERIFICATO | Each ending reached independently; no race/duplicate ending | MD-017 | Game / Verse |
| MD-020 | QA evidence pack | Test matrix NOT RUN | INCOMPLETO | Pass/fail results, build version, recordings and defect log | Playable build | QA Coordinator |
| MD-021 | Performance/memory profile | Requirements only | INCOMPLETO | Measured reports for target platform/editor | Integrated build | Technical Director |
| MD-022 | Island validation and publication package | No validation/publish evidence | INCOMPLETO | Validation result and approved release checklist | MD-020/021 | Release Owner |

## Important distinction
Some deliverables have partial written specifications. They remain PRESENTE MA NON VERIFICATO or INCOMPLETO until the actual asset, editor configuration, compiled source or test evidence exists. The existence of this register is not completion of any implementation item.


## Who produces the missing evidence
For every deliverable whose completion requires an actual UEFN project/editor, asset import, Verse compile, gameplay test, multiplayer test, performance profile or island validation, **Claude produces the implementation and evidence**. ChatGPT prepares the detailed execution plan, exact test protocol and acceptance checklist, then checks Claude's returned evidence. The project owner supplies access and approves decisions/publication. Repository entries remain guidance until implementation evidence is returned. See `CLAUDE_EXECUTION_PROTOCOL.md`.


## Re-audit additions — 2026-11-16

The following items were found during deeper CSV, wall-register and open-branch inspection:

| ID | Missing / incomplete deliverable | Current evidence | Status | Required completion evidence | Dependency | Owner |
|---|---|---|---|---|---|---|
| MD-023 | Validated interaction/puzzle/coordinate CSV rows | Three malformed interaction rows, one malformed PZ-03 row and one malformed UPPER_ROOM11 row | INCOMPLETO | Header-aligned rows, parser report and cross-reference validation | Current main schedules | Gameplay / Level Design |
| MD-024 | Split lighting and audio schedules | lighting_audio_schedule.csv contains two distinct schemas and dynamic text coordinates | INCOMPLETO | Separate schema-consistent files and defined dynamic audio emitter contract | Geometry freeze / audio design | Audio Lead |
| MD-025 | Complete canonical wall/opening schedule | 23-row partial wall list; opening IDs differ from DOOR_WINDOW_SCHEDULE; D-13C absent | BLOCCATO | Full wall centre-lines, shared walls once, host wall IDs and every opening cross-reference | MD-002/003/007 | Technical Level Designer |
| MD-026 | Owner-approved R2.0 geometry package and complete section set | Candidate geometry, two plan documents and schematic SVGs exist; E-E section and exact stair/vertical stack remain open | BLOCCATO | Owner approval, dimensioned plan/sections, wall/opening schedules and Claude traversal evidence | MD-002/003/004/006 | Project Owner / Level Design |
| MD-027 | Reviewed and synchronised Environment Art package | PR #1 draft; branch 11 ahead / 42 behind; no review; files remain outside main | BLOCCATO | Rebased branch, fresh diff, review, corrected placements and approved merge | MD-026 | Art Lead / Production Director |
| MD-028 | Corrected Environment Art placement register | Six wardrobes outside room bounds; secret panel offset 0.30 m; trigger reference lacks asset definition | BLOCCATO | Updated 195-row register, geometry footprint checks, door-swing/route checks and Claude editor evidence | MD-026/027 | Environment Art |
| MD-029 | Current README/source-of-truth index | README omits R2.0 and Claude execution docs and points to legacy lower-case schedules | INCOMPLETO | Updated reading order, canonical/legacy naming table and links to current docs | Audit / source-of-truth decision | Production Director |
| MD-030 | Explicit execution-order decision | Claude execution plan says Narrative Lock Phase 1; master register/roadmap say geometry first | PRESENTE MA NON VERIFICATO | Approved order clarifying parallel narrative work vs geometry critical path | Production sequencing | Project Owner |

The PR's asset/material specifications do not close MD-009/011/012/016: no source models, textures, rig/animation files, license proof or UEFN imports are present in that branch. Documentation improves readiness but does not create the deliverables.


## R2.1 / current PR additions — 2026-11-16

| ID | Missing / incomplete deliverable | Current evidence | Status | Required completion evidence | Dependency | Owner |
|---|---|---|---|---|---|---|
| MD-031 | Complete R2.1 wall/floor/ceiling and polygon schedules | wall_schedule.csv remains 23 partial rows; balcony corner pads and courtyard roof cut-out are not explicit polygons | BLOCCATO | Unique wall/floor/ceiling IDs, vertices, thickness/elevations, openings and collision | R2.1 design baseline | Technical Level Design |
| MD-032 | Dimensioned continuous ROOM 12 → ROOM 13 route | Vestibule, corner pads and D-13C are described but not fully registered as one continuous wall/floor assembly | BLOCCATO | Dimensioned plan/section D-D, wall cuts, clear opening, approach and return-path evidence | MD-031 | Technical Level Design |
| MD-033 | Finished north stair drawing | STAIR_PLAN_R2.md gives correct riser/going arithmetic but exact origin, flight direction, landing polygon and slab opening remain unresolved | INCOMPLETO | Dimensioned plan and section with start/end coordinates, handrails, headroom and collision | R2.1 geometry | Level Design |
| MD-034 | Finished roof construction schedule | ROOF_PLAN_R2.md defines levels and intent but drainage positions/falls and courtyard polygon exclusion are not fully modelled | INCOMPLETO | Roof polygon union, drains/scuppers, downpipes and coordinated section | R2.1 geometry | Level Design |
| MD-035 | Complete furnishing/placement schedule with valid references | ROOM_FURNISHING_SCHEDULE.csv has 15 initial rows; Material_ID contains PROP-* IDs and Asset_ID values do not resolve to current asset IDs | INCOMPLETO | Full room/shared-area placement register with separate Placement_ID, Asset_ID and Material_ID | MD-031/032 | Environment Art |
| MD-036 | R2.1-compatible Environment Art package | PR #1 is 44 ahead / 87 behind, draft, non-mergeable and still based on R2.0 | BLOCCATO | Reauthored R2.1 art spec/registers, synchronized branch, review and acceptance | MD-031/035 | Environment Art / Production |
| MD-037 | Corrected art placement coordinates | Nine wardrobes outside R2.1 bounds; secret panel X differs from D-13A by 1.35 m; 91 rows remain unplaced | BLOCCATO | Corrected coordinates, footprint/door-swing/path checks and Claude editor evidence | MD-036 | Environment Art |
| MD-038 | Valid source/geometry query registers | 8/10 source rows malformed; GQ-007 has 11 fields against 10; one Fab listing's current metadata differs from register | INCOMPLETO | Quoted CSV, verified listing facts, license/provenance and UEFN format classification | MD-036 | Art / Production |
| MD-039 | Semantic repair of interaction/puzzle rows | IN-021/022/023 and PZ-03 pass width count but fields remain shifted; PZ-03 AcceptanceTest blank | INCOMPLETO | Correct field mapping and explicit row-level acceptance tests | Gameplay design | Gameplay Design |
| MD-040 | Lighting/audio parameter schema | CCT and intensity fields are now separate and NPC audio rows use actor attachment fields; numeric intensity values remain TBD for target editor | INCOMPLETO | Claude sets numeric light intensity using verified units and verifies actor-attached audio on THE_GUEST | R2.2 geometry | Lighting / Audio |
| MD-041 | Approved gate anchor and vehicle route | GATE-01 at Y=0–1 conflicts with legacy EXT_GATE at Y=18 | BLOCCATO | Owner-approved anchor and aligned schedules/drive path | R2.1 exterior plan | Project Owner / Level Design |
| MD-042 | Current production index | README omits R2.1 source hierarchy and geometry handoff documents | INCOMPLETO | README points to LEVEL_DESIGN_R2.1_INDEX.md and current Claude protocols | R2.1 baseline | Production |

The current R2.1 design has corrected several earlier ambiguities, but it remains a proposed greybox baseline. No native UEFN build, imported asset, editor test or engine-verified evidence is present in the repository.


### MD-036 status clarification
PR #1 is technically reported `mergeable=true` by GitHub at the latest check, but remains OPEN/DRAFT, 49 ahead / 94 behind, unreviewed and stale against R2.1. Its block is production/data/geometry readiness, not a reported merge conflict. The PR description's 119 asset / 20 material / 286 placement counts are current; its “CSV schemas normalized” claim is not supported by the source-register and GQ-007 parsing results.


### MD-036 final status correction
Latest live check returned `mergeable=false` after an earlier check reported true; compare was 49 ahead / 100 behind main. Treat PR #1 as blocked and recheck after synchronisation/review. The reason for MD-036 remains content/readiness as well as the current mergeability result.


### MD-036 / MD-037 latest placement delta
Latest PR snapshot has 120 asset rows and 286 placement rows (186 proposed, 7 blocked, 2 editor-test required, 91 unplaced). Six west wardrobes are now blocked/unplaced rather than active placements; three upper-east wardrobes remain outside R2.1 bounds, and F12_SECRET_PANEL is 1.35 m offset from D-13A. PR remains draft and diverged 52 ahead / 106 behind; latest mergeable=false. This supersedes the earlier nine-active-wardrobe and 119-asset counts.

## R2.2 / current-main addendum — 2026-11-16

This addendum supersedes older R2.0/R2.1 status and Environment Art branch divergence figures where they differ.

| ID | Missing / incomplete deliverable | Current evidence | Status | Required completion evidence | Dependency |
|---|---|---|---|---|---|
| MD-043 | Owner approval of LD-GEO R2.2 | Single candidate proposal and 11-item approval checklist exist; full geometry remains explicitly unapproved | BLOCCATO | Explicit owner approval or revised signed geometry decision | Project owner |
| MD-044 | Single physical identity for north balcony/hall polygon | U-NORTH-BALCONY and U-NORTH-HALL have identical bounds in ROOM_COORDINATE_REGISTER.csv | INCOMPLETO | Register alias/functional-area mapping; one physical slab and collision surface | Level Design |
| MD-045 | Final roof drainage and complete ceiling/service construction detail | R2.2 sections show levels and flat roof intent; drainage/falls and detailed ceiling/service layout remain open | INCOMPLETO | Dimensioned roof falls/drains/downpipes and coordinated ceiling/void schedule | Geometry approval |
| MD-046 | Final player-facing narrative clue content | Puzzle solutions are documented but register text, office captions, Room 04 transcript, Room 06 identities, diary, drawing and ROOM 13 captions remain incomplete | INCOMPLETO | Approved English source text, subtitle/transcript and prop layout for every mandatory clue | Narrative owner |
| MD-047 | Consistent THE_NEW_GUEST co-op quorum | ENDING_DESIGN_SPEC.md proposes unanimous confirmation; ENDING_IMPLEMENTATION_SPEC.md / GAMEPLAY_SYSTEMS_SPEC.md use majority | BLOCCATO | One owner-approved quorum rule reflected in every gameplay/ending document | Project owner |
| MD-048 | Approved THE_TRUTH evidence gate and finale | Truth evidence list exists but mandatory status and final confrontation/cost/dialogue/consequence remain unresolved | BLOCCATO | Approved mandatory evidence list and complete ending script/trigger specification | Narrative owner |
| MD-049 | Environment Art package reauthored against R2.2 | PR #1 is OPEN/DRAFT; live comparison at audit time is diverged and mergeable=false; re-read ahead/behind counts before any merge; branch handoff still references older geometry | BLOCCATO | Reauthored R2.2 package, fresh comparison, register audit and review | Geometry approval |
| MD-050 | Actual UEFN project/editor baseline and implementation evidence | Main contains no native UEFN project, Verse source or editor/test evidence | INCOMPLETO | Actual project identity, editor version, compiled Verse, configured devices and evidence from Claude | Claude / project owner |

### Current-main status corrections
- FINAL_GROUND_FLOOR_PLAN.md stair assembly coordinates were corrected to match STAIR_PLAN_R2.md and ROOM_COORDINATE_REGISTER.csv (commit 532729b6c0e131d200eece4c4546c16e1b5bd67a).
- INTERACTION_MASTER_REGISTER.csv now has 29 rows and every row matches its 13-column header; IN-021/022/023 Target/Action fields were repaired (commit 4ccbad6a9af1d2fabcaf26c9fe1b332a750139d5).
- PUZZLE_MASTER_REGISTER.csv, ROOM_COORDINATE_REGISTER.csv, DOOR_WINDOW_SCHEDULE.csv, wall_schedule.csv, SLAB_SCHEDULE.csv, AUDIO_REGISTER.csv and LIGHTING_REGISTER.csv also passed row-width checks in this audit. These are schema checks only, not semantic or editor validation.
- Gameplay reward ownership and Screwdriver use were reconciled; GAT-048–GAT-052 now cover the revised contracts.
- Current Environment Art PR divergence is 66 ahead / 290 behind; do not reuse older 52/113 or 52/106 figures as current metadata.


## R2.2 re-audit correction — 2026-11-16

The earlier MD-023 wording that IN-021/022/023 were malformed is superseded by the current main snapshot: those three rows are header-aligned. The PZ-03 AcceptanceTest field has now been populated. The SITE, BLDG-UNION and COURTYARD semantic columns in ROOM_COORDINATE_REGISTER.csv have also been corrected.

This does **not** close the full CSV/data gate. Remaining validation still required:
- schema and enum checks across every controlled CSV;
- unique ID and foreign-key checks across coordinate, wall, opening, slab, asset, material and placement registers;
- one-to-one opening-to-host-wall mapping;
- geometry topology, balcony union, courtyard void and ROOM 12–ROOM 13 continuity checks;
- editor collision and traversal proof by Claude after owner approval.

Current geometry decision and Claude execution documents:
- `OWNER_DECISION_GATE_R2.2.md`
- `CLAUDE_R2.2_EXECUTION_PACKET.md`

Current state remains **INCOMPLETO / BLOCCATO** where editor evidence or owner approval is required. No implementation status is upgraded by these documentary repairs.


## Narrative draft closure — 2026-11-16

A complete proposal-level draft pack now exists at `NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md`. It supplies the missing exact draft content and puzzle deduction for:
- Guest Register / code 02-13-86;
- Owner's Office four-photo ordering puzzle;
- Fuse A/B/C location labels and Room 04 phone recording;
- Room 06 missing-guest photo board;
- Room 09 diary;
- Room 11 child's drawing;
- ROOM 13 four-photo sequence and reveal state contract;
- THE TRUTH ending action/consequence proposal;
- THE NEW GUEST invitation/consent copy.

These are authored drafts, not approved canon. Owner approval items NCP-A01–A10 and END-A01/END-A02 remain open. Therefore the content-authoring deliverable is **PRESENTE MA NON VERIFICATO / IN ATTESA DI APPROVAZIONE**, while the final approved narrative pack and editor implementation remain incomplete.


## R2.3 / current documentation addendum — 2026-11-16

This addendum supersedes older rows and narrative notes where they describe geometry as unapproved, co-op quorum as unresolved, or draft clue text as absent. It does not claim editor implementation.

### Status corrections
- **MD-002 / MD-003:** ground/upper geometry source of truth and R2.3 design are OWNER-APPROVED DESIGN (GEO-A01–GEO-A21). Remaining work is register integrity, editor construction, collision and traversal evidence. Do not retain the old status BLOCCATO for the owner design decision.
- **MD-004:** route is dimensioned at R2.3 design level; physical continuity and traversal remain EDITOR-TEST REQUIRED.
- **MD-006 / MD-007:** approved stair/balcony/opening design is in R2.3 controlled records; editor and cross-register verification remain open.
- **MD-048:** THE TRUTH narrative sequence now has a complete proposal-level draft. END-A02 evidence formula and NCP-A08 remain owner approval pending; no content is absent at draft level.
- **MD-049:** PR #1 must be reconciled against LD-GEO R2.3, not R2.2. Do not merge it as-is.
- END-A01 co-op quorum is owner-approved; it is no longer an outstanding owner decision.
- The narrative proposal pack is complete at draft level. NCP-A01–A09 and END-A02 are consolidated in OWNER_DECISION_PACKET_R1.md.

### New documentation deliverables
| ID | Deliverable | Current status | Completion criterion |
|---|---|---|---|
| MD-051 | Dedicated THE GUEST AI behaviour specification | PRESENTE — MONSTER_AI_BEHAVIOUR_SPEC.md | Design contract reviewed; target UEFN feasibility remains a separate engine gate |
| MD-052 | Canonical objective/event/flag catalog | PRESENTE — OBJECTIVE_AND_EVENT_CATALOG.md + INTERACTION_EXECUTION_SPEC.md | Cross-reference every objective and IN-001–IN-031 mapping; no duplicate flag writer |
| MD-053 | Consolidated owner narrative decision packet | PRESENTE — OWNER_DECISION_PACKET_R1.md | Owner response recorded; NCP-A01–A09 and END-A02 synchronized |
| MD-054 | UI/UX vote and objective reconciliation | PARTIAL — GAMEPLAY_UI_UX_SPEC.md | Fully matches END-A01 and objective catalog; vote window and visual treatment specified as tunable UX parameters |
| MD-055 | Cue-level audio/lighting specification | PRESENTE — AUDIO_CUE_SHEET.csv / LIGHTING_CUE_SHEET.csv initial baseline; asset/mix/editor validation pending | Complete cue IDs, triggers, duration, priority, concurrency/mix, subtitle/visual fallback and recovery |
| MD-056 | Objective/UI string table and prompt copy | PRESENTE — UI_STRING_TABLE.csv + INTERACTION_EXECUTION_SPEC.md; input glyph and visual validation pending | Stable StringId for every objective, interaction, error, pickup, rescue, checkpoint and ending prompt |
| MD-057 | Complete asset acquisition/licensing/import manifest | INCOMPLETO | Every required asset has unique ID, source, license, owner, format, import status and replacement/fallback |
| MD-058 | Full interaction register IN-001–IN-031 reconciliation | PRESENTE — 31 interaction rows + INTERACTION_EXECUTION_SPEC.md; cross-register/editor validation pending | Every interaction has exact preconditions, UI mode, cancel/timeout, success/failure copy, state writer and fallback |

Old audit sections below this addendum remain historical evidence. Use the current R2.3 approval record, production control master and R2.3 Claude packet for current status.

| MD-059 | Cinematic and presentation sequence specification | PRESENTE — CINEMATIC_AND_PRESENTATION_SPEC.md; narrative approval/engine capabilities pending | Sequence IDs, triggers, durations, locks, fallbacks, subtitles, multiplayer sync and tests defined |
| MD-060 | Asset sourcing/licensing/import pipeline | PRESENTE — ASSET_PRODUCTION_PIPELINE_SPEC.md; actual asset sourcing/import pending | Asset IDs, rights, metadata, import, collision, LOD, performance and acceptance gates defined |

| MD-061 | Audio mix/ducking/concurrency policy | PRESENTE — AUDIO_MIX_POLICY.md; actual mix calibration pending | Relative level targets, VO ducking, concurrency, spatial and loop QA defined |
| MD-062 | Lighting state/intensity/readability specification | PRESENTE — LIGHTING_STATE_SPEC.md; actual editor calibration pending | Relative state targets, transitions, readability and photosensitivity rules defined |


## Delegated narrative decision closure — 2026-11-16
| ID | Deliverable | Current status | Remaining work |
|---|---|---|---|
| MD-046 | Approved player-facing narrative/clue copy | COMPLETE — CANON APPROVED NCP-A01–A09 | Create/import authored props, images, readable text, subtitles and journal content; verify in editor. |
| MD-048 | Approved THE_TRUTH evidence gate and finale | COMPLETE — END-A02 APPROVED; exact 3-clue gate and finale specified | Implement IN-032 and cinematic/actor presentation; run solo/co-op acceptance tests. |
| MD-053 | Consolidated owner narrative decision | COMPLETE — delegated approval recorded in OWNER_DECISION_PACKET_R1.md | No further owner decision required for NCP-A01–A09 or END-A02. |
| MD-063 | THE_TRUTH Night Audit interaction | DOCUMENTED — IN-032 in interaction register/execution spec | Implement dedicated control actor/proxy, one-shot event and sequence; verify target UEFN capabilities. |


## Detailed systems documentation addendum — 2026-11-16

The following deliverables have been authored and verified on branch main. Their existence closes documentation-authoring gaps only; it does not imply implementation, API verification, editor validation or playtest completion.

| ID | Deliverable | Current status | Remaining work |
|---|---|---|---|
| MD-064 | Detailed executable sheets for all registered puzzles PZ-01–PZ-05 | PRESENTE — PUZZLE_EXECUTION_DETAIL_R2.md | Cross-register audit, UEFN interaction implementation, solo/co-op acceptance evidence |
| MD-065 | THE GUEST numeric tuning baseline | PRESENTE — THE_GUEST_NUMERIC_TUNING_R1.md (PROPOSED CALIBRATION) | Verify movement/NPC capabilities in target UEFN; calibrate with at least 3 runs per party size; replace proposed values only with measured evidence |
| MD-066 | UEFN feature compatibility and fallback matrix | PRESENTE — UEFN_FEATURE_COMPATIBILITY_MATRIX_R1.md | Check each feature against target editor/API digest; create minimal proofs; record engine/editor evidence |
| MD-067 | UI screen layouts and widget state definitions | PRESENTE — UI_SCREEN_LAYOUTS_AND_WIDGET_STATES_R1.md | Implement widget hierarchy; verify safe zones, controller focus, mobile/console scaling, accessibility and multiplayer refresh |
| MD-068 | Authoritative event and state transition catalog | PRESENTE — EVENT_AND_STATE_TRANSITION_CATALOG_R2.md | Reconcile EVT-001–042 with existing IN-001–IN-032 and Verse/device bindings; resolve event-ID mapping; run race/disconnect/checkpoint tests |

### Current documentary closure

The core gameplay design now has explicit documentation for: all five registered puzzles; per-screen UI layouts; numeric THE GUEST starting values; 42 logical events; and a feature-by-feature UEFN implementation/fallback route. The remaining major documentary risks are cross-register reconciliation, asset-level sourcing/rights/completeness, exact device/API bindings against the target release, and consistency of legacy task/status snapshots.

### Mandatory follow-up

1. Do not treat the proposed AI numbers as final tuning or measured behavior.
2. Do not treat compatibility matrix routes as verified UEFN capabilities.
3. Cross-map EVT IDs to existing interaction IDs; no second event system may be created in Verse.
4. Confirm all UI strings exist in UI_STRING_TABLE.csv; add missing stable StringIds before implementation.
5. Keep CLD-001/CLD-002 and all editor gates open until reproducible evidence is committed.


## Event integration crosswalk addendum — 2026-11-16

| ID | Deliverable | Current status | Remaining work |
|---|---|---|---|
| MD-069 | Complete IN-001–IN-032 ↔ EVT-001–EVT-051 ↔ Verse manager crosswalk | PRESENTE — EVENT_INTERACTION_VERSE_CROSSWALK_R1.md; EVT-043–051 added to EVENT_AND_STATE_TRANSITION_CATALOG_R2.md | Implement against target Verse API; confirm no duplicate event writers; compile and run solo/2P/4P transaction tests |

The interaction-to-event documentation mapping is now complete at design level. It does not mean the logical Verse method names exist as compiled source. UEFN_DEVICE_BINDINGS.csv still contains EDITOR-TEST REQUIRED entries and must not be upgraded without target-editor evidence.


## R3 production documentation refresh — 2026-11-16

The following documentation deliverables are now present on main. These close planning gaps only; source acquisition, editor setup, import, compilation and testing remain open.

| ID | Deliverable | Status | Remaining acceptance |
|---|---|---|---|
| MD-070 | Canonical Claude read order and ordered production gates | PRESENT — CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md | Executor must return baseline and integrity report |
| MD-071 | Room interior fit-out rules and clearance policy | PRESENT — ROOM_INTERIOR_FITOUT_SPEC_R1.md | Verify all 183 furnishing rows against R2.3 bounds, door swings and interaction clearance in editor |
| MD-072 | Expanded asset production backlog | PRESENT — ASSET_PRODUCTION_BACKLOG_R1.csv (65 rows) | Source original/licensed assets; fill exact provider/license evidence; import and profile |
| MD-073 | Official UEFN feature reference register | PRESENT — UEFN_VERIFIED_REFERENCE_REGISTER_R1.md | Minimal project proofs for all project-specific behaviors |
| MD-074 | Expanded device binding register | PRESENT — UEFN_DEVICE_BINDINGS.csv (50 rows including all 32 interactions and system devices) | Verify exact device properties/events in target editor; map each device to a placed actor and source revision |
| MD-075 | THE GUEST model-to-UEFN production sequence | PRESENT — GUEST_MODEL_SPEC.md addendum | Produce turnaround/mesh/rig/animations and combined NPC proof |
| MD-076 | Exact world/UI/player spawn anchors for IN-001–IN-032 | PRESENT — INTERACTION_ANCHOR_SCHEDULE_R1.csv (58 rows) | Verify all pivots, collision, reach and spawn clearance in editor |
| MD-077 | THE GUEST spawn/patrol/stair waypoint anchors | PRESENT — AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv | Verify NPC spawn, navmesh and every route in target UEFN build |

### Current blockers that documentation cannot close

- MD-001 native UEFN project and target editor baseline.
- R3 integration integrity report: semantic checks beyond CSV row width, including furniture-vs-room fit, interaction/event/objective mapping, cue/string coverage and exact device binding.
- Actual R2.3 greybox construction and traversal proof.
- Asset source/rights verification and actual asset creation/import.
- Verse source compilation and all runtime tests.
- Performance/memory profiling, island validation and release authorization.

The R3 brief is the current execution sequence. SERVICE_CONTROL_BAY_LOCATION_AND_INTERACTION_SPEC_R1.md resolves the service-control-room ambiguity: GF-SERVICE-BAY is playable; U-SERVICE remains sealed. Historical task rows below this addendum remain useful as historical audit evidence but must not override the current R2.3/R3 authority.


## R3 static integration audit completion — 2026-11-16

**R3_INTEGRATION_INTEGRITY_REPORT.md** is now present. The static checks recorded there pass for: 57 room-coordinate rows; 183 furnishing rows; 51 openings resolving to 72 unique walls; 32 interaction IDs mapped exactly once in the crosswalk; 51 event IDs; 49 unique device binding IDs; 100 UI strings; audio and lighting cue references; and 94 unique master asset IDs. Six out-of-room wardrobe positions were corrected and all 183 furniture footprints now fit their room envelopes under the stated centre-origin assumption.

This closes the corresponding static documentation/data-integrity deliverable. It does not close editor collision, mesh pivot, door swing, interaction reach, AI navigation, Verse compilation, multiplayer, asset license or performance tests.


## R3 follow-up deliverables — 2026-11-16

| ID | Deliverable | Current status | Remaining work |
|---|---|---|---|
| MD-078 | Consolidated current status, canonical counts and strict dependency-ordered remaining work | PRESENT — R3_CURRENT_STATUS_AND_REMAINING_WORK.md | Keep synchronized when a controlling decision, register count or gate status changes |
| MD-079 | Repeatable static repository integrity checker | PRESENT — tools/validate_r3_repository.py | Run in the repository environment; resolve any reported static defects. Does not replace editor/runtime evidence |

The R3 follow-up also corrected the PZ-05 circular prerequisite and reconciled the asset manifest/rights counts to 99 unique assets and 99 rights rows. Actual asset sourcing/import, native UEFN project, Verse compilation and all editor/runtime/release gates remain open.


## R3 final handoff additions — 2026-11-16

| ID | Deliverable | Current status | Remaining work |
|---|---|---|---|
| MD-080 | Autonomous Claude execution rules, decision hierarchy, batch loop and THE GUEST missing-model/rig/animation production route | PRESENT — CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md | Claude must follow it during implementation |
| MD-081 | Automated static repository validation on push and pull request | PRESENT — .github/workflows/r3-static-validation.yml | First GitHub Actions run must complete; resolve any reported script/workflow failures |

MD-080 closes the ambiguity in the autonomous handoff instructions. MD-081 automates the static checks; neither constitutes native UEFN implementation or runtime validation.
