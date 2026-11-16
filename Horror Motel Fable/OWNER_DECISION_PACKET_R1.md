# OWNER DECISION PACKET R1
## THE MOTEL: ROOM 13
Date: 2026-11-16
Status: **ONE CONSOLIDATED CREATIVE APPROVAL REQUEST — NOT YET APPROVED**

## Purpose

This packet consolidates the remaining owner-facing creative choices so production does not repeatedly stop for small isolated approvals. It recommends one coherent baseline. Approval applies only to the exact content listed below; it does not approve geometry changes, UEFN implementation claims, engine assumptions or publication.

## Recommended single decision

**Approve NARRATIVE_CONTENT_PROPOSAL_PACK_R1 as the player-facing narrative/puzzle copy baseline, with the END-A02 evidence gate defined in Section 2 below.**

This approval would cover NCP-A01 through NCP-A09. NCP-A10's co-op quorum is superseded by END-A01, already approved separately; it must not reopen or alter that decision.

### Included content

| ID | Proposed content to approve | Recommendation |
|---|---|---|
| NCP-A01 | Reception register text and 02-13-86 code deduction | Approve as drafted |
| NCP-A02 | Office photo captions and 1974 → 1978 → 1982 → 1986 order | Approve as drafted |
| NCP-A03 | Fuse A/B/C labels, placements and Room 04 transcript | Approve as drafted, preserving Room 02 battery as separate personal pickup |
| NCP-A04 | Room 06 missing-guest photo archive and captions | Approve as drafted |
| NCP-A05 | Room 09 night-manager diary | Approve as drafted |
| NCP-A06 | Room 11 child's drawing and caption | Approve as drafted |
| NCP-A07 | ROOM 13 four photographs, captions, chronology and reveal beats | Approve as drafted |
| NCP-A08 | THE TRUTH action, recorder sequence, night-audit breaker, consequence and title card | Approve as drafted |
| NCP-A09 | THE NEW GUEST invitation text and ACCEPT THE ROOM / LEAVE THE KEY choices | Approve as drafted |

The exact wording, image descriptions, clue placements, puzzle logic, sequence beats and fallback rules are in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md. This packet does not paraphrase or silently alter that content.

## 2. END-A02 — recommended mandatory truth evidence

Approve exactly three optional-investigation evidence flags as the complete TruthChainComplete formula:

- DiaryFound — ROOM 09 diary.
- ChildRoomClueFound — ROOM 11 drawing.
- MissingGuestEvidenceFound — ROOM 06 missing-guest archive.

Formula: `TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`.

Keep SecretPanelOpened, PhotoSequenceSolved and OwnerIdentityRevealed / Room13RevealComplete as independent progression/reveal requirements. They are not additional evidence pickups and must not be duplicated inside TruthChainComplete.

This choice is also detailed in END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md. If approved, all three clues must be recoverable, session-shared, idempotent and available as readable/journal text. ESCAPE remains available when the evidence chain is incomplete.

## 3. Conditions that remain unchanged

- END-A01 co-op quorum remains owner-approved and binding:
  - ESCAPE/THE TRUTH: strict majority of currently connected eligible players.
  - THE NEW GUEST: explicit unanimous affirmative consent.
  - Disconnect removes voter and causes recalculation/reconfirmation; it is never consent.
  - Tie/timeout selects ESCAPE only if eligible; otherwise allow a new vote.
- Exactly three endings remain.
- No capture, timeout or defeat event can imply THE NEW GUEST acceptance.
- Room13 owner/GUEST identity remains one identity/manifestation.
- English remains the shipped language.
- LD-GEO R2.3 geometry approval is unaffected.

## 4. Approval does not mean

- UEFN implementation, Verse signatures, AI navigation, animation or devices are verified.
- Proposed text has been imported, voiced, subtitled or playtested.
- Geometry, prop placement or actor placement is editor-verified.
- Any asset is acquired, licensed or imported.
- Any test is passed or publication authorized.

## 5. Owner response

To approve the complete recommended package without further fragmentation, reply:

**APPROVO OWNER DECISION PACKET R1**

To reject or modify it, identify only the NCP/END-A02 IDs and the replacement text or rule. Unmentioned entries remain pending; no silence is treated as consent.

