# CONTRADICTION AND RISK REGISTER — THE MOTEL: ROOM 13
**Baseline:** main branch, 2026-11-16

| ID | Type | Finding | Evidence / location | Impact | Status | Required resolution | Owner |
|---|---|---|---|---|---|---|---|
| CR-001 | Geometry contradiction | ROOM 13 position differs: upper east wing in dossier vs north-body/service band in coordinate CSV and SVG | EXECUTIVE_BUILD_DOSSIER.md; coordinate_schedule.csv; floorplan_upper.svg; door_window_schedule.csv | Critical: route, room, door and furniture placements cannot all be correct | BLOCCATO | Select one position, update all plans/sections/schedules under one revision | Level Design Lead |
| CR-002 | Geometry contradiction | Rooms 07–12 assigned to north wing in dossier but west/east room strips in coordinate schedule/SVG | EXECUTIVE_BUILD_DOSSIER.md; coordinate_schedule.csv; floorplan_upper.svg | Critical: floor allocation and room sequence conflict | BLOCCATO | Approve a single upper-floor plan and reconcile every reference | Level Design Lead |
| CR-003 | Geometry contradiction | Ground-floor room bounds differ between dossier and coordinate schedule; door/wall data follow yet another coordinate set | EXECUTIVE_BUILD_DOSSIER.md; coordinate_schedule.csv; door_window_schedule.csv; wall_schedule.csv | Critical: openings may not be in host walls | BLOCCATO | Recalculate bounds, wall centre-lines, openings and dimensions from one datum | Technical Level Designer |
| CR-004 | Geometry risk | Geometry validation explicitly rejects final build and records unresolved route, junction, stair, balcony, opening and furniture checks | GEOMETRY_VALIDATION_REPORT.md | Critical: no final blockout acceptance | BLOCCATO | Close each listed issue with editor evidence | Level Design Lead / QA |
| CR-005 | Geometry risk | Stair target lacks resolved two-flight plan/landing/headroom; section is schematic | EXECUTIVE_BUILD_DOSSIER.md; sections_AA_CC_DD.svg | High: traversal/collision failure | INCOMPLETO | Dimension stair plan and section; test player capsule | Level Design |
| CR-006 | Data integrity | Wall schedule is partial; not a complete wall/floor/ceiling model | wall_schedule.csv | High: blockout cannot be reproduced reliably | INCOMPLETO | Complete structural schedule with unique IDs and shared walls once | Technical Level Designer |
| CR-007 | Data integrity | Door/window centres and orientations do not consistently match host wall geometry | door_window_schedule.csv; wall_schedule.csv; dossier | High: blocked or misplaced openings | BLOCCATO | Reconcile each opening to a host wall and verify swing/clear opening | Technical Level Designer |
| CR-008 | Data integrity | Furniture schedule contains proposed placements; collision/door/bathroom clearances not validated against approved plan | room_furnishing_schedule.csv; geometry report | High: blocked routes and overlaps | PRESENTE MA NON VERIFICATO | Re-run placement checks after geometry freeze | Environment Art / QA |
| CR-009 | Asset risk | Manifest lists character LODs, materials and sounds as NOT CREATED; remaining entries PROPOSED TARGET | ASSET_MANIFEST_EXECUTIVE.csv / asset_manifest.csv | High: art assets not delivered | INCOMPLETO | Produce/import with source/license and editor evidence | Art Lead |
| CR-010 | Character risk | THE GUEST spec is design-only; no mesh, rig, textures, LOD or animations in tree | GUEST_MODEL_SPEC.md | High: antagonist visual implementation absent | INCOMPLETO | Create model pack and verify import/NPC pipeline | Character Art / Technical Art |
| CR-011 | Engineering risk | Verse design says API-neutral pseudocode; no .verse source | VERSE_SYSTEM_DESIGN.md; repository tree | Critical: no compiled game logic | INCOMPLETO | Verify APIs then implement and compile modules | Verse Lead |
| CR-012 | Engineering risk | Device bindings are conceptual and marked editor/engine test required | UEFN_DEVICE_BINDINGS.csv | High: no verified event binding | PRESENTE MA NON VERIFICATO | Place devices and prove bindings in target UEFN | UEFN Implementer |
| CR-013 | Project risk | No native UEFN project/map/content files are present in this repository snapshot | Recursive tree on main | Critical: repository cannot prove existing island build | INCOMPLETO | Locate separate project or establish native UEFN project baseline | Technical Director |
| CR-014 | QA risk | QA matrix tests are NOT RUN; geometry test QA-017 is BLOCKED | QA_ACCEPTANCE_MATRIX.md | Critical: no gameplay acceptance | PRESENTE MA NON VERIFICATO | Run tests against playable build and retain evidence | QA Coordinator |
| CR-015 | Duplicate docs | Five exact-content duplicate pairs use uppercase/lowercase filenames | Git blob SHA comparison | Medium: ambiguity about authoritative edit targets | PRESENTE MA NON VERIFICATO | Approve canonical filenames; preserve both until decision | Production Director |
| CR-016 | Version risk | Repository contains target-independent design assumptions but no recorded UEFN version/API validation | UEFN_IMPLEMENTATION_SPEC.md; VERSE_SYSTEM_DESIGN.md | High: implementation may rely on unsupported workflow | INCOMPLETO | Record editor version and verify every API/device | Technical Director |
| CR-017 | Schedule risk | Two-hour target appears aspirational in project instructions; scope is a 40–50 minute full co-op island | MASTER_PROMPT_FOR_CLAUDE.md; README.md | High: unrealistic delivery expectation | PRESENTE MA NON VERIFICATO | Estimate by work package; do not equate time target with completion | Production Director |
| CR-018 | Narrative/system risk | New Guest ending must be explicit/team-consistent; implementation is only a design rule | GAME_DESIGN_BIBLE.md; VERSE_SYSTEM_DESIGN.md | Medium: co-op ending race/consent risk | PRESENTE MA NON VERIFICATO | Define team choice/precedence and test simultaneous triggers | Game Design / Verse |

