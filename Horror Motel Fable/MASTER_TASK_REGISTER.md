# MASTER TASK REGISTER

> **CURRENT AUTHORITY — 2026-11-16:** [R3_CURRENT_STATUS_AND_REMAINING_WORK.md](R3_CURRENT_STATUS_AND_REMAINING_WORK.md) is the consolidated current status and dependency order. Historical rows below preserve the original audit trail; where their status or counts conflict with the R3 current status and canonical sources, treat them as superseded snapshots. Do not mark any implementation gate complete without the required evidence.

> **CURRENT AUTHORITY ADDENDUM — 2026-11-16:** The owner's express delegation “prendi tu le decisione” has been exercised. NCP-A01–A09 and END-A02 are APPROVED; END-A01 remains APPROVED. Canonical sources: OWNER_DECISION_GATE_R2.2.md, OWNER_DECISION_PACKET_R1.md, NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md, ENDING_IMPLEMENTATION_SPEC.md, OBJECTIVE_AND_EVENT_CATALOG.md and INTERACTION_EXECUTION_SPEC.md. Older rows below that still say narrative approval is pending, geometry is unapproved, or the current execution packet is R2.2 are historical and superseded. Current interaction range is IN-001–IN-032. This does not mark any UEFN/editor implementation or test as complete.

 — THE MOTEL: ROOM 13
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

These tasks supplement prior IDs. Historical R2.2 geometry proposal status is superseded by approved LD-GEO R2.3; all editor execution remains Claude-owned.

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| GEO-013 | Level Design | Obtain owner approval of LD-GEO R2.2 or an explicitly revised geometry baseline | P0 | Current R2.2 proposal | Signed geometry decision | BLOCCATO | All 11 approval items in LEVEL_DESIGN_GEOMETRY.md are approved or revised | Explicit owner approval and revision identifier | Project Owner |
| GEO-014 | Level Design | Resolve U-NORTH-BALCONY / U-NORTH-HALL duplicate physical bounds | P1 | GEO-013 | Canonical functional-area alias mapping | INCOMPLETO | One physical walkable polygon, slab and collision surface; functional labels do not duplicate geometry | Updated coordinate register and Claude Outliner/collision evidence | Technical Level Designer |
| GEO-015 | Level Design | Complete roof drainage and ceiling/service construction detail | P2 | GEO-013 | Roof drainage and ceiling/void schedule | INCOMPLETO | Falls, outlets, downpipes, ceiling void and service zones are dimensioned and coordinated | Dimensioned section/schedules and editor inspection | Level Design |
| NAR-001 | Narrative | Finalize player-facing clue copy and mandatory document transcripts | P1 | Narrative canon | Approved English clue/text pack | INCOMPLETO | Register, office photos, Room 04, Room 06, diary, drawing and ROOM 13 photo captions are final and readable | Approved text source and subtitle/prop mapping | Narrative Lead / Project Owner |
| END-001 | Narrative / Gameplay | Resolve THE_NEW_GUEST co-op quorum conflict | P0 | Ending design review | One canonical multiplayer choice rule | BLOCCATO | Unanimous/majority rule selected and reflected in every ending/gameplay document and test | Owner decision and document diff | Project Owner |
| END-002 | Narrative / Gameplay | Approve THE_TRUTH evidence gate and finale scripts | P1 | NAR-001 | Final ending scripts and truth evidence checklist | COMPLETE — END-A02 AND NCP-A08/NCP-A09 APPROVED | Three evidence flags, player actions, consequence, dialogue and sequence are canonical | OWNER_DECISION_PACKET_R1.md + ending specs | Narrative / Production Director |
| ART-005 | Environment Art | Reauthor PR #1 package against owner-approved and Claude-verified geometry | P1 | GEO-013; GEO-014; GEO-015 | R2.2 Environment Art package | BLOCCATO | No stale R2.0/R2.1 assumptions; all IDs, placements, bounds, clearances and source records pass review | Fresh branch comparison, parser/footprint report and formal review | Art Lead / Production |
| DATA-004 | Lighting / Audio | Set and tune numeric light intensity in target UEFN and verify THE_GUEST actor-attached audio | P2 | Geometry approval; target UEFN baseline | Editor-verified lighting/audio configuration and updated registers | INCOMPLETO | Intensity values use verified UEFN units; CCT remains separate; THE_GUEST audio emitters attach and spatialize correctly | Claude editor screenshots, configuration values and audio test evidence | Lighting / Audio |
| QA-002 | QA | Execute GAT-048–GAT-052 after gameplay build is available | P1 | BLK-002; VER-003; DEV-001 | Gameplay regression evidence | NOT RUN | All five cases executed with build/version, observed result and evidence | Claude test report and recordings/logs | QA / Claude |

