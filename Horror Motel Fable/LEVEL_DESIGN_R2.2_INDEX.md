# LEVEL DESIGN R2.2 — SUPERSEDED BY R2.3 — DOCUMENT INDEX
Revision: LD-GEO R2.2 | 2026-11-16
Status: HISTORICAL R2.2 INDEX — OWNER APPROVAL RECORDED; CANONICAL SOURCE IS LD-GEO R2.3.

## Single candidate geometry authority
`LEVEL_DESIGN_GEOMETRY.md` R2.2 is the single candidate geometry proposal. It reconciles the source documents but does not claim owner approval. Do not use R1/E1/R2.0/R2.1 coordinates where R2.2 differs.

## Controlled geometry files
- `LEVEL_DESIGN_GEOMETRY.md` — canonical proposal and owner approval list.
- `ROOM_COORDINATE_REGISTER.csv` — room/zone bounds, FIF convention.
- `coordinate_schedule.csv` — compatibility coordinate schedule; UPPER_ROOM11 corrected.
- `DOOR_WINDOW_SCHEDULE.csv` — authoritative opening centre-lines and clear sizes.
- `door_window_schedule.csv` — legacy-format mirror; not an independent authority.
- `wall_schedule.csv` — unique wall centre-lines, thicknesses, levels and opening IDs.
- `SLAB_SCHEDULE.csv` — U-shaped ground/upper/roof slab polygons and courtyard void.
- `FINAL_GROUND_FLOOR_PLAN.md` / `FINAL_UPPER_FLOOR_PLAN.md` — written plans.
- `GROUND_FLOOR_PLAN_R2.svg` / `UPPER_FLOOR_PLAN_R2.svg` — plan drawings.
- `LEVEL_SECTIONS.md` / `SECTIONS_R2.2.svg` — vertical sections and stair/secret route.
- `STAIR_PLAN_R2.md` — stair proposal.
- `ROOF_PLAN_R2.md` — flat roof proposal.
- `GEOMETRY_VALIDATION_REPORT.md` — source conflict register and final review acceptance status.
- `LD_GEO_R2.2_FINAL_OWNER_APPROVAL_PACKET.md` — final mathematical audit, blocking anomalies, owner options and recommendations.

## Source files retained as historical references
`EXECUTIVE_BUILD_DOSSIER.md` and `EXECUTIVE_FLOORPLANS.md` contain conflicting earlier allocations. Their values are not to be used for placement without reconciliation to R2.2.

## Owner decisions already fixed
North stair location; continuous courtyard-facing upper balcony; ROOM 13 in north connector; flat roof; THE GUEST intended to use both floors.

## Approval and execution documents
- `OWNER_DECISION_GATE_R2.2.md` — owner response record for geometry decisions GEO-A01–A21 and ending decisions END-A01/END-A02.
- `LD_GEO_R2.2_FINAL_OWNER_APPROVAL_PACKET.md` — detailed rationale supporting the expanded geometry gate.
- `CLAUDE_R2.2_EXECUTION_PACKET.md` — current Claude task order, preconditions, tests and evidence contract.
- `CLAUDE_EXECUTION_PROTOCOL.md` — binding division of responsibilities and evidence policy.

## Approval boundary
R2.2 remains a proposal. The final review found unassigned floor areas, an inaccessible U-SERVICE marked walkable, one ROOM_COORDINATE_REGISTER dimension mismatch (VEST-13; the COURTYARD schema row is now corrected) and balcony turn-pad clipping that must be resolved before geometry freeze. The geometry must not be called approved or engine-verified until the owner confirms the listed decisions and Claude tests the approved build in UEFN.

> **Superseded:** owner approval on 2026-11-16 was synchronized into LD-GEO R2.3. Use LEVEL_DESIGN_R2.3_INDEX.md and LD_GEO_R2.3_APPROVAL_RECORD.md as the current authority. R2.2 remains audit history only.
