# GAMEPLAY FLOW, PLAYER STATES & QA
## THE MOTEL: ROOM 13

## 1. Player control specification
First-person movement:
- Walk and sprint; sprint produces more audible movement.
- Crouch reduces noise and visibility where the verified game systems permit.
- Manual flashlight with battery state.
- Contextual interaction at target range 2 m.
- Examine documents and key objects.
- Hide only in authored hiding locations.
- No combat-focused progression; survival is based on awareness, stealth, route planning and cooperation.

Flashlight target tuning:
- 180 seconds total per battery.
- 3–4 replacement batteries distributed through the level.
- Battery replacement action: about 2 seconds.
- Flicker below 15%; turns off at 0%.
- Provide clear HUD battery feedback and audio cue.
- Ensure battery replacement cannot be interrupted into a permanently unusable state.

## 2. Full act-by-act objective flow

### ACT I — THE ARRIVAL (0–8 min)
1. Spawn group at broken car.
2. Introduce rain, road ambience and neon sign.
3. Brief silhouette on upper balcony; no forced chase yet.
4. Guide players into reception.
5. Let players inspect register, phone, key rack and clock.
6. Phone rings: “Welcome. We've been expecting you.”
7. Reveal ROOM 13 key.
8. Objective: investigate the front desk and find a way into the owner's office.
Checkpoint setup begins; no required item should be missable.

### ACT II — THE REGISTER (8–17 min)
1. Players inspect guest register entries.
2. Solve three-part date/number lock.
3. Open desk drawer and obtain Office Key.
4. Explore owner's office and photo clue.
5. Unlock upper-floor access route/key.
6. Explore rooms 01–06 for clues, batteries and fuse leads.
7. ROOM 01 CRT shows impossible corridor image.
8. ROOM 02 suitcase contains battery.
9. ROOM 03 mirror shows THE GUEST.
10. ROOM 04 phone gives clue.
11. ROOM 05 footsteps from ceiling.
12. ROOM 06 missing guest photos.
13. Objective: restore motel power.
Checkpoint CP01: register solved and office access granted.

### ACT III — THE POWER (17–27 min)
1. Direct players to storage/utility area.
2. Locate Fuse A, B and C in distinct spaces; each pickup is team-shared.
3. Return to electrical panel.
4. Install all fuses and restore power.
5. Lighting and selected systems change state.
6. Power activation creates an audible event; THE GUEST investigates.
7. Trigger first full pursuit using a fair route and clear threat cues.
8. Players evade and regroup.
Checkpoint CP02: power restored and fuse flags retained.

### ACT IV — THE SECOND FLOOR (27–36 min)
1. Open upper floor and balcony.
2. THE GUEST uses verified navigation routes only after stair/balcony navigation is proven.
3. ROOM 09 diary is an optional history-evidence discovery.
4. ROOM 11 child's drawing is an optional foreshadowing/evidence discovery.
5. Use the reusable Screwdriver at the ROOM 12 concealed panel.
6. Open the hidden passage and enable the route to ROOM 13.
7. Ensure team can regroup before entering ROOM 13.
Checkpoint CP03: upper-floor access, opened panel/route and all evidence already discovered are retained. Diary/drawing inspection is not a core escape progression gate.

### ACT V — ROOM 13 (36–43 min)
1. Enter hidden passage.
2. Enter impossible ROOM 13.
3. Inspect bed, wardrobe, CRT, phone, photographs and frozen clock at 02:13.
4. Arrange four photographs chronologically.
5. Reveal owner identity: owner is identical to THE GUEST.
6. Open hidden compartment and obtain Service Key.
7. Evaluate TruthChainComplete using the owner-approved END-A02 formula: DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. SecretPanelOpened, PhotoSequenceSolved and Room13RevealComplete remain separate progression/reveal flags. Each evidence clue is team-shared, idempotent, recoverable and available in readable/journal form.
Checkpoint CP04: photo puzzle solved and reveal state retained.