### Current task-order clarification
- Geometry is the physical critical path. Narrative authoring may run in parallel but cannot authorize geometry-dependent production.
- Environment Art PR #1 is not ready to merge: live comparison at the current audit is diverged from main; re-read exact ahead/behind counts before any merge, OPEN/DRAFT and mergeable=false.
- The documentary fixes to the interaction/puzzle registers and stair coordinate discrepancy do not close the editor-dependent tasks above.


## R2.2 corrective status override — 2026-11-16

This addendum supersedes earlier R2.0/R2.1 geometry references and the prior DATA-002 finding where the current main snapshot contradicts it.

| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| GEO-013 | Level Design | Obtain owner approval of LD-GEO R2.2 or an explicitly revised geometry baseline | P0 | R2.2 proposal | OWNER_DECISION_GATE_R2.2.md | BLOCCATO | GEO-A01–A15 approved or explicitly revised | Owner's explicit decision and revision ID | Project Owner |
| GEO-016 | Level Design / Data | Validate all R2.2 structural IDs, wall/opening hosts, slab topology and secret route | P0 | GEO-013; CLD-002 | R2.2_DOCUMENT_INTEGRITY_REPORT.md | NOT RUN | Every required reference resolves exactly once; exceptions documented | Parser, cross-reference and topology report | Claude / Technical Level Design |
| END-001 | Narrative / Gameplay | Resolve co-op ending quorum and truth evidence gate | P0 | Owner decision gate | Updated ending specs and QA tests | BLOCCATO | One explicit co-op quorum and one approved mandatory truth evidence list | Owner decision and synchronized document diff | Project Owner |
| CLD-001 | UEFN | Inspect actual project/editor and record baseline | P0 | Project/editor access | CLAUDE_ENVIRONMENT_BASELINE.md | NOT RUN | Version, project/build, branch, capability and inventory evidence | Claude baseline report and screenshots | Claude |
| CLD-002 | Data / Geometry | Perform read-only R2.2 schema and cross-register audit | P0 | Repository access | R2.2_DOCUMENT_INTEGRITY_REPORT.md | NOT RUN | Schema, IDs, wall/opening joins, slabs and route exceptions reported | Parser and cross-reference output | Claude |
| CLD-004 | UEFN | Build and test greybox from approved geometry | P0 | CLD-001; CLD-002; GEO-013; GEO-016 | Playable R2.2 greybox | BLOCCATO | Approved geometry implemented; spatial tests PASS with evidence | Build/version, screenshots, walkthrough and test log | Claude |
| ART-005 | Environment Art | Reauthor PR #1 against owner-approved and Claude-verified geometry | P1 | GEO-013; CLD-004 | Rebased/re-authored art package | BLOCCATO | No stale geometry assumptions; all IDs, bounds, clearances and licenses reviewed | Fresh PR diff, parser/footprint report and review | Art Lead / Claude |

### DATA-002 correction
The current main snapshot shows IN-021/022/023 semantically aligned with the INTERACTION_MASTER_REGISTER.csv header. The previous DATA-002 assertion that those rows were malformed is superseded and must not be used as a work instruction. PZ-03's missing acceptance-test field has been completed. SITE, BLDG-UNION and COURTYARD semantic columns in ROOM_COORDINATE_REGISTER.csv have been corrected. Remaining data validation is referential/topological, not a claim that all CSVs are now fully validated.

### Current execution boundary
The current Claude handoff is `CLAUDE_R2.3_EXECUTION_PACKET.md`. CLD-001 and CLD-002 are the required baseline/integrity gates before greybox writes; creative approvals NCP-A01–A09 and END-A02 are already recorded. CLD-004, final art placements, PR merge and geometry-dependent gameplay placement remain blocked. Claude alone performs UEFN/editor implementation and tests.


## R2.3 and documentation-control addendum — 2026-11-16

This addendum supersedes earlier task wording/statuses where it refers to R2.2 geometry approval or pre-R2.3 narrative/AI completeness. It does not close editor-dependent work.

