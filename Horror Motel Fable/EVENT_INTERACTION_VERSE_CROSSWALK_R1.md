# EVENT ↔ INTERACTION ↔ VERSE CROSSWALK R1

**Purpose:** one mapping between the existing interaction IDs, event catalog IDs and intended Verse manager calls. This document does not introduce a second event bus. Existing EVT IDs are preserved; missing semantic events are added to EVENT_AND_STATE_TRANSITION_CATALOG_R2.md as EVT-043–051.

**Authority:** INTERACTION_MASTER_REGISTER.csv controls IN IDs and player-facing interaction behavior. OBJECTIVE_AND_EVENT_CATALOG.md controls progression flags. EVENT_AND_STATE_TRANSITION_CATALOG_R2.md controls transaction semantics. VERSE_SYSTEM_DESIGN.md controls logical manager ownership.

## 1. Binding rules

- One IN interaction may emit multiple lifecycle events (start/cancel/commit), but only one authoritative commit event writes its success state.
- An event may be used by multiple interaction rows only when the payload distinguishes the source/target (e.g. FusePickup with fuse_id).
- Derived states (TruthChainComplete, FinaleReady, CoreEscapeReady) are never directly written by a Verse event handler.
- UI/audio/cinematic events are presentation subscribers only.
- Use existing manager names from VERSE_SYSTEM_DESIGN.md; do not create parallel managers because this crosswalk exists.
- The “Verse call” column is a logical method name, not a claimed compiled Verse signature. Exact syntax must follow the installed UEFN Verse API.

## 2. Complete interaction crosswalk

