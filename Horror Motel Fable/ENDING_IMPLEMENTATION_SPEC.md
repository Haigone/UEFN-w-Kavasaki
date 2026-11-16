# ENDING IMPLEMENTATION SPECIFICATION
## THE MOTEL: ROOM 13

## 1. Canonical flags
CoreEscapeReady; TruthChainComplete; Room13RevealComplete; ServiceRouteReady; NewGuestAccepted; EndingSelected; Ending (NONE/ESCAPE/THE_TRUTH/THE_NEW_GUEST).

All flags are session-authoritative. Ending starts as NONE and may be committed exactly once.

## 2. Eligibility
**ESCAPE:** CoreEscapeReady=true and player/team selects the standard vehicle route. This is available even when optional truth evidence was missed.  
**THE_TRUTH:** CoreEscapeReady=true, TruthChainComplete=true, Room13RevealComplete=true, ServiceRouteReady=true, and team explicitly selects truth route.  
**THE_NEW_GUEST:** NewGuestAccepted=true through explicit invitation interaction and team confirmation. Never infer acceptance from capture, timer expiry, failed chase or ordinary defeat.

## 3. Truth evidence
TruthChainComplete is true only when all required truth evidence flags are true: DiaryFound; ChildRoomClueFound; MissingGuestEvidenceFound (Room 06); SecretPanelOpened; PhotoSequenceSolved; OwnerIdentityRevealed. Optional lore notes are excluded. If any of these are not authored as mandatory in the final level, remove them from the gate and update all documents before implementation; do not silently make a missable pickup mandatory.

## 4. Co-op choice — OWNER APPROVED 2026-11-16
Ending selection is team-wide. Present only eligible options.
- ESCAPE and THE_TRUTH: strict majority of currently connected eligible players.
- THE_NEW_GUEST: unanimous explicit affirmative confirmation from every currently connected eligible player. Never infer acceptance; no random player selection.
- Tie or timeout for ESCAPE/THE_TRUTH: choose ESCAPE only if ESCAPE is eligible; otherwise keep the choice active and permit a new vote. Never silently choose THE_TRUTH.
- Disconnect during ESCAPE/THE_TRUTH vote: remove disconnected voter from active electorate and recalculate majority.
- Disconnect during THE_NEW_GUEST confirmation: remove the disconnected player and re-prompt/reconfirm unanimity with all remaining connected eligible players. Disconnect is not consent.
- Solo choice is direct.

The active electorate is the set of currently connected eligible players when the vote/prompt is evaluated; update it on disconnect before resolving. Commit only after the applicable quorum is satisfied.

## 5. Atomic selection
GameManager validates eligibility; acquire ending lock; if Ending==NONE set Ending and EndingSelected; disable all other ending triggers; broadcast one branch event. Repeated trigger calls return existing ending without replay.

## 6. Sequences
ESCAPE: reach vehicle, gate route, final chase, radio line “Thank you for staying at the Raven Motel. We hope to see you again soon.”, rear-seat/rear-view silhouette, cut to black, title card.
THE_TRUTH: service route confrontation/revelation; show owner identity as THE GUEST; distinct final resolution and title card; do not reuse generic vehicle escape as the sole ending.
THE_NEW_GUEST: explicit acceptance; motel cycle resets; neon lights at 02:13; team-wide shared result and title card. Do not arbitrarily select one co-op player as keeper.

## 7. Recovery and edge cases
If ending cinematic fails, preserve Ending and show fallback title card/complete state. Disconnect during vote removes that voter; recalculate eligible majority. If a player disconnects after commit, ending continues for remaining connected players. Overlapping trigger volumes cannot change a committed ending.

## 8. Tests
All three endings solo; all three in co-op; truth evidence incomplete; acceptance without consent; tie vote; no vote; simultaneous trigger volumes; disconnect during vote; disconnect during cinematic; repeat activation; invalid eligibility.


## 9. Owner approval gate — co-op quorum and truth evidence

**END-A01 APPROVED:** Section 4 is the canonical owner-approved co-op quorum. Claude may implement this resolver, including timeout/tie and disconnect handling, after validating it against the current UEFN/Verse API. Keep END-A02 as a hard stop for mandatory truth-evidence gating.

**Truth evidence gate:** The six flags in Section 3 remain a proposed mandatory list until the owner approves END-A02. Do not make a clue mandatory unless its placement, readability, fallback and progression role are confirmed in the approved narrative pack.
