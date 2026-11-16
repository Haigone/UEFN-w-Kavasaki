# THE MOTEL: ROOM 13 — MULTIPLAYER SESSION EDGE-CASE SPEC R1
Status: DESIGN BASELINE — must be validated in actual UEFN multiplayer sessions.
Authority: ending quorum rules and checkpoint policy already defined in their respective approved specs; this document operationalizes edge cases.

## 1. Authority model
- Session-wide progression, puzzle completion, evidence flags, finale readiness and ending commit have one authoritative writer.
- Personal inventory/charges and personal checkpoint snapshots remain player-scoped where the existing specs define them.
- UI, client proximity and local animation never authoritatively grant progress.
- All commits are idempotent and carry a stable event/interaction identifier.
- Replication delay must not cause a second reward or contradictory objective state.

## 2. Join-in-progress
A joining player receives a snapshot of:
1. current session phase and act;
2. committed objectives and puzzle states;
3. session evidence flags;
4. current finale eligibility and ending lock;
5. that player's personal inventory/charges/checkpoint data;
6. current monster phase and safe presentation state.
The player does not replay already-committed pickups or re-fire cinematic completion events. Show a short "Session in progress" recap and place the player at the approved safe spawn/checkpoint. Do not spawn inside THE GUEST's immediate attack volume.

## 3. Disconnect and reconnect
- A disconnect removes the player from current connected-player quorum immediately when the authoritative player-removal event is processed.
- Reconnect is a new eligibility evaluation, not restoration of an old vote.
- Reconnected players receive current committed session state; uncommitted local holds, UI panels and temporary interactions are discarded.
- Personal checkpoint state is restored according to CHECKPOINT_AND_RECOVERY_SPEC; never refill a battery or recreate consumed items for free.
- A reconnect must not duplicate evidence, rewards or ending commits.

## 4. Inactivity and AFK
- AFK does not equal disconnect and does not silently remove a player from an ending electorate.
- Do not kick or auto-vote an inactive player through custom game logic unless an explicit separate owner-approved AFK policy is introduced.
- For ESCAPE/THE TRUTH, an inactive eligible connected player may abstain; apply the defined timeout/tie rule.
- For THE NEW GUEST, inactivity/timeout is not affirmative consent and therefore prevents unanimity.

## 5. Capture and rescue
- Capture state is authoritative and scoped to the captured player unless the registered encounter explicitly declares a team-wide cinematic.
- Captured player cannot interact, vote, pick up evidence or advance puzzle holds until released.
- Teammates can continue only those actions permitted by the objective/encounter specs; no hidden pause of all session progress.
- Rescue has one authoritative completion event. Simultaneous rescue attempts cannot consume multiple items or duplicate the rescue.
- If all players are captured, invoke the documented fail/recovery path; never leave the session indefinitely frozen.

## 6. Shared and personal resources
- Evidence, objective flags and completed puzzle states are session-wide.
- Personal battery charge and personal carried items follow the existing inventory/checkpoint policy.
- UI clearly labels personal versus shared ownership.
- A shared item must have a deterministic owner/transfer rule in its register; if no transfer is authored, it cannot be dropped or traded.

## 7. Ending vote edge cases
- Eligible electorate = currently connected players eligible under the ending resolver's authoritative rules.
- ESCAPE and THE TRUTH require strict majority of eligible connected players.
- THE NEW GUEST requires explicit affirmative vote from every eligible connected player.
- Voting window default 20 seconds; early resolution only when mathematically final and valid.
- Tie/timeout for ESCAPE/THE TRUTH: select ESCAPE only if eligible; otherwise reopen vote.
- Disconnect during ESCAPE/THE TRUTH removes player and recalculates majority.
- Disconnect during THE NEW GUEST removes player and restarts unanimous consent among remaining eligible players.
- A late joiner during an active vote is not silently inserted into the current electorate; close/reopen the vote with the new electorate, unless the ending spec explicitly defines another safe behavior. Default decision: reopen.
- Once ending commit starts, freeze electorate and reject further votes. Commit exactly once session-wide.

## 8. Race and failure handling
- Serialize state-changing session commits. Re-check prerequisites at commit time.
- If a player interacts while another player commits the same state, return AlreadyCompleted to the second request.
- On temporary device failure, expose a fallback Verse interaction for the same registered ID, not a second independent progression path.
- If replication is delayed, UI displays pending state; it must not optimistically mark completion.
- If the authoritative state owner is unavailable, disable the affected action and present recoverable feedback rather than guessing.

## 9. Acceptance tests
MP-001 join-in-progress receives correct session snapshot.
MP-002 reconnect restores personal snapshot without free resource refill.
MP-003 reconnect does not replay committed pickup/cinematic rewards.
MP-004 disconnect during ESCAPE/THE TRUTH recalculates electorate and quorum.
MP-005 disconnect during THE NEW GUEST restarts unanimity.
MP-006 AFK is not treated as consent or disconnect.
MP-007 late join during vote safely reopens vote with new electorate.
MP-008 simultaneous pickup/evidence interactions commit once.
MP-009 simultaneous rescue attempts produce one rescue.
MP-010 all-player capture invokes recovery/fail path.
MP-011 ending commit is atomic and occurs once.
MP-012 replication delay never creates false success UI.
