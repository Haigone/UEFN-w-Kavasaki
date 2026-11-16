# EXECUTIVE FLOOR PLANS — REVISION E1
## THE MOTEL: ROOM 13 | Dimensioned layout proposal

**Status:** PROPOSED TARGET — not editor-verified. This document supersedes the contradictory preliminary room allocations in earlier sketches for the purpose of a coherent first greybox. Validate all collision, circulation, NPC navigation and sightlines in UEFN before art production.

## Datum and construction rules
- Site: 84.00 m east-west × 72.00 m north-south. Origin (0,0,0) at south-west site corner. +X east, +Y north, +Z up.
- Units: metres in this document; UEFN world coordinates = metres × 100 cm.
- Main building footprint: west wing X=8.00–20.00, Y=18.00–60.00; east wing X=64.00–76.00, Y=18.00–60.00; north connector X=8.00–76.00, Y=48.00–60.00. The overlapping rectangles are a single connected footprint union, not stacked duplicate geometry.
- Exterior wall thickness 0.30 m; interior partitions 0.15 m. Room bounds below are FINISHED INSIDE FACE unless noted.
- Ground floor finished floor Z=0.00; upper floor finished floor Z=3.60; upper floor slab nominal 0.25 m; ground ceiling underside Z=3.20; upper ceiling underside Z=6.80; roof top Z=7.10.
- Standard door clear opening 0.90 × 2.10 m; service 1.00 × 2.10 m; main reception 1.60 × 2.30 m. Dimensions are clear opening, not rough framing.
- Primary corridor clear width 2.50 m. Room furniture must preserve 0.90 m continuous player path where the room is a required route.
- Grid: 1 m minor; 5 m major. North arrow +Y.

## Site / ground-floor diagram (schematic; coordinate schedule controls)
```
                                  NORTH (+Y)
       X=8            20                         64             76
Y=60   +---------------+--------------------------+---------------+
       |               | RECEPTION / OFFICE /     |               |
       | WEST LINK     | STORAGE / ELECTRICAL     | EAST LINK     |
Y=48   +---------------+--------------------------+---------------+
       | W CORRIDOR    |                          | E CORRIDOR    |
       | 2.50m         |       OPEN COURTYARD      | 2.50m         |
       | [01]          |                          |          [04]  |
       | [02]          |                          |          [05]  |
       | [03]          |                          |          [06]  |
Y=18   +---------------+                          +---------------+
       |               |                          |               |
       +---------------+                          +---------------+
             PARKING / BROKEN CAR / SIGN / ENTRY
                                  SOUTH
```
The diagram is schematic and not to scale. Exact polygons and openings are listed below.

## Ground floor room schedule
| ID | Finished inside bounds (Xmin–Xmax, Ymin–Ymax) | Clear size | Notes |
|---|---|---:|---|
| G-CW | X=8.30–10.80, Y=18.30–47.70 | 2.50 × 29.40 | West corridor; connects south entrance to north link |
| ROOM 01 | X=11.10–19.70, Y=20.00–27.00 | 8.60 × 7.00 | West wing south |
| ROOM 02 | X=11.10–19.70, Y=29.00–36.00 | 8.60 × 7.00 | Battery/suitcase |
| ROOM 03 | X=11.10–19.70, Y=38.00–45.00 | 8.60 × 7.00 | Mirror scare |
| G-CE | X=73.20–75.70, Y=18.30–47.70 | 2.50 × 29.40 | East corridor |
| ROOM 04 | X=64.30–72.90, Y=20.00–27.00 | 8.60 × 7.00 | Telephone clue |
| ROOM 05 | X=64.30–72.90, Y=29.00–36.00 | 8.60 × 7.00 | Sparse room |
| ROOM 06 | X=64.30–72.90, Y=38.00–45.00 | 8.60 × 7.00 | Missing guest photos |
| RECEPTION | X=20.30–37.70, Y=48.30–59.70 | 17.40 × 11.40 | Front desk and waiting zone |
| OWNER OFFICE | X=38.00–47.00, Y=48.30–59.70 | 9.00 × 11.40 | Locked drawer/photo board |
| STORAGE | X=47.30–57.00, Y=48.30–53.70 | 9.70 × 5.40 | Shelving, cleaning cart, screwdriver |
| ELECTRICAL | X=57.30–75.70, Y=48.30–59.70 | 18.40 × 11.40 | Fuse panel, generator console |
| NORTH LINK WEST | X=8.30–20.00, Y=48.30–59.70 | 11.70 × 11.40 | Corridor / stair connection |
| NORTH LINK EAST | X=64.00–75.70, Y=48.30–59.70 | 11.70 × 11.40 | Corridor / service connection |

