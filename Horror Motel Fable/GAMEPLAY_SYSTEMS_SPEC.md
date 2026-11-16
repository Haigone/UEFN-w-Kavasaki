# GAMEPLAY SYSTEMS SPECIFICATION
## THE MOTEL: ROOM 13
**Status:** gameplay design baseline / implementation-ready logical specification  
**Scope:** solo and 2–4 player co-op; UEFN/Verse implementation remains subject to API verification.

## 1. Design invariants
- Every mandatory objective is completable by one player.
- Quest ownership is session/team-owned, never dependent on the picker remaining connected.
- Puzzle completion and item grants are idempotent and server-authoritative.
- Wrong inputs never consume irreplaceable mandatory items.
- Exploration alone does not raise adaptive tension.
- Capture is recoverable; solo has a self-rescue path.
- Checkpoint restoration is deterministic and cannot duplicate rewards.
- Endings are mutually exclusive and selected once.

## 2. Canonical progression
ARRIVAL -> RECEPTION -> GROUND_ROOMS -> RESTORE_POWER -> UPPER_FLOOR -> ROOM_13 -> FINAL_ROUTE -> ENDING.
Act completion requires explicit objective flags, not proximity alone. Optional lore flags never block the core escape ending.

## 3. Core puzzles
| ID | Name | Act | Required output |
|---|---|---|---|
| PZ-01 | Guest Register | II | Office Key |
| PZ-02 | Owner Photographs | II | Upper-floor access |
| PZ-03 | Electrical Restoration | III | PowerRestored |
| PZ-04 | ROOM 13 Photographs | V | Owner reveal, Service Key |
| PZ-05 | Final Escape Mechanism | VI | GatePowered / vehicle route |

See PUZZLE_IMPLEMENTATION_SHEETS.md and PUZZLE_MASTER_REGISTER.csv for authoritative puzzle data.

## 4. Exploration and interaction
- First-person contextual interaction; target range 2 m.
- Show focus/reticle feedback, concise English verb label and success/failure feedback.
- Do not require pixel-perfect targeting. Use generous interaction volumes around small props.
- Inspectable documents open a readable close-up or UI panel; close/cancel always returns control.
- Important audio clues also have a text/subtitle or environmental equivalent.
- Interactions validate player state, distance, objective prerequisites and session state on the authority.
- A player in CAPTURED, SAFE or an active cinematic cannot initiate ordinary interactions.
- Every interaction has timeout/cancel/disconnect cleanup.

## 5. Flashlight and batteries
- Baseline battery duration: 180 seconds of active flashlight use.
- Target distribution: 3–4 replacement batteries, including the known battery in Room 02.
- Replacement takes approximately 2 seconds; interruption leaves the old charge unchanged and the battery unconsumed.
- Low-charge flicker begins below 15%; at 0%, light turns off.
- HUD shows charge state and a clear audio cue at low charge.
- Battery pickup is personal equipment unless the level design explicitly flags it as team-shared. Battery count and flashlight charge are separate values.
- Ensure a minimum visibility fallback in mandatory puzzle spaces; battery depletion must not make required clues impossible to read.
- Battery pickup grants once per authored spawn. Re-entry cannot duplicate a consumed pickup.

## 6. Inventory model
Two inventories are distinct:
1. Shared quest inventory: persistent for the live session; contains required keys, fuses and tools.
2. Personal utility inventory: flashlight charge and optional consumables, if implemented.

Shared inventory is a set of ItemId values. Add/remove operations are atomic. UI displays team ownership, not a misleading holder name. Physical props are visual proxies; the team flag is authoritative.

Required quest item catalogue: Room13Key, OfficeKey, FuseA, FuseB, FuseC, Screwdriver, CarKeys, ServiceKey. Fuse items become INSTALLED rather than lost when assigned to a panel slot. Room13Key is introduced in reception and acts as narrative/access proof; do not make it a consumable key that can be lost.

## 7. Documents and clues
- Documents have stable DocumentId, Act, location, mandatory/optional flag, readable text, discovery flag and fallback delivery method.
- Mandatory clues are readable in English and have a visual/text fallback if audio is involved.
- Re-inspecting a document is allowed; discovery flags are idempotent.
- A missed optional document does not block the game.
- Mandatory documents are re-presented through an alternate copy, journal entry or checkpoint-safe interactable if the original becomes unavailable.

## 8. Hiding and pursuit
- Hiding is limited to authored hiding spots with explicit enter/exit states.
- Do not permit hiding while captured, in a cinematic, or in a transition that would strand the player.
- THE GUEST investigates last-known sound position, not live wall-tracking.
- Pursuit begins only when target reachability and navigation route are valid.
- Every chase route has a readable route forward plus loop/alternate path; no mandatory route is permanently blocked.
- No capture during protected puzzle interactions or non-interruptible narrative beats.
- After chase, apply recovery/cooldown and reduce pressure.

