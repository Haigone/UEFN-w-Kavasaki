# MISSING DELIVERABLES REGISTER — THE MOTEL: ROOM 13
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
| MD-049 | Environment Art package reauthored against R2.2 | PR #1 is OPEN/DRAFT; live comparison at audit time is 66 ahead / 290 behind and mergeable=false; branch handoff still references older geometry | BLOCCATO | Reauthored R2.2 package, fresh comparison, register audit and review | Geometry approval |
| MD-050 | Actual UEFN project/editor baseline and implementation evidence | Main contains no native UEFN project, Verse source or editor/test evidence | INCOMPLETO | Actual project identity, editor version, compiled Verse, configured devices and evidence from Claude | Claude / project owner |

### Current-main status corrections
- FINAL_GROUND_FLOOR_PLAN.md stair assembly coordinates were corrected to match STAIR_PLAN_R2.md and ROOM_COORDINATE_REGISTER.csv (commit 532729b6c0e131d200eece4c4546c16e1b5bd67a).
- INTERACTION_MASTER_REGISTER.csv now has 29 rows and every row matches its 13-column header; IN-021/022/023 Target/Action fields were repaired (commit 4ccbad6a9af1d2fabcaf26c9fe1b332a750139d5).
- PUZZLE_MASTER_REGISTER.csv, ROOM_COORDINATE_REGISTER.csv, DOOR_WINDOW_SCHEDULE.csv, wall_schedule.csv, SLAB_SCHEDULE.csv, AUDIO_REGISTER.csv and LIGHTING_REGISTER.csv also passed row-width checks in this audit. These are schema checks only, not semantic or editor validation.
- Gameplay reward ownership and Screwdriver use were reconciled; GAT-048–GAT-052 now cover the revised contracts.
- Current Environment Art PR divergence is 66 ahead / 290 behind; do not reuse older 52/113 or 52/106 figures as current metadata.
