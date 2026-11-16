# GAMEPLAY UI/UX, QUEST TRACKER & CLUE JOURNAL SPEC
## THE MOTEL: ROOM 13
**Revision:** 1.0 — 2026-11-16
**Status:** Proposed implementation baseline; does not override approved narrative, geometry, item or gameplay rules.
**Ownership:** ChatGPT prepares specifications; Claude implements and validates in UEFN.

## 1. Purpose and authority
This document specifies the player-facing behaviour missing between the existing gameplay state model and the actual experience: objectives, clues, pickups, inventory, trackers, puzzles, rescue and endings.

Authority order:
1. Approved Game Design Bible, canonical act/flag contracts and owner decisions.
2. Gameplay Systems, Item & Inventory, Puzzle and Interaction registers.
3. This document where the above sources are silent.
4. Conflicts must be logged, not silently resolved by implementation.

UI is a per-player presentation of authoritative session/team state. It never owns progression. Opening/closing a journal, changing a tracked objective or disconnecting must not alter team quest flags.

## 2. UX principles
- Minimal persistent HUD; preserve darkness, uncertainty and environmental discovery.
- Always communicate the immediate mandatory task without revealing puzzle answers.
- Never reveal THE GUEST's exact location, undiscovered clues, hidden doors or uncollected item locations.
- Critical information never depends on audio alone.
- Team-shared quest progress is identical for every connected player; flashlight charge remains personal.
- Optional clues are distinct from mandatory progression and do not block ESCAPE.
- Use platform Interact/Back/Journal bindings, not keyboard-only instructions.
- UI remains legible at common Fortnite resolutions and safe areas.

## 3. Persistent HUD

### 3.1 Elements
**Primary objective — upper-left**
- One active objective title, one short instruction and optional progress line.
- Example: RESTORE POWER / Find the three fuses / Fuses secured: 1/3.
- Maximum one primary objective and two short substeps.
- Update only on authoritative state changes; no scrolling ticker.
- Player may collapse it; mandatory act transitions briefly re-expand it.

**Context interaction — lower-centre**
- Valid focused target within the approved 2 m range: focus/reticle treatment, action label and current Interact binding.
- Examples: Inspect register; Pick up Fuse A; Install Fuse A; Hide; Rescue teammate.
- Timed actions show progress (rescue 5 s, battery replacement ~2 s, fuse install ~2 s).
- Hide prompt when out of range, obstructed, invalid for player state or focus lost.
- Missing prerequisites replace the normal prompt with one concise reason.
- Never require pixel-perfect targeting; use generous interaction volumes.

**Team status — upper-right**
- Up to four player rows: identity, ACTIVE / THREATENED / CAPTURED / RESCUED / SAFE and connectivity.
- No exact teammate distance or through-wall markers.
- CAPTURED must be obvious and remain visible until rescue/recovery.
- Solo mode hides this panel.

**Flashlight — lower-left**
- Personal charge bar/ring and optional percentage.
- Low-charge warning/flicker below 15%; light off at 0%.
- One concise warning and designed audio cue; no repeated spam.
- Battery pickup changes only the collecting player's charge.

**Transient notification lane**
- Pickup, clue, puzzle, checkpoint, rescue and act-complete feedback.
- One message at a time; queue critical messages and suppress redundant repeats.
- Standard duration target 2.5–3 seconds; longer for narrative text.
- Important messages remain in Journal > Recent Events.

### 3.2 HUD modes
- Exploration: objective, focused interaction, flashlight and team status.
- Document/journal/puzzle modal: suppress nonessential HUD; retain required status and Back/Close hint.
- Captured: show capture/rescue status and permitted escape instruction; ordinary interactions hidden.
- Cinematic/ending: hide gameplay HUD; retain subtitles and required choice UI.
- SAFE: hide gameplay HUD after ending commit.

## 4. Quest and objective tracker

### 4.1 Authoritative data
GameManager owns CurrentActId, CurrentObjectiveId, ObjectiveStatus (LOCKED/ACTIVE/COMPLETED), progress current/target, completion flags, optional flags and CheckpointId.

