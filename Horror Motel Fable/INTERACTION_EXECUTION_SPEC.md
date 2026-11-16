# INTERACTION EXECUTION SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **CANONICAL INTERACTION BEHAVIOUR BASELINE; UEFN IMPLEMENTATION UNVERIFIED**

## 1. Global interaction contract

All interaction events are validated by the authoritative Verse/gameplay layer. A client prompt is presentation only and never commits progress.

### 1.1 Validation order
1. Target actor exists and is enabled.
2. Player is connected and in an interaction-permitted PlayerState.
3. Target is within the interaction range in INTERACTION_MASTER_REGISTER.csv and line-of-sight/obstruction rules are satisfied where relevant.
4. Objective/puzzle prerequisites are true.
5. No conflicting transaction lock is held.
6. Begin action; revalidate at commit.
7. Commit state exactly once, update UI/journal and release lock.

### 1.2 Cancellation and failure
- Press interactions commit on valid input; inspect interactions open a readable panel and commit discovery when the content is actually presented.
- Hold/timed interactions cancel on range break, target invalidation, player capture, player disconnect, cinematic lock or explicit Back/Cancel.
- Cancellation never consumes a required item or commits a partial state.
- Wrong puzzle input resets only the current attempt; no mandatory item is consumed and no tension penalty is applied.
- Disconnect clears the player's locks and timers. Team flags already committed remain.
- All repeatable interactions are idempotent; reinspection can reopen content without duplicate rewards/events.
- Required clues are readable in English and journal-backed. Audio is never the sole delivery channel.
- Default prompt range is the registered 2 m; do not silently increase range to compensate for poor placement.

### 1.3 Default input modes
- INSPECT: press Interact; opens readable content; Back closes.
- PICKUP: press Interact; short 1 s target; server commits item.
- HOLD: hold Interact for the registered duration; progress UI; cancel safely.
- PUZZLE: modal/board focus; one logical operator; replicated shared state.
- VOTE: per-player explicit choice; shared resolver owns result.
- HIDE: press to enter; press again to exit; no movement/ordinary interaction while hidden.

## 2. Interaction execution matrix