| Interaction | Authoritative event(s) | Verse owner / logical call | Commit state | Notes / exception |
|---|---|---|---|---|
| IN-001 | EVT-043 ArrivalClueSeen | GameManager.MarkArrivalClueSeen | ArrivalClueSeen=true | New event: sightline inspection; must not substitute for reception entry |
| IN-002 | EVT-002 PhoneTranscriptPresented | GameManager.CommitPhoneMessageHeard | PhoneMessageHeard=true | Commit after subtitle/transcript is presented; audio is optional |
| IN-003 | EVT-003 Room13KeyInspected | GameManager.CommitRoom13KeyKnown | Room13KeyKnown=true; Room13Key team flag | Key is non-consumable narrative/access item |
| IN-004 | EVT-004 RegisterInspected | GameManager.CommitRegisterCluesSeen | RegisterCluesSeen=true | Readable register opens before commit |
| IN-005 | EVT-005 RegisterCodeAccepted | PuzzleManager.CommitRegisterSolved | RegisterSolved=true | Code 02-13-86 |
| IN-006 | EVT-006 OfficeKeyGranted | InventoryManager.GrantOfficeKey | OfficeKeyGranted=true; OfficeKey held | Sole OfficeKey writer |
| IN-007 | EVT-007 OfficePhotoSequenceSolved | PuzzleManager.CommitOfficePhotoSequence | OfficePhotoPuzzleSolved=true; UpperFloorAccessGranted=true | Years 1974/1978/1982/1986 |
| IN-008 | EVT-044 DocumentEvidenceDiscovered | EvidenceManager.CommitDocumentEvidence | DocumentId-specific discovery flag | Payload must include stable DocumentId; optional documents never gate act progression |
| IN-009 | EVT-045 BatteryPickupClaimed | InventoryManager.ClaimPersonalBattery | player-local BatteryCharge=100%; SpawnId claim | Per-player pickup claim; use documented team-stock fallback only if per-player actor availability is unsupported |
| IN-010 | EVT-046 ElectricalPanelCoverOpened | PuzzleManager.OpenElectricalPanelCover | PanelCoverOpen=true | Screwdriver reusable; not consumed |
| IN-011 | EVT-009 FuseInstalled | PuzzleManager.InstallFuse | FuseXInstalled=true; matching shared item assigned to slot | Payload fuse_id + slot_id; atomic slot lock |
| IN-012 | EVT-010 BreakerActivated | PuzzleManager.CommitPowerRestored | PowerRestored=true | Only after all three matching slots installed |
| IN-013 | EVT-011 DiaryEvidenceDiscovered | EvidenceManager.CommitDiaryEvidence | DiaryFound=true | Room 09; readable text required |
| IN-014 | EVT-012 ChildDrawingDiscovered | EvidenceManager.CommitChildDrawingEvidence | ChildRoomClueFound=true | Room 11; readable caption required |
| IN-015 | EVT-013 SecretPanelOpened | PuzzleManager.OpenSecretPanel | SecretPanelOpened=true; Room13Unlocked=true | Screwdriver reusable |
| IN-016 | EVT-015 Room13PhotoSequenceSolved + EVT-016 OwnerRevealPresented | PuzzleManager.CommitRoom13PhotoSequence; CinematicManager.RequestReveal / GameManager.CommitReveal | PhotoSequenceSolved=true; then Room13RevealComplete=true | Keep solve and presentation-complete commits separate |
| IN-017 | EVT-017 ServiceKeyGranted | InventoryManager.GrantServiceKey | ServiceKeyObtained=true; ServiceKey held | Sole ServiceKey writer |
| IN-018 | EVT-018 ServiceGateActivated | PuzzleManager.ActivateServiceGate | GatePowered=true; ServiceRouteReady=true | SVC-GATE-CONSOLE in GF-SERVICE-BAY after D-G16 Service Key access; GameManager derives FinaleReady |
| IN-019 | EVT-019 VehicleIgnitionSucceeded | GameManager.CommitVehicleIgnitionSucceeded | VehicleIgnitionSucceeded=true; CoreEscapeReady is derived | Requires FinaleReady + CarKeys; ESCAPE branch only |
| IN-020 | EVT-020 EndingVoteCommitted + EVT-021 EndingSelected; EVT-022 for NEW_GUEST consent | EndingManager.SubmitVote / GameManager.CommitEnding | EndingSelected set once | END-A01 rules; New Guest unanimous explicit confirmation |
| IN-021 | EVT-047 HidingStateChanged | PlayerStateManager.SetHidden | PlayerHidden[player]=true/false | New event: player-local, clear on disconnect/reset/capture |
| IN-022 | EVT-025 RescueStarted + EVT-026 PlayerRescued; EVT-027/028 self-recovery | PlayerStateManager.StartRescue / CompleteRescue / StartSelfRecovery / CompleteSelfRecovery | CAPTURED→RESCUING→RECOVERING→NORMAL | Rescue 5 s uninterrupted; emergency recovery never auto-kills |
| IN-023 | EVT-030 CheckpointCommitted + EVT-031 CheckpointRestored | CheckpointManager.CommitCheckpoint / RestoreCheckpoint | CheckpointId + snapshot version | Activation and restore are distinct events |
| IN-024 | EVT-008 FusePickup(fuse_id=A) | InventoryManager.GrantFuseA | FuseAFound=true; FuseA team available | Room 02 suitcase |
| IN-025 | EVT-008 FusePickup(fuse_id=B) | InventoryManager.GrantFuseB | FuseBFound=true; FuseB team available | Storage shelf beside wet-floor sign |
| IN-026 | EVT-008 FusePickup(fuse_id=C) | InventoryManager.GrantFuseC | FuseCFound=true; FuseC team available | Room 06 maintenance cabinet |
| IN-027 | EVT-048 ScrewdriverPickupClaimed | InventoryManager.GrantScrewdriver | ScrewdriverObtained=true; reusable tool held | New event: shared team item, sole writer |
| IN-028 | EVT-049 CarKeysPickupClaimed | InventoryManager.GrantCarKeys | CarKeysObtained=true; CarKeys held | Optional Act VI vehicle-route pickup after FinaleReady; not an ending selection |
| IN-029 | EVT-014 MissingGuestArchiveDiscovered | EvidenceManager.CommitMissingGuestEvidence | MissingGuestEvidenceFound=true | Room 06; TruthChainComplete recomputed |
| IN-030 | EVT-050 CRTFeedViewed | EvidenceManager.CommitCRTFeedViewed | CRTFeedSeen=true | Room 01; repeatable view, one discovery flag |
| IN-031 | EVT-051 Room04RecordingPresented | EvidenceManager.CommitRoom04Recording | Room04RecordingHeard=true; Room04TranscriptRead=true | Room 04; transcript is sufficient if audio unavailable |
| IN-032 | EVT-023 NightAuditActivated | EndingManager.CommitNightAudit | NightAuditActivated=true | Only after EndingSelected=THE_TRUTH; one-shot finale beat |