## Duplicate inventory (preserve)
- ASSET_MANIFEST_EXECUTIVE.csv = asset_manifest.csv
- GEOMETRY_VALIDATION_REPORT.md = geometry_validation_report.md
- GUEST_MODEL_SPEC.md = guest_model_spec.md
- QA_ACCEPTANCE_MATRIX.md = qa_acceptance_matrix.md
- UEFN_DEVICE_BINDINGS.csv = uefn_device_bindings.csv

Exact duplicate content was confirmed by matching Git blob SHA. No duplicate has been deleted or renamed.

## Risk acceptance rule
No critical geometry or implementation risk may be accepted by wording alone. Close it with a revised source artifact and the evidence defined in MASTER_TASK_REGISTER.md. Never mark an asset, Verse system, device or island feature complete from a specification.


## Execution responsibility clarification
Risks requiring UEFN/editor inspection or testing must be assigned to Claude for execution. ChatGPT prepares the procedure and acceptance/evidence requirements only; it must not report an editor test as performed. The project owner retains approval authority for design choices and publication. The repository is Claude's reference specification, not proof that the island has been implemented. See `CLAUDE_EXECUTION_PROTOCOL.md`.


## Re-audit additions — 2026-11-16

The R2.0 candidate in `LEVEL_DESIGN_GEOMETRY.md` consolidates the earlier room allocation conflict at documentation level, but it is not owner-approved or editor-verified. Keep CR-001/002 open until the candidate is formally approved and all dependent schedules/walls/sections are aligned. The following additional findings are confirmed:

