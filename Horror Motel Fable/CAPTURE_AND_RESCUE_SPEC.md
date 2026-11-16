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
In a one-player session, capture must not create a teammate-only dependency. After a capture presentation with a 2-second target duration, enable the local self-rescue interaction/route immediately. The interaction requires 5 uninterrupted seconds, no quest item and no second player. Successful self-rescue returns to ACTIVE after 8 seconds of RESCUED protection.

## 5. Emergency assistance
In co-op, at 90 seconds captured, enable an emergency self-recovery interaction for that player; it also requires 5 uninterrupted seconds and no quest item. This supplements, but does not replace, teammate rescue. If solo recovery is unavailable or no recovery path can be completed by 90 seconds, restore the latest checkpoint. If every connected player is CAPTURED, trigger team checkpoint recovery immediately. No capture outcome is death/game over.

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