### Geometry status reconciliation
- **GEO-001:** design-level source-of-truth decision is now OWNER-APPROVED DESIGN under LD-GEO R2.3 (GEO-A01–GEO-A21). The earlier status BLOCCATO is superseded for the owner-decision portion. Remaining work is CLD-002 document/register integrity and editor verification; do not call geometry editor-frozen.
- **GEO-002:** R2.3 defines the ROOM 12 → VEST-13 → ROOM 13 route at design level. Physical continuity, collision and two-way traversal remain EDITOR-TEST REQUIRED.
- **GEO-003/004:** floor/slab/stair/balcony/roof design decisions are covered by R2.3 approval. Construction schedule integrity, editor collision, capsule clearance and traversal remain open.
- **GEO-005/006:** keep open until CLD-002 proves opening-to-host-wall and schedule references, and Claude provides editor evidence.
- **BLK-001/002:** no completion inferred; native project baseline and greybox remain separate UEFN deliverables.

### New documentation work packages
| ID | Sector | Description | Priority | Dependencies | Deliverable | Status | Acceptance criterion | Required evidence | Owner |
|---|---|---|---|---|---|---|---|---|---|
| DOC-001 | Narrative | Consolidate owner-facing narrative decisions | P0 | NARRATIVE_CONTENT_PROPOSAL_PACK_R1 | OWNER_DECISION_PACKET_R1.md | COMPLETE — DELEGATED APPROVAL RECORDED | NCP-A01–A09 and END-A02 approved; END-A01 remains separately closed | OWNER_DECISION_GATE_R2.2.md + OWNER_DECISION_PACKET_R1.md | Production Director |
| DOC-002 | AI | Complete THE GUEST behaviour contract | P1 | Gameplay/player-state/geometry contracts | MONSTER_AI_BEHAVIOUR_SPEC.md | DOCUMENT PRESENT; ENGINE FEASIBILITY PENDING | States, perception, stimuli, target selection, navigation, capture handoff, recovery and AI tests defined | Document review plus later target-version feasibility evidence | AI / Game Design |
| DOC-003 | Gameplay | Define exact objective predicates and event ownership | P0 | Existing interaction/puzzle registers | OBJECTIVE_AND_EVENT_CATALOG.md + INTERACTION_EXECUTION_SPEC.md | DOCUMENTS PRESENT; CROSS-REGISTER AUDIT PENDING | Every objective has one predicate; each state has one authoritative writer and event mapping; IN-001–IN-032 has exact input/cancel/failure/commit rules | Schema/reference audit and later Verse tests | Gameplay Design |
| DOC-004 | Production governance | Reconcile stale R2.2 and pre-proposal documents to R2.3 | P0 | Current control master and source docs | Updated control/readme/registers | COMPLETE — controlled authority docs reconciled; legacy snapshots marked historical | No active controlling document states obsolete approval, quorum, puzzle solution or narrative gap as current; CSV topology audit remains CLD-002 | Repository-wide source review; CLD-002 evidence is separate | Production Director |
| DOC-005 | UI/UX | Finalize vote timing, objective strings and interaction prompts | P1 | END-A01; objective catalog; narrative approval | UI string/objective/input register | DOCUMENTS PRESENT — UI_STRING_TABLE.csv + INTERACTION_EXECUTION_SPEC.md; input glyph/visual validation pending | Every prompt has stable StringId, trigger, success/failure/cancel text and input binding | String table review and target UI validation | UI/UX |
| DOC-006 | Audio/Lighting | Complete cue-level trigger and mix specification | P2 | Approved narrative; geometry; AUDIO_REGISTER/LIGHTING_REGISTER | AUDIO_CUE_SHEET.csv, AUDIO_MIX_POLICY.md, LIGHTING_CUE_SHEET.csv, LIGHTING_STATE_SPEC.md | DOCUMENTS PRESENT — editor calibration, asset rights/import and mix/light validation pending | Every mandatory cue has unique event, concurrency and subtitle/visual fallback | Cue sheet and later editor playback evidence | Audio / Lighting |

### Current documentation priorities
1. Finish DOC-004 cross-document reconciliation; do not revive old R2.2 approval or vote text.
2. Obtain the single consolidated owner decision in OWNER_DECISION_PACKET_R1.md. No separate repeated micro-approvals are required for its included items.
3. Complete cue/string/asset production registers and exact interaction prompts.
4. Keep CLD-001/002 as Claude's actual editor/repository execution gates; no UEFN work is claimed by these documentation tasks.

