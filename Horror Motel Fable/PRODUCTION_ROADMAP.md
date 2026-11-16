# PRODUCTION ROADMAP — THE MOTEL: ROOM 13
**Baseline:** 2026-11-16 audit  
**Production principle:** geometry → greybox → traversal → systems → content → QA → release.

## Phase 0 — Audit and governance
**Objective:** establish trustworthy source of truth.
- Record current repository state and exact duplicate pairs.
- Approve canonical file naming without deleting legacy duplicates.
- Resolve the conflicting authority between dossier, coordinate CSVs and SVGs.
- Establish target UEFN version and identify actual editor project.
**Exit gate:** audit accepted; geometry decision owner and revision recorded.

## Phase 1 — Geometry resolution (FIRST SECTOR)
**Objective:** one buildable, collision-aware motel layout.
- Select authoritative location of rooms 07–13.
- Resolve ROOM 12 → secret passage → ROOM 13 → exit.
- Reconcile ground/upper room polygons, shared walls, service core and courtyard.
- Resolve stair, landings, balcony, guardrails, slabs and headroom.
- Reconcile all doors/windows with actual host walls.
- Complete wall/floor/ceiling and coordinate schedules.
- Validate player and NPC routes, solo traversal and chase loop.
**Exit gate:** no unresolved critical geometry conflict; dimensioned plans/sections/schedules agree; editor walkthrough accepted.

## Phase 2 — UEFN baseline and greybox
**Objective:** prove the physical experience in the target editor.
- Locate/create native UEFN project; record editor version and project structure.
- Build only functional geometry and collision first.
- Test first-person scale, player capsule, door clearance, stair, balcony, secret route and exits.
- Test all mandatory objectives are reachable solo.
**Exit gate:** playable greybox with captured evidence and no route softlock.

## Phase 3 — Technical feasibility and core systems
**Objective:** prove the chosen UEFN implementation path before full content.
- Verify NPC Spawner/character/NPC navigation and animation capabilities.
- Verify Verse API/device event signatures against installed release.
- Compile a minimal Verse device and record compile output.
- Implement authoritative team/session state, objective flags and shared inventory.
- Add interaction locks, checkpoints, join/leave recovery and ending precedence.
**Exit gate:** compile evidence and functional tests for core state transitions.

## Phase 4 — Gameplay and antagonist
**Objective:** playable six-act progression.
- Implement register, photo, fuse and ROOM 13 puzzles.
- Implement THE GUEST patrol/investigation/chase/capture/search/retreat within verified capabilities.
- Implement teammate rescue and solo self-recovery.
- Implement adaptive tension with safe narrative locks.
- Implement three deterministic endings.
**Exit gate:** solo and multiplayer progression passes, including disconnect and all-captured recovery.

## Phase 5 — Art, audio and atmosphere
**Objective:** production-quality content integrated into stable layout.
- Approve and create THE GUEST model pack, rig, LOD and animations.
- Produce modular architectural kit and room/exterior props.
- Create materials, lighting, VFX, rain, neon and audio.
- Import, configure and validate every asset's source/license and performance.
- Add English-only UI, documents, subtitles and voice.
**Exit gate:** all critical content imported and functional; no placeholder asset in required gameplay path.

## Phase 6 — QA, optimization and release
**Objective:** evidence-based acceptance.
- Run QA-001 to QA-025 and all solo/2/4-player scenarios.
- Validate puzzle recovery, disconnects, captures, checkpoints and ending races.
- Profile memory/performance on target platform.
- Run island validation and resolve all blocking errors.
- Prepare publication checklist and request explicit owner authorization.
**Exit gate:** QA pass evidence, validation report and release approval.

## First sector to work
**Level Design / Technical Geometry** owns Phase 1. The current contradiction between upper-floor allocations and ROOM 13 makes downstream construction unsafe. Production Director controls the source-of-truth decision; Level Design authors the corrected plan; QA validates routes and clearances.

## Parallel work
Can proceed during Phase 1:
- Verse/API feasibility research against target UEFN version.
- Asset sourcing, licensing and character concept/turnaround.
- Narrative text, clue and subtitle review.
- QA test procedure/evidence template preparation.

Must wait for geometry freeze:
- Final furniture placements and room dressing.
- Final lighting/audio/VFX coordinates.
- Patrol points, chase volumes and hiding positions.
- Device/trigger placements and final environment asset placement.

