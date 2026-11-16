# MONSTER AI & BEHAVIOUR SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **DESIGN BASELINE — UEFN/NPC CAPABILITIES MUST BE VERIFIED**
Owner: AI / Gameplay Design
Implementation operator: Claude (UEFN/Verse)
Approver: Project Owner

## 1. Purpose and hard constraints

Define THE GUEST as a fair, readable, persistent-feeling antagonist for solo and 1–4 player sessions. This is a behaviour contract, not a claim that a specific NPC API, navigation feature, animation, perception component or capture workflow exists in the target UEFN release.

Non-negotiable:
- THE GUEST is one antagonist identity: the motel owner and THE GUEST are the same person/manifestation.
- No omniscient tracking, wall vision, teleporting into view, or target-position updates while the player is unseen.
- The AI may only pursue a target through a verified navigable route.
- Scripted scares and systemic AI are separate systems; a scripted silhouette must not accidentally initiate capture.
- Capture is recoverable and never selects an ending.
- Solo progression cannot require a second player.
- Mandatory interactions and critical cinematics have explicit protection windows.
- If the required AI behaviour cannot be implemented with supported UEFN capabilities, report the exact unsupported behaviour and present a UEFN-compatible fallback for owner decision. Do not silently substitute another creature/system.

## 2. Authority and inputs

Monster Controller owns only antagonist state and target intent. It does not own player progression, inventory, puzzle completion, checkpoints or endings.

Read-only inputs:
- ConnectedPlayers and each player's PlayerState.
- CurrentAct, protected narrative/puzzle lock and capture eligibility.
- Verified player transforms/visibility where supported.
- Authored noise stimuli: source position, event class, timestamp/sequence and optional instigator.
- Authored patrol/investigation points and valid navigation regions.
- Team TensionValue (0–100) and current TensionBand.
- Chase cooldown, last seen position, last heard position and recent target history.

Outputs:
- MonsterState and state-entry timestamp.
- Current target (if any), target last-known position and investigation destination.
- Scripted cue requests, threat cue requests and capture request.
- Navigation success/failure diagnostics.
- AI debug record for QA (not player-facing).

GameManager remains authoritative for objective and act progression. PlayerManager alone commits CAPTURED/RESCUED transitions. Monster requests a capture; it cannot directly mutate player state.

## 3. Canonical state machine

States: DORMANT, PATROL, OBSERVE, INVESTIGATE, CHASE, CAPTURE, SEARCH, RETREAT.

| State | Purpose | Entry | Exit |
|---|---|---|---|
| DORMANT | No systemic hunt; scripted presence only | Session/act gate says AI inactive | Authored activation event |
| PATROL | Move between valid patrol points | Activation or retreat completion | Stimulus or visible target |
| OBSERVE | Briefly inspect a target/suspicious location | Valid sight or strong stimulus | Confirmed detection → CHASE; uncertainty → INVESTIGATE/PATROL |
| INVESTIGATE | Move to last-known sound/visual position | Noise, lost sight or anomaly | Arrive → SEARCH; reacquire visible target → CHASE; timeout → PATROL |
| CHASE | Pursue one valid, reachable target | Detection confirmed and chase allowed | Capture request, target lost → SEARCH, route invalid → INVESTIGATE/RETREAT |
| CAPTURE | Execute one capture transaction | PlayerManager accepts capture request | Immediately return to SEARCH/RETREAT after commit/failure |
| SEARCH | Search last-known area/hiding candidates | Target lost or investigation arrival | Reacquire → CHASE; search timeout → RETREAT/PATROL |
| RETREAT | Disengage and recover pressure/cooldown | Chase ends, path fails, protection or scripted reset | Cooldown complete → PATROL/DORMANT |

No transition may be caused by elapsed time alone if it bypasses a required player-facing cue or capture guard.

### 3.1 Transition priority
Evaluate in this order:
1. Session shutdown, cinematic hard lock or AI disabled → DORMANT/hold.
2. Active capture transaction → CAPTURE until transaction resolves.
3. Valid visible target with chase eligibility and valid path → CHASE.
4. Valid high-priority noise stimulus → INVESTIGATE.
5. Lost target with known position → SEARCH.
6. Cooldown/recovery active → RETREAT.
7. Otherwise PATROL or DORMANT according to act activation.

