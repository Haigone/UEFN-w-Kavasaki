# LEVEL DESIGN & GEOMETRY
## THE MOTEL: ROOM 13 — preliminary coordinate brief

**Important:** the earlier layout was a conceptual sketch, not an executable plan. It contains overlapping zones, particularly around the north service wing and ROOM 13. Do not build from it as-is. This file records the known site envelope and requires a corrected, collision-free layout before blockout.

## 1. Coordinate convention
- Site envelope: 84 m × 72 m.
- Origin (0,0,0): south-west corner of site.
- X increases east; Y increases north; Z increases upward.
- 1 metre = 100 Unreal centimetres.
- Ground floor reference: Z = 0.
- Earlier proposal for upper floor: Z = 3.5 m; verify floor thickness, headroom and stairs.
- Earlier wall targets: exterior 0.30 m; interior partitions 0.15 m.
- Earlier ceiling target: approximately 3 m clear height.
All dimensions are design targets and must be reconciled with UEFN grid snapping, modular asset dimensions and player collision.

## 2. Intended building concept
Compact U-shaped, two-level motel around a central open courtyard:
- West wing.
- East wing.
- North connecting wing containing reception and service spaces.
- Central courtyard open to sky.
- Ground-floor rooms 01–06.
- Upper-floor rooms 07–12 with balcony corridor.
- Hidden route to ROOM 13, which must feel spatially impossible but remain physically navigable.
- Service route to generator/gate and final parking escape.

## 3. Old rough envelope — reference only
Earlier rough building envelope:
- West wing: X 8–20, Y 18–60.
- East wing: X 64–76, Y 18–60.
- North body: X 8–76, Y 48–60.
- Courtyard concept: X 20–64, Y 18–48.

These rectangular envelopes overlap at the corners by design if interpreted as solid rectangles. Convert them into a single consistent wall/floor footprint and remove duplicate/overlapping geometry. The north body must not fill the courtyard. Model the U as a connected polygon with explicit wall segments and floor polygons.

## 4. Known old room ideas — do not treat as final coordinates
Ground floor:
- West wing rooms 01–03 were sketched in the west strip.
- East wing rooms 04–06 were sketched in the east strip.
- Reception, office, storage and electrical room were sketched in the north wing.
Upper floor:
- Rooms 07–12 were sketched along the north wing.
- ROOM 13 was placed in an area that overlapped room 12 / service space.
- A secret passage was sketched through the same conflicting zone.

These placements are not approved. Reallocate all rooms and service spaces to eliminate intersections and preserve circulation.

## 5. Required corrected plan outputs
Before constructing the final blockout, produce:
1. Ground-floor top-down plan with all room polygons and wall centre-lines.
2. Upper-floor top-down plan.
3. Vertical section through north wing and courtyard.
4. Stair plan and section with floor-to-floor height, risers, tread depth and landing.
5. Balcony/corridor plan with guardrail and clear walking width.
6. ROOM 13 secret route plan and section, showing how it connects without intersecting ordinary rooms.
7. Final chase route map for players and THE GUEST.
8. Door/window schedule.
9. Furniture and gameplay prop coordinate schedule.
10. Collision / navigation / trigger-volume schedule.

## 6. Minimum dimension targets to verify
- Ordinary room door: 0.90 m wide × 2.10 m high.
- Service door: about 1.00 m × 2.10 m.
- Reception main entrance: about 1.60 m × 2.30 m.
- Utility double door: about 1.60 m × 2.10 m.
- Room window: about 1.60 m × 1.20 m.
- Reception window: about 2.40 m × 1.50 m.
- Corridor clear width: target 2.50 m.
- Balcony clear width: target 2.50 m.
- Stair clear width: target 1.20 m.
These are minimum design targets, not confirmed Fortnite avatar or NPC requirements. Validate with the actual player capsule, camera and selected NPC navigation.

## 7. Exterior reference placements from old sketch
The following are old approximate anchors and may move to support the corrected plan:
- Broken car: X 34–40, Y 5–10.
- Neon sign: X 39–45, Y 15.
- Courtyard entrance: X 40–44, Y 18.
- Dumpster: X 70–74, Y 20–24.
- Vending machine: X 21–24, Y 25–28.
- Four parking/courtyard lights were roughly indicated near (25,12), (59,12), (25,43), (59,43).

## 8. Geometry validation rules
For every room and corridor:
- Store polygon bounds and wall segment endpoints.
- Check no two unrelated room polygons overlap.
- Check wall segments do not intersect except at intended corners/junctions.
- Door openings must interrupt the correct wall segment and align with a traversable path.
- Window openings must not accidentally remove required collision or create unintended player exits.
- Check headroom, ceiling clearance, stair landing and floor thickness.
- Verify the balcony has a continuous guardrail except at intended access points.
- Verify the hidden passage is physically continuous and does not intersect a normal room volume.
- Ensure ROOM 13 has an understandable entry and at least one exit.
- Ensure all required objectives are reachable by a solo player.
- Ensure THE GUEST can traverse intended chase routes; do not place its patrol nodes inside walls or inaccessible props.
- Ensure no chase route requires a jump or movement ability not available in the target UEFN configuration.
- Test in first person, not only in top-down editor view.

## 9. Required coordinate schedule format
Produce a CSV or Markdown table with:
- ID
- Floor
- Element type (wall, floor, door, window, stair, prop, trigger, light, patrol point, nav route)
- X centre / start / end
- Y centre / start / end
- Z
- Width
- Length
- Height
- Rotation
- Material / asset reference
- Collision setting
- Gameplay function
- Verification status

For walls, prefer start/end coordinates and thickness. For rectangular rooms, provide min/max bounds and calculated clear dimensions. Include units explicitly.

## 10. Required gameplay landmarks
- Parking and car.
- Neon sign and entrance.
- Reception.
- Owner's office.
- Storage.
- Electrical room.
- Rooms 01–06.
- Upper rooms 07–12.
- Room 09 diary.
- Room 11 child's room.
- Room 12 concealed panel.
- Secret passage.
- ROOM 13.
- Service key access.
- Generator / gate.
- Final vehicle route.

## 11. Design acceptance
The geometry milestone is accepted only when:
- Both floors have dimensioned, non-overlapping room footprints.
- All doors, windows, stairs and balcony openings are scheduled.
- The secret passage and ROOM 13 are coherent in plan and section.
- Player and NPC routes have been checked.
- The chase loop has no unavoidable dead end.
- Solo progression is physically possible.
- The coordinate table is complete enough to reproduce the blockout.
- All unresolved assumptions are explicitly listed.

Do not decorate before this milestone is approved.
