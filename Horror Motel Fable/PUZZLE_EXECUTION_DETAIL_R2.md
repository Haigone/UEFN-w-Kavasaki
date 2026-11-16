# PUZZLE EXECUTION DETAIL R2 — THE MOTEL: ROOM 13

**Status:** Canonical implementation contract aligned to PUZZLE_MASTER_REGISTER.csv and PUZZLE_IMPLEMENTATION_SHEETS.md.  
**Authority:** PuzzleManager owns puzzle state; InventoryManager owns grants; GameManager owns progression predicates.  
**Important:** This document specifies intended behavior. It is not proof of UEFN implementation or test completion.

## 0. Global contract

All five registered puzzles use states LOCKED → AVAILABLE → IN_PROGRESS → SOLVED. A puzzle may return IN_PROGRESS → AVAILABLE after operator disconnect, interaction timeout, invalid actor or explicit reset. SOLVED is terminal for the session. The server/session authority validates every input and commits each completion once.

Every interaction transaction follows: validate session and player → validate puzzle state and prerequisites → acquire short exclusive lock → validate input → commit authoritative flags → release lock → emit presentation event. On failure, release lock and preserve items. A duplicate event returns the already committed result and never duplicates rewards.

No mandatory puzzle is time-limited. THE GUEST cannot capture a player while a mandatory puzzle transaction is in its protected commit window. Do not freeze all players during a puzzle: only the active operator receives interaction protection; other players remain free to move and assist.

## 1. PZ-01 — GUEST REGISTER

**Act/location:** II, reception counter desk lock.  
**Prerequisites:** reception entered; IN-004 register inspection available.  
**Inputs:** three numeric groups, exactly 02 / 13 / 86. Accept display formats 02-13-86 and 02 13 86; normalize separators before comparison. Reject missing/extra digits and any other order.  
**Clue presentation:** three highlighted register entries expose 02, 13 and 86; wall clock is frozen at 02:13; motel year is 1986. Readable note: “Use the dates that appear more than once.”  
**Success transaction:** PuzzleManager commits RegisterSolved=true. Drawer opens. This does not grant OfficeKey. IN-006 is the sole OfficeKey grant writer and is enabled only after RegisterSolved.  
**Failure:** clear entered digits; play restrained rejection cue; show “That combination is incorrect.” Unlimited attempts, no tension penalty, no item consumed.  
**Concurrency:** one lock per desk keypad. If two players submit simultaneously, first valid server transaction wins; second receives already-solved feedback.  
**Recovery:** if keypad actor is absent, expose recovery keypad only after register clue inspection has been committed. It uses identical validation. If drawer pickup actor is absent, IN-006 recovery proxy grants OfficeKey only when RegisterSolved and OfficeKeyGranted=false.  
**Acceptance:** PZ1-01 correct code; PZ1-02 wrong code then retry; PZ1-03 malformed input; PZ1-04 simultaneous correct submits; PZ1-05 solved state survives checkpoint restore; PZ1-06 duplicate IN-006 does not duplicate key.

## 2. PZ-02 — OWNER PHOTOGRAPHS

**Act/location:** II, owner's office.  
**Prerequisites:** OfficeKeyGranted; office access.  
**Inputs:** four photos assigned to four chronological slots. Each photo has a visible year on reverse and a repeated readable office note.  
**Solution:** 1974 → 1978 → 1982 → 1986.  
**Clue scope:** images depict motel renovation milestones; do not reveal the owner's final identity or the truth behind ROOM 13.  
**Success:** PuzzleManager commits OfficePhotoPuzzleSolved=true and UpperFloorAccessGranted=true; route unlocks.  
**Failure:** all four slots reset; no photo consumed; feedback indicates “The dates do not form a continuous chronology” without revealing exact positions.  
**Concurrency:** one operator lock; replicated board state for all clients. Slot selection is server-validated. Disconnect releases lock and resets uncommitted arrangement.  
**Recovery:** after inspecting all four photos, journal chronology index is available. If any physical photo actor is missing, a substitute photo card appears on the board with the same year and image content.  
**Acceptance:** PZ2-01 correct order; PZ2-02 reverse order rejected; PZ2-03 partial arrangement reset; PZ2-04 operator disconnect; PZ2-05 missing photo proxy; PZ2-06 duplicate success cannot re-trigger access event.