## 3. Shared system events not initiated by an IN interaction

| Event IDs | Trigger | Owner | Required behavior |
|---|---|---|---|
| EVT-001 | Reception entry volume | GameManager | Commit ReceptionEntered; do not infer from IN-001 |
| EVT-024 | THE GUEST capture validation | PlayerStateManager | Capture one valid active player; no inventory loss |
| EVT-029 | All connected eligible players captured | CheckpointManager | Restore latest committed checkpoint |
| EVT-032/033 | Player join/leave | GameManager | Sync session state / release transient locks / update electorate |
| EVT-034 | Objective predicate transition | GameManager | Recompute next objective and notify UI |
| EVT-035/036/037 | Tension, stimuli, AI state transition | AIManager | Follow THE_GUEST_NUMERIC_TUNING_R1.md and monster spec |
| EVT-038 | Interaction cancellation | InteractionManager | Release lock and revert uncommitted transient state |
| EVT-039 | Recovery proxy used | Owning manager | Verify prerequisite and log reason |
| EVT-040 | Presentation failure | Presenter → GameManager | Run approved readable/static fallback |
| EVT-041 | Ending sequence terminal state | EndingManager | Session complete one-shot |
| EVT-042 | Explicit session reset | GameManager | Initialize new session; never reset because one player disconnects |

## 4. Required Verse logical interfaces

These are responsibilities, not literal API signatures:

- GameManager: OnReceptionEntered, MarkArrivalClueSeen, CommitPhoneMessageHeard, CommitRoom13KeyKnown, CommitRegisterCluesSeen, CommitEnding, RecomputeDerivedProgress, RecomputeObjective.
- PuzzleManager: StartPuzzle, CommitRegisterSolved, CommitOfficePhotoSequence, OpenElectricalPanelCover, InstallFuse, CommitPowerRestored, OpenSecretPanel, CommitRoom13PhotoSequence, ActivateServiceGate.
- InventoryManager: GrantTeamItem, ClaimPersonalBattery, GrantFuse, GrantOfficeKey, GrantServiceKey, GrantScrewdriver, GrantCarKeys.
- EvidenceManager: CommitDocumentEvidence, CommitDiaryEvidence, CommitChildDrawingEvidence, CommitMissingGuestEvidence, CommitCRTFeedViewed, CommitRoom04Recording.
- PlayerStateManager: SetHidden, CapturePlayer, StartRescue, CompleteRescue, StartSelfRecovery, CompleteSelfRecovery.
- CheckpointManager: CommitCheckpoint, RestoreCheckpoint.
- EndingManager: SubmitVote, ConfirmNewGuest, CommitNightAudit, CompleteEnding.
- InteractionManager: AcquireInteractionLock, CancelInteraction, ReleaseInteractionLock.

## 5. ID and ownership checks

- Existing IN IDs remain unchanged.
- Existing EVT-001–042 remain unchanged; new events are EVT-043–051 only.
- No new state flag may have two writers.
- FinaleReady, TruthChainComplete, CoreEscapeReady and NewGuestInvitationAvailable are derived predicates. NewGuestAccepted is an EndingManager output after unanimity, never a precondition to showing the invitation.
- Room 06 missing guest evidence is independent from FuseC pickup in the same room; separate actors and separate discovery/grant flags.
- IN-016's reveal completion is a cinematic/game manager handshake; ServiceKey grant remains IN-017 only.
- The interaction crosswalk is the source for wiring IN events; do not add a duplicate parallel event catalogue in Verse.

## 6. Validation checklist

- [ ] All 32 interaction IDs are mapped exactly once.
- [ ] Every IN row has a valid manager owner.
- [ ] All new events EVT-043–051 are added to EVENT_AND_STATE_TRANSITION_CATALOG_R2.md.
- [ ] Event names and payloads agree across both documents.
- [ ] Every flag has one writer; derived flags have none.
- [ ] UEFN_DEVICE_BINDINGS.csv maps only verified devices or marks them EDITOR-TEST REQUIRED.
- [ ] Verse compile and multiplayer tests remain NOT RUN until evidence is attached.
