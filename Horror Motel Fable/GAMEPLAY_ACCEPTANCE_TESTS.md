# GAMEPLAY ACCEPTANCE TESTS
## THE MOTEL: ROOM 13
**Execution owner:** Claude in the actual UEFN/Fortnite project environment.  
**Specification and review owner:** ChatGPT prepares test design, expected outcomes and defect analysis; it does not execute UEFN tests.  
**Status:** test cases defined; none are considered passed until Claude attaches actual evidence.

## Execution rules
- Execute the detailed sequence in CLAUDE_UEFN_EXECUTION_PLAN.md.
- Record actual editor/game version, build commit, party size, platform, tester, timestamp and evidence for every case.
- Use PASS, FAIL, BLOCKED or NOT RUN. Never infer PASS from code review alone.
- Run solo, 2-player and 4-player configurations where specified.
- A blocked/unavailable test is not a pass; include reason and next action.
- ChatGPT may review Claude's reports and prepare fixes, but must not claim to have launched UEFN, compiled Verse or run the test.

## 1. Progression and puzzle tests
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-001 | Complete six acts solo | Reach an ending without another player |
| GAT-002 | PZ-01 wrong code then correct | Retry succeeds; OfficeKey granted once |
| GAT-003 | PZ-02 wrong order then correct | Board resets; upper access opens |
| GAT-004 | PZ-03 wrong fuse socket | Fuse remains available; correct install succeeds |
| GAT-005 | PZ-04 wrong chronology then correct | Retry; reveal and ServiceKey committed once |
| GAT-006 | PZ-05 interact before prerequisites | Clear missing-requirement feedback; no item loss |
| GAT-007 | Mandatory clue audio muted | Text/environment clue still sufficient |
| GAT-008 | Required item actor missing | Recovery proxy restores only validated item |
| GAT-009 | Optional lore omitted | Core escape remains completable |

## 2. Inventory and multiplayer
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-010 | Two players pick up same fuse simultaneously | One team grant; no duplicate |
| GAT-011 | Picker disconnects after item grant | Team item persists |
| GAT-012 | Picker disconnects before commit | Lock clears; pickup remains available |
| GAT-013 | Four players interact with one puzzle | One authoritative state; no corruption |
| GAT-014 | Player leaves during puzzle transaction | Lock clears; puzzle retryable |
| GAT-015 | Fuse installed then CP02 restore | Slot remains filled; no duplicate item |

## 3. Capture/rescue
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-016 | Two-player rescue | 5-second rescue within 2 m succeeds |
| GAT-017 | Rescuer leaves range | Rescue cancels cleanly |
| GAT-018 | Rescuer disconnects | Lock clears; target remains recoverable |
| GAT-019 | Solo player captured | Self-rescue path works |
| GAT-020 | Captured for 90 seconds | Assistance/self-recovery, not death |
| GAT-021 | All connected players captured | Latest checkpoint restored |
| GAT-022 | Capture during protected puzzle | Capture is rejected/deferred |
| GAT-023 | Duplicate capture event | No second transition |

## 4. Checkpoint and disconnect
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-024 | Restore CP01 | Register/office progression retained |
| GAT-025 | Restore CP02 | Power and fuses retained |
| GAT-026 | Restore CP03 | Upper-floor access and evidence retained |
| GAT-027 | Restore CP04 | Photo reveal and ServiceKey retained |
| GAT-028 | Restore same checkpoint twice | Identical state; no duplicate actors/events |
| GAT-029 | Player rejoins same live session | Current team state restored |
| GAT-030 | All players disconnect | No claim of cross-session persistence unless separately implemented |

## 5. Endings
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-031 | Standard escape without truth chain | ESCAPE |
| GAT-032 | Full truth chain and truth choice | THE_TRUTH |
| GAT-033 | Explicit team acceptance | THE_NEW_GUEST |
| GAT-034 | Capture without acceptance | Not THE_NEW_GUEST |
| GAT-035 | Overlapping ending triggers | Exactly one ending commits |
| GAT-036 | Tie/timeout in co-op ESCAPE/THE_TRUTH vote | ESCAPE only if eligible; otherwise selector remains active for a new vote; THE_TRUTH is never implicit |
| GAT-037 | Repeat ending trigger | No branch change or replay |

