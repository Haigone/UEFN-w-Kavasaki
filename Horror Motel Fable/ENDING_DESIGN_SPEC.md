# ENDING DESIGN SPECIFICATION — THE MOTEL: ROOM 13

Exactly three endings. Names and core outcomes are canon; flag names below are logical identifiers, not verified Verse code.

## Shared flags
FinaleReady, CoreEscapeReady, CarKeysObtained, ServiceKeyObtained, ServiceRouteReady, GatePowered, PowerRestored, TruthChainComplete, Room13RevealComplete, NewGuestAccepted, EndingSelected, NightAuditActivated. Team/session authoritative except individual inputs used for a vote. Commit ending atomically and once.

Derived readiness: FinaleReady = PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete. CoreEscapeReady = FinaleReady AND CarKeysObtained AND successful vehicle ignition (IN-019). CarKeys/ignition are required only for ESCAPE.

## ESCAPE
**Eligibility:** CoreEscapeReady; GatePowered; EndingSelected is NONE; team chooses vehicle escape. CarKeys may be collected after FinaleReady; pickup does not commit or select the ending.
**Sequence:** reach car; activate escape; final chase through gate; play exact approved radio line “Thank you for staying at the Raven Motel. We hope to see you again soon.”; silhouette in rear seat or rear-view reflection; cut to black; ESCAPE title card.
**Outcome:** players physically leave, but the final image implies the motel's influence persists.

## THE TRUTH
**Eligibility:** FinaleReady; TruthChainComplete; Room13RevealComplete; ServiceKeyObtained; ServiceRouteReady; explicit team choice; EndingSelected is NONE. Does not require CarKeys or vehicle ignition.
**Sequence:** after the session commits THE_TRUTH, remain in GF-SERVICE-BAY (the canonical Service Control Bay). The group has already accessed it from Storage through D-G16 using the reusable Service Key before final selection. The four ROOM 13 photographs appear on the evidence rail in their solved chronology (1968/1974/1981/1986); no second photo puzzle or inventory transfer is required. Play the night manager's 02:13 recorder entry with subtitles; THE GUEST appears at the opposite corridor end; the owner portrait and THE GUEST align in a reflection; players activate the dedicated `NIGHT AUDIT — END CYCLE` breaker through IN-032. Lights go out room by room while the neon remains at 02:13; the register prints `NO VACANCY. NO OWNER. NO GUEST.`; cut to THE TRUTH title card.
**Outcome:** the team stops the current night-loop and exposes it, but the motel remains physically present and its source is not proven destroyed. All players remain together in GF-SERVICE-BAY after blackout; nobody is killed, sacrificed or selected as a replacement. This is distinct from ESCAPE and requires no car, car keys, ignition or chase.

## THE NEW GUEST
**Eligibility:** FinaleReady; EndingSelected is NONE; invitation must receive unanimous explicit affirmative confirmation. NewGuestAccepted is the resolver output set only after the quorum succeeds. Does not require CarKeys or vehicle ignition.
**Sequence:** present invitation; if every connected eligible player explicitly accepts, commit one shared session-wide outcome; the whole team willingly becomes the next collective caretaker/guest group (no individual is selected or sacrificed); motel resets; the register gains a blank NEXT GUEST line and the ROOM 13 key returns to the rack; neon lights at 02:13; NEW GUEST title card.

## Deterministic resolver

The ending resolver is an eligibility filter plus one team-choice transaction, not an automatic priority list.

1. If EndingSelected is not NONE, reject all new triggers.
2. Open one session-wide ending selector when FinaleReady is true. Show only currently eligible choices. If ESCAPE is not eligible yet, omit it; players may close the selector, collect CarKeys, complete ignition and reopen the selector.
3. Each connected eligible player may cast one explicit choice in the active round.
4. ESCAPE and THE_TRUTH resolve on strict majority. THE_NEW_GUEST is a separate explicit confirmation requiring unanimous affirmative consent; a decline or timeout does not commit it.
5. Apply END-A01 tie/timeout/disconnect rules exactly. If ESCAPE is eligible, tie/timeout selects ESCAPE; otherwise keep the selector active for a new round.
6. On a valid quorum, acquire the ending lock, set Ending and EndingSelected atomically, disable all competing triggers and broadcast one branch event.
7. No elapsed time, capture, defeat, disconnection or failed chase can select an ending.

## Multiplayer contract
One shared ending for the session. All connected players receive the same choice. Disconnect during vote cannot silently count as acceptance. **APPROVED CO-OP RULE (owner, 2026-11-16):** ESCAPE and THE TRUTH require a strict majority of currently connected eligible players. THE NEW GUEST requires an explicit affirmative confirmation from every currently connected eligible player; no inferred acceptance. A tie or timeout for ESCAPE/THE TRUTH selects ESCAPE only when ESCAPE is eligible; otherwise the choice remains active for a new vote. A disconnect removes that player from the active electorate and recalculates majority; for THE NEW GUEST, re-prompt/reconfirm unanimity among the remaining connected players. A disconnect never counts as acceptance. Solo choice is direct. After commit, lock all competing endings.

## Required state transitions
- All three END-A02 evidence flags true → `TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`. These three discoveries are mandatory only for THE_TRUTH; optional for core progression and ESCAPE.
- Finish four-photo puzzle → Room13PhotoSequenceSolved.
- Finish identity reveal presentation → Room13RevealComplete.
- Open compartment → ServiceKeyObtained.
- Activate service mechanism → ServiceRouteReady.
- Explicit invitation and unanimous affirmative confirmation → NewGuestAccepted and THE_NEW_GUEST commit.
- Eligible selection while EndingSelected is NONE → commit exactly one ending.
- After THE_TRUTH is committed, IN-032 → NightAuditActivated=true once; this is an ending presentation beat, not an ending selector.

## Acceptance
All endings reachable solo/co-op; mutually exclusive; no capture/timeout trigger; one-shot replicated state; no reconnect duplication; unique ending sequence/title card; approved radio line exact. THE TRUTH and THE NEW GUEST scripts are approved in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md.
