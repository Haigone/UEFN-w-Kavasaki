# PROJECT DEPENDENCY MAP — THE MOTEL: ROOM 13
**Baseline:** 2026-11-16 audit of main

## 1. Critical path
```text
Repository audit / source-of-truth decision
                  |
                  v
        Canonical geometry revision
                  |
       +----------+-----------+
       |          |           |
       v          v           v
 ROOM 13 route  Stair/       Door/window/
 & circulation  balcony      wall schedules
       |          |           |
       +----------+-----------+
                  |
                  v
        Native UEFN project baseline
                  |
                  v
        Functional geometry greybox
                  |
        +---------+-----------+
        |                     |
        v                     v
 UEFN/NPC/Verse feasibility  Asset pipeline & licensing
        |                     |
        v                     v
 Shared state + devices     Character/environment assets
        |                     |
        +----------+----------+
                   |
                   v
         Integrated gameplay systems
                   |
                   v
          Solo / co-op / disconnect QA
                   |
                   v
       Performance + island validation
                   |
                   v
        Publication readiness / approval
```

## 2. Dependency register
| Node | Requires | Blocks / enables | Current status |
|---|---|---|---|
| Audit baseline | Repository read access | All production prioritisation | COMPLETATO CON EVIDENZA |
| Canonical geometry | Approved decision on conflicting plans | Blockout, placements, routes | BLOCCATO |
| ROOM 13 route | Canonical geometry, room adjacency, floor section | Secret passage, puzzle placement, chase route | BLOCCATO |
| Stair / balcony | Floor elevations, footprint and section | Upper floor access, NPC navigation | INCOMPLETO |
| Opening / wall schedules | Canonical room polygons | Collision-ready blockout | INCOMPLETO |
| UEFN project baseline | Editor access and agreed version | Build, device configuration, Verse compilation | INCOMPLETO |
| Greybox | Approved geometry + UEFN baseline | Traversal and gameplay integration | INCOMPLETO |
| NPC / Verse feasibility | UEFN version, device/API inspection | AI, capture/rescue and objective implementation | INCOMPLETO |
| Asset pipeline | Canonical manifest, source rights, import workflow | Art/audio integration | INCOMPLETO |
| THE GUEST model | Approved character sheet + verified import path | NPC visual integration | INCOMPLETO |
| Shared gameplay state | Verse/device feasibility + gameplay contract | Puzzles, checkpoints, endings | INCOMPLETO |
| Integrated gameplay | Greybox + systems + devices | Full QA | INCOMPLETO |
| QA | Playable integrated build | Release readiness | PRESENTE MA NON VERIFICATO |
| Performance / validation | Content-complete build | Publication gate | INCOMPLETO |
| Publication | All gates + explicit owner authorization | Release | INCOMPLETO |

## 3. Parallel work allowed
After the geometry source-of-truth decision is made:
- Narrative dialogue/subtitles and clue copy can be reviewed independently of geometry.
- Verse/API feasibility research can proceed while geometry is resolved, provided it does not assume unverified APIs.
- Asset sourcing, rights checks and character concept/turnaround work can proceed as non-integrated work.
- QA test design and evidence templates can proceed before the playable build exists.
- Audio cue design and sound sourcing can proceed, but final spatial placement waits for the approved layout.

## 4. Work that must not run ahead
- Final room furniture placement before room bounds and door openings are reconciled.
- Final monster patrol/chase path before the player and NPC routes are approved.
- Final device placement before trigger/interaction coordinates are stable.
- Final lighting/audio placement before spatial layout is approved.
- Final UEFN integration of custom character/animation before import and NPC compatibility are verified.
- Publication or claims of playability before end-to-end QA and island validation.

## 5. Critical blockers
**DEP-01 — Geometry conflict:** dossier, coordinate schedule, SVGs and door/wall schedules disagree on room positions, especially upper floor and ROOM 13. Blocks final blockout and placement.

**DEP-02 — Native project not evidenced:** repository contains no UEFN project/map files. Blocks any claim of an existing build; requires locating/creating the actual editor project.

**DEP-03 — Verse not implemented:** only a logical blueprint exists; no .verse source or compiler evidence. Blocks gameplay implementation acceptance.

**DEP-04 — Asset production absent/unverified:** manifest entries are proposed or explicitly NOT CREATED; no imported assets evidenced.

**DEP-05 — NPC workflow unverified:** THE GUEST model spec and conceptual device bindings do not prove supported NPC movement, animation, perception, navigation or capture workflow in target editor.

## 6. Gate definitions
- **Gate G0 — Audit:** source inventory and risks accepted.
- **Gate G1 — Geometry:** one approved, internally consistent plan/section/schedule set; no unresolved critical intersections.
- **Gate G2 — Greybox:** actual UEFN blockout is traversable in first person and solo.
- **Gate G3 — Systems:** Verse compiles; devices and core gameplay flows work.
- **Gate G4 — Content:** required assets/audio/lighting integrated.
- **Gate G5 — QA:** solo, 2-player, 4-player and recovery cases pass with evidence.
- **Gate G6 — Release:** performance, memory and island validation pass; publication explicitly authorized.

