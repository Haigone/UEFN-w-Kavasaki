# THE MOTEL: ROOM 13 — CANONICAL GEOMETRY PROPOSAL
Revision LD-GEO R2.2 | 2026-11-16
Status: **PROPOSED CANONICAL GEOMETRY — NOT OWNER-APPROVED — NOT UEFN-VERIFIED**

## 0. Status legend and authority
- **APPROVED / FIXED**: explicitly fixed by the owner or an unambiguous project constraint.
- **DERIVED**: arithmetic or coordinate result from an approved/fixed input.
- **PROPOSED CORRECTION**: selected here to eliminate a contradiction; not owner-approved.
- **OWNER APPROVAL REQUIRED**: do not treat as final until the owner confirms.
- **EDITOR VERIFICATION REQUIRED**: cannot be proved by documents; Claude must test in UEFN. This document does not perform or claim UEFN testing.

R2.2 is the single *candidate* geometry reference. It supersedes conflicting coordinates in R1, E1, R2.0 and R2.1 only as a proposal. The owner has not approved the full geometry in this document.

## 1. Approved project constraints
| Item | Value | Classification |
|---|---|---|
| Site envelope | 84 × 72 m | APPROVED / FIXED |
| Coordinate origin | South-west corner (0,0,0); +X east, +Y north, +Z up | APPROVED / FIXED |
| Units | metres; convert to UEFN cm ×100 | APPROVED / FIXED |
| Building form | Two-floor U-shaped motel around open courtyard | APPROVED / FIXED |
| Visible rooms | ROOM 01–12 plus concealed ROOM 13 | APPROVED / FIXED |
| Stair position | North connector / reception | OWNER DECISION — APPROVED |
| Upper balcony | Continuous courtyard-facing U route | OWNER DECISION — APPROVED |
| ROOM 13 | North connector, upper floor | OWNER DECISION — APPROVED |
| Roof | Flat | OWNER DECISION — APPROVED |
| THE GUEST | Intended access to both floors | OWNER DECISION — APPROVED |

No room dimensions, wall thicknesses, door coordinates, vertical levels or stair details are considered owner-approved merely because they appeared in earlier drafts.

## 2. Coordinate and wall convention
- All room/corridor bounds in the coordinate register are **finished inside face (FIF)** bounds.
- Wall schedules use **wall centre-lines**. A 0.15 m partition has 0.075 m on either side of its centre-line; a 0.30 m exterior wall has 0.15 m on either side.
- Openings are centred on the host wall centre-line. Opening clear width is measured along the wall; clear height is measured vertically from that floor's FFL unless noted.
- Floor levels: GF FFL Z=0.00; UF FFL Z=3.60.
- Do not create room-sized solid boxes on top of one another. Construct each floor polygon and each shared wall once.
- All coordinates below are PROPOSED CORRECTIONS unless specifically labelled otherwise.

## 3. Building footprint and wing arrangement
**PROPOSED CANONICAL OUTER FOOTPRINT**
- West wing: X=8.00–20.00, Y=18.00–60.00.
- East wing: X=64.00–76.00, Y=18.00–60.00.
- North connector: X=8.00–76.00, Y=48.00–60.00.
- Courtyard void: X=20.00–64.00, Y=18.00–48.00, open to sky.

The union is one U-shaped polygon, not three overlapping solid rectangles. Boundary vertices in clockwise order:
(8,18) → (20,18) → (20,48) → (64,48) → (64,18) → (76,18) → (76,60) → (8,60) → close.
The 12×12 m intersections at each north wing junction are part of the union once only. No duplicate floor slab, wall or collision.

Classification: footprint dimensions are repeated in the dossier and E1 and are treated as the best-supported baseline; exact final wall offsets remain PROPOSED and require owner approval.

## 4. Canonical room and circulation coordinates