## 3. PZ-03 — ELECTRICAL RESTORATION

**Act/location:** III, electrical/utility room.  
**Prerequisites:** panel discovered; Screwdriver acquired.  
**Required team items:** FuseA, FuseB, FuseC. Screwdriver is reusable and never consumed.  
**Canonical fuse placements:** Fuse A in Room 02 suitcase (separate from the battery pickup); Fuse B on storage shelving beside wet-floor sign; Fuse C in Room 06 maintenance cabinet. Letter label must be legible at normal interaction distance.  
**Inputs:** open maintenance cover with Screwdriver; install A→A, B→B, C→C; close cover; activate breaker. There is no hidden order among the three fuses.  
**Success:** each slot assignment commits its matching Installed flag atomically. Only after all three are installed and the breaker is activated does PowerRestored=true. Lighting/service-power cues are emitted once from the power commit.  
**Failure:** wrong socket rejects item and leaves it in shared inventory. Occupied slot rejects second item. Breaker interaction before all three slots are installed shows exact missing fuse labels.  
**Concurrency:** slot-level atomic assignment. Two players may install different fuses concurrently; two attempts on the same slot resolve to one winner. Team inventory decrements only on successful assignment.  
**Recovery:** recovery drawer near panel can restore only a fuse whose act is active and whose pickup actor is verified missing/unreachable. It creates one recovery pickup/flag; never duplicate physical and recovery fuse.  
**Checkpoint:** persist FuseA/B/C found and installed flags. Restore panel cover, fuse meshes and breaker state from flags; do not infer state from mesh positions.  
**Acceptance:** PZ3-01 solo all fuses; PZ3-02 wrong socket no loss; PZ3-03 two simultaneous different slots; PZ3-04 same-slot race; PZ3-05 breaker blocked until all installed; PZ3-06 duplicate pickup ignored; PZ3-07 checkpoint restore before/after breaker; PZ3-08 disconnected installer does not lose a committed fuse.

## 4. PZ-04 — ROOM 13 PHOTO SEQUENCE

**Act/location:** V, ROOM 13 wall and hidden compartment.  
**Prerequisites:** ROOM 13 unlocked and entered. Do not require optional evidence discoveries for this puzzle.  
**Inputs:** four chronology photographs. Each image/date is inspectable and journal-readable.  
**Solution:** 1968 → 1974 → 1981 → 1986.  
**Narrative mapping:** 1968 motel construction/opening; 1974 first recorded disappearance; 1981 child/guest disappearance; 1986 current night/owner portrait. The exact approved copy and imagery must be taken from NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md, not improvised in implementation.  
**Success sequence:** correct board order → PhotoSequenceSolved=true → hidden compartment opens → reveal presentation begins → GameManager/CinematicManager handshake confirms reveal completed and readable fallback is available → Room13RevealComplete=true / OwnerIdentityRevealed=true → IN-017 pickup becomes available. IN-017 alone grants ServiceKey.  
**Strict separation:** PZ-04 never sets MissingGuestEvidenceFound, DiaryFound or ChildRoomClueFound. TruthChainComplete is derived only from the three evidence flags.  
**Failure:** reset board; provide earliest/latest relationship feedback; no item loss.  
**Recovery:** journal chronology view and substitute photo cards. If cinematic presentation fails, keep puzzle solved but do not falsely set reveal-complete until the fallback title/text presentation is shown. If Service Key actor is missing, IN-017 proxy grants only when Room13RevealComplete=true and ServiceKeyObtained=false.  
**Acceptance:** PZ4-01 correct order; PZ4-02 incorrect order/retry; PZ4-03 every photo inspectable; PZ4-04 cinematic failure and readable fallback; PZ4-05 disconnect during reveal; PZ4-06 no evidence flags set by puzzle; PZ4-07 duplicate Service Key pickup ignored.

