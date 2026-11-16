# CLAUDE UEFN EXECUTION PLAN — GAMEPLAY & PUZZLE SYSTEMS
## THE MOTEL: ROOM 13
**Document type:** step-by-step implementation, verification and test execution handoff  
**Executor:** Claude, operating with access to the project repository and UEFN editor/build environment  
**Specification owner:** ChatGPT prepares and maintains design, implementation instructions, test cases, expected results and defect triage guidance  
**UEFN test owner:** Claude executes all editor, Verse compile, device configuration, launch, solo/co-op, performance and acceptance tests  
**Status:** execution plan; no implementation or test pass is implied by this document.

---

## 0. Mandatory division of responsibility

### ChatGPT MUST
- Read and reconcile the project specifications.
- Produce detailed architecture, state contracts, implementation steps, Verse pseudocode guidance, device setup instructions, test cases and expected results.
- Identify inconsistencies, missing requirements, edge cases and softlock risks.
- Review Claude's logs, screenshots, diffs, test reports and failures when supplied.
- Recommend corrections and prepare follow-up implementation tasks.
- Update documentation when a design decision changes.

### ChatGPT MUST NOT
- Claim to have opened UEFN, launched Fortnite sessions, compiled Verse, validated device APIs, run multiplayer tests or measured island performance.
- Mark any UEFN test as PASS without Claude's evidence.
- Invent compiler output, test logs, performance figures or screenshots.
- Treat a proposed API or pseudocode contract as verified engine functionality.

### Claude MUST
- Inspect the actual repository and UEFN project before implementation.
- Verify all Verse API names, device events, editable properties and feature support against the target UEFN version/digests.
- Implement the system in the project, compile frequently and resolve compile errors.
- Configure devices, actors, UI and level interactions.
- Run the complete test matrix in UEFN/Fortnite sessions, including solo, 2-player and 4-player where applicable.
- Capture evidence and record actual PASS/FAIL/BLOCKED results.
- Commit implementation and test artifacts; never silently change puzzle solutions or game design.
- Report any specification conflict before choosing a new behavior.

---

## 1. Source-of-truth documents

Read these before changing the project:
1. GAME_DESIGN_BIBLE.md
2. GAMEPLAY_FLOW_AND_TESTS.md
3. VERSE_SYSTEM_DESIGN.md
4. UEFN_IMPLEMENTATION_SPEC.md
5. GAMEPLAY_SYSTEMS_SPEC.md
6. PUZZLE_MASTER_REGISTER.csv
7. PUZZLE_IMPLEMENTATION_SHEETS.md
8. INTERACTION_MASTER_REGISTER.csv
9. ITEM_AND_INVENTORY_SPEC.md
10. PLAYER_STATE_MACHINE.md
11. CAPTURE_AND_RESCUE_SPEC.md
12. CHECKPOINT_AND_RECOVERY_SPEC.md
13. ENDING_IMPLEMENTATION_SPEC.md
14. GAMEPLAY_ACCEPTANCE_TESTS.md

If any source document is missing, report the exact path and stop work that depends on it. Do not substitute assumptions.

### Conflict protocol
Create a decision record containing: conflicting files/sections, observed conflict, proposed resolution, affected systems/tests, approval required, final decision. Do not silently resolve a narrative or puzzle-content conflict.

---

## 2. Phase 0 — Repository and project preflight

1. Confirm repository, branch, latest commit and project folder.
2. Identify the actual UEFN project file (.uefnproject) and project content structure.
3. Record UEFN editor version, Fortnite target version, Verse digest/API version and test platform.
4. Identify all existing Verse files, devices, level actors, UI assets, NPC definitions and data assets.
5. Map existing implementation to the 10 gameplay deliverables; classify each feature as absent, partial, implemented-unverified or verified.
6. Confirm source control is clean or record pre-existing changes. Never overwrite unrelated user work.
7. Create a feature branch or clearly scoped commits before large changes.
8. Build a dependency map: GameManager -> Objective/Act state; InventoryManager -> item transactions; PuzzleManager -> puzzle state; PlayerManager -> player state/capture; CheckpointManager -> snapshots; EndingManager -> final selection; InteractionManager -> range/locks; DifficultyManager -> tension; MonsterController -> threat/AI; UI/Audio -> presentation.
9. Produce PREFLIGHT_REPORT.md with version details, discovered files, missing assets, current compile state, risks and proposed implementation order.

**Exit gate:** actual project and target UEFN version identified; baseline status documented; no destructive unknown changes.

---

## 3. Phase 1 — API verification spike