| ID | Mode / duration | Preconditions and commit | Cancel / failure | UI string / fallback |
|---|---|---|---|---|
| IN-001 | INSPECT / press | Inspect neon sightline; set ArrivalClueSeen once | Reinspect is harmless; if sightline trigger fails, journal flag only after sign is shown | UI_IN_001_PROMPT; visual sign remains primary |
| IN-002 | PRESS + LISTEN / VO duration | Phone becomes available after reception entry; play welcome line and subtitle; set PhoneMessageHeard only when presented | If interrupted, replay from start or open transcript; no duplicate state | UI_IN_002_PROMPT; UI_PHONE_WELCOME_SUB |
| IN-003 | INSPECT/PICKUP / 1 s | Inspect/collect Room13Key; set Room13KeyKnown and team Room13Key once | Duplicate inspection does not consume or duplicate key | UI_IN_003_PROMPT; reception journal entry |
| IN-004 | INSPECT / press | Open readable guest register; set RegisterCluesSeen | Back closes; repeatable | UI_IN_004_PROMPT; readable register/journal copy |
| IN-005 | PUZZLE / modal | Accept exact code 02-13-86; set RegisterSolved; open drawer | Wrong code resets fields; unlimited retry; no tension penalty | UI_IN_005_PROMPT; UI_ERR_CODE |
| IN-006 | PICKUP / 1 s | If RegisterSolved, grant OfficeKey team-wide exactly once | If actor missing, drawer proxy after validated solve; no premature grant | UI_IN_006_PROMPT; UI_ALREADY_SECURED |
| IN-007 | PUZZLE / modal | Arrange 1974/1978/1982/1986; set OfficePhotoPuzzleSolved and UpperFloorAccessGranted | Wrong order resets; no photo consumed; operator disconnect releases lock | UI_IN_007_PROMPT; UI_ERR_PHOTO |
| IN-008 | INSPECT / press | Generic inspect for non-dedicated Room 01–06 documents/props; each DocumentId has its own flag | Reinspection harmless; use IN-030/031 for CRT and Room 04 phone | UI_IN_008_PROMPT; readable document panel |
| IN-009 | PICKUP / 1 s | Personal flashlight battery pickup; restore collecting player's charge to 100%; record per-player SpawnId claim | If charge already 100%, show full-charge feedback and leave pickup available; one player cannot consume another's pickup; if per-player actor visibility unsupported, implement a team battery stock with per-player charge and update UI consistently | UI_IN_009_PROMPT; flashlight HUD |
| IN-010 | HOLD / 1 s | Use reusable Screwdriver to open electrical panel cover; set PanelCoverOpen | Cancel leaves cover closed; screwdriver is not consumed | UI_IN_010_PROMPT; metal click/visual cover state |
| IN-011 | HOLD / 2 s | Insert matching FuseA/B/C into its empty slot; set slot filled and item state INSTALLED atomically | Wrong fuse rejected; cancel/duplicate slot does not consume item | UI_IN_011_PROMPT; UI_ERR_FUSE |
| IN-012 | HOLD / 1 s | Only when A/B/C slots filled; activate breaker; set PowerRestored once | Premature activation shows unmet requirement; no repeated stinger | UI_IN_012_PROMPT; UI_POWER_ON |
| IN-013 | INSPECT / press | Read ROOM 09 diary; set DiaryFound when readable content opens | Repeatable; journal copy persists | UI_IN_013_PROMPT; diary transcript |
| IN-014 | INSPECT / press | Inspect ROOM 11 drawing; set ChildRoomClueFound | Repeatable; journal copy persists | UI_IN_014_PROMPT; readable caption |
| IN-015 | HOLD / 2 s | Use reusable Screwdriver on ROOM 12 panel; set SecretPanelOpened and Room13Unlocked; open route | Cancel leaves panel unchanged; route actor recovery allowed only after validated commit | UI_IN_015_PROMPT; readable panel cue and route visual |
| IN-016 | PUZZLE / modal | Arrange ROOM 13 photos 1968/1974/1981/1986; set PhotoSequenceSolved and open compartment; start reveal presentation | Wrong order resets; no items consumed; disconnect releases lock | UI_IN_016_PROMPT; UI_ERR_PHOTO; chronology journal fallback |
| IN-017 | PICKUP / 1 s | After PZ-04, grant ServiceKey team-wide exactly once | Recovery proxy only if PhotoSequenceSolved; no duplicate grant | UI_IN_017_PROMPT; UI_ALREADY_SECURED |
| IN-018 | HOLD / 2 s | Require PowerRestored and ServiceKey; unlock service control; set GatePowered and ServiceRouteReady | Cancel leaves gate unchanged; missing prerequisite gives feedback; manual lever is equivalent validated fallback | UI_IN_018_PROMPT; gate visual/audio feedback |
| IN-019 | HOLD / 2 s | Require CarKeys and GatePowered; use vehicle ignition; set CoreEscapeReady | Cancel leaves ignition uncommitted; no key consumed | UI_IN_019_PROMPT; vehicle engine cue |
| IN-020 | VOTE / max 20 s | At final choice point, show eligible endings only; solo selects directly. Co-op: strict majority for ESCAPE/THE_TRUTH; unanimous explicit affirmative for THE_NEW_GUEST | Early resolve when quorum is met. Timeout/tie selects ESCAPE only if eligible; otherwise reopen selector. THE_NEW_GUEST decline/timeout means no commit. Disconnect removes player and restarts/reconfirms with remaining electorate. Commit ending atomically once | UI_IN_020_PROMPT; UI_VOTE_WAIT; UI_VOTE_TIE; UI_VOTE_TIMEOUT; ending choice strings |
| IN-021 | PRESS / enter-exit | Enter/leave authored hiding spot; set per-player hidden state | Force exit on reset/disconnect; cannot hide while captured/cinematic/SAFE | UI_IN_021_PROMPT; hiding-state HUD |
| IN-022 | HOLD / 5 s | Active rescuer within 2 m of CAPTURED target; commit RESCUED once | Cancel on range break, rescuer capture/disconnect or target disconnect; target remains CAPTURED | UI_IN_022_PROMPT; UI_RESCUE_PROGRESS / UI_RESCUE_CANCEL / UI_RESCUE_DONE |
| IN-023 | PRESS / press | Activate checkpoint only when required flags are satisfied; snapshot authoritative session state | Duplicate activation is harmless; invalid prerequisites reject | UI_IN_023_PROMPT; UI_CHECKPOINT |
| IN-024 | PICKUP / 1 s | Grant FuseA to team once from ROOM 02 suitcase | Duplicate pickup ignored; recover only if authored pickup unreachable | UI_IN_024_PROMPT; UI_ALREADY_SECURED |
| IN-025 | PICKUP / 1 s | Grant FuseB to team once from Storage shelf | Duplicate pickup ignored; recover only if authored pickup unreachable | UI_IN_025_PROMPT; UI_ALREADY_SECURED |
| IN-026 | PICKUP / 1 s | Grant FuseC to team once from ROOM 06 cabinet | Duplicate pickup ignored; recover only if authored pickup unreachable | UI_IN_026_PROMPT; UI_ALREADY_SECURED |
| IN-027 | PICKUP / 1 s | Grant reusable Screwdriver to team once | Duplicate pickup ignored; do not consume on IN-010/015 | UI_IN_027_PROMPT; UI_ALREADY_SECURED |
| IN-028 | PICKUP / 1 s | In ACT VI, grant CarKeys to team once | If actor missing, vehicle key hook proxy; no ignition until IN-018 + IN-019 conditions | UI_IN_028_PROMPT; UI_ALREADY_SECURED |
| IN-029 | INSPECT / press | Inspect ROOM 06 missing-guest photo archive; set MissingGuestEvidenceFound | Repeatable; journal copy; END-A02 mandatory role pending owner approval | UI_IN_029_PROMPT; readable photo archive |
| IN-030 | INSPECT / press | Watch ROOM 01 CRT; set CRTFeedSeen | Repeatable; visual content remains available if audio unavailable | UI_IN_030_PROMPT; CRT visual feed |
| IN-031 | PRESS + LISTEN / VO duration | Listen to ROOM 04 recording; set Room04RecordingHeard and Room04TranscriptRead when transcript is presented | Replayable; close/cancel does not erase transcript; audio is not required to learn fuse locations | UI_IN_031_PROMPT; transcript/journal fallback |

