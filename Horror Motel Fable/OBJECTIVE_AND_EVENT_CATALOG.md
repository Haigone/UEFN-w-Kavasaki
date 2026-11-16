# OBJECTIVE & EVENT CATALOG
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **CANONICAL GAMEPLAY LOGIC PROPOSAL — NARRATIVE APPROVAL DEPENDENCIES NOTED**
Authority: GameManager / PuzzleManager / Interaction register
Implementation: UEFN/Verse API-neutral contract; target-editor verification required.

## 1. Purpose and rules

This catalog makes act progression, objective presentation and state commits explicit. It is the source for objective IDs and completion predicates. UI displays these states; it never owns or infers them.

- All mandatory progression is solo-completable.
- Quest objectives and evidence discovery are session/team-owned.
- Each event commits once; repeat inspection may reopen readable content but cannot duplicate flags/rewards.
- Room entry alone never completes an objective unless explicitly stated.
- Optional investigation flags never block ESCAPE.
- END-A02 is pending: no truth evidence flag becomes a mandatory ending gate until owner approval.
- If a required actor is missing, recovery may restore only the interaction proxy/flag whose prerequisite has already been validated.

## 2. Canonical act state

Use six narrative acts exactly:
1. ACT I — THE ARRIVAL
2. ACT II — THE REGISTER
3. ACT III — THE POWER
4. ACT IV — THE SECOND FLOOR
5. ACT V — ROOM 13
6. ACT VI — NO VACANCY

Legacy Verse enum labels may map to these six IDs but must not create a competing story structure.

## 3. Objective catalog

| ObjectiveId | Act | Player-facing title | Instruction | Completion predicate | Next |
|---|---|---|---|---|---|
| OBJ-01-ARRIVE | I | REACH THE MOTEL | Follow the neon sign to reception | ReceptionEntered AND PhoneMessageHeard AND Room13KeyKnown AND RegisterCluesSeen | OBJ-02-REGISTER |
| OBJ-02-REGISTER | II | OPEN THE FRONT DESK | Read the register and solve its date code | RegisterSolved AND OfficeKeyGranted (IN-006) | OBJ-03-OFFICE |
| OBJ-03-OFFICE | II | FIND THE WAY UPSTAIRS | Enter the owner's office and solve the separate photo board | OfficePhotoPuzzleSolved AND UpperFloorAccessGranted | OBJ-04-POWER |
| OBJ-04-POWER | III | RESTORE THE POWER | Find three fuses, install them in matching sockets and activate the breaker | FuseAFound AND FuseBFound AND FuseCFound AND FuseAInstalled AND FuseBInstalled AND FuseCInstalled AND PowerRestored | OBJ-05-SECOND-FLOOR |
| OBJ-05-SECOND-FLOOR | IV | FIND ROOM 13 | Reach the upper floor and open the concealed panel in ROOM 12 | UpperFloorAccessGranted AND SecretPanelOpened AND Room13Unlocked | OBJ-06-ROOM-13 |
| OBJ-06-ROOM-13 | V | DISCOVER THE OWNER'S IDENTITY | Solve the four-photo chronology and complete the reveal | PhotoSequenceSolved AND Room13RevealComplete AND ServiceKeyObtained (IN-017) | OBJ-07-FINAL-ROUTE |
| OBJ-07-FINAL-ROUTE | VI | OPEN THE SERVICE ROUTE | Unlock service control and activate the gate; obtain CarKeys only if pursuing ESCAPE | ServiceKeyObtained AND PowerRestored AND GatePowered AND ServiceRouteReady AND Room13RevealComplete (derived as FinaleReady) | OBJ-08-ENDING |
| OBJ-08-ENDING | VI | DECIDE THE MOTEL'S FATE | Choose an eligible ending as a team | EndingSelected AND Ending != NONE | Session complete |

