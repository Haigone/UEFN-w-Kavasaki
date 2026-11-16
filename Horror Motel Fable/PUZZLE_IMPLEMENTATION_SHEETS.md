# PUZZLE IMPLEMENTATION SHEETS
## THE MOTEL: ROOM 13

All interactions are server-authoritative, retryable and idempotent. The values below are the canonical proposed puzzle content for implementation; if the physical clue props differ, update both clue text and solution in the same change.

## PZ-01 — GUEST REGISTER
**Act:** II. **Position:** reception counter / desk lock.  
**Prerequisites:** reception entered; register inspection available.  
**Required objects:** none. **Optional:** none.  
**Clue design:** three highlighted guest entries show the date fragments 02, 13 and 86. The reception wall clock is frozen at 02:13 and the motel's year is 1986. A short readable note states “Use the dates that appear more than once.”  
**Interaction:** inspect each register entry; enter three-part code at desk lock.  
**Solution:** 02-13-86.  
**Success:** mechanical click; drawer opens; RegisterSolved=true; OfficeKey pickup becomes available. IN-006 is the sole grant transaction and adds OfficeKey to shared inventory exactly once.  
**Failure:** soft reject sound and brief “That combination is incorrect” prompt; clear entered digits; unlimited retries with no tension penalty.  
**Fallback:** after repeated failed attempts, the register UI offers a magnified clue view (not the answer); if the lock actor is missing, an office-key recovery interactable becomes available only after RegisterSolved is validated by the clue-completion fallback.  
**Multiplayer:** any active player can inspect/enter; lock transaction prevents concurrent commits.  
**Completion:** RegisterSolved is committed and the drawer pickup is enabled; OfficeKey is present only after IN-006 commits.  
**Tests:** solo solve; wrong code/retry; two players submit simultaneously; drawer actor reload; picker disconnects immediately after success.

## PZ-02 — OWNER PHOTOGRAPHS
**Act:** II. **Position:** owner's office.  
**Prerequisites:** OfficeKey; office access.  
**Required objects:** none. **Optional:** optional lore documents.  
**Clue design:** four dated photographs show office events in 1974, 1978, 1982 and 1986. Dates are printed legibly on the reverse and repeated in a short office note. The photographs depict an ordinary progression of motel renovations; do not reveal the full owner/GUEST identity.  
**Interaction:** place/select four photos in chronological slots.  
**Solution:** 1974 → 1978 → 1982 → 1986.  
**Success:** latch releases; upper-floor route unlocks; UpperFloorAccessGranted=true.  
**Failure:** incorrect arrangement resets all slots and gives a restrained mechanical rejection. No photo is consumed.  
**Fallback:** a readable photo index appears in the journal after inspecting all four; if a photo prop is missing, its journal record remains inspectable and a substitute card appears on the board.  
**Multiplayer:** one operator at a time; all players see replicated arrangement; any active player may operate after lock release.  
**Completion:** access flag set and route physically open.  
**Tests:** solo solve; reverse order; reset; simultaneous slot attempts; missing photo actor; operator disconnect.

## PZ-03 — ELECTRICAL RESTORATION
**Act:** III. **Position:** electrical room / service storage.  
**Prerequisites:** electrical panel discovered.  
**Required objects:** Fuse A, Fuse B, Fuse C. **Tool:** Screwdriver opens the maintenance cover and is reused for the ROOM 12 concealed panel in Act IV; it is not consumed.  
**Fuse placement:** Fuse A in Room 02 suitcase (retain the documented battery there as a separate pickup); Fuse B in storage shelving beside the wet-floor sign; Fuse C in the Room 06 maintenance cabinet. Each fuse has a large letter label and a readable matching socket. These placements are proposed canonical placements and must be mirrored in the level layout.  
**Interaction:** open cover with Screwdriver; install each fuse into its matching labelled socket; activate breaker.  
**Solution:** A→A, B→B, C→C; close cover; pull breaker. No hidden sequence.  
**Success:** PowerRestored=true; all three fuse flags become INSTALLED; lights/service systems update; electrical activation emits one investigation sound event.  
**Failure:** wrong socket rejects fuse; item remains team-owned; panel gives clear label feedback.  
**Fallback:** if a fuse pickup is physically missing or unreachable, a service recovery drawer near the panel can restore that fuse flag once the relevant act is active; log Recovery_FuseX. Never spawn duplicate physical fuse actors.  
**Multiplayer:** shared team flags; slot locks atomic; one fuse cannot occupy two slots.  
**Completion:** all slots occupied and breaker active.  
**Tests:** solo; wrong slot; simultaneous installation; player leaves during install; pickup actor destroyed; breaker spam; power state after CP02 restore.

