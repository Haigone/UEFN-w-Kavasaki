# ENDING DESIGN SPECIFICATION — THE MOTEL: ROOM 13

Exactly three endings. Names and core outcomes are canon; flag names below are logical identifiers, not verified Verse code.

## Shared flags
CoreEscapeReady, CarKeysObtained, ServiceKeyObtained, ServiceRouteReady, TruthChainComplete, Room13RevealComplete, NewGuestAccepted, EndingSelected. Team/session authoritative except individual inputs used for a vote. Commit ending atomically and once.

## ESCAPE
**Eligibility:** CoreEscapeReady; CarKeysObtained; required service/gate mechanism complete; EndingSelected is NONE; team chooses vehicle escape. If truth is also eligible, show a choice rather than forcing this ending.
**Sequence:** reach car; activate escape; final chase through gate; play exact approved radio line “Thank you for staying at the Raven Motel. We hope to see you again soon.”; silhouette in rear seat or rear-view reflection; cut to black; ESCAPE title card.
**Outcome:** players physically leave, but the final image implies the motel's influence persists.

## THE TRUTH
**Eligibility:** core progression complete; TruthChainComplete; Room13RevealComplete; ServiceKeyObtained; ServiceRouteReady; explicit team choice; EndingSelected is NONE.
**Sequence:** confirm owner/GUEST reveal; activate truth route rather than standard vehicle escape; play distinct confrontation/exposure sequence; ending-specific consequence and title card.
**Canon boundary:** confrontation verb, cost, cinematic, dialogue and exact consequence are not defined in source material. These are PROPOSALS requiring approval.

## THE NEW GUEST
**Eligibility:** NewGuestAccepted from explicit interaction or separately authored, clearly communicated cycle branch; EndingSelected is NONE.
**Sequence:** present invitation; confirm shared outcome in co-op; motel resets; one or more players become part of next story; neon lights at 02:13; NEW GUEST title card.
**Canon boundary:** whether one player or the group becomes the next guest/keeper is unresolved. Random selection without consent is prohibited. Team-wide result is the safe baseline.

## Deterministic resolver
Recommended order is a PROPOSAL because source documents require deterministic precedence but do not define it:
1. If EndingSelected is not NONE, reject all triggers.
2. If NewGuestAccepted is true after team confirmation, select THE NEW GUEST.
3. Else if TruthChainComplete, Room13RevealComplete, ServiceKeyObtained and ServiceRouteReady are true and team selects truth, select THE TRUTH.
4. Else if CoreEscapeReady, CarKeysObtained and ServiceRouteReady are true and team selects vehicle escape, select ESCAPE.
5. Otherwise keep final objective active; never infer an ending from elapsed time, capture or defeat.

If truth and escape are both eligible, expose explicit choice; do not rely on race conditions.

## Multiplayer contract
One shared ending for the session. All connected players receive the same choice. Disconnect during vote cannot silently count as acceptance. **APPROVED CO-OP RULE (owner, 2026-11-16):** ESCAPE and THE TRUTH require a strict majority of currently connected eligible players. THE NEW GUEST requires an explicit affirmative confirmation from every currently connected eligible player; no inferred acceptance. A tie or timeout for ESCAPE/THE TRUTH selects ESCAPE only when ESCAPE is eligible; otherwise the choice remains active for a new vote. A disconnect removes that player from the active electorate and recalculates majority; for THE NEW GUEST, re-prompt/reconfirm unanimity among the remaining connected players. A disconnect never counts as acceptance. Solo choice is direct. After commit, lock all competing endings.

## Required state transitions
- Complete approved evidence checklist → TruthChainComplete.
- Finish four-photo puzzle → Room13PhotoSequenceSolved.
- Finish identity reveal presentation → Room13RevealComplete.
- Open compartment → ServiceKeyObtained.
- Activate service mechanism → ServiceRouteReady.
- Explicit accepted invitation → NewGuestAccepted.
- Eligible selection while EndingSelected is NONE → commit exactly one ending.

## Acceptance
All endings reachable solo/co-op; mutually exclusive; no capture/timeout trigger; one-shot replicated state; no reconnect duplication; unique ending sequence/title card; approved radio line exact. THE TRUTH and NEW GUEST scripts require approval.
