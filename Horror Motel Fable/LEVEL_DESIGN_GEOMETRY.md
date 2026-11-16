# THE MOTEL: ROOM 13 — CANONICAL GEOMETRY PROPOSAL
Revision LD-GEO R2.3 | owner approval recorded 2026-11-16
Status: **OWNER-APPROVED CANONICAL GEOMETRY LD-GEO R2.3 — NOT UEFN-VERIFIED**

## 0. Status legend and authority
- **APPROVED / FIXED**: explicitly fixed by the owner or an unambiguous project constraint.
- **DERIVED**: arithmetic or coordinate result from an approved/fixed input.
- **OWNER APPROVED R2.3**: geometry explicitly approved by the project owner on 2026-11-16.
- **EDITOR VERIFICATION REQUIRED**: design intent is approved, but collision, navigation, traversal and in-editor fit remain unverified.
- **EDITOR VERIFICATION REQUIRED**: cannot be proved by documents; Claude must test in UEFN. This document does not perform or claim UEFN testing.

R2.3 is the single owner-approved geometry reference. It consolidates R2.2 and the owner's approval of GEO-A01–GEO-A21 on 2026-11-16. It supersedes conflicting coordinates in R1, E1, R2.0, R2.1 and R2.2. No UEFN verification is implied.

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
- Floor and roof slab polygons are controlled by `SLAB_SCHEDULE.csv`; the U-shaped polygon is stored once, with the courtyard void explicitly excluded.
- Wall schedules use **wall centre-lines**. A 0.15 m partition has 0.075 m on either side of its centre-line; a 0.30 m exterior wall has 0.15 m on either side.
- Openings are centred on the host wall centre-line. Opening clear width is measured along the wall; clear height is measured vertically from that floor's FFL unless noted.
- Floor levels: GF FFL Z=0.00; UF FFL Z=3.60.
- Do not create room-sized solid boxes on top of one another. Construct each floor polygon and each shared wall once.
- All coordinates below are OWNER APPROVED R2.3 unless specifically labelled DERIVED or EDITOR VERIFICATION REQUIRED.

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
| GF-W-SOUTH-VEST | 11.10–19.70 | 18.30–19.85 | 8.60×1.55 | OWNER APPROVAL REQUIRED |
| GF-E-SOUTH-VEST | 64.30–72.90 | 18.30–19.85 | 8.60×1.55 | OWNER APPROVAL REQUIRED |
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

The south-end 1.55 m buffer zones Y18.30–19.85 are open to the ground corridor / upper balcony; the room south walls close at Y19.925. This avoids leaving an inaccessible strip behind the south facade. OWNER APPROVAL REQUIRED.

The 2.00 m gaps between guest-room Y bands (27–29 and 36–38) are retained as **transverse open connector bays**, not room area. This is a proposed interpretation to avoid inventing extra room dimensions. Provide 1.50 m clear openings through both corridor/room partitions (X=10.95 west, X=73.05 east) and courtyard-facing walls (X=19.85 west, X=64.15 east) at Y=28.00 and 37.00. These bays connect the side corridor to the courtyard. OWNER APPROVAL REQUIRED.

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
| UF-W-SOUTH-VEST | 8.30–17.00 | 18.30–19.85 | 8.70×1.55 | OWNER APPROVAL REQUIRED |
| UF-E-SOUTH-VEST | 67.00–75.70 | 18.30–19.85 | 8.70×1.55 | OWNER APPROVAL REQUIRED |

This restores a usable 8.70 m room width consistent with the 12.00 m wing depth, 2.50 m courtyard balcony and 0.30 m wall allowance. It replaces the R2.1 5.90 m width, which left an unexplained outer strip. OWNER APPROVAL REQUIRED.

The 2.00 m Y gaps between upper room bays (27–29 and 36–38) are reserved as upper cross-bays. Each receives a 1.50 m clear opening through the room/balcony partition so the cross-bay connects to the continuous balcony. These are open circulation bays, not additional rooms. OWNER APPROVAL REQUIRED.