No gate is passed by documentation alone.


## Execution ownership and evidence loop
All nodes requiring editor access, UEFN construction, asset import, Verse compilation, gameplay tests, multiplayer tests, profiling or island validation are executed by **Claude**. ChatGPT supplies ordered, granular execution plans and evaluates the returned evidence; it does not run these tests. The project owner approves design decisions and release. Repository documents are guidance, not implementation proof. Every gate must include Claude's evidence, editor/project version and reproducible result before status advancement. See `CLAUDE_EXECUTION_PROTOCOL.md`.


## 7. Re-audit dependency additions

### Updated geometry dependency
`LEVEL_DESIGN_GEOMETRY.md`, `FINAL_GROUND_FLOOR_PLAN.md` and `FINAL_UPPER_FLOOR_PLAN.md` now provide a more coherent R2.0 candidate. They reduce the earlier allocation ambiguity but remain proposed and not approved. The critical geometry dependency is therefore:

**Owner review of R2.0 → canonical wall/opening/section schedules → complete CSV/reference integrity → Claude greybox and traversal evidence → geometry freeze.**

Do not treat a filename containing FINAL or a document status of DOCUMENT AUDIT COMPLETE as final geometry acceptance.

### Data-integrity gate
Before Claude or any import workflow consumes schedules:
- repair malformed rows in INTERACTION_MASTER_REGISTER.csv, PUZZLE_MASTER_REGISTER.csv and coordinate_schedule.csv;
- split lighting_audio_schedule.csv into separate schema-consistent tables;
- decide canonical uppercase vs legacy lowercase schedule names;
- complete wall_schedule.csv and reconcile its opening IDs with DOOR_WINDOW_SCHEDULE.csv.

This gate is a prerequisite for reliable blockout, gameplay bindings and placement work.

### Environment Art intake
PR #1 adds a useful design package but is not ready for merge/integration. Its branch is 11 commits ahead and 42 behind current main, remains draft, and has no review/comments/status checks on the inspected head. Rebase/synchronise, then repeat all placement and register checks. In particular, six wardrobe placements are outside their assigned room bounds, F12_SECRET_PANEL is offset 0.30 m from D-13A, and EXT_SIGN_TRIGGER is typed as an asset despite lacking an asset definition.

The Environment Art package depends on:
1. approved geometry revision;
2. corrected placement register and opening alignment;
3. canonical asset/material IDs and source/license evidence;
4. Claude's DCC/import/engine validation.

### Execution sequencing
Geometry is the current physical critical path in MASTER_TASK_REGISTER.md and PRODUCTION_ROADMAP.md. Narrative Lock documentation can proceed in parallel, but the phase order in CLAUDE_EXECUTION_PLAN.md requires owner clarification so it does not silently delay geometry resolution.

### New gates
- **Gate G0.5 — Data integrity:** all active CSV schemas parse consistently; IDs cross-reference; legacy schedules are explicitly marked.
- **Gate G1.5 — Geometry approval:** owner-approved R2.0 plan, complete wall/opening schedule, stair/balcony/secret-route sections.
- **Gate G4.5 — Art intake:** PR reviewed and synchronised; no known out-of-bounds placements; source/license and import evidence tracked.

No new gate passes by document presence alone. Claude remains responsible for UEFN execution and evidence; ChatGPT prepares the task packets and reviews returned results.


## 8. R2.1 dependency map and revised art intake

### Current source hierarchy
R2.1 is now the sole candidate geometry authority. The approved handoff sequence is:
**Owner-locked R2.1 design decisions → complete R2.1 polygons/wall/floor/ceiling/opening schedules → complete stair/balcony/roof/secret-route sections → full furnishing/asset coordinate schedule → Claude greybox → player and THE GUEST traversal evidence → owner geometry approval → final environment art.**

R2.1 owner-locked decisions are north stair at reception, continuous courtyard-facing U-shaped balcony, ROOM 13 in north connector, flat non-playable roof and THE GUEST's intended access to both floors. This does not mean the whole construction package is approved. Only greybox is authorized until the remaining geometry gates pass.

### R2.1 blockers
- Complete wall/floor/ceiling/polygon register. Current wall_schedule.csv is still a 23-row partial legacy schedule and does not represent all R2.1 walls/openings/rails.
- Explicit U-balcony corner-pad polygons and roof polygon union excluding the courtyard.
- Continuous ROOM 12 → vestibule → east balcony → north balcony → ROOM 13 route, including D-13A/B/C wall cuts and return path.
- Exact stair plan origin, flight direction, landing polygon and upper slab opening.
- Roof drainage falls and drain/downpipe positions.
- Gate anchor: GATE-01 (X40–44,Y0–1) conflicts with legacy EXT_GATE at (42,18); owner approval required before any change.
- Full furnishing schedule and valid Placement_ID/Asset_ID/Material_ID cross-references.