### Ground floor
| ID | X min–max | Y min–max | FIF size | Classification |
|---|---:|---:|---:|---|
| ROOM 01 | 11.10–19.70 | 20.00–27.00 | 8.60×7.00 | PROPOSED CORRECTION |
| ROOM 02 | 11.10–19.70 | 29.00–36.00 | 8.60×7.00 | PROPOSED CORRECTION |
| ROOM 03 | 11.10–19.70 | 38.00–45.00 | 8.60×7.00 | PROPOSED CORRECTION |
| ROOM 04 | 64.30–72.90 | 20.00–27.00 | 8.60×7.00 | PROPOSED CORRECTION |
| ROOM 05 | 64.30–72.90 | 29.00–36.00 | 8.60×7.00 | PROPOSED CORRECTION |
| ROOM 06 | 64.30–72.90 | 38.00–45.00 | 8.60×7.00 | PROPOSED CORRECTION |
| G-CW | 8.30–10.80 | 18.30–48.00 | 2.50×29.70 | DERIVED from corrected wall-face bounds |
| G-CE | 73.20–75.70 | 18.30–48.00 | 2.50×29.70 | DERIVED from R2.1 bounds |
| RECEPTION | 20.15–37.70 | 48.30–59.70 | 17.55×11.40 | PROPOSED CORRECTION |
| OWNER OFFICE | 38.00–47.00 | 48.30–59.70 | 9.00×11.40 | PROPOSED CORRECTION |
| STORAGE | 47.30–57.00 | 48.30–53.70 | 9.70×5.40 | PROPOSED CORRECTION |
| ELECTRICAL | 57.30–72.90 | 48.30–59.70 | 15.60×11.40 | PROPOSED CORRECTION |
| GF NORTH-WEST LINK | 8.30–10.80 | 48.30–59.70 | 2.50×11.40 | PROPOSED CORRECTION |
| GF WEST LOBBY | 11.10–19.85 | 48.30–59.70 | 8.75×11.40 | PROPOSED CORRECTION |
| GF NORTH-EAST LINK | 73.20–75.70 | 48.30–59.70 | 2.50×11.40 | PROPOSED CORRECTION |
| GF SERVICE BAY | 47.30–57.00 | 53.85–59.70 | 9.70×5.85 | PROPOSED CORRECTION |

The key correction is ELECTRICAL ending at X=72.90. This preserves a 2.50 m east link at X=73.20–75.70 and removes the previous overlap. The north-west link/lobby are separated into two non-overlapping spaces. The service bay occupies the previously unassigned north half of the storage band; its access and use require owner approval.

The 2.00 m gaps between guest-room Y bands (27–29 and 36–38) are retained as **transverse open connector bays**, not room area. This is a proposed interpretation to avoid inventing extra room dimensions. Provide 1.50 m clear openings through the courtyard-facing wall at Y=28.00 and 37.00. These bays connect the side corridor to the courtyard. OWNER APPROVAL REQUIRED.

### Upper floor — side wings
To retain a continuous courtyard-facing balcony without leaving an unexplained 2.50 m strip between the room and outer envelope, the side rooms use the full outer room band:
| ID | X min–max | Y min–max | FIF size | Classification |
|---|---:|---:|---:|---|
| ROOM 07 | 8.30–17.00 | 20.00–27.00 | 8.70×7.00 | PROPOSED CORRECTION |
| ROOM 08 | 8.30–17.00 | 29.00–36.00 | 8.70×7.00 | PROPOSED CORRECTION |
| ROOM 09 | 8.30–17.00 | 38.00–47.40 | 8.70×9.40 | PROPOSED CORRECTION |
| ROOM 10 | 67.00–75.70 | 20.00–27.00 | 8.70×7.00 | PROPOSED CORRECTION |
| ROOM 11 | 67.00–75.70 | 29.00–36.00 | 8.70×7.00 | PROPOSED CORRECTION |
| ROOM 12 | 67.00–75.70 | 38.00–47.40 | 8.70×9.40 | PROPOSED CORRECTION |

This restores a usable 8.70 m room width consistent with the 12.00 m wing depth, 2.50 m courtyard balcony and 0.30 m wall allowance. It replaces the R2.1 5.90 m width, which left an unexplained outer strip. OWNER APPROVAL REQUIRED.

