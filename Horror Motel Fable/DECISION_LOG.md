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