## Upper floor room schedule
Upper floor repeats the U footprint. The north connector is a circulation and secret-room zone, not a duplicate of ground-floor room partitions.
| ID | Finished inside bounds | Clear size | Notes |
|---|---|---:|---|
| U-CW | X=8.30–10.80, Y=18.30–47.70 | 2.50 × 29.40 | West balcony-side corridor |
| ROOM 07 | X=11.10–19.70, Y=20.00–27.00 | 8.60 × 7.00 | West wing |
| ROOM 08 | X=11.10–19.70, Y=29.00–36.00 | 8.60 × 7.00 | West wing |
| ROOM 09 | X=11.10–19.70, Y=38.00–47.40 | 8.60 × 9.40 | Diary room; north door into link |
| U-CE | X=73.20–75.70, Y=18.30–47.70 | 2.50 × 29.40 | East corridor |
| ROOM 10 | X=64.30–72.90, Y=20.00–27.00 | 8.60 × 7.00 | East wing |
| ROOM 11 | X=64.30–72.90, Y=29.00–36.00 | 8.60 × 7.00 | Child's room |
| ROOM 12 | X=64.30–72.90, Y=38.00–47.40 | 8.60 × 9.40 | Concealed north-wall panel |
| U-NORTH HALL | X=20.30–63.70, Y=48.30–50.80 | 43.40 × 2.50 | Upper connector corridor |
| ROOM 13 | X=49.00–63.70, Y=51.10–59.70 | 14.70 × 8.60 | Secret room; entered from concealed panel at west wall |
| U-STAIR LANDING | X=20.30–28.70, Y=51.10–59.70 | 8.40 × 8.60 | Stair landing and arrival |
| U-SERVICE | X=29.00–48.70, Y=51.10–59.70 | 19.70 × 8.60 | Upper service / story dressing; no mandatory objective |

## ROOM 12 → ROOM 13 secret route
- Concealed panel in ROOM 12 north wall: centre X=68.60, Y=47.40, Z=4.65; clear opening 0.90 × 2.10 m; opens north into the upper east link (X=64.00–75.70, Y=48.30–59.70).
- Hidden route is a continuous walkable route, not a teleport: pass north through the panel into the upper east link; follow the east link to its west opening at X=64.00, Y=49.55; enter U-NORTH HALL (X=20.30–63.70, Y=48.30–50.80); follow the hall west-to-east to X=56.35; pass north through ROOM 13 south-wall concealed door at centre (X=56.35, Y=51.10). Clear width 0.90 m at both doors. The hall is darkened and dressed as a service passage; the north-wall panel remains the secret entrance.
- The upper east link must remain free of upper-floor room partitions and furniture except route dressing. Its ground-floor volume is ELECTRICAL; the upper floor is a distinct floor level at Z=3.60–6.80.
- ROOM 13 south-wall door opens inward; reserve 1.20 × 1.20 m clear approach area inside ROOM 13 and keep photo wall on north wall so the only exit remains clear.
- This route is now geometrically continuous in plan by design. Door cut alignment, floor slab openings, wall junctions and actual collision still require editor verification.

## Vertical circulation
- Primary stair target: clear width 1.20 m, 20 risers at 0.18 m = 3.60 m floor-to-floor; tread depth 0.28 m; nominal run 5.32 m plus landing; two flights of 10 risers with intermediate landing 1.20 × 1.20 m. Validate actual stair code/UEFN collision and headroom.
- Stair location target: north-west connector, X=21.00–27.00, Y=51.20–59.00. Provide continuous handrails both sides.
- Balcony walkway target: 1.50 m clear, outside-facing edge along courtyard sides of upper wings; guardrail 1.10 m high. No balcony route may be the sole mandatory route.
- First-person camera and player capsule clearance must be tested on all stairs and under balcony soffits.

## Doors / windows
See `door_window_schedule.csv` for opening centres, clear sizes, orientation and swing. Window sill target 0.90 m; standard window 1.60 × 1.20 m. Reception window 2.40 × 1.50 m. All dimensions PROPOSED TARGET.

## Sections
- Section A-A: along Y through west wing at X=14.00; show floor Z=0/3.60, slab 0.25, ceiling 3.20/6.80, roof 7.10, exterior wall 0.30, room/corridor.
- Section B-B: along X through north connector at Y=55.00; show reception/office/electrical at ground floor and upper hall/ROOM 13 at upper floor; verify no vertical overlap or hidden void.
- Section C-C: through stair centreline; show 20 risers, 0.18 m rise, 0.28 m tread, landing, 2.20 m minimum head clearance target.
- Section D-D: through ROOM 12 secret panel, connecting route and ROOM 13. Must prove the corridor is enclosed, walkable and connected; update route geometry if required.

## Known open validation items
1. The north connector and wings share a footprint junction; use one wall/floor set, not duplicated overlapping boxes.
2. ROOM 13 connector path is a design target requiring a polygon/section revision before implementation.
3. Ground-floor and upper-floor use of north connector differs; verify vertical columns and room functions do not collide.
4. Exact stairs and balcony geometry require collision/headroom testing.
5. This plan is a dimensioned design proposal, not a claim of an already validated UEFN level.
