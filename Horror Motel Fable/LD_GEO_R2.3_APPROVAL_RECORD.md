# LD-GEO R2.3 — OWNER APPROVAL & CANONICAL RELEASE RECORD

Project: THE MOTEL: ROOM 13
Repository: Haigone/UEFN-w-Kavasaki — main
Approval date: 2026-11-16
Owner response: “approvo tutto, procedi”
Approved scope: geometry decisions GEO-A01–GEO-A21 only.

## Release status

**OWNER-APPROVED DESIGN GEOMETRY — NOT UEFN-VERIFIED — NOT STRUCTURALLY CERTIFIED — NOT WATERPROOFING-VERIFIED.**

LD-GEO R2.3 is the single canonical geometry baseline. It consolidates the R2.2 proposal and the owner's explicit approval of all geometry decisions and recommended corrections. It supersedes earlier R1/E1/R2.0/R2.1/R2.2 proposals for geometry placement.

## Approved decisions

1. U-shaped footprint, 84×72 m site, origin SW, two floors, open courtyard.
2. Rooms 01–06 ground floor, 07–12 upper floor, ROOM 13 upper north connector; room bounds as R2.2.
3. Ground-floor room orientation toward courtyard, external corridors; cross-bays 2.00 m gross / 1.70 m net with 1.50 m openings.
4. Upper rooms 8.70 m nominal width; continuous U-shaped courtyard-facing balcony.
5. North stair: two parallel 1.20 m flights, 0.30 m central separator, 20 risers at 0.18 m, nine 0.28 m goings per flight, 2.70×1.20 m intermediate landing at Z1.80. West/lower flight rises south-to-north; east/upper flight returns north-to-south. Lower south approach 1.35 m nominal; upper south approach 1.20 m.
6. Wall thicknesses 0.30 m exterior/courtyard-facing and 0.15 m standard partitions; selected connector partitions 0.30 m.
7. Vertical stack: GF slab −0.20/0.00; GF clear ceiling 3.00; UF slab 3.35/3.60; UF clear ceiling 6.40; roof slab 6.40/6.65; parapet top 7.10 m.
8. ROOM 12 → ROOM 13 secret route: D-13A, VEST-13 5.90×1.65 m, D-13C, east balcony leg, north balcony crossbar, D-13B. All three doors clear 0.90×2.10 m.
9. Two GF north pockets sealed/no-access/no-navmesh; structural floor collision retained.
10. Upper west reserve sealed by UF-W-SEALED-RESERVE-WEST. Upper east L-shaped reserve registered as two sealed components. Both no-access/no-navmesh.
11. U-SERVICE sealed/no-access/no-navmesh; no new door.
12. Balcony turn pads clipped to slab polygon: west X17.15–20.00, east X64.00–66.85, Y47.00–50.80. No floor collision over courtyard void; continuous path target ≥2.50 m clear.
13. Roof flat, non-playable/no access; concealed 1.0% falls to coordinated perimeter drainage. Exact outlets and hydraulic sizing remain technical coordination.
14. Windows and all existing openings remain as in the approved DOOR_WINDOW_SCHEDULE.csv.
15. Interior bathroom/partition fit-out is excluded; only room envelopes are approved.

## Applied canonical corrections

- ROOM_COORDINATE_REGISTER.csv: VEST-13 Length_m = 1.65; five sealed reserve components added; turning pad bounds corrected; U-SERVICE collision/navmesh policy corrected.
- coordinate_schedule.csv: five sealed reserve components added; U-SERVICE marked no-navmesh; turning pad bounds corrected.
- wall_schedule.csv: new wall UF-W-SEALED-RESERVE-WEST added, joining existing north wall runs; no opening.
- DOOR_WINDOW_SCHEDULE.csv: 51 existing openings retained; no new access openings added for sealed reserves.
- SLAB_SCHEDULE.csv: U-shaped slab polygons retained; courtyard and stair void remain excluded.
- Ground and upper SVGs updated to show sealed reserves and clipped turning pads.
- Ground/upper plans, sections, stair plan, roof plan and geometry master synchronized to R2.3.

## Verification required from Claude — no claims made here

- Import/build and validate all wall/slab geometry in UEFN.
- Confirm no navmesh/player access to sealed reserves or U-SERVICE; structural floor collision remains.
- Confirm balcony union/corner clearance after clipping and rail/post offsets.
- Test all 51 openings, including secret panel/vestibule doors and wall-host alignment.
- Test stair capsule traversal, both approaches, headroom ≥2.20 m, handrails and THE GUEST traversal between floors.
- Check the 1.0% roof falls and drainage implementation with environment/technical design; no outlet coordinates are authorized by this record.
- Report any editor-driven geometry change as a proposed R2.4 change; do not silently alter R2.3.

## Explicit exclusions

The owner approval does not decide END-A01 co-op quorum or END-A02 truth-evidence gate. Those remain unapproved. It does not approve room interior/bathroom fit-out. It does not certify structure, fire egress, waterproofing, accessibility/code compliance, collision, navmesh or UEFN implementation.
