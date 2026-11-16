# CLAUDE EXECUTION PACKET — R2.2 READINESS & GREYBOX GATE
Project: THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **DOCUMENTATION READY / EXECUTION BLOCKED AT OWNER GEOMETRY APPROVAL**
Executor: Claude (UEFN/editor, Verse, assets, tests)
Planner/reviewer: ChatGPT
Approver: Project owner

## 1. Binding constraints
1. Read CLAUDE_EXECUTION_PROTOCOL.md first.
2. R2.2 is the only candidate geometry proposal. It is not approved and is not UEFN-verified.
3. R2.1 brief is superseded. Do not build from R2.1, R2.0, E1 or the Executive Build Dossier where values conflict with R2.2.
4. Do not resolve creative/layout conflicts by choosing silently.
5. Do not merge or use Environment Art PR #1 as a build source. It must be reauthored against the owner-approved and editor-verified geometry.
6. This packet authorizes read-only inspection, schema/cross-reference checks and feasibility reporting. It does not authorize final greybox construction until the owner decision gate is signed.
7. Do not fabricate test results, project files, Verse APIs or asset imports.

## 2. Source hierarchy
1. CLAUDE_EXECUTION_PROTOCOL.md
2. OWNER_DECISION_GATE_R2.2.md — approval boundary and owner decisions.
3. LEVEL_DESIGN_R2.2_INDEX.md — geometry source hierarchy.
4. LEVEL_DESIGN_GEOMETRY.md — candidate geometry proposal.
5. GEOMETRY_VALIDATION_REPORT.md — open geometry issues and arithmetic checks.
6. ROOM_COORDINATE_REGISTER.csv; coordinate_schedule.csv.
7. DOOR_WINDOW_SCHEDULE.csv; wall_schedule.csv; SLAB_SCHEDULE.csv.
8. LEVEL_SECTIONS.md; SECTIONS_R2.2.svg; STAIR_PLAN_R2.md; ROOF_PLAN_R2.md.
9. UEFN_BLOCKOUT_BUILD_GUIDE.md — execution reference only after approval.
10. Gameplay/device/asset documents, subject to geometry and narrative gates.

Legacy documents are historical references unless the R2.2 index explicitly lists them as controlled. Do not treat lowercase door_window_schedule.csv as an independent authority.

## 3. Task CLD-001 — Actual project/environment baseline
Priority P0 | Status NOT RUN | Dependency none

### Actions
1. Identify the actual UEFN project path and confirm it opens.
2. Record UEFN version/release, project identifier, island/build identifier, repository branch and commit.
3. Inventory actual project files separately from repository design documents. Report Verse files, devices, imported meshes, materials, textures, audio, animations and maps.
4. Confirm available editor/Playtest, Verse build, log, memory and validation capabilities.
5. Create or confirm a recoverable baseline/backup before any write.
6. Report any required user action or unavailable capability.

### Return
- CLAUDE_ENVIRONMENT_BASELINE.md
- project tree / inventory
- editor/version screenshot
- capability matrix AVAILABLE / UNAVAILABLE / NEEDS USER ACTION
- exact blocker list

### Acceptance
Baseline is reproducible and distinguishes repository documents from actual UEFN content. No implementation claim is inferred from the docs.

## 4. Task CLD-002 — R2.2 document and schedule integrity
Priority P0 | Status NOT RUN | Dependency CLD-001 (read-only inspection can proceed if actual project unavailable)

### Actions
1. Parse every controlled CSV with a schema-aware parser; report row count, header width, row-width failures, duplicate IDs, empty mandatory fields, invalid numbers and invalid enums.
2. Cross-reference every opening ID in DOOR_WINDOW_SCHEDULE.csv to exactly one Wall_ID in wall_schedule.csv. Report missing, duplicate and unused wall/opening references.
3. Cross-reference coordinate IDs to placement, slab, wall, material and asset references where those relationships are specified.
4. Confirm SITE, BLDG-UNION and COURTYARD fields in ROOM_COORDINATE_REGISTER.csv match their header semantics.
5. Confirm U-NORTH-HALL is an alias of U-NORTH-BALCONY and must not create a second physical slab/collision.
6. Validate U-shaped slab/roof polygons, courtyard void, balcony union, corner pads and stair opening topology from schedules/SVGs.
7. Verify ROOM 12 → D-13A → vestibule → D-13C → east balcony → north balcony → D-13B → ROOM 13 is physically continuous and two-way on paper; list any unresolved overlap or wall-cut.
8. Do not alter canonical coordinates. Report proposed corrections separately for owner review.