Before implementing full systems:
1. Inspect the installed Verse digest and current official API references available in the editor.
2. Verify the required device classes, event subscriptions, player/agent access, team/session handling, timers, transforms, UI and NPC capabilities.
3. Create the smallest possible Verse device that compiles in the target project.
4. Verify one real interaction event end-to-end in a test island.
5. Verify how players join/leave and how session-owned state can be held during a live session.
6. Verify whether the intended NPC navigation/capture behavior is feasible with supported tools.
7. Record every verified API symbol and the exact editor version.
8. Replace unsupported pseudocode/API assumptions with supported alternatives and document any design impact.

**Do not** promise persistence across separate play sessions unless an independently implemented and tested persistence mechanism supports it.

**Exit gate:** minimal Verse compile and interaction spike succeeds; unsupported features have approved alternatives.

---

## 4. Phase 2 — Data model and authoritative state

Implement and validate in this order:

### 4.1 Session/Game Manager
- Own CurrentAct, ObjectiveFlags, SharedInventory, PuzzleFlags, CheckpointId, TensionValue and Ending.
- Initialize a clean session exactly once.
- Make objective completion idempotent.
- Prevent clients/UI from writing authoritative progression.
- Ensure ending remains NONE until the final validated selection.

### 4.2 Inventory Manager
- Implement session-owned set of ItemId values and explicit item states.
- Add atomic AddItem, HasItem, InstallFuse and recovery operations.
- Keep personal flashlight charge separate from shared quest inventory.
- Disable physical pickup proxy only after authoritative grant.
- Resolve simultaneous pickup with exactly one successful commit.
- Reconcile pickup actor visibility from state after checkpoint restore.

### 4.3 Player Manager
- Track connected players and PlayerState per player.
- Release all player-owned locks on leave.
- Rehydrate returning player UI and safe spawn from current live session state.
- Never bind a required quest item to one player's personal lifetime.

### 4.4 State validation
Create debug-only state inspection/logging for current act, objective flags, items, puzzle states, checkpoint and player states. Ensure debug tools cannot be used by ordinary players in a published island.

**Exit gate:** state model compiles; state transitions and idempotency can be verified using logs/debug interactions.

---

## 5. Phase 3 — Interaction framework

Implement a reusable interaction contract:
1. Resolve player and target.
2. Validate player is ACTIVE or otherwise explicitly allowed.
3. Validate target is enabled and within 2 m (or the authored per-interaction range).
4. Validate act/objective/item prerequisites.
5. Acquire a short-lived logical lock.
6. Execute the interaction.
7. Commit authoritative state once.
8. Broadcast feedback/UI/audio.
9. Release lock.
10. On cancellation, timeout, player leave or invalid target, release lock without consuming mandatory items.

Test two players targeting one object, a player leaving mid-interaction, interaction spam, invalid range, and actor destruction.

**Exit gate:** no duplicate state changes, no stuck locks, clear feedback for invalid interactions.

---

## 6. Phase 4 — Puzzle implementation (in dependency order)

Implement exactly the approved puzzle IDs and record any requested content change before applying it.

### PZ-01 Guest Register
- Reception register clue fragments: 02, 13, 86.
- Lock solution: 02-13-86.
- Success flag: RegisterSolved.
- Reward: OfficeKey, once only.
- Retry wrong codes indefinitely; no mandatory item consumption.
- Verify desk drawer proxy and recovery rule.

### PZ-02 Owner Photographs
- Four dated photographs: 1974, 1978, 1982, 1986.
- Chronological arrangement.
- Success flag: UpperFloorAccessGranted.
- Incorrect order resets arrangement; no photo consumed.
- Verify all clients see the same arrangement and opened route.

### PZ-03 Electrical Restoration
- Required FuseA, FuseB, FuseC.
- Proposed canonical locations: Room 02 suitcase; storage shelving by wet-floor sign; Room 06 maintenance cabinet.
- Screwdriver opens cover and is reusable.
- Correct socket mapping A->A, B->B, C->C; then breaker.
- Success flag: PowerRestored; fuses become INSTALLED.
- Wrong socket rejects fuse without consuming it.
- Add recovery drawer for physically missing/unreachable fuse, gated by act and logged.

### PZ-04 ROOM 13 Photographs
- Four dates: 1968, 1974, 1981, 1986.
- Chronological arrangement.
- Success flags: PhotoSequenceSolved, OwnerIdentityRevealed.
- Reward: ServiceKey, once only.
- TruthChainComplete only when all approved mandatory evidence flags are satisfied.
- Verify missing photo proxy and checkpoint restore.

### PZ-05 Final Escape Mechanism
- Prerequisites: PowerRestored, ServiceKey, CarKeys.
- ServiceKey unlocks service control; activate gate; CarKeys operate vehicle.
- Success: GatePowered and CoreEscapeReady.
- Do not select ending until the authored final decision point.
- Missing prerequisites show exact feedback; never consume keys.
- Verify manual lever and ignition proxy fallbacks.

