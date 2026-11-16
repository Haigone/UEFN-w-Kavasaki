# UEFN BLOCKOUT BUILD GUIDE — LD-GEO R2.2
Purpose: geometry-specific greybox handoff for Claude. Greybox only; not authorization for final environmental art.
Status: R2.2 PROPOSAL — NOT OWNER-APPROVED — NOT UEFN-VERIFIED.

## Source and conversion
Use LEVEL_DESIGN_GEOMETRY.md R2.2 as the candidate geometry authority. Read ROOM_COORDINATE_REGISTER.csv, coordinate_schedule.csv, DOOR_WINDOW_SCHEDULE.csv, door_window_schedule.csv (mirror only), wall_schedule.csv, SLAB_SCHEDULE.csv, LEVEL_SECTIONS.md and both R2.2 floor plans. Convert metres to Unreal cm by multiplying X/Y/Z by 100. Origin SW; +X east, +Y north, +Z up. Owner approval is required before geometry freeze.

## Build order
1. Create site datum, origin marker, 1 m minor / 5 m major grid.
2. Build one U-shaped footprint polygon from SLAB_SCHEDULE.csv; courtyard X20–64,Y18–48 remains void/open to sky. Do not overlap the wing junctions.
3. Build GF slab and wall centre-lines from schedules. Apply unique wall IDs once; merge/miter T-junctions rather than stacking duplicate full-thickness meshes.
4. Build ground rooms 01–06, outer side corridors and south-end vestibule buffers. The 2 m cross-bays have 1.50 m openings on both corridor and courtyard sides.
5. Build north connector: NW link, west lobby, reception, owner office, storage/service bay, electrical and NE link. Electrical ends X72.90; preserve east link X73.20–75.70.
6. Build GF door/window openings from DOOR_WINDOW_SCHEDULE.csv. Opening centres are on host wall centre-lines.
7. Build upper slab at FFL Z3.60, underside Z3.35, thickness0.25; include UF-STAIR-OPENING X22.50–25.50,Y52.30–56.32. Courtyard excluded.
8. Build upper rooms 07–12 at 8.70 m width, south-end vestibule buffers and upper cross-bays. Do not use obsolete R2.1 5.90 m room widths.
9. Build continuous upper balcony union: west leg X17.15–19.70, north crossbar X19.70–64.30,Y48.30–50.80, east leg X64.30–66.85 and two corner pads. Union all five components into one floor/collision surface. U-NORTH-HALL is a functional alias of the north balcony, not a second floor. Preserve at least 2.50 m clear after finishes.
10. Build courtyard-edge guardrails 1.10 m high at centre-lines X19.85, X64.15 and Y48.15. Rails sit outside the walkable polygon; do not reduce the clear path.
11. Build north U-turn stair at X22.65–25.35,Y52.45–56.17: 20 risers, two flights of 10, nine goings per flight at0.28 m, riser0.18 m, intermediate landing Z1.80, 1.20 m clear flight width. Upper slab cut and three-edge guardrail are mandatory; south approach remains open and ≥1.20 m.
12. Build ROOM 12→ROOM 13 route exactly: D-13A (69.95,47.475), vestibule X67–72.90,Y47.55–49.20, D-13C (66.925,48.45), east corner pad/balcony leg, north balcony, D-13B (56.35,50.95). Verify bidirectional passage.
13. Build ROOM 13 in north connector upper floor at X49–63.70,Y51.10–59.70.
14. Build flat roof over the U polygon only: underside Z6.40, top Z6.65, parapet top Z7.10. Courtyard remains open; roof is non-playable. Join the courtyard-side parapet centre-lines continuously at both north U-corners per wall_schedule.csv.
15. Add placeholder furniture only after owner-approved room bounds. Preserve door swings, 0.90 m routes and 1.20×1.20 m interaction pads.
16. Add THE GUEST placeholder at 2.60 m visual height; provisional navigation markers on both floors. Stair and all nav routes remain EDITOR-TEST REQUIRED.
17. Run player/NPC tests in UEFN and attach evidence. This guide does not claim any tests were run by the author.

## Wall and opening targets
- Exterior walls: 0.30 m.
- Standard room partitions: 0.15 m.
- Selected connector partitions where FIF zones are separated by 0.30 m: 0.30 m.
- Guardrails: target 0.10 m thickness, 1.10 m high.
- Roof parapet: target 0.20 m thickness, 0.45 m above roof.
- Door/window clear sizes and host wall IDs are controlled by DOOR_WINDOW_SCHEDULE.csv. Do not eyeball or offset centres.

## Collision rules
Continuous floors at thresholds; no duplicate collision in U corners; wall collision only except scheduled openings; glass collision intentional; door/panel collision synced to state; continuous balcony rail collision; stairwell opening guarded on west/east/north edges and open on south approach; stair collision tested for players and THE GUEST; secret route no snagging seams; roof inaccessible.

## Required test evidence
Record UEFN version/build, map revision R2.2, test player count, NPC implementation, route, expected result, actual result, screenshots/video and pass/fail. Never label ENGINE-VERIFIED without evidence. If owner approval is not yet recorded, mark build geometry PROPOSED and do not finalise environmental art.