### Data gates
- Repair semantic alignment in IN-021/022/023 and PZ-03; row-width checks alone are insufficient.
- Keep legacy coordinate_schedule.csv and lighting_audio_schedule.csv out of automated ingestion. R2.1 coordinate register and separate AUDIO_REGISTER/LIGHTING_REGISTER are current, subject to remaining semantic checks.
- Correct ROOM_FURNISHING_SCHEDULE.csv schema: separate placement, asset and material IDs; map against actual registers.
- Separate light colour temperature from intensity units; replace Dynamic XYZ text with explicit attached-emitter mode for NPC audio.

### Environment Art branch intake
PR #1 currently diverges 44 commits ahead / 87 behind main and is mergeable=false. It still uses R2.0 authority/placements; R2.1 reduces upper room widths to 5.90 m and moves upper doors to courtyard-facing walls. Rebase alone is not sufficient: reauthor and revalidate the 195 coordinate-bearing placements. Nine wardrobes are out of R2.1 room bounds and F12_SECRET_PANEL is offset 1.35 m in X from D-13A. The source register and geometry query CSVs also need syntax repair.

### External asset source gate
Only the checked PropHaus Motel and Hotel Props bundle and Motel Signs listings explicitly advertise UEFN Source. The Motel listing advertises UEFN Reference. Other checked candidates list Unreal Engine/Blender/glTF formats without UEFN Source; treat UEFN compatibility as unconfirmed. Epic documentation distinguishes UEFN Source publisher project files from listings without that format. No listing is acquired or licensed in this audit.

### Revised execution ownership
Claude may inspect, greybox and test only within the current authorized scope. If an unresolved geometry conflict requires a structural decision, Claude records a proposed correction and stops for owner approval. ChatGPT supplies task packets and audits evidence; it does not execute UEFN or certify engine behaviour.


## 9. PR metadata correction
Latest live GitHub metadata reports PR #1 as OPEN/DRAFT and `mergeable=true`, but the branch is DIVERGED 49 ahead / 94 behind main and has no reviews/comments/status checks. The mergeable flag only indicates no current merge conflict; it does not clear the R2.0-vs-R2.1 authority mismatch, nine out-of-bounds wardrobes, panel X offset or malformed source/query CSVs. Keep the art intake gate closed until those are corrected and reviewed.


### Final mergeability status correction
The most recent live check returned `mergeable=false` (the value had fluctuated between checks); compare was 49 ahead / 100 behind main. Keep the art intake gate closed. Recheck metadata after the branch is reauthored against R2.1, not before.


### Latest branch delta
Latest branch head is 52 commits ahead / 106 behind main, DIVERGED; PR #1 is OPEN/DRAFT and latest mergeable=false. Six west wardrobes have been changed to BLOCKED with blank coordinates, but three upper-east wardrobes remain proposed outside R2.1 bounds and F12_SECRET_PANEL remains 1.35 m offset from D-13A. Asset register now has 120 rows; source-register/GQ-007 CSV errors remain. The art intake dependency remains blocked.


## 10. LD-GEO R2.3 and current dependency authority — 2026-11-16

This section supersedes R2.0/R2.1 dependency assumptions and PR branch snapshots above wherever they conflict.

### Approved design baseline
LD-GEO R2.3 and GEO-A01–GEO-A21 are OWNER-APPROVED DESIGN. This closes the owner decision gate for geometry layout, stair, balcony, roof, secret route, reserves and U-SERVICE access policy. It does not close document integrity, editor construction, collision/navmesh or traversal tests.

### Current dependency graph
**CLD-001 actual UEFN project baseline + recoverable backup** AND **CLD-002 R2.3 document/register integrity PASS** → **CLD-003 R2.3 greybox construction** → **editor traversal/collision/NPC navigation evidence** → **owner acceptance of implemented geometry** → **Environment Art PR #1 reauthoring/intake** → **asset import and content integration** → **Verse/device/AI/gameplay implementation** → **solo/2P/4P QA and profiling** → **island validation** → **owner release approval**.

CLD-001 and CLD-002 may run in parallel. CLD-003 is blocked until both pass. PR #1 remains non-authoritative and must not be merged as-is.

### Current owner decision state
- END-A01 co-op quorum: APPROVED and closed.
- END-A02 truth evidence: PENDING; use OWNER_DECISION_PACKET_R1.md.
- NCP-A01–A09 narrative copy: proposal complete; owner approval pending in OWNER_DECISION_PACKET_R1.md.
- Interior/bathroom fit-out and R2.4 deviations: separate owner approval if brought into scope.

### Current source authority
Use PRODUCTION_CONTROL_MASTER_SPEC.md, LEVEL_DESIGN_R2.3_INDEX.md, LD_GEO_R2.3_APPROVAL_RECORD.md and CLAUDE_R2.3_EXECUTION_PACKET.md. Earlier R2.0/R2.1/R2.2 task descriptions and PR statistics are retained only as historical audit evidence.