| ID | Type | Finding | Evidence / location | Impact | Status | Required resolution | Owner |
|---|---|---|---|---|---|---|---|
| CR-019 | CSV integrity | IN-021/022/023 in INTERACTION_MASTER_REGISTER have 12 fields against 13 headers; action/prerequisite fields are shifted or absent | INTERACTION_MASTER_REGISTER.csv, final 3 data rows | Interaction requirements may be misread or imported incorrectly | INCOMPLETO | Restore all columns, validate each row by header and re-run CSV parser | Gameplay Design |
| CR-020 | CSV integrity | PZ-03 has 14 fields against 15 headers | PUZZLE_MASTER_REGISTER.csv, PZ-03 | Fuse puzzle schema is incomplete/ambiguous | INCOMPLETO | Rebuild row with explicit RequiredItems, OptionalItems, InputType, Solution and remaining fields | Gameplay Design |
| CR-021 | CSV integrity | UPPER_ROOM11 is missing the 8.6 m width value; row has 13 fields against 14 headers | coordinate_schedule.csv, UPPER_ROOM11 | Legacy geometry row is unsafe for ingestion | INCOMPLETO | Correct row or formally deprecate legacy schedule in favour of ROOM_COORDINATE_REGISTER.csv | Level Design |
| CR-022 | CSV/schema integrity | Lighting and audio schedules with different headers are concatenated in one CSV; dynamic NPC audio positions are text, not numeric coordinates | lighting_audio_schedule.csv | Automated import/parsing and spatial review are ambiguous | INCOMPLETO | Split lighting/audio tables and represent dynamic emitters explicitly | Audio / Technical Design |
| CR-023 | Structural data | Wall schedule is partial and opening IDs do not match current door/window schedule; D-13C is absent | wall_schedule.csv; DOOR_WINDOW_SCHEDULE.csv | Openings cannot be reliably bound to host wall segments | BLOCCATO | Complete wall IDs/segments and use exact opening IDs from canonical schedule | Technical Level Designer |
| CR-024 | Branch governance | Environment Art PR #1 branch is diverged: 11 commits ahead, 42 behind main; PR is draft with no review/comments/status checks | PR #1; compare main...environment-art/room13-v1 | Merge may reintroduce stale assumptions and bypass review | BLOCCATO | Synchronise branch, re-run comparisons/data validation, review before merge | Production Director / Art Lead |
| CR-025 | Placement geometry | Six west-wing wardrobe footprints lie outside their assigned room bounds, at X≈10.10–10.70 m vs room X-min 11.10 m | PROP_PLACEMENT_REGISTER.csv: F01/F02/F03/F07/F08/F09_WARDROBE | Corridor intrusion, collision and route obstruction | BLOCCATO | Reposition against approved room polygon; re-check door swing and 0.90 m path in editor | Environment Art |
| CR-026 | Placement alignment | F12_SECRET_PANEL placement Y=47.25 m differs from D-13A centre Y=47.55 m by 0.30 m | PROP_PLACEMENT_REGISTER.csv; DOOR_WINDOW_SCHEDULE.csv | Panel may not align with opening/wall | BLOCCATO | Reconcile pivot, wall centre-line and placement coordinates | Level Design / Environment Art |
| CR-027 | Reference integrity | EXT_SIGN_TRIGGER references GAMEPLAY_SIGN_TRIGGER as Asset_ID, but no such asset exists in ENVIRONMENT_ASSET_REGISTER | PROP_PLACEMENT_REGISTER.csv; ENVIRONMENT_ASSET_REGISTER.csv | Device/trigger may be mistaken for an art asset | INCOMPLETO | Move to device/interaction register or add a typed non-mesh reference field | UEFN Implementer |
| CR-028 | Production sequencing | CLAUDE_EXECUTION_PLAN makes Narrative Lock Phase 1; MASTER_TASK_REGISTER and PRODUCTION_ROADMAP make geometry the first critical-path sector | CLAUDE_EXECUTION_PLAN.md; MASTER_TASK_REGISTER.md; PRODUCTION_ROADMAP.md | Claude may receive conflicting execution order | PRESENTE MA NON VERIFICATO | Owner confirms geometry critical path; narrative documentation runs in parallel unless explicitly reprioritised | Production Director |
| CR-029 | Documentation governance | README omits newer R2.0 geometry, Claude protocol and plan files and points to legacy lower-case schedules | README.md; current tree | Operators may use stale or non-authoritative inputs | INCOMPLETO | Refresh reading order and identify canonical files vs legacy references | Production Director |
| CR-030 | Geometry approval | R2.0 candidate has improved room allocation and secret vestibule but remains proposed; wall plan, E-E section, stair run and vertical datum are unresolved | LEVEL_DESIGN_GEOMETRY.md; LEVEL_SECTIONS.md; GEOMETRY_VALIDATION_REPORT.md | Final blockout/art placement still unsafe | BLOCCATO | Owner approves one revision after dimensioned plans/sections/schedules agree; Claude then validates in UEFN | Project Owner / Level Design |