Do not switch targets every update. A current chase target remains selected until captured, disconnected, protected, no longer eligible or lost beyond the authored search/reacquisition rule.

## 4. Perception contract

### 4.1 Sight
- Vision is line-of-sight based. Solid walls, closed opaque doors and floor slabs block sight.
- Use an authored forward-facing perception cone; never treat a player behind THE GUEST as automatically visible.
- Detection requires a short confirmation window, not a single transient sample.
- Crouch, distance, lighting and movement may modify detection only if the chosen UEFN implementation can measure them reliably. Otherwise omit the modifier rather than simulate false precision.
- After sight is lost, store the last visible player position and timestamp. Never continue tracking the live transform while occluded.
- A player entering a protected puzzle/cinematic state becomes ineligible immediately; the AI must disengage or select another valid target.

### 4.2 Hearing / noise
Use authored event stimuli rather than continuous omniscient player polling. Every stimulus has:
- NoiseEventId (unique authored ID)
- NoiseClass: LOW / MEDIUM / HIGH / SCRIPTED
- WorldPosition
- Instigator (optional)
- CreatedAt / sequence
- Maximum investigation age
- Consumed/handled state

Suggested event classes:
- LOW: ordinary movement at close range, quiet prop contact.
- MEDIUM: sprinting, dropped/handled object, door slam.
- HIGH: fuse breaker activation, loud mechanism, major scripted impact.
- SCRIPTED: authored scare cue with a fixed destination and no automatic capture authority.

Hearing selects a position, not a live player. Multiple stimuli are ranked by class, recency and distance using verified available data; ties resolve deterministically by recency then stable event ID. Ignore stale stimuli and events generated during a protected cinematic.

### 4.3 Detection and alert cues
Before an unscripted chase, provide a readable escalation:
1. Environmental tell (sound/light/footstep cue).
2. OBSERVE or investigate posture/animation where supported.
3. Threat cue visible/audible to the target.
4. CHASE begins only after confirmation and valid navigation.

Do not reveal exact AI coordinates through HUD or through-wall markers.

## 5. Target selection and co-op fairness

Eligible targets are connected players in ACTIVE or THREATENED, not protected, not SAFE, and reachable by a verified route.

Target priority:
1. Retain current valid chase target.
2. Otherwise choose the valid visible target with strongest confirmed detection.
3. Otherwise investigate the highest-ranked unexpired noise stimulus.
4. If multiple equally valid players remain, use deterministic rotation from stable PlayerId order so one player is not repeatedly selected by incidental iteration order.

Fairness:
- One systemic capture transaction at a time.
- Avoid switching to a new target solely because another player is marginally closer.
- Do not target a player inside a protected mandatory interaction or spawn/recovery grace.
- If all connected players are ineligible, disengage to RETREAT.
- Do not intentionally camp the only mandatory objective, recovery proxy or sole exit.
- Do not force simultaneous capture of multiple players.
- Solo tuning must reduce pressure and preserve a self-rescue route; it must not be a harder version of co-op.

## 6. Navigation and route contract

Every AI destination must be validated as reachable before CHASE/INVESTIGATE begins. Navigation targets are authored point IDs or a verified player last-known position.

Required route tests:
- Exterior approach and parking.
- Reception and all ground corridors.
- Each ground room threshold used by the AI.
- Stair lower approach, both flights, landing and upper approach.
- Continuous upper balcony.
- Room 12 panel approach and secret passage only if the NPC is intended and verified to enter it.
- ROOM 13 and service route only if those spaces are explicitly included in the AI route plan.
- Doorway widths, thresholds, guardrails, slab edges and all turns.

Failure handling:
- If a path query fails, do not teleport. Repath once using a nearby authored waypoint; if still invalid, abandon the chase and enter INVESTIGATE/RETREAT.
- If the NPC becomes stuck or fails to make measurable progress for the stuck timeout, stop movement, try one safe recovery waypoint, then retreat. Record the failure.
- Never place recovery points through walls or outside walkable geometry.
- If the target is on a floor the NPC cannot reach, the AI may investigate the nearest valid stair/connector waypoint but cannot pretend to pursue upstairs.
- The Guest's ability to use stairs, doors, the secret passage and upper floor is a hard feasibility gate, not an assumed capability.

