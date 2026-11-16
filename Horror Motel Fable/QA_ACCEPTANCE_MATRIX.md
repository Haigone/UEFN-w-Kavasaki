# QA ACCEPTANCE MATRIX — THE MOTEL: ROOM 13

| ID | Test | Setup | Expected result | Status |
|---|---|---|---|---|
| QA-001 | Solo full run | 1 player, fresh session | Complete all six acts and reach an ending | NOT RUN |
| QA-002 | Two-player rescue | 2 players, one captured | Teammate rescues in 5s interaction; progression resumes | NOT RUN |
| QA-003 | Four-player objective sync | 4 players | Shared objective state consistent for all | NOT RUN |
| QA-004 | Disconnect item owner | Disconnect carrier of key/fuse | Shared quest item remains available | NOT RUN |
| QA-005 | Simultaneous puzzle input | Two players interact at once | Exactly one state transition; no duplication/softlock | NOT RUN |
| QA-006 | Solo capture recovery | 1 player captured | Autonomous escape/recovery route available | NOT RUN |
| QA-007 | All captured | Full team captured | Defeat/recovery checkpoint; no permanent lock | NOT RUN |
| QA-008 | Checkpoint CP01 | Reset after register | Completed register state preserved | NOT RUN |
| QA-009 | Checkpoint CP02 | Reset after power | Power puzzle remains completed | NOT RUN |
| QA-010 | Checkpoint CP03 | Reset on upper floor | Upper-floor access remains unlocked | NOT RUN |
| QA-011 | Checkpoint CP04 | Reset after ROOM 13 puzzle | Photo solution and key state preserved | NOT RUN |
| QA-012 | Monster wall occlusion | Player behind solid wall | NPC does not track through walls omnisciently | NOT RUN |
| QA-013 | Monster route reachability | Chase each route | NPC path valid; no wall clipping or doorway jam | NOT RUN |
| QA-014 | Hiding spot | Hide in each designated location | Search is fair, bounded and recoverable | NOT RUN |
| QA-015 | Door clearance | Walk through every opening | Player capsule passes; no snag | NOT RUN |
| QA-016 | Stair clearance | Walk up/down | No head collision, camera clipping or fall | NOT RUN |
| QA-017 | Secret passage | Open ROOM 12 panel | Continuous route into ROOM 13 and back | BLOCKED |
| QA-018 | ROOM 13 co-op inspection | 2 players inspect photos | Both can read/interact; exit remains clear | NOT RUN |
| QA-019 | Ending ESCAPE | Select escape conditions | Correct ending sequence, no other ending fires | NOT RUN |
| QA-020 | Ending THE TRUTH | Select truth conditions | Correct reveal and ending state | NOT RUN |
| QA-021 | Ending THE NEW GUEST | Select cycle conditions | Correct transformation/cycle ending | NOT RUN |
| QA-022 | Subtitles | Trigger every voice clue | English subtitle visible and timed | NOT RUN |
| QA-023 | Puzzle readability | First-person inspection | All mandatory text readable at intended distance | NOT RUN |
| QA-024 | Performance/memory | Target device/editor validation | Island within current Fortnite limits | NOT RUN |
| QA-025 | Island validation | UEFN publish validation | No blocking validation errors | NOT RUN |

A test can only be marked PASS after actual execution and evidence capture. Never infer pass from source code presence.


## R2.3 documentation coverage extension — NOT RUN

The following controlled test suites are now part of the release evidence plan. Their existence does not imply any test has been executed.

| Suite | Source specification | Required scope | Evidence required | Status |
|---|---|---|---|---|
| OBJ | OBJECTIVE_AND_EVENT_CATALOG.md | Six-act progression; objective predicates; single state writer; checkpoint recovery | Solo/2P/4P state trace and objective UI captures | NOT RUN |
| INT | INTERACTION_EXECUTION_SPEC.md | IN-001–IN-031; preconditions; cancel/failure; idempotency; item preservation | Interaction test log and state snapshots | NOT RUN |
| AI | MONSTER_AI_BEHAVIOUR_SPEC.md | Dormant/observe/investigate/hunt/chase/search/capture/retreat; nav; fairness; fallback | Target-version capability matrix; AI traces; nav/capture video | NOT RUN |
| CIN | CINEMATIC_AND_PRESENTATION_SPEC.md | CINE-001–CINE-011; co-op sync; camera/VO failure; fallback; one-shot endings | Sequence event logs; solo/2P/4P captures | NOT RUN |
| AUD | AUDIO_CUE_SHEET.csv + AUDIO_MIX_POLICY.md | Audio ID/trigger references; priority; ducking; concurrency; spatialization; subtitle fallback | Asset rights/import evidence; mix recordings; concurrency log | NOT RUN |
| LGT | LIGHTING_CUE_SHEET.csv + LIGHTING_STATE_SPEC.md | Act/power/chase/ending states; readability; photosensitivity; route visibility | UEFN property captures; dark/bright display tests | NOT RUN |
| AST | ASSET_PRODUCTION_PIPELINE_SPEC.md | Source/license; import; pivot/scale; collision; LOD; material/texture memory | Source/license archive; editor import and profile evidence | NOT RUN |
| UI | UI_STRING_TABLE.csv + GAMEPLAY_UI_UX_SPEC.md | StringId coverage; safe areas; input prompts; vote; journal; subtitles | UI screenshots at supported resolutions/input modes | NOT RUN |
| END | ENDING_IMPLEMENTATION_SPEC.md | ESCAPE/THE_TRUTH/THE_NEW_GUEST; END-A01; END-A02 after approval; atomic commit | Solo/2P/4P vote traces and ending sequence evidence | NOT RUN |

### Release gate

A release candidate cannot pass until all required suites are PASS with target UEFN version/build identifiers, reproducible steps, logs/screenshots/video, defects and owner sign-off. A suite blocked by unavailable platform capability must have an approved fallback and a new test; it is not silently marked PASS. Performance/memory and island validation are separate mandatory release gates.