### Upper floor — continuous balcony and north connector
| ID | X min–max | Y min–max | FIF size | Classification |
|---|---:|---:|---:|---|
| U-WEST-BALCONY | 17.15–19.70 | 18.30–48.30 | 2.55×30.00 | OWNER DECISION + PROPOSED DIMENSION |
| U-NORTH-BALCONY | 19.70–64.30 | 48.30–50.80 | 44.60×2.50 | OWNER DECISION + PROPOSED DIMENSION |
| U-EAST-BALCONY | 64.30–66.85 | 18.30–48.30 | 2.55×30.00 | OWNER DECISION + PROPOSED DIMENSION |
| U-WEST-TURN | 17.15–20.00 | 47.00–50.80 | 2.85×3.80 | OWNER APPROVED R2.3 — clipped to UF slab |
| U-EAST-TURN | 64.00–66.85 | 47.00–50.80 | 2.85×3.80 | OWNER APPROVED R2.3 — clipped to UF slab |
| U-STAIR-LANDING | 20.15–28.70 | 51.10–59.70 | 8.55×8.60 | PROPOSED CORRECTION |
| U-SERVICE | 29.00–48.70 | 51.10–59.70 | 19.70×8.60 | OWNER APPROVED R2.3 — sealed, no access/no navmesh |
| ROOM 13 | 49.00–63.70 | 51.10–59.70 | 14.70×8.60 | OWNER DECISION for location; size PROPOSED |
| U-WEST-SERVICE-RESERVE | 8.30–19.85 | 51.10–59.70 | 11.55×8.60 | PROPOSED non-playable reserve |
| U-EAST-SERVICE-RESERVE | 64.00–75.70 | 51.10–59.70 | 11.70×8.60 | PROPOSED non-playable reserve |

The balcony is one connected walkable polygon: union of the two side legs, north crossbar and two corner turning pads. Guardrail only along courtyard-facing exposed edges; centre-lines X=19.85 (west leg), X=64.15 (east leg), Y=48.15 (north crossbar), Z=3.60–4.70. Rails sit in the 0.30 m edge strips outside the walkable polygon; no rail across room door thresholds or stair landing. Target guardrail height 1.10 m. The 2.50 m clear width is measured after rail posts/props.

The two service reserve zones are non-playable placeholders to close the upper-floor slab footprint. They are not new rooms and have no assumed access. OWNER APPROVAL REQUIRED to retain them or replace them with another upper-level allocation.

**Room-interior boundary:** ROOM 01–13 coordinates define the finished room envelopes only. The EBD mentions a nominal 2.20×2.40 m bathroom allowance in standard rooms, but it does not give a reconciled placement/orientation or complete door/partition geometry. R2.2 therefore does not invent bathroom walls, bathroom doors or fixture clearances. These interior subdivisions remain out of the canonical wall schedule pending owner-approved room fit-out.

## 5. ROOM 12 → ROOM 13 continuous secret route
Route sequence:
1. D-13A: concealed panel in ROOM 12 north wall; wall centreline Y=47.475, centre X=69.95, sill Z=3.60, clear 0.90×2.10 m; opens north.
2. Vestibule: X=67.00–72.90, Y=47.55–49.20, FFL Z=3.60. Clear FIF depth 1.65 m; vestibule clear bounds are X67.00–72.90 and Y47.55–49.20.
3. D-13C: opening through vestibule west wall; wall centreline X=66.925, centre Y=48.45, clear 0.90×2.10 m; opens west into east balcony leg X=64.30–66.85.
4. Follow the continuous east balcony leg south-to-north to the east turning pad, then west along the north balcony crossbar.
5. D-13B: concealed door in ROOM 13 south wall; wall centreline Y=50.95, centre X=56.35, clear 0.90×2.10 m; opens north into ROOM 13.
6. Return uses the same continuous path. No teleport and no one-way lock.

Vestibule bounds are FIF X67.00–72.90,Y47.55–49.20 (5.90×1.65 m clear). Its 0.15 m wall centre-lines are X=66.925 west, X=72.975 east and Y=49.275 north; the south boundary is the ROOM 12 north wall at Y=47.475. Door cuts, collision, enclosure and return path still require editor verification.

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
- At perpendicular/T-junctions, merge or trim wall meshes to a single continuous junction; do not leave a gap and do not stack duplicate full-thickness wall meshes.
- Openings must be listed by ID in the host wall's Openings field. Wall schedule is a construction centre-line register, not a list of room bounding boxes.
- Courtyard remains open to sky; facade wall segments around it do not imply a roof over the courtyard.
- The flat-roof parapet follows the complete U-shaped roof perimeter. Courtyard-side parapet centre-lines meet continuously at (19.85,48.15) and (64.15,48.15); use `wall_schedule.csv` and miter/trim corner meshes without gaps or stacked collision.

## 8. Stair — north connector / reception
Owner-approved only as to **location**. Proposed dimensions:
- Reservation X=21.00–27.00, Y=51.20–59.00.
- Clear flight width 1.20 m each; two parallel flights plus 0.30 m centre separation/structure; overall width 2.70 m.
- Floor-to-floor rise 3.60 m = 20 risers × 0.18 m.
- 10 risers per flight; 9 goings × 0.28 m = 2.52 m run per flight.
- Intermediate U-turn landing 2.70×1.20 m at Z=1.80.
- Stair flight/landing envelope 2.70×3.72 m. Bottom and top approach each target ≥1.20 m. The upper south approach is 1.20 m from the wall face at Y51.10 to the slab cut at Y52.30.
- Handrails both sides; 1.00 m target height. Headroom ≥2.20 m measured vertically above nosings and landings. Upper south approach is 1.20 m clear from Y51.10 to Y52.30. Lower approach must retain ≥1.20 m clear, but its exact polygon and the reception counter/queue furniture layout are not dimensioned yet. The stair occupies part of reception; furniture must remain outside the stair reservation and both approach zones.
- Proposed placement: X=22.65–25.35, Y=52.45–56.17; lower and upper access approach from south. Upper slab cut X=22.50–25.50,Y=52.30–56.32 (3.00×4.02 m) through the 0.25 m slab; guardrail west/east/north, south edge open to the landing. Exact stair handedness and support layout require owner approval and editor verification.
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

