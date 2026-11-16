# UEFN BLOCKOUT BUILD GUIDE — LD-GEO R2.0
Purpose: greybox for geometry QA only; not an environmental art authorization.

## Before blockout
Owner review of candidate R2.0. Close room polygons, wall centre-lines, shared-wall junctions, stair flights, ROOM 12 vestibule and ROOM 13 section. Resolve floor/slab/ceiling datum. No detailed environmental assets yet.

## Coordinate conversion
UEFN cm = metres × 100 on every axis. Example (21.00,51.20,3.60) m = (2100,5120,360) cm. Keep origin and pivots consistent.

## Proposed modular greybox kit
Exterior wall 3.00×0.30×3.00 m; interior wall 3.00×0.15×3.00 m; floor tile 1×1 m; standard door rough module 1.20×2.25 m for 0.90×2.10 clear; reception rough module 1.90×2.45 m for 1.60×2.30 clear; window rough module 1.80×1.40 m for 1.60×1.20 clear. All module sizes are PROPOSED TARGET, not engine-verified.

## Build order
1. Site boundary, origin and 1 m/5 m grid.
2. U footprint as one connected polygon union.
3. Ground slabs and corridors.
4. Room shells; shared walls once.
5. Door/window openings and temporary collision doors.
6. Reception/office/storage/electrical partitions.
7. Upper slab and floor at Z=3.60.
8. Upper rooms, connector and balcony/guardrails.
9. Stair after exact flight geometry is dimensioned.
10. ROOM 12 vestibule, hall and ROOM 13 as one connected path.
11. Primitive furniture bounding boxes; preserve route clearances.
12. THE GUEST placeholder capsule only after collision spec selected.
13. Objective triggers and nav markers.
14. Solo, 2P and 4P traversal tests.
15. Correct all geometry and schedules before environmental art.

## Collision rules
Floors continuous at thresholds; walls solid except scheduled openings; glass blocking/breakable behaviour deliberate; doors/panels collision synced to open state; guardrails continuous; secret passage has walkable floor and headroom; NPC uses simple capsule/nav footprint, not per-triangle visual collision.

## Acceptance tests
First-person door passage; four-player pinch points; stair ascent/descent/headroom; balcony edge/rail; ROOM 13 enter/inspect/turn/exit; THE GUEST patrol/investigate/chase/lose sight/recover; solo objectives; disconnect/rejoin; island memory/performance. Record UEFN build, map revision, player count and evidence. Do not mark ENGINE-VERIFIED without an actual editor/playtest proof.