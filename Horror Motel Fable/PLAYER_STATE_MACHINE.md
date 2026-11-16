# PLAYER STATE MACHINE
## THE MOTEL: ROOM 13

## 1. States
ACTIVE: normal movement/interactions.  
THREATENED: threat warning / target acquisition; player remains controllable.  
CAPTURED: immobilised in recoverable capture state; ordinary interactions disabled.  
RESCUE_PENDING: rescue transaction in progress; target remains captured until commit.  
RESCUED: short post-rescue protection; movement restored.  
SOLO_ESCAPE: solo emergency self-rescue sequence.  
SAFE: ending/exit state; gameplay interactions disabled.

## 2. Allowed transitions
ACTIVE -> THREATENED -> ACTIVE  
ACTIVE or THREATENED -> CAPTURED  
CAPTURED -> RESCUE_PENDING -> RESCUED -> ACTIVE  
CAPTURED -> SOLO_ESCAPE -> ACTIVE  
CAPTURED (all team captured) -> checkpoint recovery -> ACTIVE  
ACTIVE or RESCUED -> SAFE

No other transition is valid without an explicitly documented scripted exception.

## 3. Transition guards
- Capture only if capture enabled, target ACTIVE/THREATENED and not protected.
- Never capture a player twice.
- Captured player cannot rescue another player.
- Rescue requires rescuer ACTIVE, target CAPTURED, distance <=2 m, uninterrupted 5 s.
- Leaving range, rescuer capture, player disconnect or invalid target cancels rescue and clears lock.
- RESCUED protection target: 8 s, then ACTIVE.
- Emergency assistance target: 90 s captured; trigger self-recovery/assist, never automatic death.
- If all connected players are CAPTURED, start team defeat/checkpoint recovery.
- Cinematic interruption, reset and disconnect must restore movement/input state.

## 4. Solo behavior
When session player count is one, play a capture presentation with a 2-second target duration, then transition to SOLO_ESCAPE immediately. Enable a local self-rescue interaction/route requiring 5 uninterrupted seconds; it uses no quest item and requires no second player. If the solo recovery interaction is unavailable or the player remains captured for 90 seconds from capture, automatically restore the latest checkpoint (never death/game over). Successful self-rescue grants 8 seconds of RESCUED protection, then ACTIVE.

## 5. Co-op rescue
Any ACTIVE teammate within 2 m can start rescue. A single rescuer owns the rescue lock. Progress is displayed to target and rescuer. Rescue completes after 5 uninterrupted seconds. If multiple players attempt simultaneously, only one transaction runs; others receive “Rescue in progress”. Do not allow duplicate reward or state transitions.

## 6. Disconnect handling
- Disconnecting player is removed from ConnectedPlayers and CapturedPlayers.
- Release their interaction, puzzle, rescue and cinematic locks.
- If they were rescuer, target returns to CAPTURED and another rescuer may try.
- If they were target, no rescue lock remains; team objective flags are unchanged.
- Rejoin within same live session restores current session state and ACTIVE spawn/recovery position; never respawn holding a stale capture lock.

## 7. Checkpoint defeat recovery
When all connected players are CAPTURED, show defeat feedback, freeze new capture triggers, restore last checkpoint snapshot, respawn connected players into ACTIVE, clear transient threat/capture/rescue locks, preserve committed team quest flags, and resume the current act. Do not reset solved mandatory puzzles later than the checkpoint contract permits.

## 8. QA
Test every allowed transition; attempt every forbidden transition; capture during puzzle protection; rescuer leaves range; rescuer disconnects; target disconnects; all players captured; solo self-rescue; cinematic interrupted; repeated capture events; checkpoint restore while capture lock active.