### Act completion rules
- ACT I ends when the group has entered reception, heard the phone line, discovered the anomalous Room 13 key and inspected the register. No chase.
- ACT II ends after PZ-01 grants OfficeKey and PZ-02 grants upper-floor access. Rooms 01–06 are open for investigation; inspecting every anomaly is not a mandatory Act II gate.
- ACT III ends only after all three matching fuses are installed and the breaker commits PowerRestored. The first full chase may start after this commit and authored high-noise stimulus.
- ACT IV ends after the ROOM 12 concealed panel opens and the ROOM 13 route is available. Diary, drawing and Room 06 archive are evidence discoveries, not core escape gates.
- ACT V ends after the four-photo puzzle, identity reveal and Service Key grant. The reveal flag is committed only after its readable presentation is available to the team.
- ACT VI ends after final route readiness and one ending commit.

## 4. Evidence catalog and gate separation

| EvidenceId | Location | Flag | Mandatory for core escape? | Truth role |
|---|---|---|---|---|
| EV-ROOM06-ARCHIVE | ROOM 06 | MissingGuestEvidenceFound | No | Candidate END-A02 clue |
| EV-ROOM09-DIARY | ROOM 09 | DiaryFound | No | Candidate END-A02 clue |
| EV-ROOM11-DRAWING | ROOM 11 | ChildRoomClueFound | No | Candidate END-A02 clue |
| EV-ROOM01-CRT | ROOM 01 | CRTFeedSeen | No | Supporting atmosphere |
| EV-ROOM04-PHONE | ROOM 04 | Room04RecordingHeard / Room04TranscriptRead | No | Fuse guidance; Fuse locations remain labelled in world |
| EV-ROOM13-PHOTOS | ROOM 13 | PhotoSequenceSolved | Yes, for ROOM 13 reveal progression | Puzzle/reveal gate, not a separate optional evidence pickup |

**END-A02 pending:** the recommended formula is `TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound`. Do not implement as a mandatory truth gate until the owner approves OWNER_DECISION_PACKET_R1.md. SecretPanelOpened, PhotoSequenceSolved and OwnerIdentityRevealed/Room13RevealComplete are separate progression/reveal states and are not part of that evidence formula.

## 5. State flag ownership and exact event mapping

| Flag / state | Sole writer | Authoritative interaction/event | Commit condition |
|---|---|---|---|
| ReceptionEntered | GameManager | reception entry volume / verified entry event | Player enters reception |
| PhoneMessageHeard | GameManager | IN-002 | Phone line presented with subtitle/transcript |
| Room13KeyKnown | GameManager | IN-003 | Key inspected; item is non-consumable |
| RegisterCluesSeen | GameManager | IN-004 | Register inspection |
| RegisterSolved | PuzzleManager | IN-005 | Exact code accepted |
| OfficeKeyGranted / OfficeKey | InventoryManager | IN-006 only | Drawer pickup transaction after RegisterSolved |
| OfficePhotoPuzzleSolved / UpperFloorAccessGranted | PuzzleManager | IN-007 | Correct 1974/1978/1982/1986 order; access route opens |
| FuseAFound / FuseBFound / FuseCFound | InventoryManager | IN-024 / IN-025 / IN-026 | Team pickup transaction commits |
| FuseAInstalled / FuseBInstalled / FuseCInstalled | PuzzleManager | IN-011 | Correct fuse assigned to empty matching socket |
| PowerRestored | PuzzleManager / GameManager | IN-012 | All slots filled and breaker activated |
| DiaryFound | EvidenceManager/GameManager | IN-013 | Diary inspected; readable copy available |
| ChildRoomClueFound | EvidenceManager/GameManager | IN-014 | Drawing inspected |
| SecretPanelOpened | PuzzleManager | IN-015 | Screwdriver interaction succeeds |
| Room13Unlocked | GameManager | IN-015 completion event | Route physically enabled after panel opens |
| PhotoSequenceSolved | PuzzleManager | IN-016 | Correct 1968/1974/1981/1986 order |
| OwnerIdentityRevealed / Room13RevealComplete | GameManager / CinematicManager handshake | reveal event after PZ-04 | Presentation completes and readable/journal version is available |
| ServiceKeyObtained / ServiceKey | InventoryManager | IN-017 only | Hidden compartment pickup |
| GatePowered / ServiceRouteReady | PuzzleManager | IN-018 | Service Key + power; service control opens the route and commits both flags |
| CarKeysObtained / CarKeys | InventoryManager | IN-028 | Team pickup transaction commits |
| FinaleReady | GameManager | Derived state | PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete; unlocks final choice point without requiring CarKeys |
| CoreEscapeReady | GameManager | IN-019 | FinaleReady AND CarKeys; vehicle ignition succeeds |
| MissingGuestEvidenceFound | EvidenceManager/GameManager | IN-029 | Room 06 archive inspected |
| TruthChainComplete | GameManager | derived state only | END-A02 formula, only after owner approval |
| NewGuestAccepted | EndingManager | explicit invitation interaction and END-A01 team confirmation | Every currently connected eligible player explicitly accepts |
| EndingSelected | GameManager | IN-020 / ending resolver | Eligibility + quorum + atomic lock |