### Upper floor — continuous balcony and north connector
| ID | X min–max | Y min–max | FIF size | Classification |
|---|---:|---:|---:|---|
| U-WEST-BALCONY | 17.15–19.70 | 18.30–48.30 | 2.55×30.00 | OWNER DECISION + PROPOSED DIMENSION |
| U-NORTH-BALCONY | 19.70–64.30 | 48.30–50.80 | 44.60×2.50 | OWNER DECISION + PROPOSED DIMENSION |
| U-EAST-BALCONY | 64.30–66.85 | 18.30–48.30 | 2.55×30.00 | OWNER DECISION + PROPOSED DIMENSION |
| U-WEST-TURN | 17.15–20.15 | 47.00–50.80 | 3.00×3.80 | PROPOSED CORRECTION |
| U-EAST-TURN | 63.85–66.85 | 47.00–50.80 | 3.00×3.80 | PROPOSED CORRECTION |
| U-STAIR-LANDING | 20.15–28.70 | 51.10–59.70 | 8.55×8.60 | PROPOSED CORRECTION |
| U-SERVICE | 29.00–48.70 | 51.10–59.70 | 19.70×8.60 | PROPOSED CORRECTION |
| ROOM 13 | 49.00–63.70 | 51.10–59.70 | 14.70×8.60 | OWNER DECISION for location; size PROPOSED |
| U-WEST-SERVICE-RESERVE | 8.30–19.85 | 51.10–59.70 | 11.55×8.60 | PROPOSED non-playable reserve |
| U-EAST-SERVICE-RESERVE | 64.00–75.70 | 51.10–59.70 | 11.70×8.60 | PROPOSED non-playable reserve |

The balcony is one connected walkable polygon: union of the two side legs, north crossbar and two corner turning pads. Guardrail only along courtyard-facing exposed edges; no rail across room door thresholds or stair landing. Target guardrail height 1.10 m. The 2.50 m clear width is measured after rail posts/props.

The two service reserve zones are non-playable placeholders to close the upper-floor slab footprint. They are not new rooms and have no assumed access. OWNER APPROVAL REQUIRED to retain them or replace them with another upper-level allocation.

## 5. ROOM 12 → ROOM 13 continuous secret route
Route sequence:
1. D-13A: concealed panel in ROOM 12 north wall; wall centreline Y=47.475, centre X=69.95, sill Z=3.60, clear 0.90×2.10 m; opens north.
2. Vestibule: X=67.00–72.90, Y=47.55–49.20, FFL Z=3.60. Clear depth 1.50 m.
3. D-13C: opening through vestibule west wall; wall centreline X=66.925, centre Y=48.45, clear 0.90×2.10 m; opens west into east balcony leg X=64.30–66.85.
4. Follow the continuous east balcony leg south-to-north to the east turning pad, then west along the north balcony crossbar.
5. D-13B: concealed door in ROOM 13 south wall; wall centreline Y=50.95, centre X=56.35, clear 0.90×2.10 m; opens north into ROOM 13.
6. Return uses the same continuous path. No teleport and no one-way lock.

The vestibule and opening are dimensionally aligned in R2.2. Door cuts, collision, enclosure and return path still require editor verification.

## 6. Doors and windows — canonical placement rules
- Ground guest-room doors: west wing X=10.95, east wing X=73.05; centres Y=23.50, 32.50, 41.50. These sit on corridor/room partition centre-lines.
- Ground guest-room windows: west wing X=19.85, east wing X=64.15; same Y centres; face the courtyard.
- Upper guest-room doors: west wing X=17.075, east wing X=66.925; centres Y=23.50, 32.50, 42.70; face the continuous balcony.
- Upper guest-room windows: west exterior wall X=8.15, east exterior wall X=75.85; same Y centres.
- Ground main reception door: centre (29.00,48.15), south facade, clear 1.60×2.30.
- Reception window: centre (33.00,48.15), south facade, 2.40×1.50.
- Internal ground doors lie on shared partition centre-lines: X=37.85 (reception/office), X=47.15 (office/storage), X=57.15 (storage/electrical).
- Opening schedule is the exact authority for each opening. All centres are wall centre-line coordinates, not room FIF boundary coordinates.

## 7. Wall thickness and continuity
- Exterior and courtyard-facing facade walls: 0.30 m target.
- Standard room partitions: 0.15 m target.
- Partitions separating FIF zones with a 0.30 m coordinate gap use 0.30 m centre-line thickness (north connector, corridor separations); the wall schedule is the controlling record.
- Ground walls: Z=0.00 to Z=3.35; upper slab top Z=3.60 and thickness 0.25.
- Upper walls: Z=3.60 to Z=6.40; clear height 2.80.
- Roof parapet: from Z=6.65 to Z=7.10, target thickness 0.20.
- A wall segment is one unique centre-line record. Shared walls are not duplicated per room.
- Openings must be listed by ID in the host wall's Openings field. Wall schedule is a construction centre-line register, not a list of room bounding boxes.
- Courtyard remains open to sky; facade wall segments around it do not imply a roof over the courtyard.

