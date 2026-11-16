# EVENT & STATE TRANSITION CATALOG R2

**Authority:** OBJECTIVE_AND_EVENT_CATALOG.md, INTERACTION_EXECUTION_SPEC.md, PLAYER_STATE_MACHINE.md, ENDING_IMPLEMENTATION_SPEC.md.  
**Purpose:** single implementation contract for event ownership, payload, validation, idempotency and failure behavior.  
**Status:** logical design canonical; Verse/device wiring requires editor verification.

## 1. Global event envelope

Every gameplay event uses this logical envelope, regardless of final Verse representation:

- event_id: stable catalog ID;
- session_id: current island session identity;
- actor_id: initiating player identity, nullable only for authored world/system events;
- source_id: interaction/puzzle/trigger actor identifier;
- sequence: monotonic session sequence or equivalent dedupe token;
- timestamp: server/session time;
- payload: typed values defined per event;
- scope: SESSION_SHARED / PLAYER_LOCAL / PRESENTATION_ONLY;
- result: ACCEPTED / ALREADY_COMMITTED / REJECTED_PREREQUISITE / REJECTED_STATE / CANCELLED / RECOVERY.

Never trust a client-supplied success flag. Client input requests a transaction; authoritative manager validates and commits.

## 2. Manager ownership

| Manager | Sole responsibility |
|---|---|
| GameManager | act/objective progression, derived predicates, session ending lock |
| PuzzleManager | puzzle states, puzzle inputs and solved flags |
| InventoryManager | item grants, pickup ownership and item transaction dedupe |
| EvidenceManager | discovery flags and journal-readable records |
| InteractionManager | focus/hold/interaction transaction lifecycle |
| AIManager | THE GUEST state, perception, target and movement intent |
| PlayerStateManager | normal/captured/rescuing/recovering state |
| CheckpointManager | snapshot/restore from committed flags |
| UIManager | display only; never owns progression |
| Audio/Lighting/Cinematic presenters | presentation only; never own gameplay flags |
| EndingManager | vote lifecycle and ending-specific one-shot beats; GameManager owns final atomic ending lock |

## 3. Event catalog

