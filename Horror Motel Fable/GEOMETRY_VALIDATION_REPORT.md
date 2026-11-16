# GEOMETRY VALIDATION REPORT — OWNER-APPROVED CANONICAL GEOMETRY R2.3
Audit date: 2026-11-16
Scope: document and coordinate reconciliation only.
Status: **OWNER-APPROVED LD-GEO R2.3 — DOCUMENTARY GEOMETRY RECONCILED — NOT UEFN-VERIFIED**

## 1. Files examined
- LEVEL_DESIGN_GEOMETRY.md
- GEOMETRY_VALIDATION_REPORT.md
- LEVEL_DESIGN_R2.2_INDEX.md
- ROOM_COORDINATE_REGISTER.csv
- coordinate_schedule.csv
- DOOR_WINDOW_SCHEDULE.csv
- wall_schedule.csv
- SLAB_SCHEDULE.csv
- LEVEL_SECTIONS.md
- STAIR_PLAN_R2.md
- ROOF_PLAN_R2.md
- FINAL_GROUND_FLOOR_PLAN.md
- FINAL_UPPER_FLOOR_PLAN.md
- GROUND_FLOOR_PLAN_R2.svg
- UPPER_FLOOR_PLAN_R2.svg
- SECTIONS_R2.2.svg

## 2. Classification
| Classification | Meaning |
|---|---|
| APPROVED / FIXED | Explicit owner/project constraint |
| DERIVED | Direct arithmetic from a fixed or selected coordinate |
| APPROVED R2.3 | Owner-approved design geometry; not UEFN-verified |
| EDITOR VERIFICATION REQUIRED | Must be verified by Claude in UEFN before implementation sign-off |
| EDITOR VERIFICATION REQUIRED | Cannot be proven from files; requires UEFN testing by Claude |

Only the site datum, U footprint/open courtyard, two-floor premise, room count, and the five explicit owner decisions are treated as fixed. All numerical room/wall/opening/stair/roof values remain proposed unless individually approved.

## 3. Conflict register and resolution
| ID | Source conflict | R2.2 proposal | R2.3 final disposition |
|---|---|---|---|
| G01 | EBD places west rooms X8.30–17.00 and corridor X17.20–19.70; E1/R2.1 reverse these bands | Ground floor follows E1/R2.1: rooms on courtyard side, outer corridor on west/east perimeter side | APPROVED R2.3 |
| G02 | EBD and R2.1 use different room Y bands | R2.2 retains R2.1 Y bands (20–27, 29–36, 38–45) and labels the 2 m gaps as proposed open connector bays | APPROVED R2.3 |
| G03 | EBD upper rooms 07–12 occupy six north connector bays; E1/R2.1 place them in side wings | R2.2 uses side wings to preserve the continuous U balcony and restores 8.70 m room width | APPROVED R2.3 |
| G04 | R2.1 upper rooms only 5.90 m wide, leaving an unexplained outer strip | Upper rooms become X8.30–17.00 west and X67.00–75.70 east | APPROVED R2.3 |
| G05 | Electrical allocation overlaps the full NORTH LINK EAST area | ELECTRICAL ends at X72.90; east link is X73.20–75.70 | DERIVED partition gap; APPROVED R2.3 |
| G06 | West lobby, reception and stair connector boundaries leave ambiguous offsets | Lobby ends X19.85, reception starts X20.15, with 0.30 m partition at X20.00; north-west link/lobby split by 0.30 m partition | APPROVED R2.3 |
| G07 | ROOM 13 originally in east wing; later decision moves it to north connector | ROOM 13 upper north connector X49.00–63.70,Y51.10–59.70 | OWNER DECISION fixes location; dimensions require approval |
| G08 | ROOM 12 route coordinates used boundary points rather than host wall centre-lines; vestibule wall extents were not aligned to FIF bounds | D-13A (69.95,47.475); vestibule FIF X67.00–72.90,Y47.55–49.20 (5.90×1.65 m); west/east wall centre-lines X66.925/72.975; north Y49.275; D-13C (66.925,48.45); D-13B (56.35,50.95) | APPROVED R2.3; EDITOR VERIFICATION REQUIRED |
| G09 | Door schedules disagree on room orientation, wall host and opening centre | Uppercase DOOR_WINDOW_SCHEDULE.csv is canonical; lowercase file is a compatibility mirror | APPROVED R2.3 |
| G10 | Wall schedule only contains a partial subset of perimeter and partitions | wall_schedule.csv rebuilt as centre-line schedule with unique wall IDs and opening references | APPROVED R2.3; review all physical joins in UEFN |
| G11 | EBD/E1 vertical heights conflict with R2.1 | Z0.00 GF; ceiling3.00; slab underside3.35/top3.60; upper ceiling/roof underside6.40; roof top6.65; parapet7.10 | DERIVED internally consistent stack from proposed slab/clearance values; APPROVED R2.3 |
| G12 | Stair text states 5.32 m run but 20 risers/2 flights/9 goings each | 9×0.28=2.52 m per flight; total 18 goings=5.04 m; U-turn landing2.70×1.20; plan envelope2.70×3.72 | DERIVED arithmetic; exact layout OWNER APPROVAL + EDITOR VERIFICATION |
| G13 | Balcony width listed as 1.50 m in E1 and 2.50 m in R2.1 | Continuous U route, 2.50 m minimum clear; side leg widths adjusted to 2.55 m where needed to align wall faces | APPROVED R2.3 |
| G14 | UPPER_ROOM11 row has missing Y2, shifting subsequent CSV fields | Complete row: X67–75.7, Y29–36, Z3.6–6.4, width8.7, clear height2.8 | DERIVED from R2.2 room schedule |
| G15 | SVGs were schematic and did not consistently represent R2.1 room/balcony dimensions | Both SVG plans redrawn with R2.2 proposed bounds; SECTIONS_R2.2.svg added and syntax/labels corrected | APPROVED R2.3; not CAD/engine verification |
| G16 | EBD contains a generic 2.20×2.40 m bathroom allowance but no reconciled internal wall/door placement | R2.2 controls room envelopes only; bathroom subdivisions and fixtures are intentionally not fabricated in the wall schedule | OUT OF SCOPE — separate room-interior fit-out required |

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
- Vestibule clear FIF depth: 49.20−47.55 = 1.65 m. Wall centre-lines are offset by half the 0.15 m partition thickness so the vestibule finished faces remain on the registered bounds.

