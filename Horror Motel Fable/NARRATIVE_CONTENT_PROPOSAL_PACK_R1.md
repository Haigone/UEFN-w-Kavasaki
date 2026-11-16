# NARRATIVE CONTENT PROPOSAL PACK — THE MOTEL: ROOM 13
Revision: NCP-01 | 2026-11-16
Status: **COMPLETE DRAFT PACKAGE — PROPOSAL ONLY — NOT OWNER-APPROVED**
Language of in-game content: English.

Purpose: supply complete draft copy and puzzle logic for the missing narrative deliverables. This pack closes the writing gap at proposal level; it does not make new creative content canon. The owner must approve or revise each item before Claude implements it.

## 0. Continuity rules
- Raven Motel, United States, 1986; twelve public rooms.
- Motifs: 02:13, Room 13, and date/code 02-13-86.
- Owner and THE GUEST are the same identity or manifestations of the same identity.
- The motel repeats a night and absorbs guests into ROOM 13.
- Mandatory information is readable or subtitled.
- PZ-01 register, PZ-02 office photos and PZ-04 ROOM 13 photos are separate puzzles.
- Rewards are team-shared and granted only by their designated interaction IDs.

## 1. PZ-01 — Guest Register (02-13-86)

### Proposed player-facing copy
**RAVEN MOTEL — NIGHT REGISTER**
**Thursday, February 13, 1986**

| Room | Guest | Check-in | Notes |
|---|---|---|---|
| 02 | E. Mercer | 8:06 PM | One suitcase. Asked for a flashlight. |
| 07 | H. Doyle | 9:14 PM | Paid cash. No vehicle listed. |
| 11 | M. Vale | 10:02 PM | Requested a room away from the stairs. |
| 13 | RESERVED | 2:13 AM | No key issued. Do not enter. |

**Handwritten desk note:** "First occupied room. Night of the month. Last two digits of the year. In that order."

### Solution proof
- First occupied room in the register: 02.
- Night/day of the register date: 13.
- Last two digits of 1986: 86.
- Result: 02-13-86.
- The anomalous Room 13 reservation is a thematic misdirection, not the first code field.

Input must visibly accept the three two-digit fields. Recommended presentation: 02 / 13 / 86; implementation must choose one input convention and display it.
Success: RegisterSolved=true; drawer opens; Office Key is granted only through IN-006.
Failure: neutral reject cue, reset input, no lockout, no item consumption.
Solo/co-op: one player can solve; any active player may submit; team flag commits once.

## 2. PZ-02 — Owner's Office photo puzzle

### Proposed captions
1. **1974 — THE FIRST SUMMER:** the owner stands beside the newly painted RAVEN MOTEL sign; twelve room markers are visible.
2. **1978 — THE NEW WING:** the owner cuts a ribbon at the upper balcony; a background figure has the owner's face.
3. **1982 — STAFF PORTRAIT:** the owner sits alone at reception; the wall clock reads 02:13.
4. **1986 — CLOSING NIGHT:** reception is empty; a ROOM 13 key lies on the counter; the owner appears only as a reflection in the dark window.

### Solution and acceptance
Place photographs in ascending year order: 1974 → 1978 → 1982 → 1986. The year is printed legibly on each frame; no pixel hunting is required.
Success: UpperFloorAccessGranted=true.
Wrong order: soft mechanical reset and neutral feedback; no penalty.
This puzzle is distinct from the later ROOM 13 photo sequence.

## 3. PZ-03 — Fuse placement and clue chain

### Pickup mapping (matches IN-024–IN-026)
- Fuse A — ROOM 02, inside the opened suitcase beside the spare flashlight battery.
- Fuse B — STORAGE, on shelving beside the wet-floor sign.
- Fuse C — ROOM 06, inside the maintenance cabinet.

### Proposed readable labels
- ROOM 02 suitcase tag: "A — FRONT DESK CIRCUIT. Spare fuse. Return to the utility panel."
- Storage shelf label: "B — HALL / BALCONY CIRCUIT. Keep dry."
- ROOM 06 cabinet label: "C — SERVICE CIRCUIT. Maintenance stock."

## 4. ROOM 04 phone recording — complete proposed transcript

**Speaker:** unidentified night clerk, recorded in 1986.
**Delivery:** exhausted, restrained, trying to sound procedural.

