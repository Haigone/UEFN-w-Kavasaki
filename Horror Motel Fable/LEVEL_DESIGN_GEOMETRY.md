# THE MOTEL: ROOM 13 — AUTHORITATIVE LEVEL GEOMETRY
Revision LD-GEO R2.0 | 2026-11-16 | Status: PROPOSED TARGET — NOT UEFN-VERIFIED

## Authority
This is the candidate single geometry authority. It supersedes the preliminary geometry in this file and resolves conflicting allocations in EXECUTIVE_BUILD_DOSSIER.md and EXECUTIVE_FLOORPLANS.md E1 for design review. It is not approved for final environmental art.

Status labels:
- FIXED REQUIREMENT: supplied project constraint.
- PROPOSED TARGET: selected design value, not tested in editor.
- ENGINE-VERIFIED: only with actual UEFN evidence.
- EDITOR-TEST REQUIRED: requires blockout/editor/playtest.

## 1. Fixed datum
Site 84 × 72 m; origin (0,0,0) at south-west; +X east, +Y north, +Z up; metres; 1 m = 100 Unreal cm. Two-storey U-shaped motel; 12 visible rooms; hidden ROOM 13; courtyard, reception, office, storage, electrical, parking, car, sign and gate. 1–4 players; solo completion required.

All room bounds below are finished-inside-face (FIF) bounds. Walls are separate geometry. Exterior wall thickness 0.30 m and interior partition thickness 0.15 m are PROPOSED TARGETS. Shared walls are built once. Do not create solid overlapping room boxes.

## 2. Vertical datum proposal
Ground FFL Z=0.00 m; upper FFL Z=3.60 m; upper slab 0.25 m target; ground clear height 3.00 m; upper clear height 2.80 m. The slab/ceiling/roof stack remains EDITOR-TEST REQUIRED: do not silently mix the former Z=3.20, 3.35, 6.55, 6.80 and 7.10 elevations. Produce one dimensioned section before blockout acceptance.

## 3. Footprint
West wing X=8–20, Y=18–60; east wing X=64–76, Y=18–60; north connector X=8–76, Y=48–60. Courtyard X=20–64, Y=18–48, open to sky. The footprint is a polygon union. No duplicate slab or wall at the 12 × 12 m wing junctions.

## 4. Ground floor — selected E1 allocation
Bounds are FIF, metres.
| ID | X min–max | Y min–max | Clear size |
|---|---:|---:|---:|
| G-CW | 8.30–10.80 | 18.30–47.70 | 2.50 × 29.40 |
| ROOM 01 | 11.10–19.70 | 20.00–27.00 | 8.60 × 7.00 |
| ROOM 02 | 11.10–19.70 | 29.00–36.00 | 8.60 × 7.00 |
| ROOM 03 | 11.10–19.70 | 38.00–45.00 | 8.60 × 7.00 |
| G-CE | 73.20–75.70 | 18.30–47.70 | 2.50 × 29.40 |
| ROOM 04 | 64.30–72.90 | 20.00–27.00 | 8.60 × 7.00 |
| ROOM 05 | 64.30–72.90 | 29.00–36.00 | 8.60 × 7.00 |
| ROOM 06 | 64.30–72.90 | 38.00–45.00 | 8.60 × 7.00 |
| RECEPTION | 20.30–37.70 | 48.30–59.70 | 17.40 × 11.40 |
| OWNER OFFICE | 38.00–47.00 | 48.30–59.70 | 9.00 × 11.40 |
| STORAGE | 47.30–57.00 | 48.30–53.70 | 9.70 × 5.40 |
| ELECTRICAL | 57.30–75.70 | 48.30–59.70 | 18.40 × 11.40 |
| NORTH LINK WEST | 8.30–20.00 | 48.30–59.70 | 11.70 × 11.40 |
| NORTH LINK EAST | 64.00–75.70 | 48.30–59.70 | 11.70 × 11.40 |

Decision: E1 reception width 17.40 m is selected over dossier's 14.00 m. E1 room strip placement is selected over the dossier's mirrored/shifted strip. Office, storage and electrical allocations follow E1.

