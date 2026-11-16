# MASTER TASK REGISTER — THE MOTEL: ROOM 13
**Baseline:** repository main, audit 2026-11-16  
**Status vocabulary:** COMPLETATO CON EVIDENZA / PRESENTE MA NON VERIFICATO / INCOMPLETO / BLOCCATO  
**Priority:** P0 = blocks production / P1 = critical path / P2 = required downstream / P3 = polish

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| AUD-001 | Production | Repository inventory and baseline audit | P0 | Repository access | PROJECT_STATUS_AUDIT.md | COMPLETATO CON EVIDENZA | Tree and source inventory documented | Git tree and file review | Production Director |
| GEO-001 | Level Design | Select one authoritative geometry revision; resolve dossier/CSV/SVG conflicts | P0 | AUD-001 | Approved geometry decision + revised source plans | BLOCCATO | Every room, floor and route has one consistent coordinate definition | Signed decision, reconciled plan/section/schedules | Level Design Lead |
| GEO-002 | Level Design | Resolve ROOM 12 to ROOM 13 physically continuous route and exit | P0 | GEO-001 | Secret route plan/section | BLOCCATO | Walkable, collision-free route with entry and exit; no room overlap | Editor walkthrough + top-down/section evidence | Level Design Lead |
| GEO-003 | Level Design | Resolve full ground/upper floor polygons, shared walls and connector junctions | P0 | GEO-001 | Ground/upper plans and wall schedule | BLOCCATO | No unintended polygon/wall intersections; dimensions reconcile | CAD/SVG plus editor screenshots | Technical Level Designer |
| GEO-004 | Level Design | Complete stair flights, landings, headroom, balcony slab/rail and thresholds | P0 | GEO-001 | Stair and balcony plans/sections | INCOMPLETO | Continuous safe circulation with target clearances | Dimensioned section and editor traversal | Level Design Lead |
| GEO-005 | Level Design | Reconcile doors/windows with host walls and swings | P1 | GEO-003 | Canonical door_window_schedule.csv | INCOMPLETO | Every opening aligns with one wall and clear route | Schedule + editor collision tests | Technical Level Designer |
| GEO-006 | Level Design | Complete wall/floor/ceiling schedule and coordinate IDs | P1 | GEO-003 | Canonical coordinate_schedule.csv + wall_schedule.csv | INCOMPLETO | Every structural element has coordinates, dimensions and collision intent | CSV validation + editor Outliner | Technical Level Designer |
| GEO-007 | Level Design | Verify solo route, chase loop, patrol points and hiding clearances | P1 | GEO-002; GEO-004 | Player/NPC route maps | INCOMPLETO | All objectives reachable solo; no dead-end softlock | Walkthrough + NPC route test | Level Design / AI |
| BLK-001 | UEFN | Create/identify native UEFN project and target version | P0 | GEO-001 decision | UEFN project baseline | INCOMPLETO | Actual editable island project opens in agreed editor version | Project tree and editor screenshot | UEFN Technical Director |
| BLK-002 | UEFN | Build functional greybox from approved geometry | P0 | BLK-001; GEO-003..007 | Playable greybox | INCOMPLETO | All mandatory spaces and routes traversable | UEFN screenshots and recorded walkthrough | Environment / Level Design |
| AS-001 | Art | Canonical asset register with source/license and actual status | P1 | AUD-001; GEO-001 | Consolidated asset_manifest.csv | INCOMPLETO | Every required asset has ID, source/license, owner and import state | Manifest + source/licence records | Art Lead |
| AS-002 | Character | Produce THE GUEST model sheet and final approved proportions | P1 | GUEST spec; art direction | Character turnaround pack | PRESENTE MA NON VERIFICATO | Same character across front/side/back/3-4/scale views | Approved image pack | Character Art Lead |
| AS-003 | Character | Model, rig, texture and LOD THE GUEST; verify UEFN import path | P1 | AS-002; BLK-001 | Imported skeletal character asset | INCOMPLETO | Correct 2.60 m target scale, rig, LODs and collision in editor | Import screenshots, asset details and animation tests | Character Art / Technical Art |
| VER-001 | Engineering | Verify NPC implementation and Verse API/device capabilities | P0 | BLK-001; target UEFN version | Technical feasibility note | INCOMPLETO | Every chosen API/device verified against installed release | Official docs references + minimal test project | Verse Lead |
| VER-002 | Engineering | Implement authoritative session/game manager and shared state | P1 | VER-001; BLK-001 | Compilable Verse source | INCOMPLETO | Compiles; join/leave and shared objectives pass | Source, compile log and tests | Verse Lead |
| VER-003 | Engineering | Implement puzzle/interactions/checkpoints/capture/rescue/ending state | P1 | VER-002; gameplay gates | Verse modules and device bindings | INCOMPLETO | Idempotent interactions; solo recovery; no race/softlock | Compile logs and QA recordings | Verse Lead |
| DEV-001 | UEFN | Place/configure devices and bind Verse events | P1 | BLK-002; VER-001..003 | UEFN_DEVICE_BINDINGS.csv + editor map | INCOMPLETO | Every device ID and binding resolves in editor | Outliner/property screenshots and functional tests | UEFN Implementer |
| AUD-002 | Audio/Art | Produce/import ambience, cues, VO/subtitles and VFX | P2 | AS-001; BLK-002; story lock | Audio/VFX asset pack and schedules | INCOMPLETO | All cues triggered correctly, English subtitles readable | Asset sources, import proof and in-game capture | Audio Lead |
| QA-001 | QA | Execute geometry, gameplay, solo/co-op, disconnect and ending matrix | P1 | BLK-002; VER-003; DEV-001 | QA evidence pack | PRESENTE MA NON VERIFICATO | Every critical test PASS with evidence; no open blocker | Test logs, videos, screenshots, build/version | QA Coordinator |
| REL-001 | Release | Profile performance/memory and island validation | P1 | QA-001; content integration | Optimization and validation report | INCOMPLETO | Target platform validation has no blocking errors | UEFN reports and measured results | Technical Director / QA |
| REL-002 | Release | Publication readiness and release handoff | P2 | REL-001; explicit authorization | Release checklist and approved publish package | INCOMPLETO | All gates pass and owner explicitly authorizes publication | Final validation, approvals and release record | Production Director |