> "If you're hearing this, the lights have gone again. The spare marked A is with the guest's flashlight. B is on the storage shelf by the wet-floor sign. C is in the maintenance cabinet in Six. Match the letters. Don't force a fuse into the wrong socket. And if the clock says two thirteen... don't answer the phone."

Provide verbatim subtitles and a readable transcript beside the phone. Audio is not the sole source of mandatory fuse information.
PZ-03 solution: insert A/B/C into matching labelled sockets, close cover, activate breaker. PowerRestored=true only after all three distinct slots are filled and breaker interaction succeeds. Wrong-slot rejection must not consume the fuse.

## 5. ROOM 06 missing-guest photo board

### Proposed photographs
- **1968 — M. HARROW, LAST CHECK-IN:** a guest stands outside Room 02; in the motel window behind him, a tall figure has the owner's face.
- **1974 — THE VALE PARTY:** three guests pose by the courtyard; one face is scratched out; the same figure appears in an upper-balcony reflection.
- **1981 — NIGHT AUDIT:** empty reception at 02:13; the register reads "NO CHECK-OUT RECORDED".
- **1986 — CLOSING NIGHT:** guests stand at the entrance; the owner is absent from the group but appears behind them in the glass.

**Back-of-frame note:** "Every name was checked in. None was checked out."
Player inference: disappearances span decades and the same uncanny figure appears across years.
Flag MissingGuestEvidenceFound is granted through IN-029 only after inspection.
Truth-chain role remains pending END-A02 approval.

## 6. ROOM 09 diary — complete proposed text

**Cover:** PRIVATE — NIGHT MANAGER'S LOG  
**Dates:** 12–13 February 1986.

**12 FEBRUARY — 11:40 PM**  
The owner came through the lobby again. I heard the front door, then the desk bell, but the rain never stopped and the glass never moved. He asked whether the register was ready. I told him there were no guests. He said the register disagreed.

**13 FEBRUARY — 12:05 AM**  
There are twelve rooms on the plans. I checked every wall myself. The owner says the thirteenth room is not on the plans because it is not meant for guests. Then why is there a key on the rack?

**13 FEBRUARY — 1:17 AM**  
A woman came downstairs carrying a suitcase. She asked me to call her family. The telephone rang before I touched it. When I picked up, I heard my own voice telling her to go back upstairs.

**13 FEBRUARY — 2:13 AM**  
The clock stopped. The owner was standing at the far end of the corridor. I could see his face clearly. Then the lights flickered and the thing at the end of the corridor was still wearing it.

**13 FEBRUARY — 2:14 AM**  
I locked the office. The register is open on the desk. There is a new line in the book. My handwriting. I do not remember writing it.

**13 FEBRUARY — NO TIME**  
If someone finds this, do not trust a room number just because it is printed on a door. The room is where the motel keeps what it cannot check out.

Provide close-range readable text and a journal copy after inspection. Truth-chain role remains pending END-A02 approval.

## 7. ROOM 11 child's drawing

**Visual:** a U-shaped motel around a black courtyard. Twelve small windows surround it. A thirteenth window floats above the roofline, with a tall stick figure behind it. The figure wears the same round lapel pin as the owner in the office photographs.

**Child's caption:** "HE IS IN EVERY ROOM. THE ONE WITH NO DOOR IS HIS."
**Back of paper:** "13 / 2:13" in crayon.

Inference: ROOM 13 is not a normal room; the owner/figure identity recurs.
ChildRoomClueFound is granted on inspection. Supporting clue / truth-chain role pending END-A02.

## 8. ROOM 13 photo sequence — PZ-04

This is a separate photo set from the office puzzle and Room 06 board.

### Proposed photo fronts and backs
1. **1968 — THE OWNER, BEFORE THE MOTEL:** a young man in a roadside uniform beside a highway sign; his face matches the ROOM 13 portrait. Back: "Before there was a room, there was a promise."
2. **1974 — OPENING DAY:** the same man at the Raven Motel entrance; twelve room keys hang behind him. Back: "Twelve rooms for the road."
3. **1981 — THE LAST STAFF PHOTO:** the man alone in reception; clock reads 02:13; a shadow behind him has THE GUEST's outline. Back: "The night stopped at 2:13."
4. **1986 — NO VACANCY:** the owner stands in a doorway absent from every floor plan; his reflection is THE GUEST. Back: "The thirteenth room was never built. It was kept."

