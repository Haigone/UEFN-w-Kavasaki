# CAPTURE AND RESCUE SPECIFICATION
## THE MOTEL: ROOM 13

## 1. Capture eligibility
THE GUEST may capture only one eligible target at a time unless a separately authored, tested sequence explicitly overrides this rule. Eligible state is ACTIVE or THREATENED. Capture is disabled during protected puzzle transactions, key story cinematics, spawn grace and post-rescue protection.

## 2. Capture transaction
1. Validate target, reachability, distance and capture permission.
2. Acquire per-target capture lock.
3. Set PlayerState=CAPTURED and add player to CapturedPlayers.
4. Disable ordinary movement/interactions using verified UEFN-supported controls.
5. Play brief capture presentation if supported; otherwise show clear HUD/audio state.
6. Notify teammates with rescue marker and subtitle.
7. Release capture lock after state commit.
If any step fails before commit, restore ACTIVE and log the failure. Never leave a player immobilised after failed cinematic.

## 3. Teammate rescue
- Range: <=2 m.
- Duration: 5 seconds uninterrupted.
- Rescuer must be ACTIVE; target must be CAPTURED.
- One rescue transaction per target.
- Cancel on range break, rescuer capture/disconnect, target disconnect or invalidated session.
- Success: target RESCUED, remove from CapturedPlayers, apply 8-second protection target, then ACTIVE.
- No quest item is granted on rescue.

## 4. Solo recovery
In a one-player session, capture must not create a teammate-only dependency. Provide an authored self-rescue interaction or short escape route. Trigger it after the capture presentation or after an assistance delay (90 seconds maximum). The route must be accessible and not require an unowned quest item. Successful self-rescue returns to ACTIVE after protection.

## 5. Emergency assistance
At 90 seconds captured, initiate a recovery prompt/alternate escape route. This is assistance, not death. If self-rescue is unavailable due to a verified technical failure, restore the latest checkpoint.

## 6. Team defeat
If every connected player is CAPTURED, stop additional monster attacks, show a brief defeat beat, restore latest checkpoint and clear all transient locks. Retain committed team inventory, puzzle flags and objectives according to checkpoint snapshot. If zero players remain connected, retain live-session state where supported; do not claim cross-session persistence.

## 7. Fairness and threat
- No capture during required stationary interactions.
- No capture at spawn or during checkpoint restoration.
- Clear threat cues before capture.
- Monster must have a valid reachable route; no wall tracking.
- Do not use capture as the trigger for THE_NEW_GUEST.
- Test all staircases, doorways, room entrances and secret passage navigation.

## 8. Acceptance
Solo capture recovery; 2-player rescue; four-player rescue contention; disconnect of rescuer/target; 90-second assistance; all-captured checkpoint restore; cinematic failure; protected puzzle immunity; no duplicate capture.