### Status note
The CSV checks above are structural checks, not proof of gameplay or editor behaviour. No UEFN test was run by ChatGPT. Claude must execute all editor-dependent validation and return evidence under CLAUDE_EXECUTION_PROTOCOL.md.


## R2.1 re-audit corrections and new risks — 2026-11-16

This section supersedes outdated details in CR-019 through CR-030 where noted.

### Corrections to earlier findings
- **CR-019:** main INTERACTION_MASTER_REGISTER rows IN-021/022/023 now have 13 fields, but they are still semantically shifted and have empty FailureFallback cells. Width-only validation no longer detects the problem.
- **CR-020:** PZ-03 now has 15 fields, but its Solution value is missing; subsequent values are shifted and AcceptanceTest is empty.
- **CR-021:** the malformed UPPER_ROOM11 row remains in legacy coordinate_schedule.csv. R2.1 uses ROOM_COORDINATE_REGISTER.csv; mark the old file legacy and do not import it.
- **CR-022:** lighting_audio_schedule.csv remains a mixed-schema historical file. AUDIO_REGISTER.csv and LIGHTING_REGISTER.csv now exist as separate current registers, but their semantic field issues are listed below.
- **CR-024:** latest branch comparison is 44 commits ahead / 87 behind main, diverged; PR #1 is OPEN, DRAFT and mergeable=false, with 12 files and no review/comments/status checks.
- **CR-025:** nine wardrobe placements, not six, fall outside their R2.1 assigned room bounds: F01/F02/F03, F07/F08/F09 and F10/F11/F12.
- **CR-026:** the R2.1 PR panel row now has Y=47.55 matching D-13A, but X=68.60 differs from D-13A X=69.95 by 1.35 m.
- **CR-027:** corrected in the current PR branch: EXT_SIGN_TRIGGER now uses ENV_TRIGGER_VOLUME and asset references resolve. Retain as historical closed finding; do not treat it as an active blocker.
- **CR-030:** R2.0 is superseded. The current candidate is R2.1, still NOT APPROVED / NOT UEFN-VERIFIED.

