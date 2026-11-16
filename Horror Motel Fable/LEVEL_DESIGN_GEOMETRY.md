# THE MOTEL: ROOM 13 — AUTHORITATIVE LEVEL GEOMETRY
Revision LD-GEO R2.1 | 2026-11-16 | Status: PROPOSED TARGET — NOT UEFN-VERIFIED

## Authority and decisions
This revision incorporates the owner's confirmed decisions: north stair at reception; continuous courtyard-facing upper balcony; ROOM 13 in north connector; flat roof; THE GUEST route design across both floors. R2.1 is the single candidate geometry authority. It supersedes R2.0 and resolves selected conflicts in EXECUTIVE_BUILD_DOSSIER.md and EXECUTIVE_FLOORPLANS.md E1. It is not yet approved for final environmental art.

Status vocabulary: FIXED REQUIREMENT = project constraint; PROPOSED TARGET = design value; ENGINE-VERIFIED = supported by actual UEFN evidence only; EDITOR-TEST REQUIRED = must be checked in editor/playtest.

## 1. Datum and construction conventions
Site 84×72 m; origin SW (0,0,0); +X east, +Y north, +Z up; metres; UEFN cm = metres×100. Ground FFL Z=0.00; upper FFL Z=3.60. Two storeys, U footprint, 12 visible rooms, secret ROOM 13, open courtyard. All room coordinates are finished-inside-face (FIF); wall geometry is separate. Exterior wall 0.30 m and interior wall 0.15 m are PROPOSED TARGET. Shared walls are built once. Do not make overlapping solid room boxes.

## 2. Vertical datum — flat roof
- Ground FFL: Z=0.00.
- Ground clear ceiling plane: Z=3.00; target clear height 3.00 m.
- Upper slab: top Z=3.60, thickness 0.25 m target; underside Z=3.35.
- Ground ceiling void between suspended ceiling and slab underside: 0.35 m target.
- Upper FFL: Z=3.60.
- Upper clear ceiling plane: Z=6.40; target clear height 2.80 m.
- Flat roof slab: underside Z=6.40, thickness 0.25 m target; roof walking/top surface Z=6.65.
- Roof parapet: top Z=7.10; 0.45 m above roof surface target.
All elevations are PROPOSED TARGET. No pitched roof. Roof access is not part of player progression; no roof door or ladder unless separately approved. Show roof falls/drainage without creating a player route. Section and roof drainage remain EDITOR-TEST REQUIRED.

## 3. Footprint and shared wall rule
West wing outer envelope X=8–20,Y=18–60; east wing X=64–76,Y=18–60; north connector X=8–76,Y=48–60. Courtyard X=20–64,Y=18–48 open to sky. Treat this as one polygon union; trim the 12×12 m wing junctions so there are no duplicate slabs/walls. Building footprint is not the same as room net bounds.

## 4. Ground floor
Ground room allocation remains E1 R2.0 selection:
| ID | X min–max | Y min–max | Clear m |
|---|---:|---:|---:|
| G-CW | 8.30–10.80 | 18.30–47.70 | 2.50×29.40 |
| ROOM 01 | 11.10–19.70 | 20.00–27.00 | 8.60×7.00 |
| ROOM 02 | 11.10–19.70 | 29.00–36.00 | 8.60×7.00 |
| ROOM 03 | 11.10–19.70 | 38.00–45.00 | 8.60×7.00 |
| G-CE | 73.20–75.70 | 18.30–47.70 | 2.50×29.40 |
| ROOM 04 | 64.30–72.90 | 20.00–27.00 | 8.60×7.00 |
| ROOM 05 | 64.30–72.90 | 29.00–36.00 | 8.60×7.00 |
| ROOM 06 | 64.30–72.90 | 38.00–45.00 | 8.60×7.00 |
| RECEPTION | 20.30–37.70 | 48.30–59.70 | 17.40×11.40 |
| OWNER OFFICE | 38.00–47.00 | 48.30–59.70 | 9.00×11.40 |
| STORAGE | 47.30–57.00 | 48.30–53.70 | 9.70×5.40 |
| ELECTRICAL | 57.30–75.70 | 48.30–59.70 | 18.40×11.40 |
| NORTH LINK WEST | 8.30–20.00 | 48.30–59.70 | 11.70×11.40 |
| NORTH LINK EAST | 64.00–75.70 | 48.30–59.70 | 11.70×11.40 |

North stair is in the north-west part of reception: reserved ground footprint X=21.00–27.00,Y=51.20–59.00. It occupies reception volume and must be enclosed/guarded so the reception queue and entrance remain clear. Upper stair landing zone X=20.30–28.70,Y=51.10–59.70. The 0.30 m boundary offset is a wall/finish tolerance to resolve in the wall schedule, not an open gap.

