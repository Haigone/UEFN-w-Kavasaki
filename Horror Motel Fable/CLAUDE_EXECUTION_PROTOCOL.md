# CLAUDE EXECUTION PROTOCOL — THE MOTEL: ROOM 13

**Purpose:** this repository is the project specification and execution guide for Claude. It is not, by itself, proof of an implemented or tested UEFN island.

## 1. Binding division of responsibilities

### ChatGPT — planning and specification only
ChatGPT prepares, in dependency order and at implementation-level detail, execution plans only:
- task breakdowns and execution sequences for Claude;
- geometry decisions for owner approval, dimensioned specifications and reconciliation instructions;
- device/Verse architecture plans and implementation specifications that tell Claude what to implement; ChatGPT does not author or modify the implementation code under this operating model;
- exact editor procedures, configuration tables, test cases, expected results and evidence checklists;
- risk analysis, acceptance criteria, rollback/recovery instructions and handoff documents;
- analysis of evidence returned by Claude and the next precise execution plan.

ChatGPT does **not** claim to open or operate UEFN, place devices, import assets, compile Verse, run playtests, profile memory/performance, validate or publish the island. ChatGPT does not mark editor-dependent tasks complete without Claude's returned evidence.

### Claude — implementation and UEFN execution
Claude is the designated operator for all tasks requiring the actual UEFN project/editor or its connected execution environment:
- inspect/open the actual project and report editor/version;
- create or modify the island, geometry, assets, devices and bindings;
- implement and compile Verse against the installed UEFN release;
- run editor walkthroughs, solo/co-op tests, AI tests, QA, performance/memory checks and island validation;
- capture screenshots, logs, recordings, reports and exact changed-file/asset references;
- report failures and blockers without silently changing approved design.

If Claude lacks access to a required editor capability, Claude must stop that subtask, state the limitation and request the specific user action or alternative. It must not fabricate test evidence.

### Project owner
The owner approves creative/structural decisions, supplies access when required and authorizes publication. No publication without explicit approval.

## 2. Repository meaning and evidence policy
- Treat repository documents, CSVs, SVGs and diagrams as **design inputs / instructions**, not proof of UEFN implementation.
- A coordinate, device setting, Verse symbol or asset entry marked PROPOSED TARGET is not engine-verified.
- Do not infer that a task is complete because its specification exists or because a file was committed.
- Keep the four project statuses: COMPLETATO CON EVIDENZA, PRESENTE MA NON VERIFICATO, INCOMPLETO, BLOCCATO.
- COMPLETATO CON EVIDENZA for an editor-dependent deliverable requires Claude's concrete evidence, with project/build/editor version and reproducible steps.
- ChatGPT may mark a planning/documentation deliverable complete when the document itself is present and checked; this does not change the implementation status.

## 3. Required Claude execution packet for every task
Every task packet prepared for Claude must contain:
1. Task ID, title, priority and current status.
2. Objective and exact scope; explicit out-of-scope items.
3. Preconditions, source files to read and authoritative revision.
4. Dependencies and tasks that must not start yet.
5. Exact ordered actions in UEFN/editor or repository, including object/device names and values where verified.
6. Unknowns clearly labelled PROPOSED TARGET / NEEDS EDITOR VERIFICATION; never invent APIs or settings.
7. Expected result after each action and how to inspect it.
8. Test cases: setup, steps, expected result, failure result and recovery.
9. Evidence to return: screenshots, logs, video/timecodes, Verse compile output, asset IDs, editor version and changed paths as applicable.
10. Acceptance criteria, rollback procedure and stop conditions.
11. Exact handoff format and next dependency-ready task.

Instructions must be atomic and unambiguous. Replace phrases such as "place near the door", "test the route" or "configure the device" with measurable coordinates, identifiers, settings, steps and observable pass/fail outcomes. If exact values cannot yet be grounded, specify how Claude must measure or verify them before proceeding.

## 4. Claude response contract
At the end of each execution batch Claude must return:
- task IDs attempted and outcome per task;
- UEFN version, project/build identifier and test environment;
- exact files/assets/devices changed;
- actions actually performed;
- PASS / FAIL / BLOCKED per test, with observed versus expected result;
- evidence links or filenames and timestamps;
- compile/validation output, where applicable;
- defects, root-cause hypothesis and reproduction steps;
- any deviation from the plan, with reason;
- remaining blockers and a request for owner decisions;
- recommended next task in dependency order.

No unsupported "done", "tested", "compiled" or "ready to publish" claims.

## 5. Evidence return loop
1. ChatGPT prepares a task packet from the current repository baseline.
2. Claude executes only the authorized packet and returns evidence.
3. ChatGPT checks the returned evidence against acceptance criteria and updates planning/status documentation only.
4. If evidence is incomplete or a test fails, ChatGPT prepares a corrective packet; Claude performs the next editor operation.
5. A task advances only when its gate is satisfied. Documentation cannot substitute for editor evidence.

## 6. Current production gate — R3
The geometry design source of truth is LD-GEO R2.3 / GEO-A01–GEO-A21 and is already owner-approved as a design baseline. Do not reopen that approval or block implementation waiting for another geometry decision. The baseline is NOT editor-verified: Claude must build the greybox from the controlled R2.3 schedules, measure actual pivots/collision/clearance in UEFN, and record deviations as defects. Do not alter structural dimensions silently; a structural change requires an R2.4 proposal and owner approval.

The first operational gate is native project/editor discovery and backup (GATE A in CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md). Immediately after that, rerun the repository checker with `python tools/validate_r3_repository.py` from the Horror Motel Fable directory and refresh the static report. A static pass does not replace editor or gameplay evidence.


## 6. R3 execution authority and decision finality — 2026-11-16

The current canonical execution sequence is CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md. Claude must read it before following any older task plan or master prompt. It supersedes pre-R2.3 geometry instructions and stale roadmap/task statuses.

Binding decision records:
- LD-GEO R2.3 / GEO-A01–GEO-A21: owner-approved design.
- END-A01: owner-approved co-op quorum.
- END-A02: owner-approved three-clue TruthChainComplete gate.
- NCP-A01–A09: approved canonical English content under express delegated creative authority.

Do not ask the owner to repeat these decisions. Do not reinterpret them to work around technical limitations; use the documented UEFN fallback while preserving gameplay outcome. Any structural geometry change requires an R2.4 proposal and owner approval.

Current documentary integration report: R3_INTEGRATION_INTEGRITY_REPORT.md. It records static checks only. The current UEFN device register has 50 logical/device rows; no row is editor-verified merely by appearing in the CSV. The current 99-row asset rights register remains NOT SOURCED until actual source, license, commercial-use and UEFN publishing evidence is archived.

ChatGPT's responsibility remains documentation, cross-register consistency and execution instructions. Claude remains responsible for all actual UEFN project/editor/Verse/asset operations and evidence. Do not monitor or narrate work outside the evidence returned by Claude.
