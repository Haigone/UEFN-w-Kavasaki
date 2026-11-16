# GEOMETRY VALIDATION REPORT — CANONICAL PROPOSAL R2.2
Audit date: 2026-11-16
Scope: document and coordinate reconciliation only.
Status: **COHERENT PROPOSAL — NOT OWNER-APPROVED — NOT UEFN-VERIFIED**.

## 1. Files examined
- EXECUTIVE_BUILD_DOSSIER.md
- LEVEL_DESIGN_GEOMETRY.md
- EXECUTIVE_FLOORPLANS.md
- coordinate_schedule.csv
- ROOM_COORDINATE_REGISTER.csv
- DOOR_WINDOW_SCHEDULE.csv
- door_window_schedule.csv
- wall_schedule.csv
- LEVEL_SECTIONS.md
- GROUND_FLOOR_PLAN_R2.svg
- UPPER_FLOOR_PLAN_R2.svg
- GEOMETRY_VALIDATION_REPORT.md (previous revision)

## 2. Classification
| Classification | Meaning |
|---|---|
| APPROVED / FIXED | Explicit owner/project constraint |
| DERIVED | Direct arithmetic from a fixed or selected coordinate |
| PROPOSED CORRECTION | Selected to create a single internally consistent proposal |
| OWNER APPROVAL REQUIRED | Do not freeze or build as final without owner confirmation |
| EDITOR VERIFICATION REQUIRED | Cannot be proven from files; requires UEFN testing by Claude |

Only the site datum, U footprint/open courtyard, two-floor premise, room count, and the five explicit owner decisions are treated as fixed. All numerical room/wall/opening/stair/roof values remain proposed unless individually approved.

## 3. Conflict register and resolution
| ID | Source conflict | R2.2 proposal | Classification / remaining action |
|---|---|---|---|
| G01 | EBD places west rooms X8.30–17.00 and corridor X17.20–19.70; E1/R2.1 reverse these bands | Ground floor follows E1/R2.1: rooms on courtyard side, outer corridor on west/east perimeter side | OWNER APPROVAL REQUIRED |
| G02 | EBD and R2.1 use different room Y bands | R2.2 retains R2.1 Y bands (20–27, 29–36, 38–45) and labels the 2 m gaps as proposed open connector bays | OWNER APPROVAL REQUIRED |
| G03 | EBD upper rooms 07–12 occupy six north connector bays; E1/R2.1 place them in side wings | R2.2 uses side wings to preserve the continuous U balcony and restores 8.70 m room width | OWNER APPROVAL REQUIRED |
| G04 | R2.1 upper rooms only 5.90 m wide, leaving an unexplained outer strip | Upper rooms become X8.30–17.00 west and X67.00–75.70 east | OWNER APPROVAL REQUIRED |
| G05 | Electrical allocation overlaps the full NORTH LINK EAST area | ELECTRICAL ends at X72.90; east link is X73.20–75.70 | DERIVED partition gap; OWNER APPROVAL REQUIRED |
| G06 | West lobby, reception and stair connector boundaries leave ambiguous offsets | Lobby ends X19.85, reception starts X20.15, with 0.30 m partition at X20.00; north-west link/lobby split by 0.30 m partition | PROPOSED CORRECTION |
| G07 | ROOM 13 originally in east wing; later decision moves it to north connector | ROOM 13 upper north connector X49.00–63.70,Y51.10–59.70 | OWNER DECISION fixes location; dimensions require approval |
| G08 | ROOM 12 route coordinates used boundary points rather than host wall centre-lines; east vestibule opening was misplaced | D-13A (69.95,47.475); vestibule Y47.55–49.20; D-13C (66.925,48.45); D-13B (56.35,50.95) | PROPOSED CORRECTION; EDITOR VERIFICATION REQUIRED |
| G09 | Door schedules disagree on room orientation, wall host and opening centre | Uppercase DOOR_WINDOW_SCHEDULE.csv is canonical; lowercase file is a compatibility mirror | PROPOSED CORRECTION |
| G10 | Wall schedule only contains a partial subset of perimeter and partitions | wall_schedule.csv rebuilt as centre-line schedule with unique wall IDs and opening references | PROPOSED CORRECTION; review all physical joins in UEFN |
| G11 | EBD/E1 vertical heights conflict with R2.1 | Z0.00 GF; ceiling3.00; slab underside3.35/top3.60; upper ceiling/roof underside6.40; roof top6.65; parapet7.10 | DERIVED internally consistent stack from proposed slab/clearance values; OWNER APPROVAL REQUIRED |
| G12 | Stair text states 5.32 m run but 20 risers/2 flights/9 goings each | 9×0.28=2.52 m per flight; total 18 goings=5.04 m; U-turn landing2.70×1.20; plan envelope2.70×3.72 | DERIVED arithmetic; exact layout OWNER APPROVAL + EDITOR VERIFICATION |
| G13 | Balcony width listed as 1.50 m in E1 and 2.50 m in R2.1 | Continuous U route, 2.50 m minimum clear; side leg widths adjusted to 2.55 m where needed to align wall faces | OWNER DECISION on continuity; width OWNER APPROVAL REQUIRED |
| G14 | UPPER_ROOM11 row has missing Y2, shifting subsequent CSV fields | Complete row: X67–75.7, Y29–36, Z3.6–6.4, width8.7, clear height2.8 | DERIVED from R2.2 room schedule |
| G15 | SVGs were schematic and did not consistently represent R2.1 room/balcony dimensions | Both SVG plans redrawn with R2.2 proposed bounds; SECTIONS_R2.2.svg added | PROPOSED CORRECTION; not CAD/engine verification |

