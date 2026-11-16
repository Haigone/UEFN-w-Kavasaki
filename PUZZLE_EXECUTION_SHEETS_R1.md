# THE MOTEL: ROOM 13 — PUZZLE EXECUTION SHEETS R1
Status: DESIGN BASELINE — validate against current puzzle register before implementation.
Authority: puzzle IDs and canonical room placement must match PUZZLE_MASTER_REGISTER.csv. This document supplies the execution contract; it does not silently rename or relocate registered puzzles.

## 1. Universal puzzle contract
Every puzzle implementation must define: PuzzleID, room, narrative purpose, player-facing goal, start condition, required evidence/items, interactable sequence, valid solution, invalid-input response, reset behavior, persistence scope, co-op ownership, interruption behavior, success event, objective event, audio/lighting response, hint ladder and acceptance tests.
- Puzzle logic is authoritative and idempotent. The same solution cannot grant duplicate rewards or fire completion twice.
- Players must be able to understand the immediate goal from environmental affordances and the objective tracker, not from an external guide.
- Wrong inputs give informative feedback without revealing the full answer.
- No puzzle may softlock because THE GUEST interrupts it. Interruption preserves committed progress and cancels only uncommitted hold/progress.
- Required puzzle objects must have readable collision, clear focus target and a fallback interaction volume.
- Do not require pixel-perfect aiming or frame-perfect timing.
- If puzzle is co-op, state whether actions are sequential, simultaneous, shared or personal. Never leave this implicit.

## 2. Standard hint ladder
Hint 0: objective names the target and broad task.
Hint 1: after 90 seconds without meaningful progress, add a directional/contextual nudge.
Hint 2: after a further 90 seconds, identify the relevant object or relationship.
Hint 3: after a further 120 seconds, provide the next actionable step, not the final answer unless the accessibility/easy-mode design explicitly permits it.
- Timers pause during cinematics, capture, disconnected session state and any forced control lock.
- Hints are per puzzle and session-wide. All connected players see the same hint tier.
- No repeated hint spam; show each tier once and allow journal replay.

## 3. Puzzle execution sheet template
For every PZ entry, author the following fields in the register or an adjacent sheet:
1. Goal and player-facing instruction.
2. Required inputs and prerequisites.
3. Interaction order and exact valid values.
4. State machine: Locked -> Available -> InProgress -> Solved; optional Interrupted/Reset.
5. Wrong-input feedback and retry policy.
6. Checkpoint persistence.
7. Co-op contribution and race handling.
8. Hint ladder and time thresholds.
9. Audio/lighting/UI feedback IDs.
10. Success event and authoritative state writer.
11. Failure/recovery and acceptance tests.

## 4. Canonical evidence chain — THE TRUTH
END-A02 evidence set:
- Room 06: missing-guest archive.
- Room 09: night-manager diary.
- Room 11: child's drawing.
These are three distinct evidence records, not three stages of one interactable. Each is collected once, logged in the journal and replicated to the session. THE TRUTH eligibility requires all three evidence flags plus FinaleReady. It does not require CarKeys or vehicle ignition.
No UI counter, journal text or client-side local variable may independently set TruthChainComplete. The authoritative objective/evidence system derives it from the three approved flags. If the repository's current owner-decision record differs, reconcile it before implementation rather than keeping competing formulas.

## 5. Electrical / power restoration puzzle family
- Player goal: restore the motel's electrical supply using the registered breaker/fuse interactions.
- The puzzle must clearly distinguish a missing component, an unpowered control and a completed circuit.
- A fuse or breaker action commits only after the interaction validates current state.
- If THE GUEST interrupts, preserve any component already installed and any committed switch state. Never consume a required component on a failed interaction.
- Feedback: mechanical click for accepted switch, electrical hum for powered state, distinct low feedback for invalid state; use registered cue IDs where available.
- Completion event is fired once and drives the objective update. Do not duplicate the same power flag from both a device and a Verse listener.

## 6. Room 13 reveal and finale preparation
- Room 13 reveal is a committed narrative progression event, not a proximity-only trigger.
- The reveal sequence must be recoverable if interrupted by late join or temporary player absence: the session state remains complete, and the returning player receives a short recap/state presentation rather than replaying an irreversible sequence.
- FinaleReady remains exactly: PowerRestored && ServiceKeyObtained && GatePowered && ServiceRouteReady && Room13RevealComplete.
- CoreEscapeReady remains FinaleReady && CarKeysObtained && vehicle ignition succeeds.
- THE TRUTH requires FinaleReady && TruthChainComplete.
- THE NEW GUEST becomes available at FinaleReady and then requires explicit unanimous consent. NewGuestAccepted is output only after unanimity; it is not an eligibility prerequisite.

## 7. Retry and reset rules
- Retry invalid inputs without consuming key items.
- Reset only transient puzzle state unless the puzzle specification explicitly marks a committed state as resettable.
- Checkpoint restore returns to the last committed state; it must not award missing evidence, keys or charges.
- If the puzzle device becomes unavailable, provide a Verse-controlled fallback interaction using the same PuzzleID and success event.
- Puzzle reset must not clear evidence already collected or ending eligibility flags unless a documented full-session restart occurs.

## 8. Co-op race conditions
- Two players activating the same object at once produce one authoritative commit and one completion event.
- If two different required actions occur concurrently, serialize commits and re-evaluate prerequisites after each.
- A player's disconnect during a hold cancels that player's uncommitted action; it does not undo another player's committed progress.
- Shared puzzle state is session-wide; personal item charges remain personal if the inventory specification says so.

## 9. Required test cases
PZQA-001 correct solution succeeds exactly once.
PZQA-002 wrong solution gives feedback and preserves required items.
PZQA-003 repeated interaction does not duplicate completion/reward.
PZQA-004 interruption during hold cancels only uncommitted work.
PZQA-005 interruption after commit preserves progress.
PZQA-006 two-player simultaneous interaction commits once.
PZQA-007 reconnect restores puzzle state and journal.
PZQA-008 checkpoint does not grant unearned evidence/items.
PZQA-009 hint tiers appear once and in order.
PZQA-010 all three END-A02 evidence flags enable TruthChainComplete only through authoritative logic.
PZQA-011 CarKeys are not required for THE TRUTH or THE NEW GUEST.
PZQA-012 ESCAPE is unavailable unless CoreEscapeReady is true.