### Unique solution and state contract
Ascending chronology: 1968 → 1974 → 1981 → 1986. Dates are printed on the front; journal copies preserve all dates and captions.
Success: PhotoSequenceSolved=true; frames illuminate in order; owner portrait aligns with the creature's face; hidden compartment opens; Service Key becomes available through IN-017 only.
Room13RevealComplete=true only after the reveal cue has played and all players receive the readable/journal version. The puzzle alone must not set the reveal flag.
TruthChainComplete is evaluated separately and only after END-A02 approval.

## 9. THE TRUTH — distinct ending proposal

**Eligibility candidate:** CoreEscapeReady, Room13RevealComplete, ServiceKeyObtained, ServiceRouteReady, approved mandatory evidence complete, explicit team choice, Ending=NONE.

**Player action:** use the Service Key to open the sealed service control room; place the four ROOM 13 photographs on the control-room evidence rail; activate the old night-audit recorder.

**Sequence beats**
1. The recorder plays the night manager's 02:13 entry; show the text as subtitles.
2. Service lights reveal THE GUEST at the opposite end of the corridor.
3. Owner portrait and THE GUEST face align in a reflection; no second identity is introduced.
4. Player activates the breaker marked "NIGHT AUDIT — END CYCLE".
5. Motel lights go out room by room; the neon remains lit at 02:13.
6. Corridor is empty. The register prints: "NO VACANCY. NO OWNER. NO GUEST."
7. Cut to black; THE TRUTH title card.

**Proposed consequence:** players expose the loop and prevent the current night from restarting, but the motel remains physically present. The final 02:13 neon pulse implies the source may not be destroyed. This is distinct from vehicle escape.
No new voiced dialogue is required. This sequence and consequence require owner approval before implementation.

## 10. THE NEW GUEST — invitation and consent proposal

**Invitation text:**  
"THE ROOM IS READY.  
The night can begin again.  
Someone must keep the light on.  
Will you stay?"

Choices:
- ACCEPT THE ROOM
- LEAVE THE KEY

Every connected player sees the same invitation. No player is selected randomly. Inactivity, capture and defeat never count as acceptance. The session commits THE NEW GUEST only if the owner-approved quorum is met. Timeout/disconnect rules remain END-A01.
If quorum accepts: twelve public room lights illuminate one by one; the ROOM 13 key returns to the rack; the register gains a blank line under NEXT GUEST; neon illuminates; cut to black; THE NEW GUEST title card.
If quorum is not met: return to eligible ending choice; never auto-accept.

## 11. Subtitle and accessibility contract
- Phone recording, diary, captions and ending choice are readable in English.
- Every audio clue has subtitles or a nearby transcript.
- Do not encode solutions solely by colour, sound pitch or tiny environmental details.
- Dates and codes remain legible at intended first-person interaction distance.
- Journal copies preserve mandatory clue content without revealing uninspected optional lore.

## 12. Owner approval checklist
| ID | Approval required | Status |
|---|---|---|
| NCP-A01 | Register copy and 02-13-86 deduction | PENDING |
| NCP-A02 | Office photo captions and chronological solution | PENDING |
| NCP-A03 | Fuse labels and Room 04 transcript | PENDING |
| NCP-A04 | Room 06 photo content and truth-chain role | PENDING |
| NCP-A05 | Room 09 diary and truth-chain role | PENDING |
| NCP-A06 | Room 11 drawing/caption and truth-chain role | PENDING |
| NCP-A07 | ROOM 13 photos, captions and reveal sequence | PENDING |
| NCP-A08 | THE TRUTH action, consequence and sequence | PENDING |
| NCP-A09 | THE NEW GUEST invitation and consent copy | PENDING |
| NCP-A10 | Co-op quorum and mandatory evidence list | PENDING |

## 13. Handoff
After owner approval, copy approved content into canonical narrative documents and story register; synchronize puzzle/interaction flags, subtitles, journal and audio cue sheets. Claude implements the approved text exactly and tests clue readability, transcript fallback, solo/co-op progression, duplicate triggers and recovery. Unapproved text remains proposal and must not be implemented as canon.
