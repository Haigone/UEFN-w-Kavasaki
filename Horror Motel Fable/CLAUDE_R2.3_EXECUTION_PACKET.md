# CLAUDE EXECUTION PACKET — LD-GEO R2.3
Project: THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **OWNER GEOMETRY APPROVED / UEFN BASELINE AND DOCUMENT AUDIT NOT YET VERIFIED**
Executor: Claude (UEFN/editor, Verse, assets, tests)
Planner/reviewer: ChatGPT
Approver: Project owner

## 1. Binding source hierarchy
1. CLAUDE_EXECUTION_PROTOCOL.md
2. LD_GEO_R2.3_APPROVAL_RECORD.md — sole geometry approval record.
3. LEVEL_DESIGN_R2.3_INDEX.md — current geometry source index.
4. LEVEL_DESIGN_GEOMETRY.md and the R2.3 controlled schedules/registers.
5. GEOMETRY_VALIDATION_REPORT.md and R2.3 sections/plans.
6. UEFN_BLOCKOUT_BUILD_GUIDE.md — execution reference, subject to this packet.
7. Gameplay, device and asset documents, subject to their own approval gates.

R2.3 supersedes earlier geometry revisions. R2.2 packet/index are historical. Do not use PR #1 as a build authority. Do not silently change canonical dimensions. Do not claim editor validation from document checks.

## 2. Approval boundary
The owner approved GEO-A01–GEO-A21 on 2026-11-16 (“approvo tutto, procedi”). LD-GEO R2.3 is approved as design geometry only. It is **not** UEFN-verified, structurally certified, waterproofing-verified, collision-tested or navmesh-tested.

Approved scope includes the R2.3 room envelopes, walls/openings, slabs, stair, secret route, balcony clipping, sealed reserves, U-SERVICE access policy and non-playable roof as recorded in LD_GEO_R2.3_APPROVAL_RECORD.md.

Not approved by that decision:
- END-A01: co-op ending quorum, timeout and disconnect rules.
- END-A02: mandatory evidence list for THE TRUTH.
- Room interior/bathroom partitions and fit-out.
- Editor-driven geometry changes; propose these as R2.4 and obtain owner approval.

## 3. CLD-001 — Actual UEFN project/environment baseline
Priority P0 | Status NOT RUN | May start immediately | Read-only until backup confirmed.

Actions:
1. Locate the actual UEFN project and confirm it opens.
2. Record UEFN version, project/island identifiers, build identifier, repository branch and commit.
3. Inventory actual project content separately from design documents: maps, Verse files, devices, meshes, materials, textures, audio, animations and imported assets.
4. Confirm editor, Playtest, Verse build/log, memory and island-validation capabilities.
5. Establish and document a recoverable backup/branch before any project write.
6. Identify required owner actions and unavailable capabilities.

Return: CLAUDE_ENVIRONMENT_BASELINE.md, project tree/inventory, editor/version evidence, capability matrix (AVAILABLE / UNAVAILABLE / NEEDS USER ACTION), exact blockers.

Acceptance: reproducible baseline; clear distinction between repository specifications and actual UEFN content. No implementation inferred from documents.

## 4. CLD-002 — R2.3 document/register integrity audit
Priority P0 | Status NOT RUN | Start immediately; can run if UEFN project is unavailable.

Actions:
1. Parse every R2.3 controlled CSV with schema-aware validation: row/header widths, duplicate IDs, mandatory empty fields, invalid numbers/enums.
2. Cross-reference every DOOR_WINDOW_SCHEDULE Opening_ID to exactly one host Wall_ID; report missing, duplicate and unused references.
3. Cross-reference coordinate IDs to wall/slab/placement/material/asset references wherever defined.
4. Verify SITE, BLDG-UNION and COURTYARD semantic columns.
5. Verify U-NORTH-HALL is an alias of U-NORTH-BALCONY and creates no duplicate physical slab/collision.
6. Validate U-shaped slab polygons, courtyard and stair voids, balcony union/clipped pads, roof footprint and stair topology.
7. Verify the reversible ROOM 12 → D-13A → VEST-13 → D-13C → east balcony → north balcony → D-13B → ROOM 13 route, including wall cuts and clearances.
8. Confirm sealed reserve components and U-SERVICE are no-access/no-navmesh while required structural floor collision is retained.
9. Do not edit canonical coordinates. List proposed corrections separately with source IDs, impact and recommendation.

