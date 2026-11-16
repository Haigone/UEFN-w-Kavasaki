> **SUPERSEDED GEOMETRY NOTICE — R2.2:** This brief was authored for R2.1 and must not be used as a geometry authority. Before any UEFN work, Claude must read `LEVEL_DESIGN_GEOMETRY.md` R2.2, `GEOMETRY_VALIDATION_REPORT.md`, `ROOM_COORDINATE_REGISTER.csv`, `DOOR_WINDOW_SCHEDULE.csv`, `wall_schedule.csv`, `LEVEL_SECTIONS.md`, and both R2.2 floor plans. R2.2 is a proposal pending owner approval; do not build/freeze it as final until approval is explicit.

# CLAUDE EXECUTION BRIEF — LEVEL GEOMETRY R2.1
Project: THE MOTEL: ROOM 13
Role: execution instructions for Claude in UEFN
Status: DOCUMENTATION HANDOFF — NOT AN ENGINE VERIFICATION

## 0. Owner decisions (locked)
- Main stair: north connector/reception, reservation X=21–27,Y=51.2–59.
- Upper balcony: continuous U-shaped route along courtyard-facing inner edges; 2.50 m clear target.
- ROOM 13: north connector, upper floor.
- Roof: flat, non-playable.
- THE GUEST: intended to navigate both floors using the north stair.
Do not reverse these decisions without owner approval.

## 1. Authority hierarchy
1. LEVEL_DESIGN_GEOMETRY.md R2.1 — only geometry authority.
2. ROOM_COORDINATE_REGISTER.csv R2.1 — coordinate register.
3. DOOR_WINDOW_SCHEDULE.csv R2.1 — openings.
4. FINAL_GROUND_FLOOR_PLAN.md and FINAL_UPPER_FLOOR_PLAN.md R2.1 — plan reading.
5. LEVEL_SECTIONS.md R2.1, STAIR_PLAN_R2.md, ROOF_PLAN_R2.md — vertical construction.
6. NAVIGATION_AND_PLAYER_FLOW.md R2.1 — player/NPC route intent.
7. UEFN_BLOCKOUT_BUILD_GUIDE.md R2.1 — build sequence.
8. GEOMETRY_VALIDATION_REPORT.md — unresolved risks.
9. EXECUTIVE_BUILD_DOSSIER.md, EXECUTIVE_FLOORPLANS.md, PRODUCTION_DETAIL_REQUIREMENTS.md — source/reference only; where conflict exists, R2.1 supersedes.

## 2. Claude's first actions
- Read every file in Horror Motel Fable folder and inspect repository tree.
- Check all R2.1 schedule rows, coordinate units, wall-face convention and cross-file consistency.
- Do not use legacy R1/E1 coordinates where R2.1 explicitly replaces them.
- Do not begin final environmental art.
- Build greybox only for geometric proof.

## 3. Mandatory geometry closure before greybox approval
A. Convert all room and circulation bounds into non-overlapping floor polygons.
B. Create wall centreline register: unique Wall_ID, start XY, end XY, thickness, bottom Z, top Z, openings, material and collision. Shared walls must appear once.
C. Create floor/slab register: polygon ID, vertices, elevation, thickness and collision.
D. Create ceiling/roof register: clear ceiling plane, suspended ceiling void, roof slab, parapet, roof drainage; courtyard remains open to sky.
E. Create upper continuous balcony as one connected U-shaped walkable polygon with two side legs and north crossbar; include corner turning pads; verify 2.50 m clear after rail geometry.
F. Resolve the north stair into a fully dimensioned plan: 20 risers, 2×10 flights, 9 goings each, landing at Z=1.80, width 1.20 m, headroom 2.20 m. Confirm reservation does not obstruct reception entry, queue or desk.
G. Detail room partitions, bathroom enclosures and wall returns. Recalculate net usable room dimensions after finishes.
H. Detail all ROOM 12→ROOM 13 wall cuts, vestibule, corridor, floor and ceiling in one continuous plan/section.
I. Place all furniture with exact X/Y/Z/yaw and bounding box; no generic "near wall" entries. Upper rooms are now 5.90 m wide; discard R2.0 furniture positions.
J. Confirm all door/window openings are on the intended face: upper room doors face courtyard balcony; upper windows face exterior.
K. Confirm the flat roof covers building union but never covers courtyard; no player roof access.

## 4. THE GUEST route closure
- Prepare ground and upper nav marker graph using NAVIGATION_AND_PLAYER_FLOW.md and ROOM_COORDINATE_REGISTER.csv.
- Stair must be tested bidirectionally by the selected NPC implementation. Do not assume default navigation supports the custom character.
- Test capsule/door width, stair step traversal, landing turning, rail collision, corridor turns and floor transition.
- Define no-go volumes for roof, balcony outside edge, locked rooms and secret spaces until story state permits access.
- Test patrol, investigate, chase, line-of-sight loss, recovery and solo capture recovery.
- Do not claim both-floor navigation works until actual editor/playtest evidence is attached.

## 5. Player traversal matrix
Run 1P full progression; 2P simultaneous photo inspection and passing; 3P capture/rescue; 4P reception queue, stair, balcony, room thresholds and ROOM 13. Repeat at normal and blocked-door states. Verify disconnect/rejoin and item persistence. Capture screenshots/video and exact build/map revision.

## 6. Required outputs from Claude
- Closed wall/floor/ceiling schedules.
- Dimensioned plans and sections, including stair and roof.
- Room-by-room furniture placement schedule and diagrams.
- Updated door/window schedule.
- Updated coordinate register.
- Collision and polygon-overlap audit.
- THE GUEST navigation graph and test evidence for both floors.
- Updated validation report with PASS/FAIL/BLOCKED and evidence.
- Change log and commit SHA.

## 7. Acceptance / non-claims
A document audit is not an editor test. Mark ENGINE-VERIFIED only when the exact test was run in UEFN and evidence is attached. If a geometry conflict is found, stop, report it, update the R2.1 authority and all dependent schedules before continuing. Do not mark final geometry approved while any required wall, stair, balcony, secret-route or NPC test is unresolved. No final environmental art authorization until owner approval after evidence review.