## First 20 production tasks (priority order)
1. GEO-001 — resolve and freeze one geometry source of truth.
2. GEO-002 — resolve ROOM 12–ROOM 13 route.
3. GEO-003 — reconcile floor polygons and wall junctions.
4. BLK-001 — establish native UEFN project/editor baseline.
5. GEO-004 — resolve stair, balcony and vertical section.
6. GEO-005 — reconcile door/window openings.
7. GEO-006 — complete structural schedules.
8. GEO-007 — prove solo traversal and chase route.
9. BLK-002 — build functional greybox.
10. VER-001 — verify Verse/NPC/device technical feasibility.
11. AS-001 — consolidate asset manifest and licensing.
12. AS-002 — approve THE GUEST model sheet.
13. VER-002 — implement shared game/session state.
14. DEV-001 — configure and bind devices.
15. VER-003 — implement puzzle, checkpoint and capture/rescue flows.
16. AS-003 — produce/import THE GUEST character.
17. AUD-002 — create/import audio, VFX and environmental assets.
18. QA-001 — execute full gameplay and multiplayer matrix.
19. REL-001 — profile and run island validation.
20. REL-002 — release readiness and explicit publication approval.

## Workstream rule
No task may move to COMPLETATO CON EVIDENZA because a document was authored. The status applies to the concrete deliverable named in that task, and acceptance requires the evidence stated in its criterion.


## Execution ownership rule (binding)
The Owner column identifies the discipline responsible for the work, not a separate executor. For all UEFN/editor-dependent work, **Claude is the sole designated execution and test operator**; ChatGPT prepares the exact task packet, steps, values, expected outcomes, recovery path and evidence checklist. The project owner approves design decisions and publication. Do not interpret a task assignment to QA, Level Design, Verse or UEFN as a request for ChatGPT to operate the editor. A task requiring editor evidence cannot be marked complete until Claude returns that evidence. See `CLAUDE_EXECUTION_PROTOCOL.md`.


