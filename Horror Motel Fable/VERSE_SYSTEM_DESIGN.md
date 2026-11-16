# VERSE SYSTEM DESIGN — LOGICAL CONTRACT
**Project:** THE MOTEL: ROOM 13  
**Status:** implementation blueprint / API-neutral pseudocode. Not compiled Verse and not a claim of UEFN compatibility.

## 1. Implementation boundary
Implement in UEFN using supported Verse APIs and devices available in the target Fortnite release. Before coding, check current API signatures in the installed UEFN Verse digest and compile a minimal device interaction. This document defines state, ownership, events and acceptance behavior; it does not invent engine API names.

## 2. Authority and replication
- Session objective state is server-authoritative.
- A single Game Manager owns act progression and ending selection.
- Puzzle Manager owns puzzle state transitions; interactions must be idempotent.
- Player Manager owns per-player state and capture/rescue.
- Monster Controller owns AI state and last-known-player position.
- Difficulty Manager calculates a shared tension value but may apply player-specific accessibility protections.
- UI/audio managers receive events; they do not own progression.
- Replicate only state required by clients. Never trust a client-only interaction result for key progression.

## 3. Canonical enumerations
```text
Act = ARRIVAL | RECEPTION | ROOMS_GROUND | RESTORE_POWER | UPPER_FLOOR | ROOM_13 | ESCAPE
PlayerState = ACTIVE | THREATENED | CAPTURED | RESCUE_PENDING | RESCUED | SOLO_ESCAPE | SAFE
MonsterState = DORMANT | PATROL | OBSERVE | INVESTIGATE | CHASE | CAPTURE | SEARCH | RETREAT
TensionBand = DORMANT | UNEASY | HUNTING | RELENTLESS
Ending = NONE | ESCAPE | THE_TRUTH | THE_NEW_GUEST
PuzzleState = LOCKED | AVAILABLE | IN_PROGRESS | SOLVED
```

## 4. Shared session data
```text
SessionState:
  CurrentAct: Act
  ObjectiveFlags: Map<ObjectiveId, Bool>
  SharedInventory: Set<ItemId>
  PuzzleFlags: Map<PuzzleId, PuzzleState>
  CheckpointId: CheckpointId
  TensionValue: Integer[0..100]
  Ending: Ending
  ConnectedPlayers: Set<PlayerId>
  CapturedPlayers: Set<PlayerId>
  SessionSeed: Integer
```
Persist session state for reconnect within the same live session where supported. Do not promise persistence across separate play sessions unless a supported persistence design is implemented and tested.

## 5. Event contracts
| Event | Owner | Preconditions | Atomic result |
|---|---|---|---|
| PlayerJoined | Game Manager | Valid session | Register player; restore session-owned state |
| PlayerLeft | Player Manager | Player registered | Remove active presence; retain shared quest items |
| ObjectiveCompleted(id) | Game Manager | Objective not already complete | Set flag once; recalculate next objective |
| ItemAdded(id) | Inventory Manager / Game Manager | Item not already held | Add to shared set once |
| FuseInserted(slot,item) | Puzzle Manager | Correct fuse available; slot empty | Consume/assign fuse and update panel |
| PuzzleSolved(id) | Puzzle Manager | Puzzle state not SOLVED | Commit solved state; fire one completion event |
| PlayerCaptured(id) | Player Manager | Player ACTIVE/THREATENED | Set CAPTURED; start rescue window |
| PlayerRescued(id) | Player Manager | Captured and rescuer in range | Set RESCUED; grant short protection |
| CheckpointReached(id) | Game Manager | Act checkpoint condition true | Snapshot session progression |
| EndingSelected(id) | Game Manager | Ending NONE; ending conditions true | Set one ending; block all competing endings |

## 6. Puzzle transaction rules
1. Validate the player is active and within interaction range.
2. Validate the puzzle is available and not already solved.
3. Acquire a short logical lock for that puzzle.
4. Validate required item/sequence.
5. Commit state once.
6. Release lock and broadcast resulting state.
7. On failure, release lock without consuming required items.
8. If a player disconnects mid-interaction, release the lock on timeout/session cleanup.
This prevents two players consuming the same shared item or completing a puzzle twice.