The older "First 20 production tasks" list remains a historical ordering snapshot; use this addendum and the current R2.3 execution packet for current sequencing.

| DOC-007 | Cinematics | Define sequence lifecycle, co-op presentation and fallback behaviour | P1 | Ending and narrative proposals | CINEMATIC_AND_PRESENTATION_SPEC.md | PRESENTE — narrative approval and UEFN capability verification pending | Every sequence has unique ID, trigger, duration, lock, cleanup, fallback and acceptance tests | Sequence test evidence and owner approval | Cinematic / Gameplay |
| DOC-008 | Asset pipeline | Define source, license, import and acceptance workflow | P1 | Asset manifest and GUEST_MODEL_SPEC | ASSET_PRODUCTION_PIPELINE_SPEC.md | PRESENTE — actual source/import work pending | Every published asset has source/license, metadata, target import and measured acceptance | License archive and UEFN import/performance evidence | Art / Technical Art |


## Current narrative decision closure — 2026-11-16
| Task | Current status | Canonical decision / acceptance |
|---|---|---|
| NAR-001 | COMPLETE — DOCUMENTATION / CANON APPROVED | NCP-A01–A09 exact English content approved in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md; story register synchronized. UEFN prop/VO/subtitle implementation remains separate. |
| END-002 | COMPLETE — DESIGN DECISION | END-A02 approved: exactly DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound for THE_TRUTH only; THE_TRUTH sequence/consequence approved; IN-032 Night Audit added. Runtime implementation/tests remain separate. |
| DOC-001 | COMPLETE — DELEGATED DECISION RECORDED | OWNER_DECISION_PACKET_R1.md and OWNER_DECISION_GATE_R2.2.md record delegated approval. |
| DOC-003 | DOCUMENT PRESENT — IN-001–IN-032 | Objective/event and interaction contracts include the approved evidence gate and Night Audit. Cross-register/editor verification remains separate. |


## Documentation execution addendum — 2026-11-16

The following documentation packages are now present on main. These are document-completion statuses, not implementation or test statuses.

| ID | Sector | Description | Priority | Deliverable | Status | Remaining acceptance |
|---|---|---|---|---|---|---|
| DOC-009 | Puzzle design | Individual executable sheets for all registered PZ-01–PZ-05 | P0 | PUZZLE_EXECUTION_DETAIL_R2.md | DOCUMENT PRESENT | Cross-register IDs/flags and execute solo/co-op tests |
| DOC-010 | UI/UX | Exact screen layouts, widget states, focus, subtitles and accessibility | P1 | UI_SCREEN_LAYOUTS_AND_WIDGET_STATES_R1.md | DOCUMENT PRESENT | Build in target UI framework and verify devices/safe zones |
| DOC-011 | AI/gameplay | Numeric starting tuning for THE GUEST | P1 | THE_GUEST_NUMERIC_TUNING_R1.md | PROPOSED CALIBRATION VALUES DOCUMENTED | Target-editor feasibility, playtest data and tuning sign-off |
| DOC-012 | Technical design | Feature-by-feature UEFN compatibility routes and fallbacks | P0 | UEFN_FEATURE_COMPATIBILITY_MATRIX_R1.md | DOCUMENT PRESENT; API CHECKS OPEN | Verify every exact API/device against target editor release |
| DOC-013 | Gameplay architecture | Event envelope, manager ownership and 42 logical state events | P0 | EVENT_AND_STATE_TRANSITION_CATALOG_R2.md | DOCUMENT PRESENT | Map EVT-001–042 to IN-001–IN-032 and existing Verse event IDs; remove duplicates |
| DOC-014 | Documentation control | Update production hub to index new discipline deliverables | P1 | README.md | COMPLETE — MAIN UPDATED | Maintain links when revisions change |

### New critical integration task

**INT-001 — EVENT / INTERACTION / VERSE CROSSWALK**  
Owner: Gameplay Systems / Technical Design. Priority: P0.  
Inputs: EVENT_AND_STATE_TRANSITION_CATALOG_R2.md, OBJECTIVE_AND_EVENT_CATALOG.md, INTERACTION_EXECUTION_SPEC.md, INTERACTION_MASTER_REGISTER.csv, UEFN_DEVICE_BINDINGS.csv, VERSE_SYSTEM_DESIGN.md.  
Output: one authoritative crosswalk table with columns EventID, InteractionID, Verse event/function, manager owner, payload, scope, commit predicate, dedupe key, failure/recovery and acceptance test.  
Acceptance: every existing interaction IN-001–IN-032 maps to exactly one authoritative transaction; every EVT event maps to a valid existing interaction, authored system event or derived transition; no duplicate state writer; no event IDs conflict.  
Status: OPEN — documentation crosswalk still required before implementation can be considered decision-complete.