## Re-audit tasks — 2026-11-16

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| AUD-002 | Production | Re-audit current main, all CSV schemas and open Environment Art PR | P0 | Repository access | Updated PROJECT_STATUS_AUDIT.md and registers | COMPLETATO CON EVIDENZA | Current tree, branch divergence, CSV structure and placement anomalies recorded | Git tree, PR metadata, parser and geometry-boundary report | Production Director |
| DATA-001 | Data | Repair malformed interaction, puzzle and coordinate rows; split lighting/audio tables | P0 | AUD-002 | Validated CSV package | INCOMPLETO | Every row matches its header; IDs and numeric fields validate | CSV parser report and diff | Gameplay / Level Design |
| GEO-008 | Level Design | Complete wall schedule and reconcile all opening IDs to canonical door/window register | P0 | GEO-001; DATA-001 | Complete wall/opening schedule | BLOCCATO | Every opening maps to one host wall; D-13C and vestibule are modelled | Cross-reference report, plans and sections | Technical Level Designer |
| ART-001 | Environment Art | Synchronise/rebase PR #1 with current main and complete formal review before merge | P1 | GEO-001; AUD-002 | Reviewed Environment Art PR | BLOCCATO | Current-base diff is reviewed; no stale geometry assumptions or unaddressed critical defects | Updated PR diff, review and approval | Art Lead / Production Director |
| ART-002 | Environment Art | Correct six wardrobe bounds, ROOM 12 panel alignment and trigger reference typing | P1 | GEO-001; ART-001 | Corrected PROP_PLACEMENT_REGISTER.csv | BLOCCATO | All footprints fit approved polygons and preserve door/route clearances | Automated footprint report and Claude editor screenshots | Environment Art |
| DOC-001 | Production | Refresh README and identify canonical vs legacy documents/schedules | P2 | GEO-001; DATA-001 | Updated README.md | INCOMPLETO | Reading order points to current R2.0, protocol and canonical schedules | Link/path audit | Production Director |
| PROD-001 | Production | Resolve narrative-first vs geometry-first phase order | P1 | AUD-002 | Approved execution sequence | PRESENTE MA NON VERIFICATO | Claude receives one unambiguous critical path; narrative parallel work explicitly identified | Owner decision and revised roadmap/plan | Project Owner |

These tasks supplement, and do not replace, the original task IDs. ChatGPT prepares exact implementation packets for Claude; Claude performs all UEFN/editor actions and tests. No task above authorises ChatGPT to operate UEFN or merge PR #1.


## R2.1 re-audit tasks — 2026-11-16

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| GEO-009 | Level Design | Complete explicit R2.1 floor polygons, U-balcony corner pads, roof courtyard cut-out and ROOM 12–13 route assembly | P0 | GEO-001; R2.1 owner decisions | Polygon/wall/floor/ceiling package | BLOCCATO | All polygons non-overlapping and connected; D-13A/B/C and return route have dimensioned wall cuts | CAD/plan/section and collision audit | Technical Level Designer |
| GEO-010 | Level Design | Complete wall schedule and opening cross-references for R2.1 | P0 | GEO-009 | Wall/opening schedule | BLOCCATO | Every current opening maps to one host wall; all R2.1 room side walls and rails exist | Schedule cross-reference report | Technical Level Designer |
| GEO-011 | Level Design | Finish stair and roof construction drawings | P1 | GEO-009 | Dimensioned stair/roof plans and sections | INCOMPLETO | Stair start/end/landing/headroom and roof drainage/polygon are dimensioned | Plan/section and Claude editor evidence | Level Design |
| DATA-002 | Gameplay/Data | Correct semantic alignment of IN-021/022/023 and PZ-03 | P0 | AUD-002 | Corrected interaction/puzzle CSVs | INCOMPLETO | Every field matches header meaning; acceptance tests are explicit | Schema-aware validator and reviewed diff | Gameplay Design |
| ENV-003 | Environment Art | Complete furnishing schedule with stable Placement_ID, Asset_ID and Material_ID joins | P1 | GEO-009; ART-003 | Complete room/shared-space schedule | INCOMPLETO | All required rooms/areas covered and all IDs resolve to source registers | Cross-reference report and placement drawings | Environment Art |
| ART-003 | Environment Art | Reauthor Environment Art package against R2.1 and synchronize PR #1 with main | P1 | GEO-009; GEO-010 | R2.1-aligned art package | BLOCCATO | No R2.0 coordinate dependency; all placed footprints fit approved bounds; source rows parse | Updated PR, parser, footprint report, review | Environment Art |
| ART-004 | Environment Art | Correct nine wardrobe placements and F12 secret panel alignment | P1 | ART-003 | Corrected placement register | BLOCCATO | All bounds, door swings and clear routes pass | Footprint audit and Claude editor screenshots | Environment Art |
| DATA-003 | Lighting/Audio | Normalize intensity/CCT and dynamic NPC audio emitter fields | P2 | R2.1 geometry | Valid light/audio registers | INCOMPLETO | Numeric values with units; dynamic emitters use attachment IDs, not text coordinates | Schema validation and UEFN evidence | Lighting / Audio |
| GEO-012 | Level Design | Resolve GATE-01 / EXT_GATE coordinate conflict | P1 | R2.1 exterior layout | Owner-approved gate anchor | BLOCCATO | One approved coordinate, yaw, vehicle approach and aligned dependent schedules | Owner decision and revised schedule | Project Owner / Level Design |
| DOC-002 | Production | Refresh README and all handoff references to R2.1 source hierarchy | P2 | R2.1 index | Updated README and discipline links | INCOMPLETO | R2.1 index is first geometry authority; legacy files labelled | Link and source hierarchy audit | Production |
| SRC-001 | Asset Acquisition | Correct Fab source register and record licensing/UEFN format evidence | P2 | ART-003 | Verified source shortlist | INCOMPLETO | All candidate rows parse; current listing data, license and source format are confirmed | Listing links, owner license record, UEFN import test | Art / Production |

