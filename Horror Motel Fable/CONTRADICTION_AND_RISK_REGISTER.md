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