## PZ-04 — ROOM 13 PHOTOGRAPHS
**Act:** V. **Position:** ROOM 13 wall / hidden compartment.  
**Prerequisites:** ROOM 13 entered; four chronology photos available. Optional investigation clues are not PZ-04 prerequisites.  
**Required objects:** none. **Optional:** optional lore documents.  
**Clue design:** four images show: first motel construction / owner at opening (1968); first recorded disappearance (1974); child drawing/guest disappearance (1981); current night and owner portrait (1986). Each has a visible date or date-linked caption. A diary fragment states “The room was never built. It was always here.”  
**Interaction:** place/select four photos in chronological order.  
**Solution:** 1968 → 1974 → 1981 → 1986.  
**Success:** hidden compartment opens; OwnerIdentityRevealed=true; PhotoSequenceSolved=true; Service Key pickup becomes available. IN-017 is the sole grant transaction and adds ServiceKey exactly once. TruthChainComplete is a separate derived session flag under approved END-A02: DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. PZ-04 never sets or substitutes for any of those three evidence flags.  
**Failure:** board indicates whether the earliest/latest relation is wrong without exposing the full answer; reset all slots; no item loss.  
**Fallback:** journal chronology view; substitute photo cards if a prop is missing; solved flag can restore compartment and ServiceKey.  
**Multiplayer:** shared state, one logical lock; any active player can operate; no individual vote required.  
**Completion:** solved flag and reveal flag committed; ServiceKey becomes team-owned only after IN-017 commits.  
**Tests:** solo; all permutations; wrong/retry; concurrent players; disconnect; checkpoint restore; repeated completion.

## PZ-05 — FINAL ESCAPE MECHANISM
**Act:** VI. **Position:** service route gate control and exterior vehicle.  
**Prerequisites:** PowerRestored and ServiceKey for service control; CarKeys only if the team selects ESCAPE.  
**Required objects:** ServiceKey for service control. CarKeys are required only for the ESCAPE vehicle ignition. Screwdriver is not consumed and is not a gate prerequisite.  
**Interaction:** unlock service control with ServiceKey and activate the powered gate. This establishes FinaleReady. If the team selects ESCAPE, obtain CarKeys and interact with vehicle ignition to establish CoreEscapeReady. THE_TRUTH and THE_NEW_GUEST do not require CarKeys or vehicle ignition.  
**Solution:** use ServiceKey at service control and activate gate; use CarKeys at vehicle only for ESCAPE.  
**Success:** GatePowered=true and ServiceRouteReady=true after ServiceKey validation and service-control activation; CoreEscapeReady=true only after CarKeys are used at the vehicle ignition; final pursuit/ending choice follows the authored flow.  
**Failure:** show exact missing prerequisite; do not consume keys; player can leave and return.  
**Fallback:** if physical ServiceKey prop is missing but team flag exists, use an alternate keyhole proxy; if gate control fails, a clearly signposted manual service lever performs the same validated transition. CarKeys proxy is required only if ESCAPE is selected.  
**Multiplayer:** shared key flags; all players can participate; ending choice is team-wide and deterministic.  
**Completion:** gate and vehicle route states are true; Ending remains NONE until selected.  
**Tests:** solo/co-op; missing ServiceKey or PowerRestored; each ending with/without CarKeys; wrong interaction order; gate and ending triggers overlap; repeat activation; disconnect during final sequence.

## Cross-puzzle implementation requirements
- Puzzle state: LOCKED, AVAILABLE, IN_PROGRESS, SOLVED.
- Every puzzle has one authoritative owner and one completion event.
- Failed attempts release locks and preserve required items.
- On disconnect/timeout, release puzzle lock and return IN_PROGRESS to AVAILABLE unless a committed substep is explicitly checkpointed.
- Never infer success from visual prop position alone; commit authoritative flags.
- Keep puzzle inputs protected from monster capture during the short interaction transaction.


## PZ-06 — NIGHT AUDIT (THE_TRUTH ending interaction)
**Availability:** only after IN-020 has atomically committed Ending=THE_TRUTH. This is an ending beat, not a puzzle and not an ending selector.
**Player action:** enter the service control room, inspect the automatically displayed ROOM 13 evidence rail, then hold the dedicated NIGHT AUDIT — END CYCLE breaker for 2 seconds through IN-032.
**Success:** NightAuditActivated=true exactly once; run the approved room-by-room blackout, 02:13 neon hold, register print “NO VACANCY. NO OWNER. NO GUEST.” and THE TRUTH title card.
**No extra requirements:** no car keys, vehicle ignition, chase, extra inventory item or second photo puzzle. The four photos are mirrored to the rail in solved order; the original ROOM 13 board remains intact.
**Fallback:** if the breaker actor is missing, use the service-control proxy to invoke the same one-shot event. If presentation fails, preserve Ending=THE_TRUTH and NightAuditActivated, then show the approved fallback title card.