These tasks supplement prior task IDs. ChatGPT prepares implementation packets and audits returned evidence; Claude alone performs UEFN/editor implementation and tests. Project owner approval is required for gate and other structural changes.


### ART-004 latest scope correction
Latest PR revision has blocked six west-wing wardrobe placements with blank coordinates. The active placement correction now covers three upper-east wardrobes (F10/F11/F12) still outside R2.1 bounds and F12_SECRET_PANEL offset 1.35 m from D-13A; all other upper-room placements still require R2.1 review because the branch's plan remains R2.0. Keep ART-004 blocked until the full footprint/door-swing audit is rerun.

## R2.2 / final documentary audit task additions — 2026-11-16

These tasks supplement prior IDs. Geometry R2.2 is a candidate proposal only; all editor execution remains Claude-owned.

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| GEO-013 | Level Design | Obtain owner approval of LD-GEO R2.2 or an explicitly revised geometry baseline | P0 | Current R2.2 proposal | Signed geometry decision | BLOCCATO | All 11 approval items in LEVEL_DESIGN_GEOMETRY.md are approved or revised | Explicit owner approval and revision identifier | Project Owner |
| GEO-014 | Level Design | Resolve U-NORTH-BALCONY / U-NORTH-HALL duplicate physical bounds | P1 | GEO-013 | Canonical functional-area alias mapping | INCOMPLETO | One physical walkable polygon, slab and collision surface; functional labels do not duplicate geometry | Updated coordinate register and Claude Outliner/collision evidence | Technical Level Designer |
| GEO-015 | Level Design | Complete roof drainage and ceiling/service construction detail | P2 | GEO-013 | Roof drainage and ceiling/void schedule | INCOMPLETO | Falls, outlets, downpipes, ceiling void and service zones are dimensioned and coordinated | Dimensioned section/schedules and editor inspection | Level Design |
| NAR-001 | Narrative | Finalize player-facing clue copy and mandatory document transcripts | P1 | Narrative canon | Approved English clue/text pack | INCOMPLETO | Register, office photos, Room 04, Room 06, diary, drawing and ROOM 13 photo captions are final and readable | Approved text source and subtitle/prop mapping | Narrative Lead / Project Owner |
| END-001 | Narrative / Gameplay | Resolve THE_NEW_GUEST co-op quorum conflict | P0 | Ending design review | One canonical multiplayer choice rule | BLOCCATO | Unanimous/majority rule selected and reflected in every ending/gameplay document and test | Owner decision and document diff | Project Owner |
| END-002 | Narrative / Gameplay | Approve THE_TRUTH evidence gate and both unresolved finale scripts | P1 | NAR-001 | Final ending scripts and truth evidence checklist | BLOCCATO | Mandatory flags, player actions, consequence, dialogue and sequence are fully specified | Owner-approved script and traceability matrix | Narrative Lead / Project Owner |
| ART-005 | Environment Art | Reauthor PR #1 package against owner-approved and Claude-verified geometry | P1 | GEO-013; GEO-014; GEO-015 | R2.2 Environment Art package | BLOCCATO | No stale R2.0/R2.1 assumptions; all IDs, placements, bounds, clearances and source records pass review | Fresh branch comparison, parser/footprint report and formal review | Art Lead / Production |
| DATA-004 | Lighting / Audio | Set and tune numeric light intensity in target UEFN and verify THE_GUEST actor-attached audio | P2 | Geometry approval; target UEFN baseline | Editor-verified lighting/audio configuration and updated registers | INCOMPLETO | Intensity values use verified UEFN units; CCT remains separate; THE_GUEST audio emitters attach and spatialize correctly | Claude editor screenshots, configuration values and audio test evidence | Lighting / Audio |
| QA-002 | QA | Execute GAT-048–GAT-052 after gameplay build is available | P1 | BLK-002; VER-003; DEV-001 | Gameplay regression evidence | NOT RUN | All five cases executed with build/version, observed result and evidence | Claude test report and recordings/logs | QA / Claude |

### Current task-order clarification
- Geometry is the physical critical path. Narrative authoring may run in parallel but cannot authorize geometry-dependent production.
- Environment Art PR #1 is not ready to merge: live comparison at the current audit is 66 commits ahead / 285 behind main, OPEN/DRAFT and mergeable=false.
- The documentary fixes to the interaction/puzzle registers and stair coordinate discrepancy do not close the editor-dependent tasks above.