## 4. Canonical dimensional checks
- Site area: 84×72 = 6,048 m².
- Courtyard: 44×30 = 1,320 m²; open to sky.
- West/east wing outer depth: 42 m; north connector depth: 12 m.
- Upper west/east room widths: 17.00−8.30 = 8.70 m; 75.70−67.00 = 8.70 m.
- U balcony west/east legs: 2.55 m in R2.2 where partition offsets are included; north crossbar 2.50 m.
- Upper room clear height: 6.40−3.60 = 2.80 m.
- Ground ceiling clear height: 3.00−0.00 = 3.00 m.
- Upper slab: 3.60−3.35 = 0.25 m.
- Roof slab: 6.65−6.40 = 0.25 m.
- Stair rise: 20×0.18 = 3.60 m.
- Stair flight run: 9×0.28 = 2.52 m; total 18 goings = 5.04 m, not 5.32 m.
- Vestibule depth: 49.20−47.55 = 1.65 m gross; clear usable depth depends on wall finishes and requires editor verification.

## 5. Schedule integrity and remaining geometric checks
- All room bounds use FIF convention; wall schedule uses centre-lines. SLAB_SCHEDULE.csv defines the shared U-shaped floor/roof polygon and courtyard void.
- All door/window openings must resolve to an existing Wall_ID; any missing host is a blocking document defect.
- Every shared partition must be represented once, never duplicated for adjacent rooms.
- U balcony side legs, north crossbar and corner pads must be unioned into a single walkable polygon. Do not accept point-only joins.
- Roof polygon must follow the U footprint union and exclude the courtyard.
- The ground north connector's 0.30 m partitions, the service bay door and the service reserve partitions are proposed and require owner approval.
- The floor slab, wall, rail and parapet geometry is not structurally validated.
- Door clear widths, headroom, stair ascent/descent, balcony fall protection, NPC capsule and navmesh remain EDITOR-TEST REQUIRED.

## 6. Owner approval checklist
1. Ground room orientation (E1/R2.1 vs original EBD mirror).
2. Ground room Y bands and 2 m transverse connector bays.
3. Upper side-room 8.70 m width and side-wing placement.
4. Electrical room ending X72.90 and east link retained.
5. North-west lobby, storage/service bay and upper service reserves.
6. ROOM 13 exact 14.70×8.60 m footprint.
7. Stair dimensions, handedness and exact position within north reservation.
8. Wall thicknesses: 0.30 m exterior; 0.15 m room partitions; 0.30 m selected connector partitions.
9. Vertical stack Z0/3.00/3.35/3.60/6.40/6.65/7.10.
10. Balcony 2.50 m minimum clear and corner turning pads.
11. Ground courtyard-facing windows and upper outer-facing windows.
12. Secret-route vestibule and exact opening centres.


## 8. R2.2 document-level integrity checks (performed after schedule updates)
- ROOM_COORDINATE_REGISTER.csv: 47 data rows; all rows match the 16-column header.
- coordinate_schedule.csv: 37 data rows; all rows match the 14-column header. UPPER_ROOM11 is complete: X67–75.7, Y29–36, Z3.6–6.4, width8.7, clear height2.8.
- DOOR_WINDOW_SCHEDULE.csv: 47 openings; all rows match the 16-column header.
- door_window_schedule.csv: 47 entries; all rows match the 12-column header and IDs/centres/sill/clear dimensions match the uppercase authority.
- wall_schedule.csv: 63 unique wall IDs; all rows match the 15-column header.
- SLAB_SCHEDULE.csv: 4 explicit slab/void records; the U footprint polygon is shared by ground, upper and roof slabs, with the courtyard excluded.
- All 43 opening Wall_ID values resolve to an existing wall. All opening centres lie on the centre-line of their host wall. All wall opening references resolve to an opening ID.
- No duplicate Wall_ID values found.

These are CSV/schema and coordinate-reference checks only. They do not prove that wall meshes, slabs, stair collision, balcony navigation, structural support, or UEFN navigation work in the editor.

## 9. Acceptance
R2.2 is a single coherent **proposal**, not an approved construction package. No ENGINE-VERIFIED status is asserted. No UEFN editor or playtest was run. Final geometry freeze and environmental art remain blocked until the owner approves the listed decisions and Claude verifies the approved geometry in UEFN.