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
