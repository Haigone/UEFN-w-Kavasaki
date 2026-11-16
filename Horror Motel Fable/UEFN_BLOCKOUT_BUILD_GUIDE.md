# UEFN BLOCKOUT BUILD GUIDE — LD-GEO R2.1
Purpose: exact greybox execution brief for Claude. Greybox only; not authorization for final environmental art.

## Source and conversion
Use LEVEL_DESIGN_GEOMETRY.md R2.1 as geometry authority. Convert every metre coordinate to Unreal cm by multiplying X/Y/Z by 100. Origin SW. Do not use legacy R1/E1 values where R2.1 supersedes them.

## Build order
1. Create site datum, origin marker, 1 m minor/5 m major grid.
2. Create one polygon-union U footprint; trim overlapping wing junctions.
3. Ground slab and room shells; shared walls once.
4. Ground doors/windows and north reception stair volume.
5. Ground partitions: reception, owner office, storage, electrical.
6. Upper slab at FFL Z=3.60; confirm 0.25 m thickness.
7. Upper side rooms with revised 5.90 m widths.
8. Build continuous balcony as one connected floor polygon: west leg, north crossbar, east leg, corner pads. Keep 2.50 m clear.
9. Add courtyard-side rail only; 1.10 m high target; close rail corners and stair opening.
10. Build north U-turn stair: 20 risers, two flights of 10, 9 goings per flight, 0.28 m going, 0.18 m rise, landing Z=1.80, clear width 1.20 m.
11. Build ROOM 12 vestibule, east balcony access opening, north crossbar and ROOM 13 door as one continuous route.
12. Flat roof slab Z=6.40–6.65 and parapet top Z=7.10; no gameplay roof access.
13. Primitive furniture bounding boxes; preserve door swings, 0.90 m routes and 1.20×1.20 m interaction pads.
14. Add THE GUEST placeholder at 2.60 m visual height; provisional navigation envelope only. Set up patrol markers on both floors and stair.
15. Run solo, 2P and 4P traversal, stair and balcony tests; run NPC path tests up/down stairs.
16. Correct geometry, schedules and sections before any final art.

## Greybox modular targets
Exterior wall 3.00×0.30×3.00 m; interior wall 3.00×0.15×3.00 m; floor tile 1×1 m; ordinary rough door module 1.20×2.25 m for 0.90×2.10 clear; reception rough module 1.90×2.45 m; window rough module 1.80×1.40 m. PROPOSED TARGET.

## Collision rules
Continuous floors at thresholds; no duplicate collision in U corners; wall collision only except scheduled openings; glass collision intentional; door/panel collision synced to state; continuous rail collision along courtyard edge; stair step collision tested for players and THE GUEST; secret route no snagging seams; roof inaccessible.

## Required test evidence
Record UEFN version/build, map revision R2.1, test player count, NPC implementation, route, expected result, actual result, screenshots/video and pass/fail. Never label ENGINE-VERIFIED without evidence.