## 5. PZ-05 — FINAL ESCAPE MECHANISM / SERVICE ROUTE

**Act/location:** VI, GF-SERVICE-BAY (Service Control Bay) and exterior vehicle. U-SERVICE is a sealed technical reserve and is never a gameplay location.  
**Prerequisites:** PowerRestored, ServiceKeyObtained and Room13RevealComplete.  
**Phase A — service route:** use ServiceKey at D-G16 to access GF-SERVICE-BAY; activate the SVC-GATE-CONSOLE when PowerRestored is true. Commit GatePowered=true and ServiceRouteReady=true. Derive FinaleReady only when all of the following are true: PowerRestored AND ServiceKeyObtained AND GatePowered AND ServiceRouteReady AND Room13RevealComplete.  
**Phase B — optional vehicle route:** after FinaleReady, CarKeys are available as an optional Act VI pickup. Collecting them does not select or commit an ending. Vehicle ignition succeeds only when FinaleReady and CarKeysObtained; commit VehicleIgnitionSucceeded=true and derive CoreEscapeReady = FinaleReady AND CarKeysObtained AND VehicleIgnitionSucceeded.  
**No-key rule:** CarKeys and vehicle ignition are not prerequisites for THE_TRUTH or THE_NEW_GUEST. The final selector must appear after FinaleReady, regardless of CarKeys.  
**Failure:** show exact missing prerequisite; keys are never consumed; player can leave and return. Gate control fallback lever performs the same validated transition. ServiceKey proxy is allowed only if ServiceKeyObtained is already true. CarKeys proxy is allowed only when FinaleReady and the authored CarKeys actor is verified missing/unreachable; it does not commit or select ESCAPE.  
**Concurrency:** session-wide one-shot commit; gate animation can be replayed visually but cannot create duplicate progression events. If ending selection and ignition race, GameManager serializes: ending selector cannot commit ESCAPE until CoreEscapeReady; non-ESCAPE ending commits do not wait for ignition.  
**Acceptance:** PZ5-01 service route with no CarKeys; PZ5-02 ESCAPE blocked before CarKeys; PZ5-03 ESCAPE after ignition; PZ5-04 THE_TRUTH available without CarKeys when truth chain complete; PZ5-05 THE_NEW_GUEST available without CarKeys after unanimity; PZ5-06 gate proxy; PZ5-07 duplicate activation; PZ5-08 simultaneous ending/ignition requests.

## 6. Shared objective/evidence/UI contract

- One primary objective is visible at a time. Substeps may show Fuse 0/3, but never reveal undiscovered fuse positions.
- Evidence is recorded in Journal > Evidence with title, location, readable transcript/description, discovery timestamp/order and a persistent found state.
- The three truth clues are optional for core progression and mandatory only for THE_TRUTH: Room 06 missing-guest archive; Room 09 night-manager diary; Room 11 child's drawing.
- Every clue must have a readable version; no audio-only gate.
- Interaction prompts must state the action and relevant missing prerequisite. Avoid unexplained “Locked”.
- Journal content remains readable after leaving the room, capture, checkpoint restore and reconnect.
- UI reflects authoritative flags only; never infer success from animation, object placement or client-local state.

## 7. Change control

If a clue prop, room placement, puzzle input, solution or prerequisite changes, update in the same commit: this file, PUZZLE_MASTER_REGISTER.csv, PUZZLE_IMPLEMENTATION_SHEETS.md, relevant objective/event rows, UI_STRING_TABLE.csv, asset manifest and acceptance tests. A puzzle is not complete until all dependent docs agree.