## 5. Upper floor — continuous courtyard balcony
The previous R2.0 upper room widths are revised to create a continuous U-shaped balcony/corridor facing the courtyard. The balcony is a walkable circulation strip, not six disconnected balconies.
- West inner balcony leg: X=17.20–19.70, Y=18.30–48.30, clear width 2.50 m.
- North balcony crossbar: X=19.70–64.30, Y=48.30–50.80, clear width 2.50 m.
- East inner balcony leg: X=64.30–66.80, Y=18.30–48.30, clear width 2.50 m.
- West room strip: X=11.10–17.00; east room strip X=67.00–72.90. Room widths 5.90 m before partitions/finishes.
- Corner turning pads: west X=17.00–20.30,Y=47.00–50.80; east X=63.70–67.00,Y=47.00–50.80. Trim into the continuous walkway polygon; do not double-count collision or slab.
- Guardrail on courtyard-facing edge only, 1.10 m high target. No rail across doorway thresholds or stair landing. No furniture may reduce 2.50 m clear walkway.
Room schedule:
| ID | X min–max | Y min–max | Clear m |
|---|---:|---:|---:|
| ROOM 07 | 11.10–17.00 | 20.00–27.00 | 5.90×7.00 |
| ROOM 08 | 11.10–17.00 | 29.00–36.00 | 5.90×7.00 |
| ROOM 09 | 11.10–17.00 | 38.00–47.40 | 5.90×9.40 |
| ROOM 10 | 67.00–72.90 | 20.00–27.00 | 5.90×7.00 |
| ROOM 11 | 67.00–72.90 | 29.00–36.00 | 5.90×7.00 |
| ROOM 12 | 67.00–72.90 | 38.00–47.40 | 5.90×9.40 |
| U-NORTH HALL / BALCONY | 19.70–64.30 | 48.30–50.80 | 44.60×2.50 |
| U-STAIR LANDING ZONE | 20.30–28.70 | 51.10–59.70 | 8.40×8.60 |
| U-SERVICE | 29.00–48.70 | 51.10–59.70 | 19.70×8.60 |
| ROOM 13 | 49.00–63.70 | 51.10–59.70 | 14.70×8.60 |
| U-WEST BALCONY | 17.20–19.70 | 18.30–48.30 | 2.50×30.00 |
| U-EAST BALCONY | 64.30–66.80 | 18.30–48.30 | 2.50×30.00 |

Door positions for rooms 07–12 move to courtyard-facing room walls: west rooms on east wall X=17.00; east rooms on west wall X=67.00. Exterior windows move to outer walls: west rooms X=11.10 (west-facing); east rooms X=72.90 (east-facing). The door/window schedule is authoritative for opening centres. Ground-floor room geometry is unchanged.

## 6. ROOM 12 → ROOM 13 secret route
1. Concealed panel D-13A in ROOM 12 north wall, centre X=69.95,Y=47.55,Z=3.60; clear 0.90×2.10 m.
2. Vestibule target X=67.00–72.90,Y=47.70–49.20; minimum route depth 1.50 m. Connects panel to east balcony leg.
3. East balcony leg X=64.30–66.80,Y=18.30–48.30 continues north to north balcony crossbar. Provide an explicit west opening at X=64.30, centre Y=49.55, clear width 0.90 m (D-13C) into U-NORTH HALL. Model the shared wall and jambs; no 0.30 m mystery gap.
4. North hall X=19.70–64.30,Y=48.30–50.80 to ROOM 13 south door D-13B centre X=56.35,Y=50.80; clear 0.90×2.10 m.
5. Keep 1.20×1.20 m approach on both sides of D-13B and clear return path. No teleport, no one-way trap.
6. The route must be continuously walkable and enclosed, with 2.20 m minimum overhead target; section D-D shows upper floor and the ground-floor electrical room separated by slab.
This is a design route only; wall openings, navmesh, collision and return traversal are EDITOR-TEST REQUIRED.

## 7. North stair — exact target layout
Reservation X=21.00–27.00,Y=51.20–59.00; clear stair width 1.20 m. Floor rise 3.60 m; 20 risers ×0.18 m. Two parallel U-turn flights, 10 risers per flight. Each flight has 9 goings at 0.28 m = 2.52 m run; intermediate landing 1.20 m deep. Approximate stair assembly envelope 2.70×3.72 m, centred within reserved zone; preserve 1.20 m bottom/top approach and 2.20 m headroom. Handrails both sides, 1.00 m high target. The exact stair origin, direction, landing elevation Z=1.80 and support/guarding must be drawn in STAIR_PLAN_R2.md before greybox. Stair math is a proposed layout, not editor-verified.

## 8. Player and THE GUEST
Player primary route 2.50 m; ordinary clear route ≥0.90 m; interaction approach 1.20×1.20 m; reception queue 2.50×1.50 m; headroom ≥2.20 m target. THE GUEST has planned access to both floors using the north stair. Visual height 2.60 m target is not a collision capsule. Use provisional navigation envelope width 0.90 m and height 2.80 m for blockout only; do not use this as a final character collision without testing. Test stair ascent/descent, landings, door passage, patrol, investigate, chase and recovery on both floors. No NPC route through locked rooms, roof, balcony edge or secret panel unless explicitly enabled.

## 9. Exterior anchors
Site anchors remain: broken car X=34–40,Y=5–10; neon sign X=39–45,Y=14.5–15.5; courtyard entrance near X=42,Y=18 with 3 m clear route; vending X=21–24,Y=25–28; dumpster X=70–74,Y=20–24; lights near (25,12),(59,12),(25,43),(59,43); generator approx. 3×2 m plus 1.5 m interaction clearance; gate south/east boundary with 4 m vehicle route. Exact pivots and yaw remain PROPOSED TARGET.

## 10. Geometry acceptance gate
Before final environmental art: close every wall/floor/ceiling polygon; issue wall and furnishing schedules; dimension stair plan; show continuous balcony in plan and section; resolve secret route wall cuts; check room net areas; test 1P/2P/4P movement and THE GUEST on both floors. No ENGINE-VERIFIED claims exist until evidence is attached. R2.1 remains PROPOSED TARGET and final art remains unauthorized.