## 3. Ending vote timing — implementation default

The maximum co-op vote window is **20 seconds** (PROPOSED UX DEFAULT; tunable after playtests). The approved quorum is not tunable:
- ESCAPE/THE_TRUTH resolve immediately when a strict majority is reached.
- If all votes arrive before timeout and no majority exists, apply END-A01 tie rule.
- On timeout, apply END-A01 timeout rule.
- THE_NEW_GUEST resolves immediately only when every currently connected eligible player has explicitly accepted.
- Any explicit decline ends the current THE_NEW_GUEST confirmation attempt without committing; return to the eligible ending selector.
- If a player disconnects during THE_NEW_GUEST confirmation, remove them and restart a fresh 20-second confirmation with the remaining connected eligible players.
- A timeout without unanimous acceptance does not accept; return to the selector.
- Solo choice is direct and does not wait 20 seconds.

## 4. Battery pickup policy

The battery is personal equipment, not a quest item and not FuseA. Each player has an independent charge value and a per-spawn claim record. A battery pickup restores that player's flashlight to 100%. A player already at 100% cannot consume the pickup. In multiplayer, a spawn remains available to other players until they have individually claimed it, where supported. If the target UEFN workflow cannot present per-player availability, use a team-shared battery stock with per-player charge and show the stock clearly; do not silently make a personal pickup disappear for everyone.

## 5. State and register reconciliation

- IN-006 is the only OfficeKey grant.
- IN-017 is the only ServiceKey grant.
- IN-024/025/026 are the only FuseA/FuseB/FuseC grants.
- IN-027 is the only Screwdriver grant.
- IN-028 is the only CarKeys grant.
- IN-018 sets GatePowered and ServiceRouteReady; IN-019 sets CoreEscapeReady.
- IN-030 and IN-031 own the CRT/Room04 recording discovery flags.
- IN-029 owns MissingGuestEvidenceFound.
- TruthChainComplete is a derived GameManager flag and remains unimplemented as a mandatory gate until END-A02 is approved.
- Every UI prompt uses the stable StringId in UI_STRING_TABLE.csv; any new string must be added there before implementation.

## 6. Acceptance checklist

- [ ] Every IN-001–IN-031 prompt matches the string table.
- [ ] Every interaction has one authoritative state writer and one commit event.
- [ ] Timed interactions cancel cleanly and never consume required items on cancel.
- [ ] Repeated interactions do not duplicate state, inventory, audio or cinematics.
- [ ] Every required clue has readable/journal fallback.
- [ ] Solo, duo and four-player interactions follow the same team-state contract.
- [ ] Vote UI obeys END-A01 exactly and uses the 20-second proposed maximum.
- [ ] Battery pickups preserve personal charge and do not disappear globally before other players can claim them, unless the documented team-stock fallback is used.
- [ ] Checkpoint restore rebuilds actors from committed flags and clears locks.
- [ ] Every fallback is logged and does not bypass unsolved puzzle prerequisites.