### Return
- R2.2_DOCUMENT_INTEGRITY_REPORT.md
- CSV parser output
- opening-to-wall cross-reference table
- ID/reference exception list
- geometry topology findings with source IDs and coordinates

### Acceptance
All structural rows parse; all mandatory references resolve exactly once; all remaining exceptions have an ID, source, impact and proposed correction. This task does not constitute UEFN verification.

## 5. Task CLD-003 — Owner approval intake
Priority P0 | Status BLOCKED pending owner | Dependency OWNER_DECISION_GATE_R2.2.md

Do not infer approval. Once the owner response is available:
1. Transcribe the exact approved/rejected items into the approval record.
2. Identify the exact geometry revision approved.
3. Recompute any dependent dimensions only after approval.
4. Report any decision that makes existing schedules inconsistent.
5. Do not begin geometry build until the decision record is complete.

## 6. Task CLD-004 — Greybox build (conditional)
Priority P0 | Status BLOCKED pending CLD-001, CLD-002, CLD-003

Only after the owner approves the geometry:
1. Duplicate/branch the project baseline.
2. Build the U-shaped ground and upper slab polygons with courtyard void; never use overlapping room-sized solid boxes.
3. Build each shared wall once from the approved wall centre-line schedule.
4. Cut openings from the approved door/window schedule and bind each to its unique host wall.
5. Build stair, stairwell opening, landing, balcony union/turn pads, guardrails and roof from the approved sections/schedules.
6. Build the ROOM 12–ROOM 13 route as a physically connected, reversible path; no teleport/one-way assumption.
7. Apply collision and walkable settings; keep all final art out of this gate.
8. Capture top-down, four elevations, critical sections, stair, balcony, secret route and Outliner screenshots.

### Mandatory tests
- 1-player full traversal of every mandatory room.
- 1-player ROOM 12 to ROOM 13 and return.
- 1-player stair up/down, landing and headroom.
- balcony loop in both directions, including both turns.
- door/window clearance and collision.
- THE GUEST capsule feasibility on both floors (AI navigation test only after the supported NPC approach is established).
- 2-player and 4-player traversal after solo spatial acceptance.

### Acceptance
No blocked mandatory route, no unintended collision seam, no duplicate floor/wall collision, no unapproved geometry changes, all tests tied to build/version and evidence. Geometry approval remains with the owner after reviewing evidence.

## 7. Task CLD-005 — Gameplay/narrative readiness (parallel, document-only)
Priority P1 | Status INCOMPLETE

1. Complete source text and clue chain for PZ-01 Guest Register (code 02-13-86).
2. Complete content and unique solution proof for PZ-02 Office Photographs (1974/1978/1982/1986).
3. Complete exact Fuse A/B/C locations and clues; align with IN-024/025/026.
4. Finalize ROOM 04 phone recording, ROOM 06 missing guest photos, ROOM 09 diary and ROOM 11 child drawing.
5. Finalize ROOM 13 four-photo visual content/captions and unique chronology proof (1968/1974/1981/1986).
6. Define THE TRUTH confrontation, player action, dialogue, consequence and cinematic beats.
7. Resolve END-A01 co-op quorum and END-A02 mandatory evidence list via owner approval.
8. Ensure every mandatory clue has a non-audio fallback and every reward flag has one authoritative grant interaction.

All unapproved creative text must be labelled PROPOSAL, not canon. Claude must not invent replacements during implementation.

## 8. Task CLD-006 — Environment Art intake (blocked)
Priority P1 | Status BLOCKED

PR #1 / environment-art/room13-v1 is not a build authority. Do not merge it. After geometry approval and editor verification:
1. Reauthor against the exact frozen geometry revision.
2. Re-run every footprint against room/corridor bounds and door swing/route clearances.
3. Resolve secret-panel anchor to D-13A.
4. Validate every Placement_ID, Asset_ID and Material_ID.
5. Validate all CSV quoting/schema, source URLs, UEFN import format and license.
6. Submit a fresh review with a concise diff and evidence.

## 9. Required Claude handoff
For every task return:
- Task ID and PASS / FAIL / BLOCKED / NOT RUN.
- UEFN version, project/build ID, branch and commit.
- exact files/assets/devices changed (or state none).
- ordered actions actually performed.
- expected vs observed results.
- evidence path/link and timestamp.
- parser/compiler/validation output.
- deviations, defects, reproduction steps and root-cause hypothesis.
- remaining owner decisions and next dependency-ready task.

## 10. Immediate execution authorization
Authorized now: CLD-001 read-only baseline and CLD-002 read-only document integrity audit.
Not authorized now: final greybox build, final placements, final art, PR merge, Verse implementation based on unapproved geometry, publication.