## 7. Capture / rescue rules
- Capture can target one player at a time unless a story beat explicitly overrides it.
- A captured player remains in the session and can signal rescue.
- Teammate rescue interaction: 5 seconds uninterrupted, within 2 m.
- Successful rescue: RESCUED for 8 seconds, then ACTIVE.
- Damage, leaving range or rescuer capture cancels rescue progress.
- 90-second emergency threshold triggers a solo recovery/escape mechanic, not automatic death.
- In solo mode, capture invokes a self-recovery sequence; no teammate-only dependency may block progress.
- If all players are captured, trigger defeat/recovery checkpoint; never leave session in an unrecoverable state.

## 8. Six-act progression gates
| Act | Entry condition | Required objective | Exit gate |
|---|---|---|---|
| 1 ARRIVAL | Session start | Reach Raven Motel / inspect sign | Enter reception |
| 2 RECEPTION | Reception entered | Register clue + office clue | Obtain upper-floor key |
| 3 ROOMS_GROUND | Office clue solved | Collect evidence in rooms 01–06 | Access electrical room |
| 4 RESTORE_POWER | Fuse panel found | Install Fuse A/B/C | Power and upper access enabled |
| 5 UPPER_FLOOR | Power restored | Diary, child room, ROOM 12 panel | Secret route revealed |
| 6 ROOM_13 / ESCAPE | ROOM 13 entered | Order four photos; reveal owner; recover service key | Escape sequence and ending selection |

Do not hard-gate optional evidence. Required clues must have clear fallback readability and solo completion.

## 9. Ending decision — canonical resolver contract

At the final sequence, present only endings whose full eligibility predicates are true. GameManager validates eligibility, acquires the ending lock, commits one session-wide ending only when Ending==NONE, disables all competing triggers and broadcasts one branch event.

- ESCAPE: CoreEscapeReady (gate powered and CarKeys used at vehicle ignition) and explicit vehicle-route selection; remains available if truth evidence is incomplete.
- THE_TRUTH: FinaleReady, TruthChainComplete, Room13RevealComplete, ServiceKeyObtained, ServiceRouteReady and explicit truth-route selection; does not require vehicle ignition.
- THE_NEW_GUEST: FinaleReady plus NewGuestAccepted through explicit invitation and team confirmation; never inferred from capture, defeat, inactivity or timeout; does not require vehicle ignition.

**END-A01 owner-approved quorum (2026-11-16):** strict majority of currently connected eligible players for ESCAPE/THE_TRUTH; unanimous explicit affirmative confirmation for THE_NEW_GUEST. Tie/timeout selects ESCAPE only if eligible; otherwise reopen the vote. Disconnect removes the voter and recalculates/re-prompts; disconnect is never consent. Solo selection is direct. Ending commit is atomic and one-shot.

**END-A02 remains pending owner approval.** Do not implement mandatory truth-evidence pickups until the owner approves OWNER_DECISION_PACKET_R1.md. The current recommended evidence proposal is three optional-investigation clues (ROOM 09 diary, ROOM 11 drawing, ROOM 06 missing-guest archive). Keep physical route, photo puzzle and identity reveal as independent progression gates.

## 10. Adaptive tension
Inputs: time without meaningful progress, capture events, puzzle stalls, monster sightings and noise/detection events.
- 0–24 Dormant; 25–49 Uneasy; 50–74 Hunting; 75–100 Relentless.
- Exploration alone does not increase tension.
- Do not increase during required stationary puzzle interactions or narrative sequences.
- Decrease after hard puzzle completion and after a long chase.
- Clamp 0–100; rate-limit changes to avoid sudden difficulty oscillation.
- Solo mode lowers simultaneous pressure and guarantees an escape/recovery route.

## 11. Checkpoint contract
| Checkpoint | Trigger | State retained |
|---|---|---|
| CP01 | Register complete | Register solution, office access |
| CP02 | Power restored | Fuse panel solved, upper access |
| CP03 | Upper floor reached | Upper-floor access and completed evidence |
| CP04 | ROOM 13 photo puzzle solved | Photo order, reveal state, service key |

Checkpoint restore must be idempotent. Reapplying a checkpoint cannot duplicate items, reopen solved puzzles or trigger an ending.

## 12. UEFN implementation checklist
- [ ] Verify every used device type and event binding in current UEFN release.
- [ ] Compile minimal Verse device before implementing full systems.
- [ ] Confirm NPC Spawner / character animation / navigation support for THE GUEST.
- [ ] Confirm persistence scope and player join/leave behavior.
- [ ] Confirm cinematic sequence and audio/subtitle trigger capabilities.
- [ ] Confirm first-person camera settings and player input restrictions.
- [ ] Record actual API names, compiler version, test map and build result.
- [ ] Replace this blueprint's pseudocode with compiled Verse source and commit it.
