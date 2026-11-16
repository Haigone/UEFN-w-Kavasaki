# STORY DOCUMENT REGISTER — THE MOTEL: ROOM 13

| ID | Act / location | Document or clue | Narrative function | Source status | Mandatory |
|---|---|---|---|---|---|
| NAR-001 | I Reception | Guest register | Twelve-room context; three-part code | Approved entries and code 02-13-86 in NARRATIVE_CONTENT_PROPOSAL_PACK_R1 | Yes |
| NAR-002 | I Reception | ROOM 13 key/tag | Impossible room contradiction | Specified | Yes |
| NAR-003 | I Reception | Phone call | Invitation | Exact line approved | Yes |
| NAR-004 | I Reception | Clock / 02:13 | Repeating-night motif | Motif specified | Supporting |
| NAR-005 | II Office | Owner photos, records, calendar | Foreshadow identity; office puzzle | Approved captions and order 1974/1978/1982/1986 in proposal pack | Yes for access |
| NAR-006 | II Room 01 | CRT corridor feed | Spatial impossibility | Beat specified; image absent | Optional supporting evidence |
| NAR-007 | II Room 02 | Suitcase and battery | Prior guest evidence/resource | Battery specified; text absent | Resource |
| NAR-008 | II Room 03 | Cracked mirror / reflection | Uncertain presence | Beat specified | Supporting |
| NAR-009 | II Room 04 | Telephone recording | Supporting fuse/safety clue | Approved transcript; supporting evidence, not required for fuse progression | Optional supporting evidence |
| NAR-010 | II Room 05 | Ceiling footsteps | Impossible architecture | Beat specified | Supporting |
| NAR-011 | II Room 06 | Missing guest photos | Link disappearances to ROOM 13 | Approved photo identities/dates; END-A02 evidence flag MissingGuestEvidenceFound | Candidate END-A02 evidence; mandatory role pending owner approval; optional to ESCAPE/core progress |
| NAR-012 | IV Room 09 | Diary | Primary history evidence | Approved full text; END-A02 evidence flag DiaryFound | Required for THE_TRUTH only; optional to ESCAPE/core progress |
| NAR-013 | IV Room 11 | Child's room/drawing | Unease/foreshadowing | Approved caption; END-A02 evidence flag ChildRoomClueFound | Required for THE_TRUTH only; optional to ESCAPE/core progress |
| NAR-014 | IV Room 12 | Concealed panel | Opens secret passage | Screwdriver-opened concealed panel; exact actor/animation remains editor implementation detail | Yes |
| NAR-015 | V ROOM 13 | Four chronological photos | Owner reveal and hidden compartment | Approved dates/captions/order 1968/1974/1981/1986 in proposal pack | Yes |
| NAR-016 | V ROOM 13 | Owner portrait | Match owner to THE GUEST | Reveal role specified | Yes |
| NAR-017 | V ROOM 13 | Frozen clock at 02:13 | Motif | Specified | Supporting |
| NAR-018 | V ROOM 13 | CRT/phone/bed/wardrobe | Reveal atmosphere | Props specified | Supporting |
| NAR-019 | VI Escape | Radio message | Lingering threat | Exact line approved | Yes for ESCAPE |
| NAR-020 | VI THE TRUTH | Final cinematic | Resolve identity/source | Approved action/sequence/consequence in proposal pack | Yes |
| NAR-021 | VI THE NEW GUEST | Invitation/acceptance | Explicit consent to cycle | Approved invitation and ACCEPT THE ROOM / LEAVE THE KEY choices in proposal pack | Yes |

## Optional environmental fragments (approved, non-gating)
See NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md Section 14 and UI_STRING_TABLE.csv PROP-ENV-001–006. These fragments are optional dressing only and never create progression flags or ending gates.

## Exact mandatory voice lines
- Reception phone: “Welcome. We've been expecting you.”
- ESCAPE radio: “Thank you for staying at the Raven Motel. We hope to see you again soon.”

## Current content and approval status

The complete draft content for NAR-001, NAR-005, NAR-009, NAR-011, NAR-012, NAR-013, NAR-015, NAR-020 and NAR-021 is in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md. It includes the register code, office photo order, Room 04 transcript, Room 06 archive, Room 09 diary, Room 11 drawing, ROOM 13 chronology, THE TRUTH finale and THE NEW GUEST invitation.

The content is approved canon under express owner delegation; NCP-A01–A09 in OWNER_DECISION_PACKET_R1.md. NAR-003 reception phone line and NAR-019 ESCAPE radio line remain exact approved lines. END-A01 co-op quorum is separately approved and closed. END-A02 evidence gating is approved.

Remaining production deliverables (not missing narrative concepts): final asset/image/audio sourcing, runtime readability tests and any additional localization beyond the approved English baseline.


## Narrative proposal status — 2026-11-16

The missing player-facing draft copy and puzzle clue chains have been authored in `NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md`. It contains approved Guest Register text/code deduction, office photo captions/solution, fuse labels and Room 04 recording, Room 06 missing-guest photos, Room 09 diary, Room 11 drawing, ROOM 13 photo sequence, THE TRUTH sequence and THE NEW GUEST invitation.

This changes the status from **no draft text available** to **draft proposal available**; it does not change any item to approved canon. NCP-A01–A09 and END-A02 are APPROVED under express owner delegation. END-A01 co-op quorum is separately APPROVED and closed. Claude must implement the approved text exactly as final canon.
\n\n## Canonical gameplay decisions — 2026-11-16\n- Act II room-by-room inspection is optional; no requirement to inspect every room 01–06.\n- Room 01 CRT and Room 04 phone are optional supporting journal discoveries, not gates. Suggested stable evidence IDs: `EV-ROOM01-CRT` and `EV-ROOM04-PHONE`; discovery flags: `Room01CRTClueFound` and `Room04PhoneClueFound` (reuse an existing exact-equivalent flag if present).\n- Room 06 archive, Room 09 diary and Room 11 drawing are optional to core progress/ESCAPE but required together for THE_TRUTH under approved END-A02.\n- Draft narrative copy remains draft; approval of gameplay dependency does not silently canonize exact prose or visual assets.\n

## Optional prop text decision
PROP-ENV-001–006 are approved for optional environmental dressing exactly as listed in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md Section 14. They are non-gating, do not create journal entries/evidence flags and may be omitted if a prop placement is unavailable. Their UI String IDs are present in UI_STRING_TABLE.csv.