| ID | Type | Finding | Evidence / location | Impact | Status | Required resolution | Owner |
|---|---|---|---|---|---|---|---|
| CR-031 | Geometry / route | R2.1 ROOM 12–ROOM 13 route depends on a corner turning pad and vestibule/wall assembly not fully represented in coordinate and wall schedules | LEVEL_DESIGN_GEOMETRY.md R2.1; ROOM_COORDINATE_REGISTER.csv; DOOR_WINDOW_SCHEDULE.csv; wall_schedule.csv | Route continuity, 0.90 m opening and return path cannot be proven from current schedules | BLOCCATO | Add explicit non-overlapping floor polygons, corner-pad/wall/jamb IDs and a dimensioned D-D section; Claude proves traversal | Level Design |
| CR-032 | Geometry / structural data | wall_schedule.csv remains a 23-row partial R2.0-era list and does not represent the R2.1 upper side-wall doors, balcony rails/corners, floor/ceiling/roof polygons or all current opening IDs | wall_schedule.csv; R2.1 door schedule and geometry brief | Blockout cannot be reproduced from one coherent structural register | BLOCCATO | Create complete R2.1 wall/floor/ceiling/opening schedule with unique IDs and one host wall per opening | Technical Level Designer |
| CR-033 | Art branch stale baseline | PR #1 still uses R2.0 authority/placements while main R2.1 changes upper rooms to 5.90 m and moves upper doors to courtyard-facing walls | CLAUDE_ENVIRONMENT_ART_EXECUTION_PLAN.md; PROP_PLACEMENT_REGISTER.csv; main LEVEL_DESIGN_GEOMETRY.md R2.1 | Nearly all upper placements require re-evaluation; rebase alone is insufficient | BLOCCATO | Reauthor package against R2.1, synchronize branch, rerun footprint/clearance checks and obtain review | Environment Art / Production |
| CR-034 | Placement geometry | Nine wardrobe footprints lie outside R2.1 room bounds; F12_SECRET_PANEL X=68.60 differs from D-13A X=69.95 by 1.35 m | PROP_PLACEMENT_REGISTER.csv; ROOM_COORDINATE_REGISTER.csv; DOOR_WINDOW_SCHEDULE.csv | Corridor intrusion, wrong wall fit and invalid upper-room dressing | BLOCCATO | Reposition using R2.1 FIF bounds, wall-face/pivot convention and verified door/route clearances | Environment Art |
| CR-035 | Furnishing schema / completeness | ROOM_FURNISHING_SCHEDULE.csv has only 15 initial rows; Material_ID contains PROP-* values and Asset_ID values do not map to current asset-register IDs | ROOM_FURNISHING_SCHEDULE.csv; ENVIRONMENT_ASSET_REGISTER.csv; MATERIAL_MASTER_REGISTER.csv | No reliable join between placement, asset and material; incomplete room dressing | INCOMPLETO | Separate Placement_ID, Asset_ID and Material_ID; map every ID; complete all rooms/shared areas after geometry freeze | Environment Art / Data |
| CR-036 | Gameplay data semantics | IN-021/022/023 remain shifted despite matching CSV width; PZ-03 has no actual Solution and empty AcceptanceTest | INTERACTION_MASTER_REGISTER.csv; PUZZLE_MASTER_REGISTER.csv | Claude may implement incorrect interaction/puzzle contracts | INCOMPLETO | Correct fields by header semantics and add row-level validation beyond width checks | Gameplay Design |
| CR-037 | Lighting/audio data | CCT is separated from intensity and NPC emitters use actor-attachment fields; actual light intensity values remain TBD pending target-editor tuning | LIGHTING_REGISTER.csv; AUDIO_REGISTER.csv | Runtime lighting balance and actor-attached spatial audio remain unverified | PRESENTE MA NON VERIFICATO | Claude assigns numeric intensity using verified units and tests THE_GUEST audio attachment in target UEFN | Audio / Lighting |
| CR-038 | Asset source data | 8 of 10 ENVIRONMENT_ASSET_SOURCE_REGISTER rows have excess columns from unquoted commas; GQ-007 has 11 fields vs 10; Abandoned Cars listing facts are stale | Environment Art PR branch CSVs; current Fab listing | Source/rights/compatibility fields may shift and shortlist evidence is unreliable | INCOMPLETO | Quote CSV fields, revalidate current listings and record acquisition/license evidence separately | Art / Production |
| CR-039 | Gate anchor | GATE-01 remains X=40–44,Y=0–1 while EXT_GATE legacy placement is (42,18); no approved corrected anchor exists | ROOM_COORDINATE_REGISTER.csv; exterior_prop_schedule.csv; GQ-007 | Final vehicle escape route and gate placement remain unresolved | BLOCCATO | Prepare one coordinate proposal and wait for owner approval before updating dependent files | Project Owner / Level Design |
| CR-040 | Balcony / roof polygon | R2.1 describes U-shaped balcony corner pads and a roof polygon excluding courtyard, but coordinate register does not encode the explicit polygon vertices/corner unions | LEVEL_DESIGN_GEOMETRY.md; ROOM_COORDINATE_REGISTER.csv; ROOF_PLAN_R2.md | Potential gaps, duplicate collision or unintended roof over courtyard | BLOCCATO | Add explicit polygon vertex/union schedule and verify floor/rail/roof collision in greybox | Technical Level Designer |
| CR-041 | Execution authority | Environment Art plan says “ask no question to owner” for gate correction, while the binding project protocol reserves structural/creative approval to the owner | CLAUDE_ENVIRONMENT_ART_EXECUTION_PLAN.md; CLAUDE_EXECUTION_PROTOCOL.md | Claude could change an unapproved geometry decision | BLOCCATO | Claude may propose and document; do not alter authority schedules until owner approval | Production Director |
| CR-042 | Documentation index | README now references separate audio/light registers but omits the R2.1 index, geometry brief, stair/roof plans and full current R2.1 source hierarchy | README.md; LEVEL_DESIGN_R2.1_INDEX.md | Operators may start from stale reading order | INCOMPLETO | Refresh README and point all chats to R2.1 index/protocol first | Production Director |

