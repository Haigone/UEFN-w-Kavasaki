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
