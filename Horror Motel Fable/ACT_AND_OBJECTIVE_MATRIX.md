# ACT & OBJECTIVE MATRIX — THE MOTEL: ROOM 13

Six approved act names and timings are retained. Timings are targets, not hard timers.

| Act | Target | Environments | Primary objectives | Evidence / puzzle | Exit state |
|---|---:|---|---|---|---|
| I — THE ARRIVAL | 0–8 | Road, car, parking, neon, balcony, reception | Reach motel; inspect front desk; hear phone; see anomalous key | Twelve-room register/key rack; ROOM 13 key; phone line | Investigation started |
| II — THE REGISTER | 8–17 | Reception, office, rooms 01–06 | Solve register; obtain Office Key; solve office photo clue; investigate ground-floor rooms (optional lore) | Three-part register code; separate office photo clue; room anomalies; Room 06 archive is optional evidence for THE_TRUTH | RegisterSolved; OfficeAccessGranted; OfficePhotoPuzzleSolved; UpperFloorAccessGranted |
| III — THE POWER | 17–27 | Storage, utility/electrical room | Find three fuses; install; restore power; evade first full chase | Fuse A/B/C and labelled panel | PowerRestored; CP02 |
| IV — THE SECOND FLOOR | 27–36 | Rooms 07–12, balcony, concealed panel | Open Room 12 panel and reach passage; investigate diary/drawing as optional evidence | Room 09 diary and Room 11 drawing are optional discoveries; Room 12 panel opens the route | SecretPanelOpened; Room13Unlocked; CP03 |
| V — ROOM 13 | 36–43 | Passage and impossible room | Inspect room; order four photos; reveal identity; obtain Service Key | Four-photo chronology; owner portrait/records/creature match | Room13RevealComplete; ServiceKeyObtained; CP04 |
| VI — NO VACANCY | 43–50 | Service route, gate/generator, car | Unlock service route; choose an eligible ending; optionally collect CarKeys and ignite the vehicle for ESCAPE only | Service Key; powered gate; CarKeys/vehicle ignition for ESCAPE only; explicit team choice | FinaleReady; exactly one ending selected |

## Per-act handoff contract
- ACT I: objects are broken car, neon, register, phone, clock, key rack and ROOM 13 key. THE GUEST appears only as distant scripted silhouette. No forced chase. No mandatory item may become missable.
- ACT II: register wrong input is retryable; Office Key is granted once; office photo puzzle is distinct from ROOM 13 puzzle. Room 03 reflection is a scare, not mandatory capture. CP01 retains register solution and office access.
- ACT III: fuse pickups are team-shared and idempotent. Wrong slot feedback does not consume irreplaceable fuse. Power restoration triggers investigation and fair first chase. CP02 retains fuses/power.
- ACT IV: diary/drawing clues must be readable when inspected but are not core progression gates; Room 12 panel opens the passage. Passage must be continuous and navigable. CP03 retains upper access and any evidence already discovered.
- ACT V: photo puzzle is resettable and no-item-loss. All players can inspect. CP04 retains photo solution, reveal and Service Key.
- ACT VI: service gate establishes FinaleReady; CarKeys/vehicle ignition are required only for ESCAPE. THE_TRUTH and THE_NEW_GUEST do not require vehicle ignition. Final chase has loop/alternate path, no unavoidable dead end. Team defeat returns to latest checkpoint. Capture never auto-selects New Guest.

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

## Resolved design decisions (2026-11-16)
- Act II does not require inspecting all rooms 01–06. Mandatory exit is OfficePhotoPuzzleSolved + UpperFloorAccessGranted after register/Office Key progression. Room 01 CRT, Room 03 mirror, Room 04 recording and Room 05 footsteps are optional. Room 06 photo archive is optional to core progress but required for THE_TRUTH evidence gate.
- END-A02 is approved: TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. This gates THE_TRUTH only; ESCAPE remains available without it.
- Ending quorum is governed by END-A01 in ENDING_IMPLEMENTATION_SPEC.md: majority for ESCAPE/THE_TRUTH; unanimous explicit affirmative consent for THE_NEW_GUEST.

## Remaining implementation and verification dependencies

- NCP-A01–A09 and END-A02 are approved and canonical; no further owner content approval is pending. Implement the exact English content in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md.
- UEFN/editor verification of the approved R2.3 secret passage, stair, balcony, furniture clearance and all mandatory routes remains open.
- Editor verification of final gate/generator/vehicle actor placements and the documented PZ-05 interaction sequence remains open.
- Runtime solo/2-player/4-player pacing, chase, rescue, ending and recovery tests remain NOT RUN until evidence is attached.

The register code, office photo solution, fuse locations, CarKeys/Screwdriver locations, PZ-05 prerequisite chain, THE TRUTH sequence and New Guest consent copy are specified. Narrative copy is canon; visual assets and implementation evidence remain separate production deliverables.