Ground slab thickness is proposed at 0.20 m from EBD; upper and roof slabs are proposed at 0.25 m from E1. All three thicknesses require owner approval. The 0.35 m gap between ground ceiling plane and upper slab underside is a ceiling/service void, not walkable space. The flat roof covers the U-shaped building union only; courtyard remains open. Roof access is prohibited in the level. This stack is internally consistent but is a PROPOSED CORRECTION to EBD/E1 vertical values and requires owner approval.

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
3. Confirm upper room width 8.70 m, side-wing placement and 2 m cross-bays, replacing R2.1's 5.90 m.
4. Confirm ELECTRICAL reduced to X=57.30–72.90 and the east north-link corridor retained at X=73.20–75.70.
5. Confirm west lobby, service bay and upper service reserve allocations.
6. Confirm ROOM 13 dimensions 14.70×8.60 m and exact north connector placement.
7. Confirm stair geometry, handedness, exact placement, lower approach polygon, reception counter/queue clearances and 0.18/0.28 riser/going targets.
8. Confirm wall thicknesses 0.30/0.15 m, ground slab 0.20 m, upper/roof slabs 0.25 m, and vertical stack Z=3.00/3.35/3.60/6.40/6.65/7.10.
9. Confirm 2.50 m balcony width and corner pads.
10. Confirm window placement on courtyard-facing ground facades and exterior-facing upper facades.
11. Confirm the 1.55 m south-end vestibule buffers and their open connections to the corridors/balconies.

## 12. Verification boundary
This is a document-only geometric reconciliation. No UEFN project was opened, built, simulated or tested. Mark all editor-dependent items EDITOR-TEST REQUIRED. The geometry is **not approved** until the owner explicitly approves the proposed corrections above.

## 12. Owner approval and R2.3 resolutions — 2026-11-16

The owner approved all geometric decisions GEO-A01–GEO-A21 and the R2.2 recommendations. This is approval of design geometry, not UEFN verification.

- Ground-floor sealed reserves: GF-W-NORTH-SEALED-RESERVE and GF-E-NORTH-SEALED-RESERVE, each 8.60×2.85 m. Structural slab collision remains; navigation/gameplay access is disabled.
- Upper-floor side pockets: sealed and registered. West pocket X8.30–17.00,Y47.55–50.80 is closed by wall UF-W-SEALED-RESERVE-WEST. East L-shaped pocket is represented by UF-E-NORTH-SEALED-RESERVE-N (6.05×1.45 m) and UF-E-NORTH-SEALED-RESERVE-E (2.65×3.25 m). Both are no-access/no-navmesh reserves.
- U-SERVICE remains 19.70×8.60 m and is sealed/no-access/no-navmesh. Structural floor collision is retained; no door is added.
- Balcony corner pads are clipped to the UF-SLAB polygon: west X17.15–20.00, east X64.00–66.85, Y47.00–50.80. No floor collision may extend into the courtyard void. Maintain a 2.50 m minimum clear continuous path after rail/post offsets.
- Cross-bays remain 2.00 m gross / 1.70 m clear net; 1.50 m openings retained.
- VEST-13 Length_m is corrected to 1.65 m from FIF bounds Y47.55–49.20.
- Stair handedness: west/lower flight rises south-to-north to the intermediate landing; east/upper flight returns north-to-south and exits at the south upper approach. Two 1.20 m clear flights, 0.30 m central separation, 20 risers at 0.18 m, nine 0.28 m goings per flight, landing 2.70×1.20 m at Z1.80.
- Vertical stack approved as recorded: GF slab −0.20/0.00; UF slab 3.35/3.60; roof slab 6.40/6.65; parapet top 7.10 m. Headroom target 2.20 m minimum; nominal stair headroom 2.80 m before beam/MEP coordination.
- Roof remains visually flat and non-accessible. Approve concealed 1.0% falls to a coordinated perimeter drainage system; exact outlets/scuppers are not located by this geometry package and require technical coordination.
- Door/window positions and dimensions, wall thicknesses, slab polygons and room envelopes in R2.2 are approved as design geometry. Room interior/bathroom fit-out remains outside this envelope approval.

The owner approval does not certify structural adequacy, waterproofing, collision, navmesh, player capsule clearance, THE GUEST traversal or UEFN import. Claude must perform those checks and report evidence separately.
