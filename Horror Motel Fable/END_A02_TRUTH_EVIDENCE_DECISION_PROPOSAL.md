# END-A02 — THE TRUTH EVIDENCE GATE
Project: THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **OWNER APPROVED — CANONICAL END-A02 DECISION (2026-11-16)**

## 1. Owner-approved decision

The owner explicitly approved the following three optional-investigation clues as the only evidence pickups required to set `TruthChainComplete` on 2026-11-16:

| Required evidence | Flag | Location | Narrative function |
|---|---|---|---|
| Night manager's diary | `DiaryFound` | ROOM 09 | Establishes the repeating night, the owner's impossible appearances and the nature of ROOM 13. |
| Child's drawing | `ChildRoomClueFound` | ROOM 11 | Establishes that the figure is present throughout the motel and links it to the owner. |
| Missing-guest photo archive | `MissingGuestEvidenceFound` | ROOM 06 | Establishes the historical pattern of guests who never checked out and the recurring figure. |

Canonical approved formula:

`TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`

All three flags are team/session-authoritative, idempotent and persistent for the current session.

## 2. Keep progression requirements separate

The following are not additional evidence pickups. They remain independent progression/reveal requirements already represented elsewhere in the ending contract:

- `SecretPanelOpened`: physical route/access progression, where required by the approved level flow.
- `PhotoSequenceSolved`: mandatory ROOM 13 puzzle progression.
- `OwnerIdentityRevealed` / `Room13RevealComplete`: identity-reveal presentation state.

The truth ending must still require the existing independent gates: core progression, completed ROOM 13 reveal, service key/service route readiness and explicit team selection. Do not count the same action twice by adding these flags to the three-clue evidence formula.

## 3. Availability and anti-softlock requirements

If the owner approves this gate, each of the three required clues must satisfy all of the following before implementation can be considered complete:

1. The clue is reachable during normal mandatory exploration and remains recoverable until an ending is committed.
2. No clue can be permanently missed because of a one-way door, timed event, chase, capture, player death/respawn, item consumption or another player's interaction.
3. Inspection sets its team flag once; any connected player may inspect it.
4. The complete clue text is readable in-world and available in a journal/transcript fallback. Audio is never the only delivery channel.
5. The clue remains inspectable or its transcript remains available after first discovery.
6. The UI clearly communicates evidence discovery; do not reveal the final solution or force a particular ending.
7. If a clue is unavailable because of a verified level-flow constraint, stop and return a design issue. Do not silently remove or substitute evidence.

## 4. Why the other three flags are excluded

`SecretPanelOpened`, `PhotoSequenceSolved` and `OwnerIdentityRevealed` are structural progression/reveal states, not optional investigative discoveries. They already participate in access, puzzle completion or the ROOM 13 reveal gate. Requiring them again inside `TruthChainComplete` duplicates gates and obscures whether the player has actually investigated the motel's history.

## 5. Required implementation and QA tests after approval

- Each of the three clues independently sets only its own evidence flag.
- All three flags together set `TruthChainComplete`; any missing flag leaves it false.
- Repeated inspection does not duplicate rewards/events.
- One player's discovery is shared by the session.
- A clue remains recoverable after chase/capture/respawn and after another player inspects it.
- Readable/journal fallback matches the approved authored text.
- THE TRUTH remains unavailable until the three clues and all independent route/reveal gates are complete.
- ESCAPE remains available when the evidence chain is incomplete.
- THE NEW GUEST consent and ending quorum remain unaffected.
- Test solo and multiplayer sessions, including disconnect/reconnect where supported.

## 6. Approval boundary

**DECISION STATUS: APPROVED BY OWNER — 2026-11-16.** This file is the implementation contract for the three-clue THE_TRUTH evidence gate. This approval covers the evidence formula and its availability/recovery requirements; it does not independently approve unrelated narrative material.

Claude is authorized to implement the approved evidence gate, validate actual clue placement and event bindings in UEFN, and execute the tests in Section 5. Keep all three clues optional to core progression and ESCAPE. The authoritative approval record is `OWNER_DECISION_GATE_R2.2.md`.