## Schedule control
No calendar duration is committed by this audit. Estimate effort after scope and editor access are confirmed. The stated two-hour target is not a production commitment and must not be used to justify unverified completion.


## Operating model for every phase (binding)
This roadmap is an execution guide for Claude. ChatGPT's responsibility is to turn each phase/task into a detailed, ordered packet: preconditions, exact actions, verified settings or labelled unknowns, expected outcomes, test steps, failure recovery, acceptance criteria and evidence to return. **Claude performs all actual UEFN/editor work and all tests**, including geometry walkthroughs, device setup, Verse compile, solo/co-op QA, profiling and island validation. The project owner approves design decisions and publication. ChatGPT reviews Claude's returned evidence and prepares corrective/next packets; it does not claim to have run UEFN tests. No phase gate passes on documentation alone. See `CLAUDE_EXECUTION_PROTOCOL.md`.


## Re-audit update — repository intake and execution order

The current main branch contains an R2.0 geometry candidate (`LEVEL_DESIGN_GEOMETRY.md`, `FINAL_GROUND_FLOOR_PLAN.md`, `FINAL_UPPER_FLOOR_PLAN.md`, `LEVEL_SECTIONS.md`, R2 SVGs). It improves the earlier allocation conflict but remains PROPOSED / NOT APPROVED. Geometry is still the physical critical path; wall/opening references, CSV integrity, stair flight layout, balcony edge, vertical datum and secret-route sections must be closed before geometry freeze.

Before blockout, add a data-integrity sub-gate:
1. Repair malformed rows in INTERACTION_MASTER_REGISTER.csv, PUZZLE_MASTER_REGISTER.csv and coordinate_schedule.csv.
2. Split lighting_audio_schedule.csv into schema-consistent lighting and audio tables.
3. Complete wall_schedule.csv and reconcile opening IDs with DOOR_WINDOW_SCHEDULE.csv.
4. Declare which uppercase schedules are canonical and which lowercase files are legacy.

Environment Art PR #1 is an intake candidate only. Its branch is 11 commits ahead / 42 behind main, still draft and unreviewed. Do not merge until synchronised, reviewed and revalidated. Its placement register has six wardrobe footprints outside assigned rooms, a 0.30 m ROOM 12 secret-panel offset and an untyped gameplay trigger reference.

**Sequencing clarification required:** the master register and this roadmap make geometry the first physical critical-path sector. CLAUDE_EXECUTION_PLAN.md labels Narrative Lock as Phase 1. Narrative text/puzzle-document refinement may proceed in parallel, but must not delay geometry unless the project owner explicitly approves a reprioritisation. Record the decision and align the Claude-facing plan before execution.

All actual editor operations, asset imports, Verse compilation, playtests, QA, profiling and island validation remain Claude's responsibility. ChatGPT supplies detailed plans and reviews evidence returned by Claude. This re-audit has not executed UEFN tests or merged the Environment Art PR.


## R2.1 production update — current critical path

R2.1 supersedes R2.0 as the sole candidate geometry authority. The owner-locked design decisions are now recorded, but R2.1 is still PROPOSED TARGET / NOT APPROVED / NOT UEFN-VERIFIED. The current authorization is greybox only. Do not begin final environmental art or import final placements until the geometry gates pass and the owner approves the evidence.

### Updated critical path
1. **Data integrity and source hierarchy:** repair semantic shifts in IN-021/022/023 and PZ-03; declare legacy lower-case schedule status; separate placement, asset and material identifiers.
2. **R2.1 geometry closure:** complete non-overlapping floor polygons, shared wall register, floor/ceiling/roof schedule, U-balcony corner pads, ROOM 12–13 route assembly, stair plan and roof drainage.
3. **Gate decision:** resolve GATE-01 (Y=0–1) vs EXT_GATE (Y=18) through a documented proposal and explicit owner approval.
4. **Claude greybox:** implement R2.1 only, then run 1P/2P/4P traversal, stair and THE GUEST path tests on both floors; attach reproducible evidence.
5. **Owner geometry approval:** review actual editor evidence and close every blocker before final art authorization.
6. **Environment Art intake:** reauthor PR #1 against R2.1, synchronize the branch, correct nine wardrobe positions and the F12 panel X offset, validate all IDs/licensing/source formats, then obtain review before merge.
7. **Final asset creation/import and lighting/audio implementation:** only after geometry freeze; profile worst-case camera and verify each asset/device.