Each objective definition requires: stable ObjectiveId, act, title, instruction, ordered substeps, prerequisites, completion predicate, progress target, mandatory/optional classification, visibility rule and fallback text.

Tracker reads this state; it never infers completion from proximity alone.

### 4.2 Behaviour
- Exactly one mandatory primary objective active at a time.
- Substeps may complete in any order only when explicitly authored.
- Objective changes follow authoritative flags, not simply entering a room.
- Completed objectives move to Journal > Completed.
- Optional exploration is never auto-promoted to mandatory.
- No persistent GPS arrow, route line, minimap route or through-wall beacon by default.
- Multi-step collections show a count (e.g. Fuses 2/3), not remaining item locations.
- Recovery messages use player-facing language, not debug terms.

### 4.3 Canonical act objective presentation
| Act | Primary objective | Completion |
|---|---|---|
| I — THE ARRIVAL | Reach the motel and investigate the front desk | ReceptionEntered, PhoneMessageHeard, Room13KeyKnown and RegisterCluesSeen committed |
| II — THE REGISTER | Open the front desk | Register solved; Office Key granted through IN-006 |
| II — THE REGISTER | Find the way upstairs | Office photo puzzle solved through IN-007; upper-floor access granted. Rooms 01–06 remain available for exploration; inspecting every room is not a progression gate |
| III — THE POWER | Restore motel power | Fuse A/B/C installed and breaker activated |
| IV — THE SECOND FLOOR | Find the way to ROOM 13 | Upper-floor access; Room 12 panel opened; route unlocked. Diary and drawing are optional evidence discoveries unless END-A02 is approved for THE_TRUTH only |
| V — ROOM 13 | Discover who the owner really is | Four-photo sequence solved; reveal completed; Service Key granted |
| VI — NO VACANCY | Open the service route and escape | Car Keys + Service Key + GatePowered; CoreEscapeReady |
| VI — NO VACANCY | Decide the motel's fate | Explicit ending committed |

Canonical objective IDs and exact completion predicates are in OBJECTIVE_AND_EVENT_CATALOG.md. ACT II completes after PZ-01/OfficeKey and PZ-02/UpperFloorAccessGranted; it does not require inspecting every room 01–06.

### 4.4 Tracker device vs quest tracker
Quest tracker means the custom objective presentation, not a permanent world marker.
- Native Tracker device may provide a simple counter only if synchronized with GameManager and configured without unwanted quest-marker behaviour.
- Verse session/team state remains authoritative.
- Beacon/map indicators are allowed only for explicitly authored, short-lived diegetic guidance after discovery (e.g. a brief light cue toward the breaker once the utility room is found).
- Never reveal THE GUEST or undiscovered clue/item locations.
- If native Tracker behaviour conflicts with team-shared state, use custom per-player UI fed by the shared state.

## 5. Journal / evidence notebook

### 5.1 Tabs
1. Current Objective — objective, substeps and team counters.
2. Evidence — discovered documents, photographs, recordings and environmental evidence.
3. Items & Access — team quest items and installed/used states.
4. Completed — completed objectives and solved puzzles.
5. Recent Events — last 10 important events (pickup, discovery, power, rescue, checkpoint, reveal).

Journal is a per-player view of shared session data. Every connected player sees the same team discoveries. Opening it does not pause the world, stop threat timers or grant invulnerability. It must not be required for a player to remain exposed during mandatory interaction.

### 5.2 Evidence lifecycle
Each entry stores EvidenceId/DocumentId, title, category, act, location label, mandatory/optional/truth-candidate classification, discovery flag, approved readable text/transcript, optional summary, per-player read/unread state and fallback source.

On first discovery:
1. Set team discovery flag once.
2. Add entry to every connected player's Evidence list.
3. Show EVIDENCE ADDED — [title].
4. Mark unread for each player.
5. Do not show undiscovered entries as spoiler checklist slots unless explicitly designed.