## 9. Adaptive difficulty
Tension 0–100; bands: DORMANT 0–24, UNEASY 25–49, HUNTING 50–74, RELENTLESS 75–100.
Inputs: meaningful objective stagnation (after grace period), recent captures, noisy actions, detection/chase history and party-size context. Exploration alone and reading documents do not increase tension. Clamp and smooth changes; pause during narrative beats and mandatory stationary puzzle actions. Solo mode reduces simultaneous pressure and guarantees self-rescue.

Initial tuning anchors (playtest targets): patrol interval 35 s at DORMANT to 18 s at RELENTLESS; investigation 12 s to 8 s; hiding search 5 s to 10 s; post-chase recovery 25 s to 12 s. These are balance targets, not engine guarantees.

## 10. Endings — canonical decision contract

- **ESCAPE:** requires CoreEscapeReady and explicit selection of the vehicle route. It remains eligible when optional truth evidence is incomplete.
- **THE_TRUTH:** requires CoreEscapeReady, TruthChainComplete, Room13RevealComplete, ServiceKeyObtained, ServiceRouteReady and explicit selection of the truth route.
- **THE_NEW_GUEST:** requires NewGuestAccepted through explicit invitation interaction and team confirmation. Capture, defeat, inactivity or timeout never imply consent.

**Owner-approved co-op quorum END-A01 (2026-11-16):**
- ESCAPE and THE_TRUTH: strict majority of currently connected eligible players.
- THE_NEW_GUEST: explicit unanimous affirmative confirmation from all currently connected eligible players.
- Tie/timeout for ESCAPE/THE_TRUTH: select ESCAPE only if eligible; otherwise keep choice active for a new vote. Never silently select THE_TRUTH.
- Disconnect removes that player from the active electorate and recalculates majority; for THE_NEW_GUEST, re-prompt/reconfirm unanimity among remaining connected players. Disconnect is never consent.
- Solo: direct choice.
- Commit one session-wide ending atomically; disable all competing triggers after commit.

**Truth evidence END-A02:** still pending owner approval. Do not hard-code a mandatory evidence list until approval. The recommended three-clue formula is in END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md and OWNER_DECISION_PACKET_R1.md. Keep route, puzzle and reveal flags separate from evidence pickups.

## 11. Accessibility and recovery
- All essential clues have readable text.
- Interaction prompts are consistent and visible.
- No mandatory clue relies on sound alone.
- Player who disconnects releases locks and timers.
- Returning players rejoin the current team state; no cross-session persistence is assumed.
- If an essential item/puzzle becomes unavailable, recovery service restores the corresponding team flag only after validating its prerequisite and logs a fallback event.

## 12. Implementation ownership
GameManager: act/objective/checkpoint/ending authority. PuzzleManager: puzzle transactions. InventoryManager: team item set. PlayerManager: per-player states, join/leave, capture/rescue. InteractionManager: range and locks. DifficultyManager: tension. MonsterController: navigation/threat. UI/Audio managers are presentation-only.

## 13. Execution ownership
Claude is responsible for all UEFN project inspection, Verse/API verification, implementation, compilation, device setup, in-editor/game-session execution, multiplayer testing, performance validation and evidence capture. ChatGPT is responsible for preparing and maintaining detailed specifications, execution plans, test cases, expected results and reviewing evidence/defects supplied by Claude. ChatGPT does not claim to run UEFN or execute tests.

## 14. Definition of done
All six acts playable in solo and 2–4 player co-op; all mandatory items recoverable; all puzzles retryable; disconnect and all-captured recovery tested by Claude; checkpoints idempotent; all three endings reachable; no known softlock; actual UEFN compile and playtest evidence attached before release. See CLAUDE_UEFN_EXECUTION_PLAN.md for the required execution sequence and reporting format.


## 15. Cross-register state additions and reward ownership
- Add `MissingGuestEvidenceFound` as the Room 06 photo-board discovery flag. It is part of the proposed THE_TRUTH evidence checklist only while the project owner retains it as mandatory.
- `RegisterSolved` opens the desk drawer; the OfficeKey is granted only by interaction IN-006.
- `PhotoSequenceSolved` opens the ROOM 13 compartment; the ServiceKey is granted only by interaction IN-017.
- Pickup events IN-024–IN-028 are the authoritative grants for FuseA, FuseB, FuseC, Screwdriver and CarKeys. Each is team-owned and idempotent.
- `Room13Key` is the team inventory item; `Room13KeyKnown` is the separate narrative discovery flag. Neither is consumed to unlock ROOM 13.
- Screwdriver is reusable and is used for the electrical cover and the ROOM 12 concealed panel.
- These mappings are documentary reconciliation rules; Claude must verify the corresponding actors and event bindings in the actual project.


## 16. UI/UX, quest tracker and evidence journal
The authoritative player-facing presentation contract is defined in [GAMEPLAY_UI_UX_SPEC.md](./GAMEPLAY_UI_UX_SPEC.md). It specifies the persistent HUD, objective tracker, team status, flashlight feedback, Journal/Evidence lifecycle, interaction and pickup feedback, puzzle interfaces, capture/rescue UI, checkpoint/ending presentation, accessibility and UI acceptance tests. UI remains presentation-only; GameManager/session flags remain authoritative.