### PR #1 status
Current compare: 44 commits ahead / 87 behind main, diverged; open draft, mergeable=false. It is not a safe integration candidate. Its 119-row asset register, 20-row material register, 10-row source register and 286-row placement register require revalidation. The 195 coordinate-bearing placements include nine out-of-bounds wardrobes and stale R2.0 upper-room positions; 91 entries remain UNPLACED. The source register and GQ-007 CSV rows need quoting repairs.

### Explicit ownership
ChatGPT produces the exact task packets, checks documentation and reviews evidence. Claude performs all UEFN editor actions, imports, Verse compilation, playtests, QA, profiling and island validation. The project owner approves structural changes and purchases. No PASS/ENGINE-VERIFIED status may be assigned without actual UEFN evidence.


### PR #1 metadata correction
GitHub currently reports the PR as technically mergeable, but it remains OPEN/DRAFT, 49 commits ahead / 94 behind main, with no review/comments/status checks. Do not equate mergeability with acceptance: its R2.0 plan/placements must be reauthored for R2.1, and malformed source/query CSVs and out-of-bounds placements must be corrected before review and merge.


### Final PR status correction
Latest live metadata returned `mergeable=false`; compare was 49 ahead / 100 behind main. An earlier check briefly returned true, so recheck the flag before any integration attempt. The art package remains blocked on R2.1 reauthoring, data repair, placement validation and review.


### Latest art placement delta
The latest PR revision blocks six west wardrobes with blank coordinates, but three upper-east wardrobes remain outside R2.1 room bounds and the secret panel remains 1.35 m offset from D-13A. The asset register now has 120 rows (PR description says 119). PR branch is 52 ahead / 106 behind, draft and latest mergeable=false. Continue to block intake pending R2.1 reauthoring and validation.


## R2.2 CURRENT BASELINE OVERRIDE — 2026-11-16

This section supersedes every earlier R2.0/R2.1 geometry and sequencing statement above where they conflict. Earlier audit snapshots and branch counts remain historical only.

### Current authority
- `LEVEL_DESIGN_R2.2_INDEX.md` is the source hierarchy.
- `LEVEL_DESIGN_GEOMETRY.md` LD-GEO R2.2 is the single candidate geometry proposal.
- R2.2 is **NOT OWNER-APPROVED / NOT UEFN-VERIFIED**.
- `CLAUDE_GEOMETRY_EXECUTION_BRIEF_R2.1.md` is superseded.
- `OWNER_DECISION_GATE_R2.2.md` is the approval gate.
- `CLAUDE_R2.2_EXECUTION_PACKET.md` is the current Claude handoff.

### Current critical path
1. Claude read-only project/editor baseline and R2.2 document/schedule integrity audit.
2. Owner approval or revision of GEO-A01–A15 and ending decisions END-A01/END-A02.
3. Reconcile every dependent geometry schedule and close wall/opening/slab/stair/secret-route cross-references.
4. Claude builds only the approved greybox and returns reproducible spatial evidence.
5. Owner reviews and approves the geometry evidence; only then freeze geometry.
6. Reauthor Environment Art PR #1 against the frozen geometry; do not merge the current stale/draft branch.
7. Asset acquisition/import, device/API feasibility, Verse implementation, gameplay integration, QA, profiling and island validation by Claude in dependency order.
8. Owner release approval; no publication without explicit authorization.

### Data correction status
- `INTERACTION_MASTER_REGISTER.csv` IN-021/022/023 rows are currently header-aligned on main; the earlier DATA-002 claim that they are shifted is superseded. Do not rewrite them without new evidence.
- `PUZZLE_MASTER_REGISTER.csv` PZ-03 now has an explicit acceptance-test field.
- `ROOM_COORDINATE_REGISTER.csv` SITE, BLDG-UNION and COURTYARD semantic fields have been corrected to match the header.
- These documentary fixes do not close geometry approval, cross-register integrity or editor verification.

### Production gate
The project remains DOCUMENTATION / PRE-PRODUCTION. No final geometry build, final art intake, PR merge, gameplay PASS, performance PASS or release readiness may be claimed until the relevant owner decision and Claude evidence exist.


## R2.3 CURRENT AUTHORITY OVERRIDE — 2026-11-16