Return: R2.3_DOCUMENT_INTEGRITY_REPORT.md, parser output, opening-to-wall cross-reference, exception list and topology findings with IDs/coordinates.

Acceptance: all controlled CSVs parse; mandatory references resolve exactly once; remaining exceptions are explicit and actionable. This is not UEFN verification.

## 5. CLD-003 — Greybox construction
Priority P0 | **BLOCKED pending CLD-001 backup/baseline and CLD-002 PASS**.

After both gates pass:
1. Duplicate/branch the verified project baseline.
2. Build approved R2.3 ground and upper U-shaped slab polygons, preserving courtyard and stair voids.
3. Build each shared wall once from the canonical centre-line schedule.
4. Cut openings from DOOR_WINDOW_SCHEDULE.csv and bind each to its unique host wall.
5. Build stair, landing, stairwell opening, continuous balcony, clipped turn pads, guardrails and non-playable roof.
6. Implement sealed reserve and U-SERVICE collision/navmesh rules.
7. Build the ROOM 12–ROOM 13 route as a continuous, reversible physical path.
8. Capture top-down, four elevations, critical sections, stair, balcony, secret route, reserves and Outliner evidence.

Tests: solo full mandatory traversal; ROOM 12↔ROOM 13; stair up/down, approaches and headroom; balcony loop both directions; all opening clearances/collision; THE GUEST capsule feasibility on both floors when supported NPC navigation is established; then 2-player and 4-player traversal.

Acceptance: no blocked mandatory route, collision seam, duplicate collision, unapproved geometry change or unexplained deviation. Attach build/version-specific evidence. Owner reviews and accepts the implemented geometry separately from design approval.

## 6. CLD-004 — Gameplay, narrative and Verse readiness
Priority P1 | Parallel document/design work permitted; implementation only against verified interfaces.

Complete and reconcile: PZ-01 Guest Register (02-13-86); PZ-02 Office Photographs (1974/1978/1982/1986); exact Fuse A/B/C locations and clues aligned to IN-024/025/026; ROOM 04 phone recording; ROOM 06 missing guest photos; ROOM 09 diary; ROOM 11 child drawing; ROOM 13 four-photo content/captions and chronology (1968/1974/1981/1986); THE TRUTH confrontation/action/dialogue/consequence/cinematic beats.

Narrative proposal pack is not canon until owner approval. Resolve END-A01 and END-A02 with the owner before implementing co-op vote/quorum logic or making evidence clues mandatory. Solo ending selection and atomic ending lock may be implemented only if the approved gameplay contract supports them. Every mandatory clue needs a non-audio fallback; each reward flag has one authoritative grant interaction.

Verse implementation must be compiled against the actual current UEFN Verse API. Do not invent API signatures or report pseudocode as implementation.

## 7. CLD-005 — Environment Art intake
Priority P1 | BLOCKED pending greybox geometry acceptance.

Environment Art PR #1 is not a build authority and must not be merged as-is. After R2.3 is editor-verified:
1. Reconcile/re-author every placement against the accepted build.
2. Recheck room/corridor bounds, door swings, route and collision clearances.
3. Resolve secret-panel anchor to D-13A and exterior gate/sign anchors against approved gameplay.
4. Validate Placement_ID, Asset_ID and Material_ID references, CSV schema, source/license evidence and UEFN import formats.
5. Submit a revised PR with diff and editor evidence. No candidate asset is considered acquired, licensed, imported or accepted without evidence.

## 8. Required handoff for every task
Return Task ID and PASS / FAIL / BLOCKED / NOT RUN; UEFN version; project/build ID; branch/commit; exact files/assets/devices changed; ordered actions actually performed; expected vs observed; evidence path and timestamp; parser/compiler/validation output; defects and reproduction steps; remaining owner decisions and next dependency-ready task.

## 9. Immediate authorization
Authorized now: CLD-001 read-only environment baseline and CLD-002 read-only R2.3 integrity audit.
Not authorized until their gates pass: greybox writes, final art placements, PR #1 merge, final Verse integration against unverified interfaces, publication.
