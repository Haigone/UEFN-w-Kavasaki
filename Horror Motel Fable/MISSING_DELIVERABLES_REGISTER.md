# MISSING DELIVERABLES REGISTER — THE MOTEL: ROOM 13
**Baseline:** repository main, 2026-11-16

| ID | Missing / incomplete deliverable | Current evidence | Status | Required completion evidence | Dependency | Owner |
|---|---|---|---|---|---|---|
| MD-001 | Native UEFN project baseline | No .uproject/.umap/.uasset or project structure in repo | INCOMPLETO | Openable UEFN project, version and editor screenshots | Editor/project access | UEFN Technical Director |
| MD-002 | Canonical reconciled ground-floor plan | Multiple competing coordinates | BLOCCATO | Approved dimensioned plan + coordinate schedule | Geometry decision | Level Design |
| MD-003 | Canonical reconciled upper-floor plan | Dossier/CSV/SVG disagree on rooms 07–13 | BLOCCATO | Approved plan + section + schedules | Geometry decision | Level Design |
| MD-004 | ROOM 12–ROOM 13 continuous route | Conceptual path only; geometry report flags discontinuity | BLOCCATO | Plan/section plus playable editor traversal | MD-002/003 | Level Design |
| MD-005 | Complete wall/floor/ceiling schedule | wall_schedule.csv is partial | INCOMPLETO | Every structural segment, thickness, height, material, openings and collision | MD-002/003 | Technical Level Designer |
| MD-006 | Verified stair and balcony package | Schematic section and target dimensions only | INCOMPLETO | Two-flight stair plan/section, landings, rails, headroom and test | MD-002/003 | Level Design |
| MD-007 | Reconciled door/window schedule | Proposed centres/orientations; host wall mismatch risk | INCOMPLETO | Each opening tied to one host wall, swing and collision test | MD-005 | Technical Level Designer |
| MD-008 | Final furniture placements | Schedule is proposed and based on inconsistent room geometry | PRESENTE MA NON VERIFICATO | Updated coordinates, collision clearance and editor proof | MD-002/003/007 | Environment Art |
| MD-009 | UEFN-ready asset inventory with sources/licenses | Initial manifests are proposal-only | INCOMPLETO | Canonical manifest with asset source, license and import status | Geometry baseline | Art Lead |
| MD-010 | THE GUEST model sheet | Specification exists; image pack absent | INCOMPLETO | Consistent front/side/back/3-4/scale/rig sheet | Character art approval | Character Art |
| MD-011 | THE GUEST mesh, rig, textures and LODs | No mesh or import files | INCOMPLETO | Imported character with measured scale, skeleton, LOD and collision proof | MD-010; MD-001 | Character Art / Technical Art |
| MD-012 | THE GUEST animations | List only; no animation assets | INCOMPLETO | Imported/tested animation set or documented verified fallback | MD-011; NPC feasibility | Animation / Technical Art |
| MD-013 | Compilable Verse source | VERSE_SYSTEM_DESIGN.md is pseudocode/logical contract | INCOMPLETO | .verse modules compile in target UEFN release | MD-001; API verification | Verse Lead |
| MD-014 | Verified NPC implementation | Conceptual NPC Spawner binding only | INCOMPLETO | Working NPC pathing, perception, animation and capture tests | MD-001; MD-011 | UEFN / AI Lead |
| MD-015 | Configured UEFN devices and bindings | CSV targets only; editor tests required | PRESENTE MA NON VERIFICATO | Device Outliner/properties and functional binding evidence | MD-001; geometry | UEFN Implementer |
| MD-016 | Imported audio, VFX and material library | Names and schedules only | INCOMPLETO | Imported assets, licenses, trigger tests and profiling | MD-001; asset pipeline | Audio / Art |
| MD-017 | Working six-act progression and puzzles | Written flow only | PRESENTE MA NON VERIFICATO | End-to-end playable session with objective flags and recovery | MD-013/015 | Game / Verse |
| MD-018 | Capture/rescue and solo recovery | Behaviour spec only | PRESENTE MA NON VERIFICATO | Solo, 2-player and all-captured recovery recordings | MD-013/014 | Verse / QA |
| MD-019 | Three implemented endings | Narrative conditions only | PRESENTE MA NON VERIFICATO | Each ending reached independently; no race/duplicate ending | MD-017 | Game / Verse |
| MD-020 | QA evidence pack | Test matrix NOT RUN | INCOMPLETO | Pass/fail results, build version, recordings and defect log | Playable build | QA Coordinator |
| MD-021 | Performance/memory profile | Requirements only | INCOMPLETO | Measured reports for target platform/editor | Integrated build | Technical Director |
| MD-022 | Island validation and publication package | No validation/publish evidence | INCOMPLETO | Validation result and approved release checklist | MD-020/021 | Release Owner |

## Important distinction
Some deliverables have partial written specifications. They remain PRESENTE MA NON VERIFICATO or INCOMPLETO until the actual asset, editor configuration, compiled source or test evidence exists. The existence of this register is not completion of any implementation item.