| Event ID | Event / payload | Sole writer | Preconditions | Commit / side effects | Idempotency and failure |
|---|---|---|---|---|---|
| EVT-001 | ReceptionEntered(player) | GameManager | valid player enters reception volume | ReceptionEntered=true | one session flag; duplicate ignored |
| EVT-002 | PhoneTranscriptPresented(player, transcript_id) | GameManager | IN-002 valid; transcript visible | PhoneMessageHeard=true | commit after readable presentation; audio failure uses transcript |
| EVT-003 | Room13KeyInspected(player, item_id) | GameManager | IN-003 in range | Room13KeyKnown=true | reinspection allowed; flag one-shot |
| EVT-004 | RegisterInspected(player) | GameManager | IN-004 valid | RegisterCluesSeen=true | one-shot flag |
| EVT-005 | RegisterCodeAccepted(player, code_hash) | PuzzleManager | PZ-01 AVAILABLE; code validated | RegisterSolved=true; enable drawer pickup | duplicate returns ALREADY_COMMITTED |
| EVT-006 | OfficeKeyGranted(player, grant_token) | InventoryManager | RegisterSolved; OfficeKey not already granted | OfficeKeyGranted=true; shared inventory +1 | grant token dedupe; actor loss uses proxy |
| EVT-007 | OfficePhotoSequenceSolved(player, ordered_years) | PuzzleManager | OfficeKeyGranted; correct four years | OfficePhotoPuzzleSolved=true; UpperFloorAccessGranted=true | one-shot; reset only before commit |
| EVT-008 | FusePickup(player, fuse_id) | InventoryManager | correct fuse actor; not already found | matching FuseXFound=true; shared inventory | one per fuse; missing actor recovery audited |
| EVT-009 | FuseInstalled(player, fuse_id, slot_id) | PuzzleManager | fuse found; matching empty slot; panel open | FuseXInstalled=true; consume shared inventory entry | slot lock; invalid slot preserves fuse |
| EVT-010 | BreakerActivated(player) | PuzzleManager | all A/B/C installed; panel closed | PowerRestored=true; emit power-on event | one-shot; breaker spam ignored |
| EVT-011 | DiaryEvidenceDiscovered(player, evidence_id) | EvidenceManager | IN-013; readable diary displayed | DiaryFound=true; journal entry | reinspection no duplicate |
| EVT-012 | ChildDrawingDiscovered(player, evidence_id) | EvidenceManager | IN-014; drawing displayed | ChildRoomClueFound=true; journal entry | reinspection no duplicate |
| EVT-013 | SecretPanelOpened(player) | PuzzleManager | IN-015; screwdriver validated | SecretPanelOpened=true; Room13Unlocked=true | one-shot; panel visual reconstructed from flags |
| EVT-014 | MissingGuestArchiveDiscovered(player, evidence_id) | EvidenceManager | IN-029; archive readable | MissingGuestEvidenceFound=true | reinspection no duplicate |
| EVT-015 | Room13PhotoSequenceSolved(player, years) | PuzzleManager | PZ-04; ROOM 13 entered; exact order | PhotoSequenceSolved=true; open compartment | no evidence flag mutation |
| EVT-016 | OwnerRevealPresented(player_set, presentation_id) | CinematicManager→GameManager handshake | PZ-04 solved; presentation or fallback text visible | Room13RevealComplete=true; OwnerIdentityRevealed=true | commit only on completion acknowledgement; retry fallback |
| EVT-017 | ServiceKeyGranted(player, grant_token) | InventoryManager | Room13RevealComplete; key not granted | ServiceKeyObtained=true | one-shot grant |
| EVT-018 | ServiceGateActivated(player) | PuzzleManager | ServiceKeyObtained AND PowerRestored | GatePowered=true; ServiceRouteReady=true | one-shot; lever proxy same validation |
| EVT-019 | VehicleIgnitionSucceeded(player) | GameManager | FinaleReady AND CarKeysObtained | CoreEscapeReady=true | only needed for ESCAPE |
| EVT-020 | EndingVoteCommitted(player, ending_id, vote) | EndingManager | eligible ending; resolver open; player eligible | vote stored; recompute quorum | one vote/player/round; changed vote replaces own vote until lock |
| EVT-021 | EndingSelected(ending_id, electorate, vote_snapshot) | GameManager | quorum satisfied; ending eligible; ending lock free | EndingSelected set once; AI disabled; final sequence begins | atomic compare-and-set; competing ending rejected |
| EVT-022 | NewGuestInvitationAccepted(player) | EndingManager | FinaleReady; invitation explicitly displayed | player affirmative stored | no default consent; timeout is no |
| EVT-023 | NightAuditActivated(player) | EndingManager | EndingSelected=THE_TRUTH; IN-032 hold complete | NightAuditActivated=true; one-shot truth finale | proxy fallback; never changes ending selection |
| EVT-024 | PlayerCaptured(player, capture_source) | PlayerStateManager | player NORMAL; valid AI capture | state CAPTURED; team status update | duplicate ignored; no inventory loss |
| EVT-025 | RescueStarted(rescuer, target) | PlayerStateManager | target CAPTURED; valid range; rescuer eligible | target RESCUING; progress starts | one rescuer lock; cancel if interrupted |
| EVT-026 | PlayerRescued(rescuer, target) | PlayerStateManager | uninterrupted rescue duration met | target NORMAL/RECOVERING; protection timer | one-shot per capture cycle |
| EVT-027 | SelfRecoveryStarted(player) | PlayerStateManager | solo/self-recovery condition valid | recovery state begins | cancel safely on disconnect |
| EVT-028 | SelfRecoveryCompleted(player) | PlayerStateManager | recovery interaction completed | player returns NORMAL/RECOVERING | one-shot per capture cycle |
| EVT-029 | AllPlayersCaptured() | CheckpointManager | all connected eligible players captured | restore latest checkpoint | restore only committed flags; no repeated one-shots |
| EVT-030 | CheckpointCommitted(checkpoint_id, state_version) | CheckpointManager | authored checkpoint reached; state stable | snapshot committed state | replace older snapshot for same progression stage |
| EVT-031 | CheckpointRestored(checkpoint_id, state_version) | CheckpointManager | restore requested/all captured | rebuild actors/UI/inventory from flags | deterministic; no duplicate grant or presentation |
| EVT-032 | PlayerJoined(player) | GameManager | valid join-in-progress | initialize player-local state; sync session state | existing session state not reset |
| EVT-033 | PlayerLeft(player) | GameManager | player disconnected | clear locks/transient state; recompute electorate | committed team flags persist |
| EVT-034 | ObjectiveChanged(objective_id) | GameManager | objective predicate transitions true | UI refresh; optional authored cue | no regressions; one event per transition |
| EVT-035 | TensionChanged(old, new, reason) | AIManager | approved tension input and clamp | adjust AI tuning band | freeze during protected beats; no exploration-only gain |
| EVT-036 | GuestStimulus(stimulus_type, location, strength, source_player?) | AIManager | valid noise/sight stimulus | suspicion update; investigate/chase decision | location snapshot only; never live tracking from hearing |
| EVT-037 | GuestStateChanged(old_state, new_state, target?) | AIManager | legal state transition | animation/audio/UI cue | presentation may replay only if state truly changes |
| EVT-038 | InteractionCancelled(player, interaction_id, reason) | InteractionManager | active interaction exists | release lock; restore prior puzzle state | duplicate cancel harmless |
| EVT-039 | RecoveryProxyUsed(player, recovery_id, prerequisite_flag) | owning manager | actor missing/unreachable; prerequisite already validated | equivalent interaction proxy only | log reason; never bypass prerequisite |
| EVT-040 | PresentationFailed(presentation_id, failure_code) | presenter→GameManager | presentation failure detected | run text/audio/static fallback | never silently set dependent progression flag |
| EVT-041 | EndingSequenceCompleted(ending_id) | EndingManager | selected ending sequence reaches terminal state | session complete | one-shot |
| EVT-042 | SessionReset(reason) | GameManager | new session/reset command | initialize all session flags and player states | reset is explicit; no implicit reset on one player leaving |