For every puzzle, test: solo completion, wrong input, retry, repeat activation, concurrent players, disconnect mid-operation, missing prop, checkpoint restore and authoritative completion flag.

**Exit gate:** all five puzzles can be completed by one player and no required item can be permanently lost.

---

## 7. Phase 5 — Items, clues, documents and flashlight

1. Implement required item IDs: Room13Key, OfficeKey, FuseA, FuseB, FuseC, Screwdriver, CarKeys, ServiceKey.
2. Keep Room 02 battery separate from FuseA.
3. Confirm every pickup has a stable ID, location, prerequisite, grant state, actor-disable behavior and recovery method.
4. Implement readable document interaction and journal rediscovery.
5. Verify mandatory clues have a text/visual fallback; no mandatory clue depends on sound alone.
6. Implement flashlight charge per player; target full charge 180 seconds of active use.
7. Low-charge flicker threshold: below 15%; zero charge switches light off.
8. Battery replacement target: 2 seconds; interrupted replacement must not consume battery or reset charge.
9. Validate mandatory puzzle readability at zero flashlight charge.
10. Keep optional lore out of core escape prerequisites.

**Exit gate:** item audit shows all required items recoverable; clue readability verified with audio muted and flashlight empty.

---

## 8. Phase 6 — Player state, hiding, capture and rescue

Implement allowed transitions:
- ACTIVE -> THREATENED -> ACTIVE
- ACTIVE/THREATENED -> CAPTURED
- CAPTURED -> RESCUE_PENDING -> RESCUED -> ACTIVE
- CAPTURED -> SOLO_ESCAPE -> ACTIVE
- all connected players CAPTURED -> checkpoint recovery -> ACTIVE
- ACTIVE/RESCUED -> SAFE

Rescue rules:
- Rescuer ACTIVE; target CAPTURED.
- Distance <=2 m.
- 5 seconds uninterrupted.
- Cancel on range break, rescuer capture/disconnect or target disconnect.
- RESCUED protection: 8 seconds.
- 90-second captured threshold triggers emergency self-recovery/assistance, not death.
- Solo must have a complete self-rescue route with no teammate-only dependency.
- If all connected players are captured, restore latest checkpoint and clear transient locks.

Hiding rules:
- Only authored hiding spots.
- Reliable enter and exit.
- Do not allow hiding while captured or during protected cinematic/transition.
- Reset hidden state safely on disconnect/checkpoint restore.

**Exit gate:** every player-state transition has a tested path; no player can remain permanently immobilised.

---

## 9. Phase 7 — THE GUEST, chase and adaptive difficulty

1. Verify NPC spawn, navigation, perception and animation capabilities in the target UEFN release.
2. Implement explicit monster states: DORMANT, PATROL, OBSERVE, INVESTIGATE, CHASE, CAPTURE, SEARCH, RETREAT.
3. Investigate last-known sound/player position; do not wall-track.
4. Start chase only when target route is reachable.
5. Validate stairs, doors, corridors, hiding spots and secret passages.
6. Prevent capture during protected puzzle transactions, spawn grace, checkpoint restoration and protected narrative sequences.
7. Implement tension 0–100 and bands: 0–24 DORMANT, 25–49 UNEASY, 50–74 HUNTING, 75–100 RELENTLESS.
8. Exploration and reading alone must not increase tension.
9. Pause tension changes during mandatory stationary puzzle interactions and story beats.
10. Solo mode reduces simultaneous pressure and retains self-rescue.
11. Tune patrol/investigation/search/recovery values only after functional tests; record before/after values and playtest observations.

**Exit gate:** no mandatory route is blocked by navigation; chase/capture cannot create a softlock; tension remains bounded and predictable.

---

## 10. Phase 8 — Checkpoints and recovery

Implement CP01–CP04:

- CP01 after register solved/OfficeKey granted.
- CP02 after power restored/fuses installed.
- CP03 after upper floor reached.
- CP04 after ROOM 13 photo puzzle/reveal/ServiceKey committed.

Restore in this order:
1. Freeze monster and gameplay triggers.
2. Clear transient interaction, puzzle, rescue, capture and cinematic locks.
3. Restore objective/puzzle flags.
4. Restore shared inventory and item states.
5. Reconcile physical pickup actors.
6. Restore doors, lights, fuse panel, secret panel and routes.
7. Spawn connected players safely as ACTIVE.
8. Restore UI/audio without replaying one-shot events.
9. Re-enable gameplay after spawn grace.

Run each checkpoint restore twice and compare state. Test restore while a player is captured, while an interaction is in progress, and after a mandatory pickup actor has been destroyed.

**Exit gate:** checkpoint restoration is idempotent and does not duplicate rewards or reopen solved gates.

---

## 11. Phase 9 — Three endings