Re-inspection opens the same entry without duplicate flags, rewards or events. Every audio clue has a transcript. If an evidence actor is missing/unreachable after verified failure, approved journal copy becomes available and a recovery event is logged.

### 5.3 Evidence categories
- Mandatory progression clue: required for access/puzzle; readable in-world and in journal.
- Optional lore: never blocks ESCAPE.
- Truth evidence: the three approved investigation entries gate THE_TRUTH through TruthChainComplete. They remain optional to the core ESCAPE route and are never represented as mandatory story progression.
- Structural states (SecretPanelOpened, PhotoSequenceSolved, OwnerIdentityRevealed) are not evidence pickups and must not be double-counted.

### 5.4 Known evidence entries to reconcile
| Evidence | Location | Title | Flag |
|---|---|---|---|
| EV-ROOM09-DIARY | Room 09 | Night Manager's Diary | DiaryFound |
| EV-ROOM11-DRAWING | Room 11 | The Child's Drawing | ChildRoomClueFound |
| EV-ROOM06-ARCHIVE | Room 06 | Missing Guest Photographs | MissingGuestEvidenceFound |
| EV-ROOM04-PHONE | Room 04 | Recorded Telephone Message | Map to existing document flag; do not create duplicate without approval |
| EV-ROOM01-CRT | Room 01 | Security Monitor Image | Map to existing document flag; do not create duplicate without approval |

## 6. Interaction, pickup and inventory UX

### 6.1 Generic interaction
1. Player focuses a valid target within 2 m.
2. Focus treatment, action label and current Interact binding appear.
3. Player activates Interact.
4. Authority validates player state, distance, prerequisites, target availability and session state.
5. Timed actions show progress and follow the interaction register's cancellation rule.
6. Commit authoritative state once.
7. Play contextual cue and show notification.
8. Update objective, journal and team inventory.

Failed validation never consumes an item or leaves an input lock. If another player committed first, show Already secured / Already completed.

### 6.2 Pickup feedback
- Quest item: world cue; TEAM ITEM SECURED — [item]; team inventory updates for all; physical pickup disables only after commit.
- Already owned/installed: Already secured.
- Evidence: EVIDENCE ADDED — [title]; add journal entry, not a consumable item icon.
- Personal battery: FLASHLIGHT CHARGED plus current charge; only the collector changes.
- Recovery proxy uses the same ItemId/grant transaction; never creates a second copy.

### 6.3 Team inventory view
Journal > Items & Access groups:
- Secured: Room13Key, OfficeKey, Screwdriver, CarKeys, ServiceKey.
- Electrical: Fuse A/B/C with NOT FOUND / SECURED / INSTALLED.
- Access: Office, upper floor, ROOM 13, service gate with LOCKED / AVAILABLE / OPEN.
Show team ownership, never a misleading holder name. Do not use personal hotbar ownership for shared quest items.

## 7. Document and puzzle interfaces

**Document inspect**
- Opens close-up/panel with title, readable body, optional image and Close hint.
- No timed auto-close; close restores previous gameplay control.
- Audio recordings have transcripts; images have captions.
- Reopening discovered documents is allowed.

**Puzzle UI**
- Register: three two-digit fields or segmented 02-13-86 entry; entered digits, clear/backspace and confirm; incorrect entry clears fields and gives restrained error. Never show solution.
- Office photos: four cards and four chronological slots. Support select-card then select-slot as fallback to drag/drop for controller/touch.
- Fuse panel: large labelled A/B/C sockets, item state and Install prompt; wrong fuse is rejected without consumption.
- ROOM 13 photos: four cards and ordered slots; feedback follows PZ-04's earliest/latest mismatch rule without revealing answer.
- Final service control: explicit unmet-prerequisite list; show Service Key and Power state; no silent no-op.
- Modal supports keyboard/controller/touch where chosen UEFN implementation supports them.
- Every modal has a close/cancel path restoring control; puzzle state changes only on authoritative commit.