## 7. Capture handoff

Monster Controller may issue CaptureRequest(PlayerId, encounterId) only when:
- State is CHASE/CAPTURE.
- Target is connected and ACTIVE/THREATENED.
- Target is within verified capture distance and unobstructed.
- Target is not protected by spawn grace, rescue protection, puzzle lock, cinematic lock or SAFE.
- No other capture transaction is active.
- Capture cooldown and chase fairness rules permit it.

PlayerManager validates again and atomically commits CAPTURED. The AI waits for the response:
- ACCEPTED: play supported capture beat, then SEARCH/RETREAT.
- REJECTED_PROTECTED: disengage; do not retry immediately.
- REJECTED_INVALID: clear target and SEARCH.
- TECHNICAL_FAILURE: retreat and log; never leave player immobilised.

Capture is never a death state, never removes quest items and never changes ending eligibility.

## 8. Hiding and search

- Hiding is authored per hiding-spot ID with explicit enter/exit state and verified player collision.
- The AI does not know a player is in a hiding spot unless it has a valid detection/investigation reason.
- Search candidates are limited to reachable authored hiding points in the last-known area.
- Search uses bounded duration and does not inspect every hiding spot instantly.
- If no valid candidate exists, finish SEARCH and retreat.
- Player exit from hiding may generate a noise stimulus only if the action is authored to do so.
- Never let the AI block the only exit from a mandatory puzzle room.

## 9. Tension integration

Tension bands are shared design targets:
- 0–24 DORMANT
- 25–49 UNEASY
- 50–74 HUNTING
- 75–100 RELENTLESS

Tension changes parameters gradually; it does not grant new perception powers or remove fairness constraints. It may adjust patrol cadence, investigation/search duration, cue intensity and cooldown within approved min/max values. It may not:
- enable wall tracking;
- bypass line of sight;
- bypass protected interactions;
- teleport or shorten navigation;
- increase simultaneous capture count;
- remove solo self-recovery.

Exploration and reading alone do not raise tension. Pause or clamp during mandatory stationary puzzles and narrative sequences.

## 10. Initial tuning table — PROPOSED, PLAYTEST REQUIRED

| Parameter | DORMANT | UNEASY | HUNTING | RELENTLESS |
|---|---:|---:|---:|---:|
| Patrol waypoint dwell (s) | 35 | 28 | 22 | 18 |
| Sight confirmation (s) | 1.5 | 1.25 | 1.0 | 0.8 |
| Investigate arrival timeout (s) | 12 | 11 | 9 | 8 |
| Search duration (s) | 5 | 7 | 8 | 10 |
| Post-chase retreat (s) | 25 | 20 | 16 | 12 |
| Reacquire grace after LOS loss (s) | 1.0 | 1.0 | 0.8 | 0.8 |
| Target max captures per encounter | 1 | 1 | 1 | 1 |

Additional proposed perception targets (must be tuned in editor): forward cone 80 degrees; reliable detection range 18 m in clear conditions; strong noise investigation radius 24 m; medium 14 m; low 7 m. These are authored tuning hypotheses, not UEFN engine capabilities or verified measurements.

## 11. Act activation and scripted appearances

- ACT I: systemic AI remains DORMANT. Balcony silhouette and reception phone are authored presentation events only.
- ACT II: limited OBSERVE/INVESTIGATE moments may be enabled after the owner office sequence; no full chase unless separately approved.
- ACT III: first full systemic chase begins only after PowerRestored and an authored high-noise stimulus. Provide route and warning cue.
- ACT IV: patrol/investigation on upper floor only after actual stair and NPC navigation are proven.
- ACT V: ROOM 13 reveal uses a controlled cinematic/pose. AI capture is disabled during the reveal and photo puzzle.
- ACT VI: final chase may activate after service route/gate objective is ready. Route must have a loop/alternate path and a safe ending transition.

