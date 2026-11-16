# GAMEPLAY ACCEPTANCE TESTS
## THE MOTEL: ROOM 13
**Test target:** UEFN build and target Fortnite release recorded by QA. This document defines expected behavior; no test is claimed passed until evidence is attached.

## 1. Test environment
Record editor/build version, island revision, platform, party size, test date, tester, session ID and Verse compile result. Run solo, 2-player and 4-player configurations.

## 2. Progression and puzzle tests
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

## 3. Inventory and multiplayer
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-010 | Two players pick up same fuse simultaneously | One team grant; no duplicate |
| GAT-011 | Picker disconnects after item grant | Team item persists |
| GAT-012 | Picker disconnects before commit | Lock clears; pickup remains available |
| GAT-013 | Four players interact with one puzzle | One authoritative state; no corruption |
| GAT-014 | Player leaves during puzzle transaction | Lock clears; puzzle retryable |
| GAT-015 | Fuse installed then CP02 restore | Slot remains filled; no duplicate item |

## 4. Capture/rescue
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

## 5. Checkpoint and disconnect
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-024 | Restore CP01 | Register/office progression retained |
| GAT-025 | Restore CP02 | Power and fuses retained |
| GAT-026 | Restore CP03 | Upper-floor access and evidence retained |
| GAT-027 | Restore CP04 | Photo reveal and ServiceKey retained |
| GAT-028 | Restore same checkpoint twice | Identical state; no duplicate actors/events |
| GAT-029 | Player rejoins same live session | Current team state restored |
| GAT-030 | All players disconnect | No claim of cross-session persistence unless separately implemented |

## 6. Endings
| Test ID | Scenario | Expected result |
|---|---|---|
| GAT-031 | Standard escape without truth chain | ESCAPE |
| GAT-032 | Full truth chain and truth choice | THE_TRUTH |
| GAT-033 | Explicit team acceptance | THE_NEW_GUEST |
| GAT-034 | Capture without acceptance | Not THE_NEW_GUEST |
| GAT-035 | Overlapping ending triggers | Exactly one ending commits |
| GAT-036 | Tie/no response in co-op vote | ESCAPE deterministic fallback |
| GAT-037 | Repeat ending trigger | No branch change or replay |

## 7. AI, readability and performance
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

## 8. Release acceptance
Release only when all critical tests pass in solo and relevant co-op party sizes; no mandatory item is permanently lost; all endings are reachable; no known softlock remains; Verse compiles in the target editor; device/API assumptions are verified; and evidence/results are attached to the build. Any failed test creates a tracked defect with severity, reproduction steps, owner and retest result.
