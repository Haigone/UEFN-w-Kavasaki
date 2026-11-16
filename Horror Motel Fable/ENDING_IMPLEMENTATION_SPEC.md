# ENDING IMPLEMENTATION SPECIFICATION
## THE MOTEL: ROOM 13

## 1. Canonical flags
FinaleReady; CoreEscapeReady; TruthChainComplete; Room13RevealComplete; ServiceRouteReady; NewGuestAccepted; EndingSelected; Ending (NONE/ESCAPE/THE_TRUTH/THE_NEW_GUEST).

All flags are session-authoritative. Ending starts as NONE and may be committed exactly once.

## 2. Eligibility
**ESCAPE:** CoreEscapeReady=true and player/team selects the standard vehicle route. CoreEscapeReady is committed only after the service gate is powered and CarKeys are used at the vehicle ignition. This is available even when optional truth evidence was missed.  
**THE_TRUTH:** FinaleReady=true, TruthChainComplete=true, Room13RevealComplete=true, ServiceKeyObtained=true, ServiceRouteReady=true, and team explicitly selects the truth route. It does not require CarKeys or vehicle ignition.  
**THE_NEW_GUEST:** FinaleReady=true and NewGuestAccepted=true through explicit invitation interaction and team confirmation. It does not require CarKeys or vehicle ignition. Never infer acceptance from capture, timer expiry, failed chase or ordinary defeat.

## 3. Truth evidence — END-A02 PENDING OWNER APPROVAL

No mandatory truth-evidence list is currently owner-approved. The recommended three-clue gate is documented in END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md and OWNER_DECISION_PACKET_R1.md.

**Proposed formula (NOT AUTHORIZED FOR IMPLEMENTATION UNTIL APPROVED):**
`TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`
- `DiaryFound`: ROOM 09 night manager diary.
- `ChildRoomClueFound`: ROOM 11 child's drawing.
- `MissingGuestEvidenceFound`: ROOM 06 missing-guest photo archive.

Keep `SecretPanelOpened`, `PhotoSequenceSolved` and `OwnerIdentityRevealed` / `Room13RevealComplete` as separate route, puzzle and identity-reveal progression gates. Do not add them as duplicate evidence pickups inside `TruthChainComplete`.

Until explicit owner approval, do not implement a mandatory truth-evidence gate. ESCAPE remains available when any optional investigation clue is missed. If approved, each required clue must be recoverable, team-shared, idempotent and have readable/journal fallback. Other optional lore remains excluded.

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

**END-A01 APPROVED:** Section 4 is the canonical owner-approved co-op quorum. Claude may implement this resolver after validating it against the current UEFN/Verse API.

**END-A02 PENDING:** Do not implement a mandatory truth-evidence gate until the owner explicitly approves it in OWNER_DECISION_PACKET_R1.md and the approval is recorded in OWNER_DECISION_GATE_R2.2.md. The three-clue formula in Section 3 is recommendation only.