### Evidence boundary
Fab listing checks confirm advertised formats and listing metadata only. They do not prove acquisition, license rights for this project, UEFN import success, asset quality in the target project or runtime performance. Claude must perform actual source inventory/import/editor tests; the project owner approves purchases and structural changes.


## Final PR metadata correction — latest live check

- CR-024 remains **BLOCCATO**, but its reason is not a Git merge conflict: GitHub currently reports `mergeable=true`. The branch is still DIVERGED 49 ahead / 94 behind main, the PR is OPEN/DRAFT, and it has no reviews, comments or status checks.
- CR-033 remains **BLOCCATO** because the PR still references R2.0 while main's current geometry authority is R2.1. “Mergeable” is not equivalent to “safe to integrate”.
- The PR description now correctly reports 119 asset rows, 20 materials and 286 placement rows (91 unplaced). Its claim that all CSV schemas are normalized is contradicted by 8 malformed source-register rows and malformed GQ-007.


### Final mergeability status correction
The latest live PR check returned `mergeable=false` (earlier check returned true). Compare was 49 ahead / 100 behind main, DIVERGED. Keep CR-024 blocked and recheck the live status before any merge attempt; regardless of the flag, R2.0-vs-R2.1 staleness and unresolved defects independently prevent acceptance.


## Latest placement/branch delta — final snapshot
The Environment Art branch advanced to `75013155a21717c02ad094c9c9d4238f0f9596e0`; compare is now 52 ahead / 106 behind main, DIVERGED. PR #1 remains OPEN/DRAFT, latest mergeable=false, with no reviews/comments/status checks. Its asset register is now 120 rows, not 119 as stated in the PR description. Placement status counts: 186 PROPOSED TARGET, 7 BLOCKED, 2 EDITOR-TEST REQUIRED, 91 UNPLACED. Six west wardrobes are now BLOCKED with no coordinates; three upper-east wardrobes F10/F11/F12 remain proposed outside R2.1 bounds (X=66.00 vs room minimum X=67.00). F12_SECRET_PANEL remains 1.35 m east/west misaligned from D-13A (X=68.60 vs 69.95). All placement asset/material references resolve. Source register and GQ-007 remain malformed; the plan still cites R2.0. This supersedes the earlier nine-active-wardrobe/119-row count; keep CR-033/034 blocked.

## R2.2 / current-main final audit addendum — 2026-11-16

### Previously recorded issues with changed status
- **CR-036 — RISOLTO DOCUMENTALMENTE:** IN-021/022/023 now have distinct Target and Action fields and all 29 interaction rows match the 13-column header. PZ-03 has a solution and acceptance-test field. Commit 4ccbad6a9af1d2fabcaf26c9fe1b332a750139d5. This is not UEFN verification.
- **CR-042 — RISOLTO DOCUMENTALMENTE:** README now points to the current production handoff, R2.2 index, geometry proposal, binding protocol and Claude execution plan. Commit 4a008bae46a4482424d8cc96febed8a1720b286f.

