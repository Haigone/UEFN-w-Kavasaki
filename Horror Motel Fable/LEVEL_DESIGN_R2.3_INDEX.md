# LEVEL DESIGN R2.3 — CANONICAL INDEX

Project: THE MOTEL: ROOM 13
Revision: LD-GEO R2.3
Status: **OWNER-APPROVED GEOMETRY — NOT UEFN-VERIFIED**
Approval: 2026-11-16 — owner response “approvo tutto, procedi”.

## Canonical authority

- LEVEL_DESIGN_GEOMETRY.md — canonical geometry master.
- LD_GEO_R2.3_APPROVAL_RECORD.md — exact owner approval and scope boundary.
- ROOM_COORDINATE_REGISTER.csv — finished-inside-face coordinate register.
- coordinate_schedule.csv — consolidated spatial coordinate schedule.
- wall_schedule.csv — wall centre-lines, thicknesses, openings and continuity.
- DOOR_WINDOW_SCHEDULE.csv — all 51 approved opening placements.
- SLAB_SCHEDULE.csv — GF/UF/roof polygons, courtyard void and stair opening.
- FINAL_GROUND_FLOOR_PLAN.md / FINAL_UPPER_FLOOR_PLAN.md — level plans.
- GROUND_FLOOR_PLAN_R2.svg / UPPER_FLOOR_PLAN_R2.svg — visual plans, updated to R2.3.
- LEVEL_SECTIONS.md / SECTIONS_R2.2.svg — vertical sections and limits (drawing title updated to R2.3).
- STAIR_PLAN_R2.md — approved stair handedness and dimensions.
- ROOF_PLAN_R2.md — flat roof, no-access rule and concealed drainage concept.
- GEOMETRY_VALIDATION_REPORT.md — final documentary audit and editor verification boundary.
- OWNER_DECISION_GATE_R2.2.md — approval record for GEO-A01–GEO-A21 and owner-approved END-A01; END-A02 remains pending.

## Key approved geometry resolutions

- Two ground-floor north pockets sealed/no-access/no-navmesh.
- Upper west reserve sealed by UF-W-SEALED-RESERVE-WEST; east L-shaped reserve split into two registered components and closed by UF-E-SEALED-RESERVE-WEST.
- U-SERVICE sealed/no-access/no-navmesh.
- Balcony turning pads clipped to the UF slab polygon; no collision over courtyard void.
- Cross-bays 2.00 m gross / 1.70 m net.
- Stair west/lower flight rises south-to-north; east/upper flight returns north-to-south.
- VEST-13 length corrected to 1.65 m.
- Flat roof non-accessible, concealed 1.0% falls to coordinated perimeter drainage.

## Execution boundary

Geometry is approved as design intent. Claude must perform UEFN implementation and verification: wall junctions, openings, collisions, navmesh, stair/player capsule, THE GUEST traversal on both floors, and roof/drainage fit. No editor-dependent status may be marked complete without evidence. Any required geometry change becomes an R2.4 proposal.

END-A01 and END-A02 are not approved by this geometry release.