## 5. Schedule integrity and remaining geometric checks
- All room bounds use FIF convention; wall schedule uses centre-lines. SLAB_SCHEDULE.csv defines the shared U-shaped floor/roof polygon and courtyard void.
- All door/window openings must resolve to an existing Wall_ID; any missing host is a blocking document defect.
- Every shared partition must be represented once, never duplicated for adjacent rooms.
- U balcony side legs, north crossbar and corner pads must be unioned into a single walkable polygon. Do not accept point-only joins.
- Roof polygon must follow the U footprint union and exclude the courtyard.
- The ground north connector's 0.30 m partitions, the service bay door and the service reserve partitions are proposed and require owner approval.
- The upper slab includes a 3.00×4.02 m stairwell cut with guardrails on three edges; the south approach remains open. The floor slab, wall, rail and parapet geometry is not structurally validated.
- Door clear widths, headroom, stair ascent/descent, balcony fall protection, NPC capsule and navmesh remain EDITOR-TEST REQUIRED.

## 6. Owner approval checklist

The following are still unapproved numerical/layout proposals. The five high-level choices already supplied by the owner (north stair, continuous balcony, ROOM 13 north, flat roof, THE GUEST on both floors) are treated as approved intent and are not repeated as open decisions.

1. Ground-floor room orientation: confirm E1/R2.2 (rooms courtyard-facing, corridors outer side) rather than the mirrored EBD layout.
2. Ground-floor room Y bands and both 2.00 m cross-bays, including the 1.50 m clear openings on corridor and courtyard sides.
3. Upper rooms 07–12 in side wings at 8.70 m nominal width, including the two 2.00 m cross-bays per wing and their 1.50 m openings to the balcony.
4. Ground-floor 1.55 m south-end buffer zones and their open connections to the side corridors; upper-floor equivalent buffers and connections to the balcony.
5. Ground north connector allocation: west lobby/NW link, reception, office, storage, service bay, electrical room ending X72.90 and retained NE link X73.20–75.70.
6. Upper north connector allocation: ROOM 13 footprint 14.70×8.60 m, U-service zone and both non-playable service reserves.
7. Stair exact footprint, U-turn handedness, flight offsets, landing arrangement, 0.18 m riser / 0.28 m going targets, guardrails and 1.20 m approaches. North location is approved; these dimensions are not.
8. Wall thicknesses: 0.30 m exterior, 0.15 m standard partitions and 0.30 m selected connector partitions; confirm corner/junction construction.
9. Slab thicknesses: GF 0.20 m; UF and roof 0.25 m. Confirm the complete vertical stack Z=0.00/3.00/3.35/3.60/6.40/6.65/7.10.
10. Continuous balcony clear width (2.50 m minimum), 2.55 m side legs, corner turning pads, rail placement and 1.10 m rail height.
11. Flat roof parapet thickness 0.20 m, height 0.45 m, exact corner joins, roof drainage/falls and outlet locations.
12. Ground courtyard-facing windows and upper exterior-facing windows: confirm placement, sizes and sill heights.
13. ROOM 12 → ROOM 13 secret-route vestibule, door/panel centres, concealment treatment and clearances.
14. Interior service-room partitions and service-bay access, including D-G16, plus any bathroom subdivisions not represented in the current room-boundary geometry.