### New findings / current statuses
| ID | Type | Finding | Evidence / location | Impact | Status | Required resolution | Owner |
|---|---|---|---|---|---|---|---|
| CR-043 | Geometry approval | LD-GEO R2.2 is a coherent candidate but its 11-item owner approval checklist is not signed | LEVEL_DESIGN_GEOMETRY.md §11; GEOMETRY_VALIDATION_REPORT.md §9 | Critical: final blockout and environment art cannot be frozen | BLOCCATO | Owner approves R2.2 or supplies a replacement; Claude then verifies in editor | Project Owner |
| CR-044 | Geometry data | U-NORTH-BALCONY and U-NORTH-HALL have identical XY bounds | ROOM_COORDINATE_REGISTER.csv | Duplicate slab/collision risk if treated as separate physical surfaces | INCOMPLETO | Mark one as functional alias of the same walkable polygon; instantiate one floor/collision | Level Design |
| CR-045 | Ending design conflict | THE_NEW_GUEST co-op quorum differs: unanimous proposal vs majority implementation rule | ENDING_DESIGN_SPEC.md; ENDING_IMPLEMENTATION_SPEC.md; GAMEPLAY_SYSTEMS_SPEC.md | Different ending outcome in multiplayer | BLOCCATO | Owner selects one rule and all documents/tests align | Project Owner |
| CR-046 | Narrative completeness | Mandatory clue copy and THE_TRUTH / THE_NEW_GUEST scripts remain incomplete | NARRATIVE_MASTER_SCRIPT.md; STORY_DOCUMENT_REGISTER.md; ENDING_DESIGN_SPEC.md | Narrative gates cannot be implemented unambiguously | INCOMPLETO | Approve complete English text, clue assets and ending scripts | Narrative |
| CR-047 | Environment Art branch | PR #1 is OPEN/DRAFT, mergeable=false and diverged from main; re-read exact ahead/behind counts before any merge | Live PR #1 and compare main...environment-art/room13-v1 | Stale geometry assumptions and unsafe merge | BLOCCATO | Reauthor against approved R2.2/frozen geometry and request fresh review | Environment Art / Production |
| CR-048 | Geometry document discrepancy | FINAL_GROUND_FLOOR_PLAN.md stair assembly Y bounds conflicted with R2.2 stair/coordinate records | FINAL_GROUND_FLOOR_PLAN.md vs STAIR_PLAN_R2.md / ROOM_COORDINATE_REGISTER.csv | Could place stair outside slab opening | RISOLTO DOCUMENTALMENTE | Corrected to X22.65–25.35, Y52.45–56.17; still requires UEFN test | Production |
| CR-049 | Gameplay transaction ambiguity | PZ-01/PZ-04 success text previously granted keys while IN-006/IN-017 also granted them; Screwdriver use was inconsistent | PUZZLE_MASTER_REGISTER.csv; PUZZLE_IMPLEMENTATION_SHEETS.md; ITEM_AND_INVENTORY_SPEC.md | Duplicate rewards or ROOM 12 softlock | RISOLTO DOCUMENTALMENTE | Puzzle opens drawer/compartment; only IN-006/IN-017 grant keys; Screwdriver is reusable for both documented uses | Gameplay |

Live Environment Art PR metadata at this audit: OPEN/DRAFT, mergeable=false, 61 commits ahead and 226 behind main. This replaces older branch deltas recorded in previous addenda.


## R2.2 final correction — current decision gate and PR state

This addendum supersedes the older 11-item approval count and narrative-completeness wording in CR-043/CR-046.

- R2.2 owner approval is now itemized as GEO-A01–GEO-A15 in OWNER_DECISION_GATE_R2.2.md. The 14 geometry report items have been decomposed and one separate room-interior fit-out decision added. No approval has been received.
- NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md now contains proposal-level draft text and puzzle logic for the register, office photographs, fuses/Room 04 recording, Room 06 photos, Room 09 diary, Room 11 drawing, ROOM 13 photo sequence and both unresolved ending scripts. CR-046 is therefore **draft authored / owner approval pending**, not text absent. END-A01 co-op quorum and END-A02 truth evidence gate remain blocked.
- Current live PR #1 metadata: OPEN, DRAFT, not merged, mergeable=false, 13 changed files, updated 2026-11-16 14:16:10Z. Do not merge.
- CSV structural correction: current ROOM_COORDINATE_REGISTER.csv, PUZZLE_MASTER_REGISTER.csv and INTERACTION_MASTER_REGISTER.csv have zero row-width errors. The combined lighting_audio_schedule.csv remains a historical malformed-width file; use LIGHTING_REGISTER.csv and AUDIO_REGISTER.csv.

The next executable work is CLD-001/CLD-002 from CLAUDE_R2.2_EXECUTION_PACKET.md. Geometry-dependent build remains blocked by owner approval.


## R2.3 current-authority correction — 2026-11-16

This addendum supersedes the earlier R2.0/R2.1/R2.2 status statements below where they conflict with the current owner-approved R2.3 baseline. Historical audit rows are retained for traceability and must not be read as current state.

