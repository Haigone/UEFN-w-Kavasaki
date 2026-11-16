# DECISION LOG — THE MOTEL: ROOM 13
**Created:** 2026-11-16  
**Purpose:** record audit and production-control decisions without rewriting previously approved creative decisions.

| Decision ID | Date | Decision / observation | Rationale | Scope | Authority | Status |
|---|---|---|---|---|---|---|
| DEC-001 | 2026-11-16 | Audit baseline is repository branch main as inspected on this date | Establish reproducible production baseline | Repository | Production Director | COMPLETATO CON EVIDENZA |
| DEC-002 | 2026-11-16 | Existing documentation is not proof of in-game implementation | Prevent false completion claims | All sectors | Production Director / QA | COMPLETATO CON EVIDENZA |
| DEC-003 | 2026-11-16 | No geometry is approved for final construction until dossier, coordinate schedules and SVGs are reconciled | Current upper-floor and ROOM 13 contradictions create build risk | Level design | Production Director; approval required from project owner | BLOCCATO |
| DEC-004 | 2026-11-16 | Preserve all exact duplicate documents; do not delete/rename in this audit | Respect repository change-control rule | Documentation | Production Director | COMPLETATO CON EVIDENZA |
| DEC-005 | 2026-11-16 | Treat VERSE_SYSTEM_DESIGN.md as logical blueprint/pseudocode, not compilable Verse | The document explicitly states API-neutral pseudocode and no compile claim | Engineering | Technical Director | COMPLETATO CON EVIDENZA |
| DEC-006 | 2026-11-16 | No UEFN implementation, compile, playtest or publication is certified by this audit | No corresponding editor/project evidence exists in inspected tree | UEFN / release | QA Coordinator | COMPLETATO CON EVIDENZA |
| DEC-007 | 2026-11-16 | First production workstream is geometry resolution; technical feasibility research may run in parallel | Geometry is the immediate dependency for blockout and placement | Production sequencing | Production Director | PRESENTE MA NON VERIFICATO |
| DEC-008 | 2026-11-16 | Canonical filenames for duplicate pairs remain undecided | Requires owner/team convention; no destructive cleanup authorized | Documentation governance | Project owner | BLOCCATO |

## Protected project decisions (not changed by this audit)
This audit does not approve changes to:
- Project title and identity: THE MOTEL: ROOM 13 / Raven Motel.
- 1986 roadside motel setting.
- 1–4 player first-person co-op survival horror target.
- Six-act structure and 40–50 minute target.
- THE GUEST antagonist concept.
- Exactly three designed endings: ESCAPE, THE TRUTH, THE NEW GUEST.
- English-only shipped experience.
- UEFN / Fortnite as target platform.

These are recorded as existing written project requirements, not independently re-approved or implemented by this audit.

## Change control
- No existing file was deleted.
- No existing design file was overwritten.
- No geometry was changed.
- No previous decision was silently superseded.
- This log records audit decisions only. Future design approvals require an explicit owner decision and a revision reference.


| DEC-009 | 2026-11-16 | Repository is a Claude-facing specification and execution guide; it is not evidence of implementation | Prevent ambiguity about the purpose of the repository | All production work | Project owner | COMPLETATO CON EVIDENZA |
| DEC-010 | 2026-11-16 | ChatGPT prepares detailed plans/specifications/evidence criteria only; Claude executes all UEFN editor operations, compilation, playtests, QA, profiling and validation | Align responsibilities with actual tool access and avoid false test claims | UEFN / production / QA | Project owner | COMPLETATO CON EVIDENZA |
| DEC-011 | 2026-11-16 | Editor-dependent tasks cannot advance without Claude's reproducible evidence; project owner approves design changes and publication | Evidence-based gates and explicit decision authority | All gates | Project owner | COMPLETATO CON EVIDENZA |

## Binding execution protocol
See `CLAUDE_EXECUTION_PROTOCOL.md` for task packet requirements, Claude's evidence return format, status rules and the execution feedback loop. This protocol clarifies roles without claiming that any UEFN work or test has already been performed.


## Re-audit observations and pending decisions — 2026-11-16

