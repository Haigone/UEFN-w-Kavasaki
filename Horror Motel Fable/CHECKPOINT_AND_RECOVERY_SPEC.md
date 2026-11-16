# CHECKPOINT AND RECOVERY SPECIFICATION
## THE MOTEL: ROOM 13

## 1. Contract
Checkpoints snapshot authoritative session progression. Snapshot is immutable until the next checkpoint. Restore is idempotent and reconciles flags/actors; it does not blindly re-grant items or replay one-shot events.

## 2. Checkpoint table
| ID | Trigger | Minimum retained state |
|---|---|---|
| CP01 | PZ-01 solved / OfficeKey granted | RegisterSolved, OfficeKey, office access, all earlier objectives |
| CP02 | PZ-03 solved / power restored | Fuse A/B/C INSTALLED, PowerRestored, prior keys and puzzles |
| CP03 | Upper floor reached after access granted | UpperFloorAccessGranted, completed mandatory clues, prior progression |
| CP04 | PZ-04 solved / ROOM 13 reveal committed | PhotoSequenceSolved, OwnerIdentityRevealed, ServiceKey, TruthChainComplete if evidence complete |

## 3. Snapshot contents
CurrentAct; completed objective flags; shared quest inventory and item states; puzzle states; fuse slot states; checkpoint ID; truth evidence flags; gate state; ending remains NONE unless already safely selected (normally checkpoints occur before ending). Personal battery charge may be restored to a safe baseline; document the actual policy.

## 4. Restore order
1. Disable gameplay triggers and freeze monster.
2. Clear all transient interaction/puzzle/rescue/capture locks and timers.
3. Restore objective and puzzle flags from snapshot.
4. Reconcile shared inventory and item states.
5. Rebuild physical actor visibility/open/closed states from authoritative flags.
6. Restore doors, lights, fuse panel, secret panel and access routes.
7. Place connected players at safe checkpoint spawn; set ACTIVE.
8. Restore UI/objectives and audio state without replaying one-shot stingers.
9. Re-enable gameplay and monster after spawn grace.
Repeated restore must produce identical state.

## 5. Softlock recovery
Recovery interactables are placed at the utility panel, ROOM 13 compartment and final service control. They can restore a missing mandatory proxy only if its prerequisite flag is satisfied. Recovery does not bypass unsolved puzzle logic. Log RecoveryReason, ItemId/PuzzleId, CheckpointId and timestamp/session sequence.

## 6. Disconnect/reconnect
A leaving player releases locks; team state remains. A player rejoining the same live session receives current act, team inventory display and safe spawn. Do not promise state persistence after the session has ended; separate persistent save requires independent technical verification.

## 7. Defeat recovery
If all connected players are captured, restore latest snapshot. If checkpoint is unavailable/corrupt, fall back to CP01 baseline and preserve only validated committed team flags; never leave players in a frozen state.

## 8. Tests
Restore each CP01–CP04; restore twice; disconnect during pickup/puzzle/rescue; restore during capture; missing physical item; missing puzzle actor; all players captured; overlapping triggers; ensure no duplicate key, audio or ending.