Eligibility:
- ESCAPE: CoreEscapeReady and standard route selection; must remain available without optional truth lore.
- THE_TRUTH: CoreEscapeReady, TruthChainComplete, Room13RevealComplete, ServiceRouteReady and explicit truth selection.
- THE_NEW_GUEST: explicit acceptance interaction and team confirmation; never infer from capture or timeout.

Co-op:
- Team-wide majority vote.
- Recalculate if a voter disconnects.
- Tie/no response defaults to ESCAPE.
- THE_NEW_GUEST requires explicit majority acceptance.
- Commit Ending only when NONE; block all other ending triggers after commit.

Test all endings in solo and co-op, including missing eligibility, simultaneous triggers, tie, no response, disconnect during vote and cinematic failure.

**Exit gate:** all three endings are reachable and exactly one ending can commit per session.

---

## 12. Phase 10 — Full test execution matrix

Use GAMEPLAY_ACCEPTANCE_TESTS.md as the case index. Execute all GAT-001 through GAT-047. For every test record:
- Test ID and exact build/commit.
- UEFN/Fortnite version.
- Session type and party size.
- Preconditions and setup.
- Exact reproduction steps.
- Expected result.
- Actual result.
- PASS / FAIL / BLOCKED / NOT RUN.
- Evidence filename (video/screenshot/log).
- Defect ID if failed.
- Tester and timestamp.

### Required configurations
- Solo: every mandatory puzzle, all three endings, solo capture recovery, checkpoint recovery.
- 2 players: shared pickup races, rescue, disconnect/rejoin, puzzle concurrency, team ending vote.
- 4 players: simultaneous interactions, rescue contention, all-captured recovery, majority/tie vote and session stability.

Do not substitute solo tests for multiplayer tests. If 4-player test is blocked by platform/test environment, record BLOCKED and reason; do not mark PASS.

### Suggested run order
1. Compile and smoke test.
2. Solo full progression.
3. Solo negative puzzle/recovery tests.
4. 2-player shared inventory and rescue.
5. 2-player disconnect/rejoin and ending vote.
6. 4-player concurrency and all-captured recovery.
7. Checkpoint matrix.
8. AI/navigation/chase.
9. UI/audio/readability.
10. Performance/island validation.
11. Regression pass after fixes.

---

## 13. Defect severity and triage

**P0 Blocker:** island fails to load/compile; progression impossible; data corruption; unrecoverable softlock; ending system corrupts session.  
**P1 Critical:** mandatory item unrecoverable; mandatory puzzle impossible; solo completion impossible; co-op disconnect destroys team progression; capture can permanently immobilise player.  
**P2 Major:** checkpoint, puzzle feedback, rescue or ending behavior incorrect but workaround exists.  
**P3 Minor:** visual/audio/UI defect with no progression impact.  
**P4 Polish:** tuning, readability refinement or non-blocking presentation improvement.

For every defect include reproduction steps, expected/actual, build, party size, evidence, likely owning module and retest status. Fix P0/P1 before new content or balance polish.

---

## 14. Evidence and report templates

### Per-test result
| Field | Value |
|---|---|
| Test ID | GAT-XXX |
| Build / commit | |
| UEFN version | |
| Party size / platform | |
| Preconditions | |
| Steps performed | |
| Expected | |
| Actual | |
| Result | PASS / FAIL / BLOCKED / NOT RUN |
| Evidence | |
| Defect ID | |
| Tester / timestamp | |

### Final Claude handoff report
1. Project/build identity and versions.
2. Files/modules implemented and commits.
3. Verse compile result and relevant compiler output.
4. Device/API verification notes.
5. Test summary counts: PASS, FAIL, BLOCKED, NOT RUN.
6. Defect list with severity and links.
7. Solo/2-player/4-player coverage.
8. Three ending verification.
9. Checkpoint/disconnect/recovery verification.
10. Performance/island validation measurements.
11. Known limitations and unresolved design decisions.
12. Exact next actions required from ChatGPT/specification owner.

Never report “all tests passed” if any required test is BLOCKED or NOT RUN.

---

## 15. Final acceptance gate

The gameplay system is ready for release review only when:
- Target UEFN project compiles with no unresolved Verse errors.
- Every required device/API is verified in the target editor.
- All five puzzles work in solo and relevant co-op.
- Every mandatory item has a tested recovery path.
- All six acts are completable.
- Capture, rescue, solo self-recovery and all-captured recovery work.
- CP01–CP04 restore idempotently.
- Same-live-session disconnect/rejoin does not destroy team progression.
- ESCAPE, THE_TRUTH and THE_NEW_GUEST are all verified.
- No P0/P1 defects remain.
- Required tests have evidence and actual results.
- Performance and island validation are recorded against the target release criteria.

**Final rule:** Claude executes and reports UEFN work. ChatGPT prepares, reviews, diagnoses and updates the technical plan/specification. ChatGPT does not claim to perform UEFN testing.