| DOC-015 | Gameplay architecture | Crosswalk all 32 interaction IDs to event IDs and Verse manager ownership | P0 | EVENT_INTERACTION_VERSE_CROSSWALK_R1.md + EVENT_AND_STATE_TRANSITION_CATALOG_R2.md | DOCUMENTATION CROSSWALK COMPLETE | Target-version Verse implementation, compile, multiplayer race/disconnect/checkpoint tests remain open |


## R3 current task override — 2026-11-16

This table supersedes stale task rows above where they still label approved R2.3 geometry or approved narrative decisions as pending. It does not mark any editor-dependent task complete.

| ID | Task | Priority | Current status | Controlling deliverable | Acceptance still required |
|---|---|---|---|---|---|
| GEO-001 | Select canonical geometry | P0 | DESIGN COMPLETE — R2.3 OWNER APPROVED | LD_GEO_R2.3_APPROVAL_RECORD.md | Editor geometry proof |
| GEO-002 | ROOM 12–13 route definition | P0 | DESIGN COMPLETE | R2.3 geometry schedules and route plan | Playable editor traversal both directions |
| GEO-003 | Floor/wall/slab/opening reconciliation | P0 | DOCUMENTARY R2.3 RECONCILED | GEOMETRY_VALIDATION_REPORT.md | Greybox collision and structural traversal |
| GEO-004 | Stair/balcony/roof design | P0 | DESIGN COMPLETE | STAIR_PLAN_R2.md / ROOF_PLAN_R2.md | Editor headroom, collision, guardrail and traversal |
| GEO-005/006 | Opening and structural schedules | P0 | DOCUMENTARY R2.3 RECONCILED | DOOR_WINDOW_SCHEDULE.csv / wall_schedule.csv / SLAB_SCHEDULE.csv | Editor placement and collision |
| GEO-007 | Solo/NPC route | P0 | DESIGN ROUTE DEFINED; ENGINE TEST OPEN | NAVIGATION_AND_PLAYER_FLOW.md / AI specs | Solo traversal and NPC route proof |
| BLK-001 | Native UEFN project baseline | P0 | NOT EVIDENCED | CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md | Open project, exact version, backup and inventory |
| BLK-002 | R2.3 greybox | P0 | NOT EVIDENCED | UEFN_BLOCKOUT_BUILD_GUIDE.md | Playable greybox and evidence |
| DOC-009–015 | Puzzle, UI, tuning, compatibility, event crosswalk documentation | P0 | DOCUMENTATION PRESENT | R2/R3 specs and registers | Cross-system semantic audit and implementation |
| DOC-016 | Room interior fit-out | P1 | DESIGN BASELINE PRESENT | ROOM_INTERIOR_FITOUT_SPEC_R1.md / room_furnishing_schedule.csv | 183 placement rows validated in editor |
| DOC-017 | Asset production backlog | P1 | DOCUMENTATION PRESENT | ASSET_PRODUCTION_BACKLOG_R1.csv | Rights/source evidence, production and import |
| VER-001 | UEFN API/device feasibility | P0 | OFFICIAL REFERENCE REVIEW PRESENT; PROJECT PROOF OPEN | UEFN_VERIFIED_REFERENCE_REGISTER_R1.md | Minimal proofs on target editor build |
| DEV-001 | Device placement/binding | P1 | REGISTER EXPANDED; EDITOR NOT VERIFIED | UEFN_DEVICE_BINDINGS.csv | 50 device/system rows mapped to real placed actors and tested |
| AS-001 | Asset source/license/import | P1 | BACKLOG PRESENT; ASSETS NOT SOURCED | ASSET_PRODUCTION_PIPELINE_SPEC.md / backlog | License archive and accepted import per Asset_ID |
| AS-002/003 | THE GUEST model/rig/animation | P1 | PRODUCTION SPEC COMPLETE; ASSETS NOT CREATED | GUEST_MODEL_SPEC.md | Art package, mesh, rig, LOD, import and NPC tests |
| VER-002/003 | Verse systems | P1 | LOGICAL DESIGN ONLY; NO SOURCE EVIDENCED | VERSE_SYSTEM_DESIGN.md and event crosswalk | Compilable source and runtime evidence |
| QA-001 | Gameplay QA | P0 final | TESTS NOT RUN | QA_ACCEPTANCE_MATRIX.md | Solo/2P/4P pass evidence |
| REL-001/002 | Performance, validation and release | P0 final | NOT RUN | Root performance baseline and release gates | Measured profile, island validation, explicit owner authorization |