## 8. Threat, capture, rescue and co-op UI
- THREATENED uses restrained audio/visual cues; never show THE GUEST exact location, distance, health or path.
- Hiding prompt indicates Hide / Exit hiding; no omniscient monster indicator while hidden.
- Captured player sees CAPTURED and Waiting for teammate (co-op); teammates see state in team panel.
- Rescuer sees Rescue [player] and 5-second uninterrupted progress; target sees Being rescued and matching progress.
- Range loss, rescuer capture or disconnect resets progress; target remains CAPTURED; show Rescue interrupted.
- If another rescuer owns lock, show Rescue in progress.
- Solo shows the authored self-rescue interaction at the configured threshold; never show teammate-dependent instruction.
- All-captured recovery uses narrative text then Checkpoint restored, not debug wording.
- Join/rejoin rehydrates objective, evidence and inventory UI from authoritative session state.

## 9. Checkpoints, act transitions and endings

**Checkpoint**
- On commit show CHECKPOINT REACHED and checkpoint label; add Recent Events entry.
- Do not imply persistence after the entire session ends.
- On restore show Returning to last checkpoint, then rebuild UI from committed snapshot without duplicate rewards/messages.

**Act transition**
- Brief act title card with act name and one sentence of non-spoiler context, followed by primary objective.
- 40–50 minute duration is pacing target, not a countdown timer.

**Ending choice**
- Selector appears only after eligibility validation and at authored choice point.
- Present only currently eligible choices; do not show locked ending spoilers.
- ESCAPE is fallback if truth eligibility is incomplete or co-op vote ties/expires.
- THE_TRUTH requires approved truth gates, completed reveal and explicit team choice.
- THE_NEW_GUEST requires explicit acceptance; never infer from capture, timeout or ordinary defeat.
- Apply the owner-approved END-A01 quorum exactly: strict majority of connected eligible players for ESCAPE/THE_TRUTH; unanimous explicit affirmative confirmation for THE_NEW_GUEST. A tie/timeout selects ESCAPE only if eligible; otherwise reopen the vote. A disconnect removes that player and triggers recalculation/reconfirmation; disconnect is never consent. Solo selection is direct. Do not add a 15-second timer or any other vote window until its duration is approved as a UX tuning value.
- EndingSelected locks once; overlapping triggers cannot reopen selector.

## 10. Accessibility, localization and input
- English launch copy; centralize all strings for later localization.
- Subtitles on by default for mandatory spoken lines; at least three subtitle-size steps and background opacity control.
- At least Standard/Large UI text; never communicate state by color alone.
- Critical states use icon plus label; color is supplementary.
- Controller focus, Confirm and Back must work; keyboard/touch equivalents where supported.
- Show current platform binding glyph, not hard-coded key names.
- Avoid rapid flashing; battery flicker is brief and accessibility-conscious.
- No essential information is audio-only, color-only or dependent on tiny world text.

## 11. UEFN implementation boundaries
Epic documents per-player custom UI built with Verse and UMG, plus HUD Message, Tracker, Beacon and Map Indicator devices. Therefore:
- GameManager/Verse state is authoritative and session/team-shared.
- UIManager creates/updates presentation for each connected player.
- A custom widget is per-player; explicitly propagate the shared team state to each player's presentation.
- Native Tracker/HUD Message may supplement UI but cannot become a second source of truth.
- Claude verifies current API, widget focus, safe areas, controller/touch input and replication in the target UEFN version.
- This specification is not evidence of successful compilation or runtime behaviour.

