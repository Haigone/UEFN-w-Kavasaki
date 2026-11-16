# FINAL GROUND FLOOR PLAN — CANONICAL PROPOSAL R2.2
Status: OWNER-APPROVED LD-GEO R2.3 — NOT UEFN-VERIFIED.
Units metres; room bounds finished-inside-face (FIF); wall centre-lines in wall_schedule.csv.

## Datum and footprint
Site 84×72 m; origin SW; +X east, +Y north, +Z up. U footprint: west wing X8–20,Y18–60; east wing X64–76,Y18–60; north connector X8–76,Y48–60. Courtyard X20–64,Y18–48 remains open to sky.

## Guest rooms and corridors
| ID | X min–max | Y min–max | Clear size |
|---|---:|---:|---:|
| ROOM 01 | 11.10–19.70 | 20–27 | 8.60×7.00 |
| ROOM 02 | 11.10–19.70 | 29–36 | 8.60×7.00 |
| ROOM 03 | 11.10–19.70 | 38–45 | 8.60×7.00 |
| ROOM 04 | 64.30–72.90 | 20–27 | 8.60×7.00 |
| ROOM 05 | 64.30–72.90 | 29–36 | 8.60×7.00 |
| ROOM 06 | 64.30–72.90 | 38–45 | 8.60×7.00 |
| G-CW | 8.30–10.80 | 18.30–48.00 | 2.50×29.70 |
| G-CE | 73.20–75.70 | 18.30–48.00 | 2.50×29.70 |

Ground rooms occupy the courtyard-facing strips; the parallel corridors are on the outer sides. Doors are on X=10.95 (west rooms) and X=73.05 (east rooms). Windows face the courtyard at X=19.85 and X=64.15. South-end buffers X11.10–19.70 and X64.30–72.90,Y18.30–19.85 connect to the side corridors; room south walls close at Y19.925.

The 2 m bands Y27–29 and Y36–38 are reserved as open transverse connector bays in this proposal, with 1.50 m clear openings through both the corridor/room partition and courtyard-facing facade at Y=28.00 and 37.00. This is an owner-approved R2.3 geometry decision.

## Sealed north reserves

Two sealed, non-gameplay reserves occupy the residual bays north of ROOM 03 and ROOM 06:

- GF-W-NORTH-SEALED-RESERVE: X11.10–19.70, Y45.15–48.00 (8.60×2.85 m).
- GF-E-NORTH-SEALED-RESERVE: X64.30–72.90, Y45.15–48.00 (8.60×2.85 m).

Existing perimeter/partition walls enclose both. Retain structural slab collision; disable navmesh and player/gameplay access. No openings are added.

## North connector allocations
| Zone | X min–max | Y min–max |
|---|---:|---:|
| GF north-west link | 8.30–10.80 | 48.30–59.70 |
| GF west lobby | 11.10–19.85 | 48.30–59.70 |
| Reception | 20.15–37.70 | 48.30–59.70 |
| Owner office | 38.00–47.00 | 48.30–59.70 |
| Storage | 47.30–57.00 | 48.30–53.70 |
| Storage/service bay | 47.30–57.00 | 53.85–59.70 |
| Electrical | 57.30–72.90 | 48.30–59.70 |
| GF north-east link | 73.20–75.70 | 48.30–59.70 |

The electrical room ends at X=72.90 to preserve the 2.50 m east link; this removes the former electrical/link overlap. The west lobby and west link are separated by a partition with a 0.90 m opening. Storage/service bay connection is shown in the door and wall schedules. These north-zone allocations are owner-approved under R2.3.

## Stair
North stair reservation X=21–27,Y=51.2–59.0, inside reception. Proposed assembly X=22.65–25.35,Y=52.45–56.17; 20 risers, 10 per flight, 0.18 m rise; 9 goings per flight at 0.28 m; 2.52 m run per flight; 2.70×1.20 m intermediate landing at Z1.80; clear flight width 1.20 m. Headroom target ≥2.20 m. Exact handedness and entry/exit approaches require owner approval and editor verification.

## Openings
See DOOR_WINDOW_SCHEDULE.csv. Door/window centres are on wall centre-lines, not on room FIF boundaries. Main reception door centre (29.00,48.15), 1.60×2.30 m; reception window centre (33.00,48.15), 2.40×1.50 m.

## Construction
Use one U-shaped ground slab and unique wall centre-lines. Do not create overlapping wing rectangles or duplicate walls at the north junctions. No UEFN testing was performed.

All room envelopes, wall thicknesses, openings and north connector allocations are owner-approved as LD-GEO R2.3. The two sealed reserves are not playable. Editor-dependent checks remain pending.
