# GAMEPLAY & NARRATIVE DECISION RECORD — R1
## THE MOTEL: ROOM 13
**Date:** 2026-11-16
**Status:** Design decisions selected and synchronized to main.
**Scope:** Resolves gameplay/narrative dependency decisions. The original D-06 text below is historical and superseded by the later express owner delegation approving NCP-A01–A09 as canonical content in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md.

## D-01 — THE TRUTH evidence gate
**Decision:** Approve the three-clue formula:
`TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`.
- ROOM 09 Night Manager's Diary.
- ROOM 11 Child's Drawing.
- ROOM 06 Missing Guest Photo Archive.
These are optional investigations for core progression and ESCAPE, but all three are required for THE_TRUTH. The clues are team-shared, idempotent, recoverable and readable in the Journal. Structural progression/reveal flags remain separate gates.
**Reason:** A truth ending should reward deliberate investigation of the motel's history, while never softlocking the standard escape.

## D-02 — Act II room investigation scope
**Decision:** Do not require inspection of all rooms 01–06.
Mandatory Act II completion is the register solved, Office Key obtained, office photo puzzle solved and upper-floor access granted. The phrase “investigate the motel rooms” describes exploration, not a room checklist.
- Room 01 CRT: optional atmospheric discovery.
- Room 02 suitcase: Fuse A is a mandatory progression pickup for Act III; the optional narrative inspection of the suitcase is not a separate Act II gate.
- Room 03 mirror: optional scare.
- Room 04 telephone recording: optional supporting clue; its transcript is not required to find/install fuses because fuse labels and locations provide sufficient information.
- Room 05 footsteps: optional scare.
- Room 06 missing-guest archive: optional to core progression; required for D-01 / THE_TRUTH.
**Reason:** Prevents repetitive room-checklist gameplay and preserves player agency, while keeping the truth ending meaningfully investigative.

## D-03 — Room 01 / Room 04 journal identities
**Decision:** Use stable journal entry IDs `EV-ROOM01-CRT` and `EV-ROOM04-PHONE`, with discovery flags `Room01CRTClueFound` and `Room04PhoneClueFound`. Before adding flags, Claude must check for an existing exact-equivalent flag and reuse it rather than duplicate state.
Both entries are optional and never gate an act, puzzle, item grant or ending.
**Reason:** The Journal needs stable entry identity and idempotent discovery, but presentation must not create duplicate authoritative state.

## D-04 — Co-op ending quorum
**Decision:** Retain the already owner-approved END-A01 contract in `ENDING_IMPLEMENTATION_SPEC.md`:
- ESCAPE and THE_TRUTH: strict majority of currently connected eligible players.
- THE_NEW_GUEST: unanimous explicit affirmative confirmation from every currently connected eligible player.
- No response, timeout, capture or defeat is never consent.
- Disconnect removes that player from the active electorate; for THE_NEW_GUEST, remaining connected players must explicitly reconfirm.
- ESCAPE/THE_TRUTH tie or timeout resolves to ESCAPE if eligible; otherwise the vote remains open for another attempt.
**Reason:** Preserve majority agency for standard resolutions and require full explicit consent for the irreversible cycle-acceptance ending.

## D-05 — Objective navigation
**Decision:** No persistent GPS marker, route line or through-wall clue/monster marker. The HUD gives text objectives and collection counts only. A short diegetic cue may guide players to a previously discovered objective (for example, a light cue toward the breaker) only when explicitly authored.
**Reason:** Keep the motel exploratory and frightening without allowing navigation UI to reveal undiscovered content or THE GUEST.

## D-06 — Narrative canon boundary
This was the status at the time of the original R1 decision record. It was superseded on 2026-11-16 by express owner delegation: NCP-A01–A09 are approved canonical English content in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md and must be implemented exactly. Approval of narrative copy does not create/acquire visual assets, VO recordings or prove UEFN implementation.

## Files synchronized
- `GAMEPLAY_UI_UX_SPEC.md`
- `ACT_AND_OBJECTIVE_MATRIX.md`
- `END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md`
- `ENDING_IMPLEMENTATION_SPEC.md`
- `STORY_DOCUMENT_REGISTER.md`
- `INTERACTION_MASTER_REGISTER.csv`

## Implementation handoff
Claude: update objective/evidence definitions and Verse bindings to match this record; check for duplicate flags before creating new ones; implement only the approved END-A02 formula and END-A01 quorum; verify every truth clue is reachable/recoverable and journal-readable in solo and co-op. Report any mismatch as a blocker rather than silently changing these decisions.