### ACT VI — NO VACANCY (43–50 min)
1. Reach service route.
2. If pursuing ESCAPE, recover Car Keys; CarKeys are not required for THE_TRUTH or THE_NEW_GUEST.
3. Unlock and activate the service gate mechanism using Service Key; this commits GatePowered, ServiceRouteReady and derived FinaleReady.
4. Trigger final pursuit with readable wayfinding.
5. Evaluate explicit ending eligibility and selected branch.
6. Play one of the three ending sequences.
7. Show ending title card and return/complete session state safely.

## 3. Player state transitions
Allowed conceptual transitions:
- ACTIVE → THREATENED → ACTIVE
- ACTIVE / THREATENED → CAPTURED
- CAPTURED → RESCUE_PENDING → RESCUED
- CAPTURED → SOLO_ESCAPE → ACTIVE
- ACTIVE / RESCUED → SAFE (ending/exit zone)

Guard every transition:
- No second capture while already CAPTURED.
- No rescue by a captured player.
- No duplicate item grants on rescue.
- Clear interaction locks on disconnect, reset or checkpoint restore.
- Do not let a player remain immobilised after an interrupted cinematic.
- Team defeat is a recoverable checkpoint event, not an unrecoverable session failure.

## 4. Capture / rescue exact targets
- Capture starts only when THE GUEST reaches a valid target and capture is enabled.
- Brief capture presentation; use verified UEFN-compatible camera/animation methods only. Target duration: 2 seconds.
- Captured player remains in a recoverable state; quest inventory is unchanged.
- Teammate rescue range: 2 m; duration: 5 uninterrupted seconds; cancel on range break, rescuer/target disconnect or rescuer capture.
- Post-rescue protection: 8 seconds.
- Solo: after the 2-second capture presentation, enable a local 5-second self-rescue interaction/route; no item or teammate required.
- Co-op: after 90 seconds captured, enable the same 5-second emergency self-recovery interaction for the captured player.
- If every connected player is CAPTURED, restore the latest checkpoint immediately. If solo recovery is unavailable or the player remains captured for 90 seconds, restore the latest checkpoint. Never use death/game over as the recovery mechanism.
- Only one unscripted capture transition should be processed at a time unless a deliberately authored sequence is implemented and tested.

## 5. Difficulty controller
TensionLevel range 0–100:
- 0–24 DORMANT.
- 25–49 UNEASY.
- 50–74 HUNTING.
- 75–100 RELENTLESS.

Potential factors:
- Time without objective progress.
- Number/recentness of captures.
- Puzzle duration with a grace period and upper cap.
- Detection frequency and chase frequency.
- Team separation and party size.

Never raise tension solely because players are looking around. Pause or clamp during narrative beats. Reduce tension after difficult puzzles and completed chases. Smooth transitions and use cooldowns.

Target parameters:
| Parameter | DORMANT | RELENTLESS |
|---|---:|---:|
| Patrol interval | 35 s | 18 s |
| Investigation duration | 12 s | 8 s |
| Hiding search duration | 5 s | 10 s |
| Post-chase recovery | 25 s | 12 s |

These are balance targets requiring playtest, not fixed engine behaviour.

## 6. Team inventory and disconnect policy
Shared quest inventory:
- Room 13 Key
- Office Key
- Fuse A
- Fuse B
- Fuse C
- Screwdriver
- Car Keys
- Service Key

The authoritative objective state is team-owned. If the picker disconnects, required progress remains. If the game uses physical item props, they must be re-grantable from a team state or checkpoint. A player leaving during a multi-step interaction must release the interaction lock.

## 7. Three endings: exact flag guidance
Recommended flags:
- FinaleReady
- CoreEscapeReady
- TruthChainComplete
- Room13RevealComplete
- ServiceRouteReady
- NewGuestAccepted
- EndingSelected

ESCAPE:
- CoreEscapeReady = true only after FinaleReady is true and CarKeys vehicle ignition succeeds.
- TruthChainComplete = false OR player/team chooses the standard exit path.
- Car Keys + gate mechanism completed.
- Trigger vehicle escape.