## 8. R2.3 document-level integrity checks (performed after schedule updates)
- ROOM_COORDINATE_REGISTER.csv: 57 data rows; all rows match the 16-column header. The COURTYARD row has the Material_Asset_ID placeholder NA and is schema-aligned (correction present in main at commit 5ac16543). VEST-13 reports Length_m=1.65, matching its FIF Y bounds 47.55–49.20. U-NORTH-HALL is a functional alias of U-NORTH-BALCONY; balcony legs and turn pads are union components and must not be built as overlapping independent collision surfaces.
- coordinate_schedule.csv: 55 data rows; all rows match the 14-column header. Cross-bays, balcony turn-pad union components, the UPPER_NORTH_HALL functional alias, service reserves and south-end buffers are represented; aliases/components do not create duplicate floor collision. UPPER_ROOM11 is complete: X67–75.7, Y29–36, Z3.6–6.4, width8.7, clear height2.8.
- DOOR_WINDOW_SCHEDULE.csv: 51 openings; all rows match the 16-column header.
- door_window_schedule.csv: 51 entries; all rows match the 12-column header and IDs/centres/sill/clear dimensions match the uppercase authority.
- wall_schedule.csv: 72 unique wall IDs; all rows match the 15-column header. Upper room partition IDs now follow ROOM 07–12 numbering.
- SLAB_SCHEDULE.csv: 5 explicit slab/void records, including the upper stairwell cut; the U footprint polygon is shared by ground, upper and roof slabs, with the courtyard excluded.
- All 51 opening Wall_ID values resolve to an existing wall. All 51 opening centres lie on the centre-line of their host wall; every clear opening span fits within its host wall segment and its vertical extent stays within the wall's Z range. All 51 wall opening references resolve to an opening ID.
- No duplicate Wall_ID values found.

Both floor-plan SVGs had a malformed duplicated initial path command (`MM`) on the U-footprint outline; this has been corrected to a valid single move command (`M`). The courtyard-side flat-roof parapet segments were also extended to meet at both north U-corners, removing the previous 0.10 m corner gaps. The section graphic's lower slab label was corrected from roof slab to ground slab (0.20 m), and the roof slab (0.25 m) is now labelled at the upper roof datum. The THE GUEST upper stair marker was moved to the clear south landing approach (24.00,51.70,3.60), outside the stairwell slab void.

The side-room partition ends now meet the adjacent corridor/outer wall centre-lines; the ROOM 12 vestibule walls are offset from its FIF bounds by half their 0.15 m thickness. Opening spans and vertical extents were rechecked after these changes.

These are CSV/schema and coordinate-reference checks only. They do not prove that wall meshes, slabs, stair collision, balcony navigation, structural support, or UEFN navigation work in the editor.

## 9. Acceptance
LD-GEO R2.3 is owner-approved design geometry, not an engine-verified or construction-certified package. The owner-approved R2.3 revision registers both ground-floor sealed reserves and all upper side-pocket components, closes the west upper reserve with a scheduled wall, marks U-SERVICE no-access/no-navmesh, clips both turning pads to the UF slab polygon, clarifies the 2.00 m gross / 1.70 m net cross-bays, and corrects VEST-13 to 1.65 m. These documentary geometry blockers are resolved. Remaining verification is editor-dependent: navmesh/collision, stair traversal, headroom around beams/MEP, Guest traversal, and physical opening behaviour. No ENGINE-VERIFIED status is asserted. No UEFN editor or playtest was run.

## 10. Approval-gate pointer and scope clarification

OWNER_DECISION_GATE_R2.2.md records the owner response for GEO-A01–GEO-A21. END-A01/END-A02 remain outside geometry scope. It has been expanded to include the final-review decisions for unassigned floor pockets, U-SERVICE access/collision, balcony pad clipping, cross-bay net depth, and roof drainage/access. LD_GEO_R2.2_FINAL_OWNER_APPROVAL_PACKET.md provides the detailed evidence and recommendations. GEO-A15 separately covers room-interior/bathroom fit-out, which R2.2 intentionally leaves undefined. Owner approval for GEO-A01–GEO-A21 was received on 2026-11-16 and is recorded in OWNER_DECISION_GATE_R2.2.md and LD_GEO_R2.3_APPROVAL_RECORD.md. Ending decisions END-A01/END-A02 remain outside this geometry approval. This document and its dimensional checks do not authorize construction or imply editor verification.


## 11. R2.3 post-approval validation

- ROOM_COORDINATE_REGISTER.csv: VEST-13 length is 1.65 m; five sealed-reserve components are explicitly registered (two GF, one UF west, two UF east).
- coordinate_schedule.csv mirrors the five reserve components and the U-SERVICE no-navmesh state.
- wall_schedule.csv contains 72 unique wall IDs; UF-W-SEALED-RESERVE-WEST and UF-E-SEALED-RESERVE-WEST close the west and east upper reserves between existing wall runs.
- DOOR_WINDOW_SCHEDULE.csv remains 51 openings; no new access openings were introduced for sealed reserves. Existing openings retain their host-wall relationships.
- U-WEST-TURN and U-EAST-TURN are clipped to X=20.00 and X=64.00 respectively; courtyard void remains excluded from UF-SLAB.
- Stair handedness and approach zones are explicitly fixed in STAIR_PLAN_R2.md; editor traversal remains unverified.
- Roof drainage concept is concealed 1.0% falls to perimeter drainage; outlet coordinates/hydraulic sizing remain outside this geometry package.
- No UEFN editor or playtest was run. No ENGINE-VERIFIED status is asserted.
