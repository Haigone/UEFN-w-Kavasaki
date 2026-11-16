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