## 8. Stair — north connector / reception
Owner-approved only as to **location**. Proposed dimensions:
- Reservation X=21.00–27.00, Y=51.20–59.00.
- Clear flight width 1.20 m each; two parallel flights plus 0.30 m centre separation/structure; overall width 2.70 m.
- Floor-to-floor rise 3.60 m = 20 risers × 0.18 m.
- 10 risers per flight; 9 goings × 0.28 m = 2.52 m run per flight.
- Intermediate U-turn landing 2.70×1.20 m at Z=1.80.
- Stair flight/landing envelope 2.70×3.72 m. Bottom and top approach each target ≥1.20 m.
- Handrails both sides; 1.00 m target height. Headroom ≥2.20 m measured vertically above nosings and landings.
- Proposed placement: X=22.65–25.35, Y=52.00–55.72; lower and upper access approach from south. Exact stair handedness and support layout require owner approval and editor verification.
The earlier 5.32 m run is mathematically inconsistent with two flights of nine goings each: 18×0.28=5.04 m total horizontal going, not 5.32 m. The U-turn assembly's plan depth is 2.52+1.20=3.72 m.

## 9. Vertical levels, slabs and flat roof
Proposed consistent stack:
| Element | Elevation |
|---|---:|
| Ground FFL | Z=0.00 |
| Ground clear ceiling plane | Z=3.00 |
| Upper slab underside | Z=3.35 |
| Upper slab top / upper FFL | Z=3.60 |
| Upper clear ceiling / roof underside | Z=6.40 |
| Flat roof slab top | Z=6.65 |
| Parapet top | Z=7.10 |

Upper slab and roof slab thickness target 0.25 m. The 0.35 m gap between ground ceiling plane and upper slab underside is a ceiling/service void, not walkable space. The flat roof covers the U-shaped building union only; courtyard remains open. Roof access is prohibited in the level. This stack is internally consistent but is a PROPOSED CORRECTION to EBD/E1 vertical values and requires owner approval.

## 10. Balcony, courtyard and floor separation
- Courtyard void: X=20–64, Y=18–48; no floor slab above ground level and no roof.
- Ground floor: continuous walkable slab over the U-shaped footprint.
- Upper floor: continuous slab over both side wings, balcony strips, corner pads and north connector.
- Upper side balcony lies on courtyard side of each wing; north crossbar closes the U route.
- Ground and upper floor surfaces are separate elevations, Z=0.00 and Z=3.60.
- Balcony rails protect only exposed courtyard edges. No rail may obstruct the 0.90 m room door opening or the 1.20 m stair access.
- Roof is a separate flat slab above the upper floor, not an upper-floor walkable route.

## 11. Owner approval required before geometry freeze
1. Confirm the ground-floor room orientation: R2.2 uses the E1/R2.1 arrangement (rooms on courtyard side of outer corridor), not the mirrored arrangement in the original dossier.
2. Confirm the room Y bands and the proposed 2.00 m transverse connector bays.
3. Confirm upper room width 8.70 m, replacing R2.1's 5.90 m.
4. Confirm ELECTRICAL reduced to X=57.30–72.90 and the east north-link corridor retained at X=73.20–75.70.
5. Confirm west lobby, service bay and upper service reserve allocations.
6. Confirm ROOM 13 dimensions 14.70×8.60 m and exact north connector placement.
7. Confirm stair geometry, handedness, exact placement and 0.18/0.28 riser/going targets.
8. Confirm wall thicknesses 0.30/0.15 m and vertical stack Z=3.00/3.35/3.60/6.40/6.65/7.10.
9. Confirm 2.50 m balcony width and corner pads.
10. Confirm window placement on courtyard-facing ground facades and exterior-facing upper facades.

## 12. Verification boundary
This is a document-only geometric reconciliation. No UEFN project was opened, built, simulated or tested. Mark all editor-dependent items EDITOR-TEST REQUIRED. The geometry is **not approved** until the owner explicitly approves the proposed corrections above.