## 4. Derived predicates — no direct writers

- TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound.
- FinaleReady = PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete.
- CoreEscapeReady = FinaleReady AND CarKeysObtained AND VehicleIgnitionSucceeded.
- NewGuestEligible = FinaleReady AND InvitationPresented AND every connected eligible player has explicitly accepted.
- EndingEligibility:
  - ESCAPE: CoreEscapeReady.
  - THE_TRUTH: FinaleReady AND TruthChainComplete.
  - THE_NEW_GUEST: NewGuestEligible.
- Derived values are recomputed from source flags after join, checkpoint restore and relevant commits. Never set them independently.

## 5. State transition rules

**Puzzle:** LOCKED→AVAILABLE when prerequisites true; AVAILABLE→IN_PROGRESS on valid operator start; IN_PROGRESS→AVAILABLE on cancel/disconnect/timeout before commit; IN_PROGRESS→SOLVED on valid authoritative commit; SOLVED never regresses in-session.

**Player:** NORMAL→CAPTURED on validated capture; CAPTURED→RESCUING on valid rescue start; RESCUING→NORMAL/RECOVERING on completion; RESCUING→CAPTURED on interruption; CAPTURED→RECOVERING→NORMAL on valid solo recovery; disconnect clears transient state without changing team flags.

**AI:** DORMANT→PATROL/INVESTIGATE when authored activation/stimulus; PATROL→INVESTIGATE on stimulus; INVESTIGATE→CHASE only with valid target/reachable path/threshold; CHASE→SEARCH on LOS loss; SEARCH→PATROL after timeout/no reacquisition; any active state→RECOVERY on invalid navigation; ending commit disables AI.

**Ending:** NONE→VOTING when final selector opens; VOTING→LOCKED only after eligible quorum; LOCKED→SEQUENCE_RUNNING once; SEQUENCE_RUNNING→COMPLETE on terminal beat. No transition from COMPLETE. THE_NEW_GUEST requires explicit unanimity and re-confirmation after disconnect.

## 6. Atomicity, retries and disconnects

