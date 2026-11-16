# CLAUDE START-HERE PROMPT — R3
Copy the prompt below into Claude Code/Claude with access to the native UEFN project and this GitHub repository.

---

You are the autonomous implementation lead for **THE MOTEL: ROOM 13**.

Your complete task is to implement, test and prepare the full 1–4 player Fortnite island in the native UEFN project. The repository `Haigone/UEFN-w-Kavasaki`, branch `main`, is your complete production specification and decision record. It is not itself the UEFN project.

## Mandatory first actions

1. Open the repository and read, in order:
   - `Horror Motel Fable/README.md`
   - `Horror Motel Fable/R3_CURRENT_STATUS_AND_REMAINING_WORK.md`
   - `Horror Motel Fable/CLAUDE_EXECUTION_PROTOCOL.md`
   - `Horror Motel Fable/CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md`
   - `Horror Motel Fable/CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md`
   - `Horror Motel Fable/PRODUCTION_CONTROL_MASTER_SPEC.md`
2. Follow the detailed read order in the canonical R3 brief. Read the controlling system specifications and registers before changing that system.
3. Locate the actual native UEFN project. Record its exact path, project/map/island identity, UEFN build, source-control state, Verse files, devices, assets and current validation state.
4. Create and verify a recoverable backup before modifying the native project.
5. Run `python tools/validate_r3_repository.py` from `Horror Motel Fable`. Inspect the GitHub Actions workflow result. Resolve static failures before relying on the registers.

## Execution mandate

- Do not stop after producing an audit, plan or list of recommendations. Implement the game.
- Work in dependency-ordered batches, compile/test each coherent batch, commit changes and continue automatically to the next ready task.
- Do not wait for a new user message after each batch.
- Do not ask avoidable questions. The owner has delegated creative and non-structural technical decisions. Choose the safest supported implementation, record the decision and keep all dependent documents/registers synchronized.
- Ask the owner only for access/credentials they alone can provide, unapproved spending/legal commitments, irreversible destructive actions, changes to approved structural geometry or binding narrative/ending decisions, and final publication authorization. Complete independent work while waiting.
- Never fabricate API support, editor actions, compilation, tests, asset rights or evidence.
- If the preferred UEFN device/API is unsupported, use the documented compatibility fallback while preserving the player-facing contract.
- If THE GUEST model is missing, produce an original model sheet, game-ready mesh/rig/LOD/collision and required animation set using the available authorized tools. Follow `GUEST_MODEL_SPEC.md` and the autonomous addendum. If a complete rigged asset cannot be produced, document the precise blocker and continue all independent work; do not call an unrigged image a finished character.
- Preserve the owner-approved R2.3 geometry. It is approved as design but not editor-verified. Build it, measure actual clearances/pivots/collision and record defects. Structural changes require an R2.4 proposal and owner approval.
- Follow the approved narrative, puzzle solutions, event ownership, ending conditions, multiplayer rules and all canonical filename/case rules. Do not silently change them.

## Required execution order

Follow GATE A through GATE G in `CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md` and the more detailed tasks in the controlling specs:
1. Native project discovery and backup.
2. Static repository integrity and design reconciliation.
3. R2.3 greybox, geometry, collision and route traversal proof.
4. Minimal UEFN/Verse/device/UI/NPC capability proofs.
5. Session systems, interactions, inventory, objectives, puzzles, THE GUEST, capture/recovery, acts, Room 13 reveal, service route and all endings.
6. Original/licensed assets, THE GUEST model/rig/animations, import, audio, lighting and polish.
7. Full solo/2P/4P QA, disconnect/reconnect, recovery, performance/memory, island validation and release evidence.

## Batch closeout

For every batch, commit:
- task IDs and PASS/FAIL/BLOCKED state;
- exact files, assets, devices and Verse modules changed;
- UEFN build/project identity;
- compile/import/test results with expected vs actual;
- screenshots, logs, recordings and reproducible evidence;
- defects and chosen technical decisions;
- next dependency-ready task.

Then continue. Keep `R3_CURRENT_STATUS_AND_REMAINING_WORK.md`, `R3_INTEGRATION_INTEGRITY_REPORT.md`, `MASTER_TASK_REGISTER.md`, `MISSING_DELIVERABLES_REGISTER.md`, registers and README synchronized.

## Definition of done

The island is complete only after the native UEFN implementation exists, Verse compiles, all required assets have verified rights and are imported, all geometry/gameplay/puzzle/AI/UI/narrative/ending suites pass, full solo/2P/4P runs pass, performance/memory and island validation pass, and the evidence pack is committed. Do not publish without explicit owner authorization.

**Begin with GATE A now. Do not ask what to do next.**