## 6. Ending selector predicates

- Show the selector at the authored final choice point after FinaleReady. CarKeys/vehicle ignition are not required to reach the selector.
- ESCAPE is eligible only when CoreEscapeReady is true and the vehicle route is selected.
- THE_TRUTH is eligible when FinaleReady, TruthChainComplete, Room13RevealComplete, ServiceKeyObtained and ServiceRouteReady are true and the team explicitly selects it; CarKeys and vehicle ignition are not required.
- THE_NEW_GUEST is eligible after FinaleReady and explicit invitation interaction plus unanimous affirmative confirmation. It must not be triggered by capture, timeout, defeat or failure.
- Apply END-A01 exactly: majority for ESCAPE/THE_TRUTH; unanimous explicit consent for THE_NEW_GUEST; tie/timeout fallback to ESCAPE only if eligible; otherwise reopen choice; disconnect removes voter and recalculates/reconfirms; solo is direct.
- Ending commit is session-wide, atomic and one-shot.

## 7. Objective visibility and recovery

- Display one primary objective at a time. Substeps may show counts only; never reveal undiscovered item locations.
- Keep evidence discoveries in Journal > Evidence, including optional clues. Re-inspection is allowed.
- A clue that is mandatory under an approved decision must be recoverable and have readable text/journal fallback.
- Recovery proxies may restore an item only if its authoritative prerequisite is already committed.
- Checkpoint restore rebuilds objective and actor state from committed flags; it does not replay one-shot audio/cinematics or re-grant items.
- On disconnect, clear the player's transient locks; team progress remains.
- If a puzzle actor is missing or corrupt, do not silently mark the puzzle solved. Use the documented recovery interaction and log the reason.

## 8. Acceptance tests for the objective/event layer

| ID | Scenario | Expected result |
|---|---|---|
| OBJ-001 | Start new solo session | OBJ-01 active; no later objective visible |
| OBJ-002 | Enter reception without phone/key/register inspection | OBJ-01 remains active |
| OBJ-003 | Solve register but do not collect OfficeKey | OBJ-02 remains active |
| OBJ-004 | Collect OfficeKey and solve office photos | OBJ-04 becomes active; rooms 01–06 are not all forced |
| OBJ-005 | Complete all fuses but do not activate breaker | OBJ-04 remains active |
| OBJ-006 | Activate breaker with all fuses installed | OBJ-05 becomes active; chase cue fires once |
| OBJ-007 | Reach upper floor but do not open panel | OBJ-05 remains active |
| OBJ-008 | Open panel and enter ROOM 13 | OBJ-06 active |
| OBJ-009 | Solve photos but reveal presentation fails | Service Key/reveal progression does not falsely complete; recovery path is available |
| OBJ-010 | Inspect optional evidence in any order | Flags persist; primary objective does not regress |
| OBJ-011 | Missing END-A02 clue | ESCAPE remains eligible; THE_TRUTH unavailable until approved gate is satisfied |
| OBJ-012 | Disconnect after team pickup | Objective/inventory unchanged |
| OBJ-013 | Restore any checkpoint twice | Identical objective/actor state; no duplicate events |
| OBJ-014 | Two endings trigger simultaneously | Exactly one ending commits under eligibility/quorum lock |

## 9. Implementation note

The catalog defines logical predicates and event ownership only. Claude must map each interaction to the actual supported UEFN/Verse events and compile/test against the target release. If an event is not available, return a technical alternative without changing player-facing progression or state ownership.