THE TRUTH:
- FinaleReady = true.
- TruthChainComplete = true exactly when DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound.
- Room13RevealComplete = true; ServiceKeyObtained and ServiceRouteReady are included in FinaleReady.
- Players select/activate the truth route.
- CarKeys and vehicle ignition are not required.
- Trigger the distinct owner confrontation/revelation resolution.

THE NEW GUEST:
- FinaleReady makes the invitation option available. NewGuestAccepted = true only after the resolver receives unanimous explicit affirmative confirmation from all currently connected eligible players. No implicit cycle condition.
- In co-op, require explicit unanimous affirmative confirmation from every currently connected eligible player. A disconnect removes that player and requires re-confirmation among those remaining; disconnect is never consent.
- Declining, inactivity, timeout, capture or defeat never count as acceptance.
- All endings require eligibility validation and an atomic one-time session-wide commit.

**END-A01 owner-approved quorum (2026-11-16):**
- ESCAPE and THE_TRUTH: strict majority of currently connected eligible players.
- THE_NEW_GUEST: unanimous explicit affirmative confirmation.
- Tie/timeout for ESCAPE/THE_TRUTH: choose ESCAPE only if eligible; otherwise keep selector active for a new vote; never silently choose THE_TRUTH.
- Solo choice is direct. Ending is locked once committed.

**END-A02 APPROVED UNDER EXPRESS OWNER DELEGATION (2026-11-16):** TruthChainComplete = DiaryFound AND ChildRoomClueFound AND MissingGuestEvidenceFound. SecretPanelOpened, PhotoSequenceSolved and Room13RevealComplete remain separate progression/reveal requirements. See OWNER_DECISION_GATE_R2.2.md and END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md.

## 8. QA scenarios
1. Solo: complete all acts and reach ESCAPE.
2. Solo: complete truth chain and reach THE TRUTH.
3. Solo: explicitly accept invitation and reach THE NEW GUEST.
4. Two players: A captured, B rescues A.
5. Two players: rescuer leaves during 5-second rescue; lock clears.
6. Four players: multiple players interact with the same puzzle at once; state remains consistent.
7. Four players: two players pick up same fuse simultaneously; only one team flag is awarded.
8. Player disconnects while holding a required item; team inventory persists.
9. All players captured; checkpoint restore returns playable state.
10. Player is captured during a protected puzzle; this must not happen.
11. THE GUEST hears a sound and investigates last-known position rather than wall tracking.
12. THE GUEST cannot navigate a door/stair; fail safely and record issue.
13. Wrong puzzle input; player can retry.
14. Checkpoint restore after each CP01–CP04.
15. Ending trigger volumes overlap; only one ending wins.
16. Repeated phone/CRT/lighting triggers do not spam or duplicate.
17. English subtitle and UI audit.
18. First-person flashlight and prop clipping audit.
19. Performance and memory validation in target UEFN version.

## 9. Definition of done for gameplay
- No mandatory progression depends on four players.
- No required item can be permanently lost.
- No capture can softlock the session.
- All puzzles are understandable, retryable and state-synchronised.
- Monster threat is fair and navigable.
- Three endings are distinct and deterministic.
- All six acts have working objectives and completion states.
- QA results are recorded, not assumed.


### THE_TRUTH ending branch — canonical execution
After IN-020 commits THE_TRUTH, the team enters the service control room. The four solved ROOM 13 photos appear on the rail in order; they are not inventory and no second puzzle is run. Play the night manager's 02:13 recorder text/subtitles, show THE GUEST at the far corridor, align owner/GUEST reflection, then enable IN-032. IN-032 commits NightAuditActivated once. Execute the room-by-room blackout, preserve neon at 02:13, print “NO VACANCY. NO OWNER. NO GUEST.” and show THE TRUTH title card. No car keys, ignition or chase are involved. If a cinematic/actor fails, use the service-control proxy and fallback title card without changing the committed ending.