### Next executable sequence

1. Establish actual UEFN project/editor baseline and recoverable backup.
2. Run R3 integration integrity audit; return exception report.
3. Build R2.3 greybox and capture geometry/traversal evidence.
4. Prove target-version NPC, UI, Verse and device capabilities.
5. Implement authoritative state, interactions, puzzles and endings.
6. Produce/import assets and integrate room fit-out.
7. Run full QA, profile performance/memory and island validation.


| DOC-018 | Technical integration | Static cross-register audit: geometry openings, furnishing bounds, IN/EVT, device IDs, UI/audio/lighting references and asset inventory | P0 | R3_INTEGRATION_INTEGRITY_REPORT.md | STATIC AUDIT COMPLETE | Editor geometry, mesh pivots, Verse compilation, device configuration and runtime behavior remain open |
| DOC-019 | Asset governance | Expand master asset inventory and per-asset rights evidence ledger | P1 | asset_manifest.csv (99 IDs), ASSET_MANIFEST_EXECUTIVE.csv, ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv (99 rows) | REGISTER COMPLETE; ALL RIGHTS NOT SOURCED | Complete exact source/license/rights proof per asset before acquisition/import/publication |
| DOC-020 | Level/gameplay integration | Resolve playable Service Control Room location inside R2.3 geometry | P0 | SERVICE_CONTROL_BAY_LOCATION_AND_INTERACTION_SPEC_R1.md | DESIGN LOCATION RESOLVED | Implement D-G16 access and consoles in GF-SERVICE-BAY; never use sealed U-SERVICE |
| DOC-021 | Interaction integration | Assign exact coordinates to all interactions, player spawns and checkpoints | P0 | INTERACTION_ANCHOR_SCHEDULE_R1.csv | DESIGN ANCHORS PRESENT | Editor placement/pivot/clearance proof for all 58 anchors |
| AI-001 | AI/Level Design | Define THE GUEST spawn and patrol waypoints including stair transitions | P0 | AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv / MONSTER_AI_BEHAVIOUR_SPEC.md | DESIGN ANCHORS PRESENT | Target UEFN navigation proof; no teleport or sealed-zone access |


## R3 follow-up documentation tasks — 2026-11-16

| ID | Sector | Description | Priority | Deliverable | Status | Acceptance criterion |
|---|---|---|---|---|---|---|
| DOC-022 | Production control | Consolidate current status, canonical counts and dependency order | P0 | R3_CURRENT_STATUS_AND_REMAINING_WORK.md | DOCUMENTATION PRESENT | One current source supersedes contradictory historical snapshots |
| QA-002 | Repository QA | Add repeatable static CSV and cross-reference validation | P1 | tools/validate_r3_repository.py | SCRIPT PRESENT — EXECUTION NOT EVIDENCED | Run in repository environment; commit clean output or exact defect list |

DOC-022 and QA-002 close documentation/tool-authoring gaps only. They do not close native UEFN, editor, Verse, gameplay, asset rights or release gates.


## R3 handoff completion tasks — 2026-11-16

| ID | Sector | Description | Priority | Deliverable | Status | Acceptance criterion |
|---|---|---|---|---|---|---|
| DOC-023 | Production control | Remove ambiguity in autonomous execution, technical decision-making, batch continuation and missing THE GUEST asset production | P0 | CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md | DOCUMENTATION PRESENT | Claude can proceed without asking avoidable technical/creative questions; only owner-only approvals remain stop conditions |
| QA-003 | Repository QA | Run static validator automatically on push and pull request | P1 | .github/workflows/r3-static-validation.yml | WORKFLOW PRESENT — FIRST RUN NOT YET VERIFIED | GitHub Actions run completes successfully on current main and on subsequent changes |

These tasks close planning/automation authoring only. Native UEFN project discovery, editor implementation and runtime/release evidence remain separate gates.