Scripted scare events have unique IDs, one-shot/session flags and explicit start/end cleanup. They must not also emit accidental systemic noise unless authored.

## 12. Failure recovery and diagnostics

Every state transition logs: timestamp/sequence, previous state, next state, reason/event ID, target PlayerId (if any), destination ID, nav result, tension band and capture response.

Recover safely from:
- Target disconnects.
- AI target becomes protected.
- All players become ineligible/captured.
- Navigation fails or NPC gets stuck.
- NPC actor/spawner fails.
- Cinematic starts during investigation/chase.
- Checkpoint restore/reset occurs.
- Duplicate noise/capture event arrives.

Fallback order:
1. Clear transient target/locks.
2. Stop chase and disable capture requests.
3. Return to a verified safe patrol/retreat point if supported.
4. If NPC control cannot recover, disable systemic AI for the current encounter and preserve player progression. Do not softlock the session.
5. Log a technical defect for the unsupported/failing behaviour.

## 13. Required acceptance tests

| ID | Scenario | Expected |
|---|---|---|
| AI-001 | ACT I scripted silhouette | No systemic chase/capture |
| AI-002 | Wall blocks sight | No detection through wall |
| AI-003 | Target crosses LOS then hides | AI moves to last-known position, not live hidden position |
| AI-004 | High noise event | Investigates authored source position |
| AI-005 | Stale noise | Ignored after expiry |
| AI-006 | Two simultaneous noise events | Deterministic priority; no target thrashing |
| AI-007 | Two visible players | Stable target selection; one capture max |
| AI-008 | Target disconnects | Target cleared; no stuck AI |
| AI-009 | Player enters protected puzzle | Capture denied; AI disengages |
| AI-010 | All players captured/ineligible | No further capture; recovery proceeds |
| AI-011 | NPC cannot path to target | No teleport; repath then retreat |
| AI-012 | Stair traversal | Continuous ascent/descent without stuck/fall |
| AI-013 | Upper balcony route | Valid path and collision clearance |
| AI-014 | Secret route | Only enabled if verified navigable; otherwise excluded |
| AI-015 | Hiding spot search | Bounded, plausible search; no omniscience |
| AI-016 | Tension changes | Parameters interpolate; fairness invariants unchanged |
| AI-017 | Solo chase/capture | Self-rescue and objective progression remain possible |
| AI-018 | Two/four-player capture | Only one valid capture transaction at a time |
| AI-019 | Cinematic begins during chase | AI/capture safely paused and restored |
| AI-020 | NPC/spawner failure | AI safely disables; session remains completable |

## 14. Dependencies and authority

Depends on: PLAYER_STATE_MACHINE.md, CAPTURE_AND_RESCUE_SPEC.md, GAME_BALANCING_SPEC.md, NAVIGATION_AND_PLAYER_FLOW.md, LD-GEO R2.3 and verified NPC feasibility in target UEFN.

If a conflict exists:
1. Owner-approved design decisions and R2.3 geometry approval record.
2. This behaviour specification for AI-specific rules.
3. Player/capture state and gameplay system contracts.
4. UEFN capability evidence from the target editor.
5. Tuning values marked PROPOSED remain adjustable only through recorded change control.

No AI acceptance test is PASS until executed in the actual target UEFN build with reproducible evidence.


## 11. R3 spawn and patrol anchor implementation

The exact proposed waypoint and spawn coordinates are in AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv. This schedule is subordinate to R2.3 geometry; it never creates access through sealed areas.

### Spawn contract

- One THE GUEST NPC only.
- Spawn point: AI-SPAWN-01 at X=42.50, Y=55.50, Z=0.00 in OWNER-OFFICE.
- Spawn condition: PowerRestored=true and CurrentAct >= ACT III.
- No NPC spawn at game start; no timer-based spawning; no infinite respawn; total spawn limit 1 per session.
- Proposed NPC Spawner options: Spawn Count=1; Spawn Character at Game Start=False; Spawn Through Walls=False; Allow Infinite Spawn=False; Total Spawn Limit=1; Spawn On Timer=False. Confirm the exact fields/options in the target editor because NPC Spawner is Beta.
- Assign one Custom NPC Character Definition using the imported THE GUEST mesh, and attach the custom Verse behavior. DEV_GUEST_AI is the behavior component for DEV_NPC_GUEST, not a second NPC Spawner.
- If the spawn actor is missing, recovery is allowed only at the same authored point after the spawn condition is true; never create a second live Guest.

