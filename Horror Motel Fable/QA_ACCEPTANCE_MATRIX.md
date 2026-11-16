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
