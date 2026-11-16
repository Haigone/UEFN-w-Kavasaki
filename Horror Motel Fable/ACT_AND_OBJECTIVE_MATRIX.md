# ACT & OBJECTIVE MATRIX — THE MOTEL: ROOM 13

Six approved act names and timings are retained. Timings are targets, not hard timers.

| Act | Target | Environments | Primary objectives | Evidence / puzzle | Exit state |
|---|---:|---|---|---|---|
| I — THE ARRIVAL | 0–8 | Road, car, parking, neon, balcony, reception | Reach motel; inspect front desk; hear phone; see anomalous key | Twelve-room register/key rack; ROOM 13 key; phone line | Investigation started |
| II — THE REGISTER | 8–17 | Reception, office, rooms 01–06 | Solve register; obtain Office Key; solve office photo clue; investigate ground-floor rooms (optional lore) | Three-part register code; separate office photo clue; room anomalies; Room 06 archive is optional evidence for THE_TRUTH | RegisterSolved; OfficeAccessGranted; OfficePhotoPuzzleSolved; UpperFloorAccessGranted |
| III — THE POWER | 17–27 | Storage, utility/electrical room | Find three fuses; install; restore power; evade first full chase | Fuse A/B/C and labelled panel | PowerRestored; CP02 |
| IV — THE SECOND FLOOR | 27–36 | Rooms 07–12, balcony, concealed panel | Find diary; inspect child's room; open Room 12 panel; reach passage | Room 09 diary; Room 11 drawing; Room 12 panel | SecretPanelOpened; Room13Unlocked; CP03 |
| V — ROOM 13 | 36–43 | Passage and impossible room | Inspect room; order four photos; reveal identity; obtain Service Key | Four-photo chronology; owner portrait/records/creature match | Room13RevealComplete; ServiceKeyObtained; CP04 |
| VI — NO VACANCY | 43–50 | Service route, gate/generator, car | Recover Car Keys; operate service mechanism; select ending | Car Keys; Service Key; explicit choice | Exactly one ending selected |

## Per-act handoff contract
- ACT I: objects are broken car, neon, register, phone, clock, key rack and ROOM 13 key. THE GUEST appears only as distant scripted silhouette. No forced chase. No mandatory item may become missable.
- ACT II: register wrong input is retryable; Office Key is granted once; office photo puzzle is distinct from ROOM 13 puzzle. Room 03 reflection is a scare, not mandatory capture. CP01 retains register solution and office access.
- ACT III: fuse pickups are team-shared and idempotent. Wrong slot feedback does not consume irreplaceable fuse. Power restoration triggers investigation and fair first chase. CP02 retains fuses/power.
- ACT IV: diary/drawing/panel clues must be readable. Passage must be continuous and navigable. CP03 retains upper access and required evidence.
- ACT V: photo puzzle is resettable and no-item-loss. All players can inspect. CP04 retains photo solution, reveal and Service Key.
- ACT VI: final chase has loop/alternate path, no unavoidable dead end. Team defeat returns to latest checkpoint. Capture never auto-selects New Guest.

## Puzzle dependency chain
1. Register puzzle → Office Key.
2. Office photo clue → upper-floor access.
3. Fuse A/B/C → PowerRestored.
4. Room 12 panel → ROOM 13.
5. Four-photo chronology → owner reveal / Service Key.
6. Car Keys + Service Key + final service mechanism → escape-ready state.
7. Explicit choice → one ending.

## Secondary objectives
No fixed side-quest or collectible chain is defined. Optional environmental lore may enrich play but cannot gate mandatory progress. Any new side objective is PROPOSAL and requires dependency review.

## Resolved design decisions (2026-11-16)\n- Act II does not require inspecting all rooms 01–06. Mandatory exit is OfficePhotoPuzzleSolved + UpperFloorAccessGranted after register/Office Key progression. Room 01 CRT, Room 03 mirror, Room 04 recording and Room 05 footsteps are optional. Room 06 photo archive is optional to core progress but required for THE_TRUTH evidence gate.\n- END-A02 is approved: TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. This gates THE_TRUTH only; ESCAPE remains available without it.\n- Ending quorum is governed by END-A01 in ENDING_IMPLEMENTATION_SPEC.md: majority for ESCAPE/THE_TRUTH; unanimous explicit affirmative consent for THE_NEW_GUEST.\n\n## Remaining design and approval dependencies

- Owner approval of narrative copy and puzzle clue text: consolidated as NCP-A01–A09 in OWNER_DECISION_PACKET_R1.md. The complete proposal is in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md.
- Owner approval of END-A02 mandatory truth evidence: recommended three-clue gate in END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md; pending.
- UEFN/editor verification of the approved R2.3 secret passage, stair, balcony and all mandatory routes.
- Editor verification of final gate/generator/vehicle actor placements and the documented PZ-05 interaction sequence.
- Runtime solo/2-player/4-player pacing, chase, rescue, ending and recovery tests.

The register code (02-13-86), office photo solution (1974/1978/1982/1986), fuse locations, CarKeys/Screwdriver locations, PZ-05 prerequisite chain, THE TRUTH draft sequence and New Guest consent copy are documented in the current puzzle sheets/proposal pack; they are no longer missing at draft-specification level. Do not mark the draft narrative canon until the owner decision is recorded.