- All inventory, puzzle and ending commits must be atomic at manager level.
- Every event has a dedupe key: session + event ID + source ID + transaction sequence (or stable equivalent).
- A client retry after timeout receives current authoritative state; it does not create a second reward.
- Disconnect releases puzzle/interaction locks and removes the player from active ending electorate.
- Shared committed progress remains. Personal flashlight charge follows the player-local reconnect policy in ITEM_AND_INVENTORY_SPEC.md.
- If a presentation fails, use fallback content; only commit progression after fallback satisfies the relevant completion condition.
- If a recovery proxy is used, log recovery ID, reason and prerequisite flag.

## 7. Required tests

EVT-R2-01 duplicate pickup; EVT-R2-02 simultaneous fuse same slot; EVT-R2-03 different fuse slots parallel; EVT-R2-04 disconnect during puzzle lock; EVT-R2-05 duplicate objective event; EVT-R2-06 checkpoint restore twice; EVT-R2-07 join-in-progress after all acts; EVT-R2-08 truth chain recompute in any clue order; EVT-R2-09 ending race; EVT-R2-10 unanimous consent disconnect/reconfirm; EVT-R2-11 presentation failure fallback; EVT-R2-12 all-captured restore; EVT-R2-13 recovery proxy with prerequisite false (must reject); EVT-R2-14 stale client request after commit; EVT-R2-15 SessionReset explicit clean state.

## 8. Conflict resolution

If this catalog conflicts with OBJECTIVE_AND_EVENT_CATALOG.md, the objective catalog controls objective IDs/predicates; this catalog controls event transaction semantics. If either conflicts with an owner-approved decision record, owner-approved decision record wins. Update all dependent docs in one change set.


## 9. Additional interaction-specific events — crosswalk closure

The following events complete the mapping to IN-001–IN-032. They extend the existing EVT namespace; they do not create a parallel event bus.

| Event ID | Event / payload | Sole writer | Preconditions | Commit / failure |
|---|---|---|---|---|
| EVT-043 | ArrivalClueSeen(player, source_id) | GameManager | IN-001 sign/sightline inspected and visual clue presented | ArrivalClueSeen=true; repeat inspection is harmless |
| EVT-044 | DocumentEvidenceDiscovered(player, document_id) | EvidenceManager | IN-008 valid authored document; readable content presented | Commit document-specific discovery flag; never gate mandatory progression unless separately approved |
| EVT-045 | BatteryPickupClaimed(player, spawn_id) | InventoryManager | IN-009; local charge below 100%; spawn claim not already used by this player | Set player-local charge to 100%; record per-player spawn claim; if full, reject without consuming claim |
| EVT-046 | ElectricalPanelCoverOpened(player) | PuzzleManager | IN-010; Screwdriver team-owned; panel not already open | PanelCoverOpen=true; screwdriver remains in inventory |
| EVT-047 | HidingStateChanged(player, hidden) | PlayerStateManager | IN-021; player NORMAL and hiding spot available; valid exit if currently hidden | Set/clear player-local hidden state; clear on capture/disconnect/reset |
| EVT-048 | ScrewdriverPickupClaimed(player, grant_token) | InventoryManager | IN-027; Screwdriver not already granted | ScrewdriverObtained=true; grant once; reusable |
| EVT-049 | CarKeysPickupClaimed(player, grant_token) | InventoryManager | IN-028; Act VI; ESCAPE route eligible/selected according to authored flow | CarKeysObtained=true; grant once; never required by THE_TRUTH or THE_NEW_GUEST |
| EVT-050 | CRTFeedViewed(player, feed_id) | EvidenceManager | IN-030; CRT visual feed presented | CRTFeedSeen=true; repeat view allowed, discovery flag one-shot |
| EVT-051 | Room04RecordingPresented(player, recording_id, transcript_presented) | EvidenceManager | IN-031; transcript presented; audio may be unavailable | Room04RecordingHeard=true and Room04TranscriptRead=true only when readable transcript is visible |

### Crosswalk authority

EVENT_INTERACTION_VERSE_CROSSWALK_R1.md is the exact mapping between IN-001–IN-032 and EVT-001–EVT-051. If an event name or payload changes, update both files in the same commit. Existing EVT-001–042 semantics are unchanged. The crosswalk is a design mapping, not a claim that Verse methods with those names already compile.