| Decision ID | Date | Decision / observation | Rationale | Scope | Authority | Status |
|---|---|---|---|---|---|---|
| DEC-012 | 2026-11-16 | Re-audit current main and the open Environment Art branch; current main contains 65 files in Horror Motel Fable plus root README | Earlier inventory count was a historical snapshot and no longer describes current main | Repository baseline | Production Director | COMPLETATO CON EVIDENZA |
| DEC-013 | 2026-11-16 | Do not merge PR #1 until its branch is synchronised with main, its data defects are corrected and it receives review | Branch is 11 commits ahead / 42 behind, draft and unreviewed | Environment Art intake | Project Owner / Production Director | BLOCCATO |
| DEC-014 | 2026-11-16 | Treat R2.0 as the current geometry candidate, not approved final geometry | It consolidates room allocation and route concept but wall/section/stair/vertical proof remains open | Level Design | Project Owner | PRESENTE MA NON VERIFICATO |
| DEC-015 | 2026-11-16 | Correct the six out-of-bounds wardrobe placements and the ROOM 12 panel offset before any placement import | Placement register conflicts with candidate room bounds and D-13A opening centre | Environment Art / Level Design | Project Owner / Art Lead | BLOCCATO |
| DEC-016 | 2026-11-16 | Repair malformed CSV rows and separate lighting/audio schemas before schedules are consumed | Confirmed header-width and schema integrity defects | Data governance | Production Director | INCOMPLETO |
| DEC-017 | 2026-11-16 | Geometry remains the physical critical path; Narrative Lock documentation may proceed in parallel unless owner explicitly changes priority | Reconciles master register/roadmap with the narrative-first phase label in CLAUDE_EXECUTION_PLAN | Production sequencing | Project Owner approval required | PRESENTE MA NON VERIFICATO |
| DEC-018 | 2026-11-16 | Claude remains sole designated operator for UEFN implementation and tests; ChatGPT prepares plans and reviews returned evidence | Confirmed by CLAUDE_EXECUTION_PROTOCOL.md and CLAUDE_EXECUTION_PLAN.md | All UEFN/editor/QA work | Project Owner | COMPLETATO CON EVIDENZA |

These entries record audit findings and recommendations. DEC-013, DEC-015 and DEC-017 require owner/discipline action; they do not authorise a merge, placement change or creative geometry change.


## R2.1 and revised asset intake decisions/observations — 2026-11-16

| Decision ID | Date | Decision / observation | Rationale | Scope | Authority | Status |
|---|---|---|---|---|---|---|
| DEC-019 | 2026-11-16 | R2.1 supersedes R2.0 and E1 wherever geometry values conflict; it remains a candidate, not final approval | Current R2.1 index and geometry validation report define this hierarchy and explicitly withhold final approval | Geometry source of truth | Project Owner | COMPLETATO CON EVIDENZA |
| DEC-020 | 2026-11-16 | Owner-locked R2.1 decisions are north stair at reception, continuous U balcony, ROOM 13 north connector, flat non-playable roof and THE GUEST both floors | Recorded in R2.1 geometry and Claude geometry brief | Level Design | Project Owner | COMPLETATO CON EVIDENZA |
| DEC-021 | 2026-11-16 | Do not merge Environment Art PR #1 in current state; it must be reauthored against R2.1, not merely rebased | Branch diverged 44 ahead / 87 behind; PR is draft, non-mergeable and based on R2.0 | Environment Art | Project Owner / Production | BLOCCATO |
| DEC-022 | 2026-11-16 | R2.1 placement review supersedes earlier six-wardrobe/panel-Y findings: nine wardrobes are out of bounds and F12 panel is 1.35 m offset in X from D-13A | R2.1 room strips narrow to 5.90 m and D-13A moves to X=69.95 | Environment Art | Art Lead / Level Design | BLOCCATO |
| DEC-023 | 2026-11-16 | Only Fab listings explicitly marked UEFN Source are treated as direct editable-source candidates; UEFN Reference is a different category | Epic's import documentation distinguishes Source from Reference; UE-only formats do not prove UEFN source compatibility | Asset acquisition | Project Owner | PRESENTE MA NON VERIFICATO |
| DEC-024 | 2026-11-16 | Use separate AUDIO_REGISTER.csv and LIGHTING_REGISTER.csv for future edits; keep lighting_audio_schedule.csv historical | Current README identifies separate registers as normalized sources | Audio / Lighting | Production Director | COMPLETATO CON EVIDENZA |
| DEC-025 | 2026-11-16 | Claude may propose a gate-anchor correction but must not change the R2.1 authority until owner approval | Gate conflict remains unresolved and structural changes require owner authority | Exterior geometry | Project Owner | BLOCCATO |

These entries do not authorize asset purchases, PR merge, geometry edits or engine acceptance.


### DEC-021 status clarification
Latest live metadata reports PR #1 `mergeable=true`, not mergeable=false. The no-merge recommendation remains unchanged because the branch is 49 ahead / 94 behind, draft and unreviewed, and still based on R2.0 rather than current R2.1. The block is readiness and governance, not Git conflict status.


### DEC-021 final status correction
The latest live check returned `mergeable=false` (earlier metadata had returned true); compare was 49 ahead / 100 behind main. Maintain the no-merge decision. Regardless of the fluctuating flag, PR #1 remains draft/unreviewed and based on R2.0 rather than R2.1.