| Earlier risk | Current status | Correct current interpretation |
|---|---|---|
| CR-001 / CR-002 geometry allocation conflict | RESOLVED AT DESIGN SOURCE-OF-TRUTH LEVEL | LD-GEO R2.3 is owner-approved and is the controlling geometry. Physical editor build/traversal still NOT RUN. |
| CR-003 room bounds / wall / opening conflict | PARTIALLY RESOLVED / CLD-002 REQUIRED | R2.3 controlled records govern; CLD-002 must validate CSV references and topology. Do not reuse legacy dossier values. |
| CR-004 / CR-005 / CR-006 / CR-007 geometry and schedule risks | OPEN AS DOCUMENT/EDITOR VALIDATION ITEMS | R2.3 approval does not prove host-wall references, collision, headroom, rail, stair or player traversal. |
| CR-009 / CR-010 asset and THE GUEST production | OPEN | Model/rig/animation/import assets are not evidenced as produced. |
| CR-011 / CR-012 / CR-013 / CR-014 / CR-016 UEFN/Verse/device/QA | OPEN | No editor build, compiled Verse, device binding or QA pass is certified by repository documents. |
| CR-018 ending co-op ambiguity | RESOLVED BY END-A01 | Owner-approved quorum is in OWNER_DECISION_GATE_R2.2.md and ENDING_IMPLEMENTATION_SPEC.md. |
| CR-043 R2.2 geometry approval missing | SUPERSEDED / CLOSED FOR DESIGN APPROVAL | Owner approved GEO-A01–GEO-A21 for LD-GEO R2.3 on 2026-11-16. |
| CR-045 THE_NEW_GUEST quorum conflict | RESOLVED BY END-A01 | Majority applies only to ESCAPE/THE_TRUTH; THE_NEW_GUEST requires explicit unanimity. |
| CR-046 narrative copy absent | DRAFT CONTENT NOW PRESENT; OWNER APPROVAL PENDING | NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md contains full draft copy; OWNER_DECISION_PACKET_R1.md consolidates NCP-A01–A09 and END-A02 approval. |
| CR-047 PR #1 geometry staleness | OPEN / DO NOT MERGE AS-IS | Any intake must be reauthored and validated against R2.3; old ahead/behind counts are historical and must be re-read live. |

### New current risks
| ID | Type | Finding | Impact | Status | Required resolution |
|---|---|---|---|---|---|
| CR-051 | Narrative approval | NCP-A01–A09 and END-A02 remain proposed, not owner-approved | Draft copy cannot be treated as shipped canon | PENDING OWNER | One consolidated response to OWNER_DECISION_PACKET_R1.md |
| CR-052 | Objective consistency | Objective/event catalog now defines explicit predicates and IN-001–IN-031 mappings | Existing summaries/registers must match one state writer and one commit event | DOCUMENT AUDIT REQUIRED | Cross-check all objective, interaction, puzzle, Verse and UI references |
| CR-053 | AI feasibility | Detailed THE GUEST behaviour contract exists, but NPC navigation/perception/capture APIs are unverified | AI scope may exceed current UEFN capability | ENGINE FEASIBILITY PENDING | Verify each required behaviour in target UEFN and report supported alternatives |
| CR-054 | Audio/lighting cues | Registers identify assets/sources but do not yet define a complete cue-level trigger/mix/concurrency plan | Atmosphere implementation may be inconsistent or duplicated | INCOMPLETO | Create cue sheet with unique event IDs, priority, cooldown, subtitle/visual fallback and mix rules |
| CR-055 | UI string/prompt completeness | UI spec defines layout and behaviour but not every final StringId/copy/input glyph | Inconsistent player-facing language and unclear interactions | INCOMPLETO | Complete objective/UI string table and IN-001–IN-031 prompt/failure/cancel copy |

Current status authority: PRODUCTION_CONTROL_MASTER_SPEC.md, OWNER_DECISION_GATE_R2.2.md, LEVEL_DESIGN_R2.3_INDEX.md and CLAUDE_R2.3_EXECUTION_PACKET.md.