## 6. AI, readability and performance
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-038 | THE GUEST investigates sound | Moves to last-known position, not wall-tracks |
| GAT-039 | NPC reaches stairs/doors/secret passage | No stuck navigation on mandatory route |
| GAT-040 | Player hides in authored spot | Enter/exit reliable; no softlock |
| GAT-041 | Mandatory interaction during threat | Protected interaction cannot be captured |
| GAT-042 | Flashlight reaches 0% | HUD/audio feedback; mandatory clues remain readable |
| GAT-043 | Battery replacement interrupted | No battery/charge loss |
| GAT-044 | Repeated phone/CRT/light triggers | No duplicate one-shot event |
| GAT-045 | First-person clipping audit | No critical camera/flashlight/prop clipping |
| GAT-046 | English UI/subtitle audit | All required text readable and consistent |
| GAT-047 | Island validation and performance | Actual memory/performance evidence recorded; no assumed pass |

## 7. Release acceptance
Release only when all critical tests pass in solo and relevant co-op party sizes; no mandatory item is permanently lost; all endings are reachable; no known softlock remains; Verse compiles in the target editor; device/API assumptions are verified; and evidence/results are attached to the build. Any failed test creates a tracked defect with severity, reproduction steps, owner and retest result.

**Ownership reminder:** Claude performs all UEFN implementation and execution. ChatGPT prepares specifications and reviews evidence/results supplied by Claude.

## 8. Register reconciliation regression tests
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-048 | Collect Fuse A/B/C and Room 02 battery | FuseA/B/C are separate team-owned quest items; battery charge remains a separate personal resource; each pickup commits once |
| GAT-049 | Collect Screwdriver; open electrical cover; later open ROOM 12 panel | One reusable team tool supports both interactions; it is not consumed or duplicated |
| GAT-050 | Solve PZ-01 and PZ-04 without collecting the visible keys | Puzzles open their respective drawers/compartments; OfficeKey and ServiceKey are granted only by IN-006 and IN-017 |
| GAT-051 | Collect CarKeys in Act VI and use vehicle ignition | CarKeys enters team inventory once; ignition remains unavailable until GatePowered and CarKeys are both true |
| GAT-052 | Inspect Room 06 missing-guest photo board | MissingGuestEvidenceFound is recorded once and appears in the journal; it gates THE_TRUTH only if owner-approved as mandatory evidence |


## 9. Objective, AI, UI and END-A01 regression tests
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-053 | Complete PZ-01 and PZ-02 without inspecting every Room 01–06 anomaly | ACT II completes; room anomaly inspection is not an accidental progression gate |
| GAT-054 | Inspect Room 01 CRT and Room 04 phone | IN-030/IN-031 set their distinct discovery/transcript flags once; no objective regression |
| GAT-055 | Activate service control then vehicle ignition | IN-018 commits GatePowered and ServiceRouteReady; IN-019 commits CoreEscapeReady only after CarKeys and GatePowered |
| GAT-056 | Co-op ending vote with 3 eligible players and 2 choose ESCAPE | ESCAPE commits once by strict majority |
| GAT-057 | Co-op ending vote tie/timeout while ESCAPE eligible | ESCAPE commits; no other branch inferred |
| GAT-058 | Co-op ending vote tie/timeout while ESCAPE ineligible | Selector remains active for a new vote; THE_TRUTH is not silently selected |
| GAT-059 | THE_NEW_GUEST confirmation with one decline | Ending does not commit; decline is not consent |
| GAT-060 | THE_NEW_GUEST confirmation with one disconnect | Disconnected player is removed; remaining connected eligible players must explicitly reconfirm unanimity |
| GAT-061 | Any ending trigger fires after EndingSelected is committed | Existing ending remains; no second cinematic or state mutation |
| GAT-062 | AI loses line of sight behind solid wall | AI navigates to last-known position and never tracks hidden live transform |
| GAT-063 | AI cannot find a valid navigation path | No teleport; repath/retreat fallback; player progression remains available |
| GAT-064 | Player enters protected puzzle/cinematic state during chase | Capture request is rejected and AI disengages safely |
| GAT-065 | All players captured | Team checkpoint recovery completes; no death/end branch is inferred |
| GAT-066 | Repeated checkpoint restore | Same flags/actors/objectives; no duplicate inventory, audio or one-shot events |

**END-A02 test gate:** before owner approval, verify that no unapproved truth clue is treated as mandatory. After explicit approval, add/enable the three-clue truth-chain tests from END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md.