### Patrol groups

Use the route groups and points in AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv:
- GF_WEST: four waypoints in the west ground-floor corridor.
- GF_EAST: four waypoints in the east ground-floor corridor.
- GF_CORE: reception, storage, electrical and Service Control Bay; the Service Control Bay waypoint is disabled during ending selection/finale.
- STAIR: lower approach, U-turn landing and upper exit. This is the only authorized floor transition route.
- UF_WEST / UF_NORTH / UF_EAST: upper balcony patrol waypoints.
- UF_SECRET: VEST-13 waypoint only after the ROOM 12 secret panel is opened.
- REVEAL: ROOM 13 reveal mark is scripted-only, not a patrol waypoint and has no capture authority.

Waypoint coordinates are destinations, not teleport points. Use NavigateTo and inspect navigation_result. If a point is unreachable, mark it unavailable for that run, use the next valid point in the same group, and emit a QA diagnostic. Never teleport a visible NPC.

### Navigation clearance and sealed zones

- Test NPC capsule radius 0.45 m / height 2.60 m against corridor, door and stair clearances. These are target dimensions, not proof of the actual NPC capsule.
- Stair waypoint Z values are 0.10, 1.80 and 3.60 m, matching the approved stair rise/landing design. Validate each step/landing with the actual NPC.
- U-SERVICE, sealed reserves, roof and courtyard slab void are never waypoint destinations. Do not enable navmesh in those areas.
- VEST-13 is unavailable until IN-015 commits SecretPanelOpened/Room13Unlocked.
- GF-SERVICE-BAY is not an AI camping zone; disable AI and clear the bay when the ending resolver opens.

### Route proof sequence

1. Spawn one Guest at AI-SPAWN-01 after PowerRestored.
2. Navigate each GF_WEST and GF_EAST point in order.
3. Navigate from GF_CORE to each ground corridor and back without clipping doors.
4. Navigate the full stair sequence bottom → landing → upper exit and reverse; no teleport or stuck state.
5. Navigate all upper balcony points; verify guardrails and turns.
6. Open ROOM 12 panel, then test VEST-13 route; before panel open it must be unavailable.
7. Verify no path request enters U-SERVICE, sealed reserves or courtyard void.
8. Run solo, duo and four-player chase/reacquisition tests; record path failures and time-to-destination.
9. If stair traversal fails after one path refresh, abort chase to last valid point and switch to Search/Retreat as specified. Do not increase speed or teleport to mask the failure.



### Door traversal contract

- Do not assume THE GUEST can automatically open a Fortnite door device or interact with a locked door.
- A waypoint is reachable only if the complete route's door states permit traversal. The door controller may request an authored open action only for doors marked NPC_PASSABLE in the door binding configuration.
- Puzzle/secret locks are never bypassed: D-G16 requires ServiceKeyObtained; ROOM 12 secret panel/vestibule route requires Room13Unlocked/SecretPanelOpened; any other authored locked door remains closed until its owning manager commits its unlock.
- If a door is closed but NPC_PASSABLE, request its normal open animation/collision state through the owning door manager, wait for the open confirmation, then NavigateTo. Never disable collision through the wall or teleport across the door.
- If the door cannot be opened or confirmed within 2 seconds, mark that route edge unavailable, enter Search/Retreat fallback and log the door ID. Do not loop forever.
- On ending selector open, AI must stop pursuit, leave GF-SERVICE-BAY and enter the authored retreat/disabled state; on ending commit, AI is disabled session-wide.

### Waypoint order

Within each Route_Group in AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv, row order is the canonical traversal order. On reaching the final point, loop to the first valid point in that group. Select the next group using the weighted group selection in the AI behavior spec. STAIR group must always traverse AI-STAIR-LOWER → AI-STAIR-MID → AI-STAIR-UPPER (and reverse when returning); never issue a direct floor-to-floor teleport or skip the intermediate landing.