## 12. Required supporting registers
Before implementation, reconcile/create:
- Objective register: ObjectiveId, ActId, title, instruction, prerequisites, completion predicate, progress target, visibility and fallback.
- Evidence/document register: EvidenceId/DocumentId, approved text/transcript, mandatory/optional/truth status, discovery flag, journal title and recovery source.
- UI string table: stable StringId and approved copy for every HUD, prompt, error, notification and modal.
- Interaction register additions: prompt, UI type (press/hold/modal), cancellation, progress, success and failure copy for every IN-001–IN-029.
- Input map: Journal, Interact, Back/Close, flashlight, crouch, sprint and vote action using platform mappings.
- UI acceptance suite: resolutions/input modes, solo/2P/4P sync, reconnect, modal close, no duplicate notifications, clue readability, subtitles and safe-area clipping.
- [UI_STRING_TABLE.csv](UI_STRING_TABLE.csv): stable English objective, interaction, status, feedback, ending and subtitle strings. This is the first controlled copy baseline; any additional in-editor text must receive a StringId before implementation.
- [AUDIO_CUE_SHEET.csv](AUDIO_CUE_SHEET.csv) and [LIGHTING_CUE_SHEET.csv](LIGHTING_CUE_SHEET.csv): cue trigger, priority, concurrency and readability rules.

## 13. Open issues — do not silently assume
1. END-A02 is APPROVED: TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. The gate is optional for core progression/ESCAPE and required only for THE_TRUTH.
2. Use OBJECTIVE_AND_EVENT_CATALOG.md for the canonical Act II predicate; do not gate on every room 01–06 inspection.
3. Room 01 CRT and Room 04 phone now have stable interaction IDs IN-030 and IN-031 and flags CRTFeedSeen, Room04RecordingHeard and Room04TranscriptRead.
4. Journal binding and final control glyphs must be selected/verified in UEFN.
5. END-A01 quorum is approved; vote-window duration, vote UI presentation and timeout UX must be specified as tunable presentation parameters without changing the approved quorum or fallback rules.
6. HUD visual style, typography, icons, safe-area coordinates and animation timing need a visual mockup and in-editor validation.
7. Any objective arrow/beacon requires explicit design approval; default is no persistent navigation marker.

## 14. UI/UX acceptance tests
| ID | Scenario | Expected result |
|---|---|---|
| UI-001 | Start solo | Act card, primary objective and flashlight HUD appear |
| UI-002 | Start 4-player | Same team quest state; individual flashlight charge |
| UI-003 | Focus valid pickup | Correct action and Interact binding shown |
| UI-004 | Invalid/out-of-range target | Prompt disappears; no wall prompt |
| UI-005 | Collect Fuse A | All clients see team item and 1/3 counter |
| UI-006 | Simultaneous fuse pickup | One grant/message; second sees Already secured |
| UI-007 | Inspect mandatory document | Readable panel; shared journal entry once |
| UI-008 | Reinspect document | Same entry; no duplicate event |
| UI-009 | Mute audio clue | Transcript/text remains available |
| UI-010 | Complete puzzle | Correct objective transition and one success message |
| UI-011 | Wrong puzzle input | Retry feedback; no item loss |
| UI-012 | Open/close journal | Control restored; no progression mutation |
| UI-013 | Journal during threat | Threat remains active; no invulnerability |
| UI-014 | Low flashlight | Warning below 15%; off at 0%; clues remain readable |
| UI-015 | Battery pickup | Only collector's charge changes |
| UI-016 | Player captured | Correct state shown to target/team |
| UI-017 | Rescue interrupted | Progress resets; target recoverable |
| UI-018 | Solo capture | Self-rescue appears without teammate dependency |
| UI-019 | Checkpoint restore | UI rehydrates; no duplicate rewards |
| UI-020 | Disconnect/rejoin | Team objective/evidence/inventory remain synchronized |
| UI-021 | Ending vote tie/timeout | ESCAPE commits only if eligible; otherwise selector reopens for a new vote; THE_TRUTH is never implicit |
| UI-022 | Overlapping ending triggers | Selector/result commits once |
| UI-023 | Large text/subtitles/controller | Readable; no safe-area clipping |
| UI-024 | No navigation aids | No marker reveals undiscovered clues/items or THE GUEST |

**Definition of done:** every approved gameplay state has a player-facing representation; every UI action has a defined input/close path; Claude verifies the cases in the target UEFN project and attaches evidence.