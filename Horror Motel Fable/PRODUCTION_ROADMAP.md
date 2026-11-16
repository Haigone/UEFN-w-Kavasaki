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