This is the current roadmap authority and supersedes the R2.0/R2.1/R2.2 baseline statements and sequencing above wherever they conflict. Historical branch counts, PR counts and old geometry blockers are snapshots, not live status.

### Current design/decision state
- LD-GEO R2.3 is OWNER-APPROVED DESIGN for GEO-A01–GEO-A21. It is not UEFN/editor verified or construction certified.
- END-A01 co-op ending quorum is OWNER-APPROVED and closed.
- END-A02 mandatory truth evidence remains PENDING owner approval; the recommendation and complete owner action are in OWNER_DECISION_PACKET_R1.md.
- NCP-A01–A09 draft narrative/puzzle/ending copy is complete at proposal level and awaits the single consolidated approval in OWNER_DECISION_PACKET_R1.md.
- Room interior/bathroom fit-out and any R2.4 geometry deviation remain outside approved scope.

### Current production sequence
1. Documentation authority: PRODUCTION_CONTROL_MASTER_SPEC.md, this R2.3 override and MASTER_TASK_REGISTER.md.
2. Claude CLD-001 actual UEFN project/environment baseline and recoverable backup (read-only until confirmed).
3. Claude CLD-002 R2.3 controlled CSV/reference/topology integrity audit.
4. Greybox write only after CLD-001 backup/baseline and CLD-002 PASS.
5. Editor geometry acceptance and owner acceptance of the implemented R2.3 build.
6. Reauthor Environment Art PR #1 against accepted R2.3 geometry; never merge PR #1 as-is or use old R2.0/R2.1 placements.
7. Asset acquisition/import, character, audio/lighting, AI, device/Verse implementation and integration in dependency order.
8. Solo, 2-player and 4-player QA; memory/performance profiling; island validation; owner release approval.

### Current controlling implementation references
- CLAUDE_R2.3_EXECUTION_PACKET.md for CLD-001 through CLD-005.
- OBJECTIVE_AND_EVENT_CATALOG.md and INTERACTION_EXECUTION_SPEC.md for progression/interaction contracts.
- MONSTER_AI_BEHAVIOUR_SPEC.md for THE GUEST.
- OWNER_DECISION_PACKET_R1.md for outstanding owner narrative approvals.
- README.md and PRODUCTION_CONTROL_MASTER_SPEC.md for document hierarchy.

No UEFN implementation, compile, playtest, performance pass or publication is claimed by this roadmap update.


## R2.3.1 DECISION UPDATE — 2026-11-16 (CURRENT)

This addendum supersedes the R2.3 override above only for narrative/ending approval status and content references. It does not change the geometry baseline or technical production sequence.

### Current approved creative baseline
- LD-GEO R2.3: approved design geometry GEO-A01–GEO-A21; editor verification remains separate.
- END-A01: separately owner-approved co-op quorum; unchanged.
- NCP-A01–A09: approved under the owner's express delegation “prendi tu le decisione”. `NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md` is canonical English narrative/puzzle content, including the 1968 pre-opening M. Harrow clue, ROOM 13 photo sequence, and all ending copy/beats.
- END-A02: approved under the same delegation. `TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`; mandatory only for THE_TRUTH, optional to core progression and ESCAPE.
- THE_TRUTH ending: FinaleReady + TruthChainComplete + Room13RevealComplete + ServiceKeyObtained + ServiceRouteReady + team selection; no CarKeys/CoreEscapeReady/vehicle ignition. After commit, IN-032 activates Night Audit once, then sequential blackout, 02:13 neon hold, register print and title card.
- IN-001–IN-032 and associated UI/audio/lighting cues are documented. No further owner creative decision is pending for NCP-A01–A09 or END-A02.

### Current production sequence
1. Use the approved canonical creative and gameplay specifications as implementation authority.
2. Complete CLD-001 actual UEFN environment baseline and recoverable backup.
3. Complete CLD-002 R2.3 document/register integrity audit.
4. Begin greybox only after the explicit CLD-001/CLD-002 gates in CLAUDE_R2.3_EXECUTION_PACKET.md.
5. Implement the approved content and systems against verified UEFN capabilities; report any technical limitation with a presentation-preserving workaround, not a narrative rewrite.
6. Complete solo/2-player/4-player QA, memory/performance profiling, island validation and owner release approval.

The repository now has approved design decisions; it does not claim that any UEFN implementation, compile, playtest, performance pass or publication has occurred.
