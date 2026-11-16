# ROOM INTERIOR FIT-OUT SPECIFICATION R1

**Status:** Design baseline selected; editor, collision and navigation validation required.  
**Authority:** LD-GEO R2.3 controls all room envelopes and structural geometry. This document controls interior furnishing only and never authorizes structural changes.

## 1. Scope and governing decisions

GEO-A15 excluded bathroom subdivisions and room interior fit-out from the geometry approval. The delegated design authority is exercised here: use the existing room_furnishing_schedule.csv as the placement baseline, retaining all current furniture coordinates as proposed placements subject to the checks below. This does not add walls, doors or openings. Any item that fails clearance is moved within its assigned room and the schedule is revised; never move an approved wall or opening to accommodate furniture.

## 2. Placement and clearance rules

- Coordinates are metres; X east, Y north, Z up; yaw is degrees.
- Ground floor FFL is Z=0.00 m; upper floor FFL is Z=3.60 m.
- Confirm each mesh pivot before placement. Schedule coordinates refer to the mesh placement origin, not necessarily its geometric centre.
- Keep a continuous 0.90 m minimum player route from the room door to the main interaction; 1.10 m preferred.
- Keep 1.20 m clear at door approaches, 0.90 m clear of door leaf/swing envelopes and 0.60 m in front of mandatory interactables.
- Hide interactions exist only at authored hiding spots mapped to IN-021. Decorative wardrobes do not become hiding spots automatically.
- Bathroom props are dressing only; no plumbing simulation or new bathroom partition/door is authorized.
- Furniture collision must not create a narrow trap, block the exit or make THE GUEST route impossible.
- Every new furnishing row requires unique FURN_ID, exact XYZ/yaw/dimensions, collision, interaction status, room ID and gameplay role.

## 3. Standard room kit

Rooms 01–12 use a reusable kit: double bed, headboard, two bedside tables, wardrobe, desk, chair, lamp, CRT/telephone where scheduled, vanity, toilet, shower and mirror where the room envelope permits. Reuse the same meshes/material instances. Do not create one-off meshes for each room.

Room-specific gameplay:
- ROOM 01: CRT anomaly. Optional; does not gate progression.
- ROOM 02: Fuse A in suitcase and battery pickup are distinct actors and distinct flags. Both remain reachable and visually distinguishable.
- ROOM 03: mirror scare only; no mandatory clue and no collision trap.
- ROOM 04: telephone recording and transcript; separate from decorative telephone mesh if necessary.
- ROOM 05: ceiling footsteps are atmosphere only; never audio-only mandatory information.
- ROOM 06: missing-guest photo archive and Fuse C maintenance cabinet are separate actors, separate flags and separately readable/collectable.
- ROOM 07–08 and ROOM 10: standard dressing; no new mandatory clue.
- ROOM 09: Night Manager diary visible, readable in-world and journal-backed.
- ROOM 11: child's drawing mounted at readable height, with journal transcript.
- ROOM 12: secret panel has 0.90 m approach, unobstructed door swing and clear access to D-13A.
- ROOM 13: unique hero set described below.

## 4. Reception, office and utility fit-out

**Reception:** counter, register and pen, keypad, telephone, key rack, ROOM 13 key, desk drawer, CRT security monitor, clock, lamp and waiting chairs. Register and keypad must be operable from the same side of the counter without jumping or crouching.

**Owner office:** desk, office-key drawer, four-photo board, chair, filing cabinet, wall notes and lamp. Keep 1.20 m operator space in front of the board. The four year labels must be inspectable.

**Storage:** shelving, toolbox and Fuse B beside the wet-floor sign. Fuse B has a unique pickup actor.

**Electrical room:** labelled A/B/C fuse sockets, cover opened with reusable Screwdriver, breaker lever. Keep 1.20 m operator space in front of the panel and no dressing within 0.75 m of its interaction face. Breaker remains disabled until all three matching slots commit.

**Service Control Bay:** use GF-SERVICE-BAY (X 47.30–57.00 m, Y 53.85–59.70 m, floor Z 0.00 m), accessed from Storage through D-G16 using the reusable Service Key. Place the gate console, separate NIGHT AUDIT — END CYCLE breaker, status lamp and recorder at the exact anchors in SERVICE_CONTROL_BAY_LOCATION_AND_INTERACTION_SPEC_R1.md. IN-018 controls the service gate; IN-032 controls Night Audit only after THE_TRUTH is committed. U-SERVICE remains sealed and has no gameplay use.

## 5. ROOM 13 hero set

Required: four independently inspectable chronological photographs (1968/1974/1981/1986), M. Harrow portrait, clock frozen at 02:13, CRT, bed, wardrobe, rotary phone, hidden compartment and Service Key pickup. M. Harrow is the same identity/manifestation as THE GUEST; do not create a second antagonist. The photo board is PZ-04 only; the truth finale does not add another photo puzzle.

Maintain 1.20 m clear in front of the photo board, 1.00 m around the player inspection position and an unobstructed route to D-13B. Service Key is granted by IN-017 only after Room13RevealComplete.

## 6. Room acceptance checklist

- All scheduled furnishing IDs exist once and only once.
- No furnishing footprint crosses its room envelope.
- Door leaf, swing and player approach remain clear.
- Mandatory interaction approach is at least 0.60 m and prompt/text is readable.
- Player path is at least 0.90 m wide.
- Hiding spot has tested entry/exit and cannot softlock.
- THE GUEST navigation is tested separately from player clearance.
- Evidence actors and item pickups are distinct where their state flags differ.
- All mandatory text has a stable UI String ID and journal fallback.
- No progression flag is granted by a presentation-only mesh.

## 7. Acceptance status

This is the selected fit-out design baseline, not editor proof. The existing schedule remains PROPOSED TARGET until bounds, collision, interaction reach, door access and AI traversal are tested in UEFN. Furniture-only corrections are schedule revisions. Structural geometry changes require an R2.4 proposal and explicit owner approval.

## 8. R3 schedule correction log

Static bounding-box review of all 183 scheduled furnishing rows against their assigned R2.3 room envelopes found six wardrobe placements outside the room bounds. The six X coordinates have been corrected in room_furnishing_schedule.csv without changing any room/wall/opening geometry:

| FURN_ID | Old X | New X | Room |
|---|---:|---:|---|
| F01_WARDROBE | 10.40 | 11.70 | ROOM 01 |
| F02_WARDROBE | 10.40 | 11.70 | ROOM 02 |
| F03_WARDROBE | 10.40 | 11.70 | ROOM 03 |
| F10_WARDROBE | 66.00 | 67.30 | ROOM 10 |
| F11_WARDROBE | 66.00 | 67.30 | ROOM 11 |
| F12_WARDROBE | 66.00 | 67.30 | ROOM 12 |

After these changes, all 183 furnishing footprints fit within their assigned room's axis-aligned envelope under the schedule's centre-origin assumption and yaw-aware footprint calculation. This is a static bounds check only; it does not prove mesh pivot correctness, door swing clearance, wall collision, player path width or THE GUEST navigation. Those remain editor tests.