## 5. Upper floor — selected E1 allocation
| ID | X min–max | Y min–max | Clear size |
|---|---:|---:|---:|
| U-CW | 8.30–10.80 | 18.30–47.70 | 2.50 × 29.40 |
| ROOM 07 | 11.10–19.70 | 20.00–27.00 | 8.60 × 7.00 |
| ROOM 08 | 11.10–19.70 | 29.00–36.00 | 8.60 × 7.00 |
| ROOM 09 | 11.10–19.70 | 38.00–47.40 | 8.60 × 9.40 |
| U-CE | 73.20–75.70 | 18.30–47.70 | 2.50 × 29.40 |
| ROOM 10 | 64.30–72.90 | 20.00–27.00 | 8.60 × 7.00 |
| ROOM 11 | 64.30–72.90 | 29.00–36.00 | 8.60 × 7.00 |
| ROOM 12 | 64.30–72.90 | 38.00–47.40 | 8.60 × 9.40 |
| U-NORTH HALL | 20.30–63.70 | 48.30–50.80 | 43.40 × 2.50 |
| U-STAIR LANDING ZONE | 20.30–28.70 | 51.10–59.70 | 8.40 × 8.60 |
| U-SERVICE | 29.00–48.70 | 51.10–59.70 | 19.70 × 8.60 |
| ROOM 13 | 49.00–63.70 | 51.10–59.70 | 14.70 × 8.60 |

Decision: ROOM 13 uses the E1 north connector pocket, not the dossier's east-wing pocket at X=67–75.7, Y=43–47. The old upper north band of six rooms is rejected.

## 6. ROOM 12 → ROOM 13
The E1 prose route is not construction-ready: its X=64.00 opening and X=63.70 hall boundary leave a 0.30 m junction unresolved, and it does not size a vestibule. Revised target:
1. Concealed panel in ROOM 12 north wall, centre X=68.60, Y=47.55, upper floor; clear 0.90 × 2.10 m.
2. Reserve east vestibule X=64.30–72.90, Y=47.85–49.35; route width at least 1.40 m and overhead clearance at least 2.20 m.
3. Cut one 0.90 m clear west passage through the X=64.00 wall junction, centre Y=48.60, connecting vestibule to U-NORTH HALL. Model the shared wall/junction explicitly; no unexplained 0.30 m gap.
4. Follow hall westward to ROOM 13 south-wall door, centre X=56.35, Y=50.95; clear opening 0.90 × 2.10 m.
5. Reserve 1.20 × 1.20 m approach on both sides; return via same continuous route. No teleport or one-way trap.
6. Section D-D must show floor at Z=3.60, wall/lintel/ceiling, vestibule and ground-floor ELECTRICAL separated by upper slab.
This is a topological design proposal only. Wall segments, slab continuity and collision remain EDITOR-TEST REQUIRED.

## 7. Stairs and balcony
Stair reservation X=21.00–27.00, Y=51.20–59.00; clear width 1.20 m; rise 3.60 m; 20 risers × 0.18 m; tread depth target 0.28 m; two flights of 10 risers; intermediate landing at least 1.20 × 1.20 m. Total run is deliberately not frozen: tread count and landing split must be dimensioned (20 risers do not mean 20 treads). Headroom target ≥2.20 m. EDITOR-TEST REQUIRED.
Balcony/circulation clear width target 2.50 m, guardrail 1.10 m. This supersedes E1's 1.50 m note. Define actual balcony polygon and edge in plan/section before build.

## 8. Doors, windows and room fit
Ordinary clear door 0.90 × 2.10 m; service 1.00 × 2.10 m; double utility 1.60 × 2.10 m; reception entry 1.60 × 2.30 m. Standard window 1.60 × 1.20 m; reception window 2.40 × 1.50 m; sill target 0.90 m. These are PROPOSED TARGETS unless stated as fixed in the project brief. Exact proposed opening centres are in DOOR_WINDOW_SCHEDULE.csv.
Room clear height targets: ground 3.00 m, upper 2.80 m. Bathroom partitions, wall returns and furniture placements remain to be detailed; do not assume bounding-box room rectangles are final net usable areas.

## 9. Player and NPC clearances
Ordinary route ≥0.90 m target; primary corridor 2.50 m; interaction approach 1.20 × 1.20 m; reception queue 2.50 × 1.50 m; head clearance ≥2.20 m. Four-player pinch points require a passing/holding solution. THE GUEST visual height target 2.60 m is not a collision capsule spec. Capsule, turn radius, door clearance and nav path are EDITOR-TEST REQUIRED. Every objective must be solo-reachable and recoverable after disconnect.

## 10. Exterior anchors
PROPOSED TARGET: broken car X=34–40,Y=5–10; neon sign X=39–45,Y=14.5–15.5; courtyard entrance centred near X=42,Y=18 with 3 m clear route; vending machine X=21–24,Y=25–28; dumpster X=70–74,Y=20–24; lights near (25,12),(59,12),(25,43),(59,43); generator approx. 3 × 2 m plus 1.5 m interaction clearance; gate south/east edge with 4 m vehicle route. Exact prop pivots and yaw still required.

## 11. Acceptance gate
No final environmental asset production until both floor polygons, wall centre-lines, openings, stair, balcony, sections, ROOM 12 route, solo path and THE GUEST navigation are validated. No ENGINE-VERIFIED status is claimed in this document revision.