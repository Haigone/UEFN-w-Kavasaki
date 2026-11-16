# LEVEL SECTIONS — OWNER-APPROVED CANONICAL GEOMETRY R2.3
Status: OWNER-APPROVED LD-GEO R2.3 — NOT UEFN-VERIFIED.
Graphic sections: `SECTIONS_R2.2.svg`. Slab polygons: `SLAB_SCHEDULE.csv`. All coordinates in metres.

## Vertical datum
| Element | Z |
|---|---:|
| Ground slab underside / top | −0.20 / 0.00 |
| Ground slab thickness | 0.20 m |
| Ground FFL | 0.00 |
| Ground clear ceiling | 3.00 |
| Upper slab underside | 3.35 |
| Upper slab top / Upper FFL | 3.60 |
| Upper clear ceiling / roof underside | 6.40 |
| Roof slab top | 6.65 |
| Parapet top | 7.10 |

Ground slab target 0.20 m thickness (EBD-derived proposal); upper and roof slabs target 0.25 m thickness (E1-derived proposal). Owner approval required for all slab thicknesses. Ground ceiling void between Z3.00 and Z3.35 is 0.35 m. Upper clear height is 2.80 m. These values reconcile the EBD and E1 vertical conflicts as one proposed stack; owner approval is required.

## A–A — West wing and courtyard-facing balcony
Section line X=14.00, looking east. Show ground ROOM 01/02/03 below upper ROOM 07/08/09. Outer wall centreline X=8.15, room outer FIF X=8.30. Upper balcony is not intersected by X=14; its courtyard-facing edge is at X=19.70. The upper room doors are on wall centreline X=17.075 and open east to balcony. The Y27–29 and Y36–38 gaps are proposed cross-bays with 1.50 m openings through the balcony partition at X=17.075 and X=66.925. Ground room windows face courtyard at wall centreline X=19.85. Show upper slab Z3.35–3.60 and roof slab Z6.40–6.65.

## B–B — North connector east-west
Section line Y=55.00, looking north. Ground allocations left-to-right: NW link X8.30–10.80; west lobby X11.10–19.85; reception X20.15–37.70; office X38–47; service/storage reserve X47.30–57; electrical X57.30–72.90; NE link X73.20–75.70. Upper allocations: west service reserve X8.30–19.85; stair landing X20.15–28.70; U-service X29–48.70; ROOM 13 X49–63.70; east service reserve X64.00–75.70. The upper balcony crossbar is south of this section at Y48.30–50.80.

## C–C — North U-turn stair
Reservation X21–27,Y51.20–59.00. Proposed assembly X22.65–25.35,Y52.45–56.17. Two 1.20 m clear parallel flights, 0.30 m central structure/clearance band; 20 risers total at 0.18 m, 10 per flight; 9 goings per flight at 0.28 m; each flight run 2.52 m. Intermediate U-turn landing 2.70×1.20 m at Z1.80. Plan envelope 2.70×3.72 m. Upper south approach is 1.20 m from Y51.10 to Y52.30; lower south approach is 1.35 m nominal from Y51.10 to stair footprint Y52.45. Stair occupies reception floor area; counter/queue furniture must be kept clear. Headroom ≥2.20 m above nosings and landings. Upper slab cut X22.50–25.50,Y52.30–56.32 (3.00×4.02 m) through Z3.35–3.60; guardrail west/east/north and open south landing approach. The arithmetic is derived; owner-approved handedness: west/lower flight rises south-to-north; east/upper flight returns north-to-south to the south upper approach. Claude must verify structure, headroom, capsule clearance and collision.

## D–D — ROOM 12 to ROOM 13
Plan/section route:
- D-13A centre (69.95,47.475), panel in ROOM 12 north wall, opens north.
- Vestibule FIF X67.00–72.90,Y47.55–49.20, clear 5.90×1.65 m, FFL3.60. Wall centre-lines: west X66.925, east X72.975, north Y49.275; south boundary is shared ROOM 12 north wall Y47.475.
- D-13C centre (66.925,48.45), opens west into east balcony leg.
- Follow east leg to the east corner pad, then west along north balcony crossbar.
- D-13B centre (56.35,50.95), in ROOM 13 south wall, opens north.
Show upper FFL Z3.60, slab thickness0.25, ceiling/roof underside Z6.40, and ground electrical room below. No vertical cut through the floor slab is required; the route remains on the upper floor. Continuous 0.90 m clear door width and 2.20 m minimum overhead target.

## E–E — Courtyard and continuous balcony
Courtyard void X20–64,Y18–48 remains open to sky. Upper balcony union consists of west leg X17.15–19.70, east leg X64.30–66.85, north crossbar X19.70–64.30,Y48.30–50.80 and clipped corner pads west X17.15–20.00, east X64.00–66.85,Y47.00–50.80. Clear path 2.50 m minimum after rail posts. Courtyard-facing guardrail target 1.10 m; centre-lines X19.85, X64.15 and Y48.15 sit outside the 2.50 m walkable polygon. Ground and upper floor slabs are separate at Z0 and Z3.60.

## F–F — Flat roof
Flat roof slab underside Z6.40, top Z6.65, parapet top Z7.10. Roof polygon follows the U footprint union; courtyard is excluded. Roof has no player access. Courtyard-side parapet segments meet continuously at both north U-corners; use wall_schedule.csv centre-lines and miter/trim corners without gaps or stacked collision. Owner-approved concept: visually flat roof with concealed 1.0% falls to a coordinated perimeter drainage system. Exact outlet/scupper locations remain for technical coordination; do not invent positions.

## Geometry limitations
These are dimensioned design sections, not proof of UEFN collision, navmesh, stair traversal, waterproofing or structural support. No UEFN testing was performed.

## R2.3 sealed reserves and collision policy

Ground sealed reserves: X11.10–19.70 and X64.30–72.90, Y45.15–48.00. Upper west sealed reserve: X8.30–17.00,Y47.55–50.80, closed by UF-W-SEALED-RESERVE-WEST. Upper east L-shaped reserve is closed by UF-E-SEALED-RESERVE-WEST. Upper east L-shaped reserve components: X67.00–73.05,Y49.35–50.80 and X73.05–75.70,Y47.55–50.80. These spaces retain structural floor collision but are excluded from navmesh and gameplay. U-SERVICE is similarly sealed/no-access/no-navmesh. They are not player traversal routes.
