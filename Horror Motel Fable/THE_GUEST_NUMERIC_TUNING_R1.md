# THE GUEST — NUMERIC TUNING SHEET R1

**Status:** Proposed implementation defaults for first UEFN calibration. Not measured or playtest-validated.  
**Authority:** MONSTER_AI_BEHAVIOUR_SPEC.md defines state/logic; GAME_BALANCING_SPEC.md defines tension intent. This sheet supplies explicit starting numbers.  
**Units:** Unreal centimeters and seconds unless stated. Distances are horizontal radius unless specified.

## 1. Player movement reference

Treat these as relative tuning assumptions until actual player movement in the target island is measured:
- Walk reference: 300 cm/s.
- Sprint reference: 500 cm/s.
- Crouch reference: 180 cm/s.
- THE GUEST patrol: 260 cm/s.
- THE GUEST investigate: 300 cm/s.
- THE GUEST chase: 540 cm/s, short-burst target only; if the player can maintain sprint indefinitely, use LOS breaks, route loops and cooldown rather than increasing speed beyond 1.08× sprint.
- THE GUEST search movement: 240 cm/s.

Do not change player movement to make AI values appear correct. Re-measure actual movement and preserve the relative intent.

## 2. Perception defaults

| Parameter | Default | Allowed calibration range | Notes |
|---|---:|---:|---|
| Vision radius | 1800 cm | 1400–2200 | Horizontal, clear LOS required |
| Vision half-angle | 55° | 45–65° | Forward cone; no rear omniscience |
| Near-field awareness radius | 250 cm | 200–350 | Gives close-range detection without LOS only if the specific sensing rule allows |
| Hearing radius, walk | 900 cm | 700–1100 | Through open connected space; attenuate by doors/walls |
| Hearing radius, sprint | 1600 cm | 1300–1900 | Strong stimulus |
| Hearing radius, interaction/noise | 1200 cm | 900–1500 | Per authored noise event |
| Hearing radius, deliberate loud event | 2200 cm | 1800–2600 | Fuse breaker/major authored noise only |
| Perception sample interval | 0.25 s | 0.20–0.40 | Avoid per-frame scans |
| Target reevaluation | 1.0 s | 0.75–1.5 | Stable target selection |
| Lost-LOS grace | 2.0 s | 1.5–3.0 | Then Search at last known location |
| Suspicion decay delay | 3.0 s | 2–5 | After stimuli stop |
| Suspicion decay | 12 points/s | 8–16 | 0–100 scale |

Vision must be blocked by authored opaque geometry. Do not use a wall-penetrating player-location query as sight. Hearing reports a stimulus location and confidence, never a continuously updated player location.

## 3. State thresholds and timing

| Parameter | Default | Range |
|---|---:|---:|
| Suspicion threshold → INVESTIGATE | 35 | 30–45 |
| Suspicion threshold → CHASE | 75 | 65–85 |
| Suspicion gain from clear sight | +45/s | 35–55 |
| Suspicion gain from sprint noise | +18 | 12–24 |
| Suspicion gain from interaction noise | +12 | 8–16 |
| Suspicion gain from loud breaker event | +35 | 25–45 |
| Investigate duration | 12 s | 8–16 |
| Search duration, low tension | 5 s | 4–7 |
| Search duration, high tension | 10 s | 8–12 |
| Patrol pause at waypoint | 2.5 s | 1.5–4 |
| Chase minimum commitment | 3 s | 2–4 |
| Chase maximum without reacquisition | 12 s | 9–15 |
| Reacquire cooldown after lost target | 4 s | 3–6 |
| Post-chase recovery | 18 s | 12–25 |
| Capture approach radius | 140 cm | 110–170 |
| Capture hold/confirm | 0.6 s | 0.4–0.9 |
| Capture animation budget | 2.5 s | 2–3.5 |

Use suspicion clamp 0–100. Clear sight may trigger chase immediately only if the target is reachable and no fairness protection is active. Otherwise transition to Investigate and re-evaluate.

## 4. Tension bands

Use team TensionLevel 0–100 and existing bands:
- 0–24 DORMANT
- 25–49 UNEASY
- 50–74 HUNTING
- 75–100 RELENTLESS

Apply multipliers only to patrol interval, investigate/search duration and recovery, not omniscient perception or capture speed.

| Parameter | DORMANT | UNEASY | HUNTING | RELENTLESS |
|---|---:|---:|---:|---:|
| Patrol interval | 35 s | 29 s | 23 s | 18 s |
| Investigate duration | 14 s | 12 s | 10 s | 8 s |
| Search duration | 5 s | 7 s | 9 s | 10 s |
| Post-chase recovery | 25 s | 21 s | 16 s | 12 s |
| Hearing multiplier | 0.85 | 0.95 | 1.0 | 1.05 |
| Vision multiplier | 0.90 | 0.95 | 1.0 | 1.0 |

Tension must not increase merely because players explore, read, stay in a room or spend time in optional lore. Objective inactivity may contribute only after a 90-second grace and with a maximum +1 point per 30 seconds, capped at +8 per act. A capture adds +8; successful rescue subtracts 5; a completed mandatory puzzle subtracts 3; a chase ending without capture subtracts 4. Clamp changes and smooth over 5 seconds. During protected narrative/puzzle windows, freeze tension gain.

## 5. Target selection and co-op fairness

1. Prefer currently visible/reachable target with highest suspicion.
2. If multiple candidates are equivalent, prefer the target who caused the strongest recent stimulus.
3. If still tied, choose least recently targeted player.
4. Do not retarget more often than once per 5 seconds unless current target is captured, disconnected or unreachable.
5. Do not target an already captured player.
6. Solo self-recovery must remain possible; AI cannot camp a mandatory self-recovery interaction.
7. If more than one player is in a mandatory puzzle, AI may pressure non-operators but may not invalidate the only route or attack during the operator's atomic commit window.
8. If a target is unreachable for 2 seconds, abandon chase and investigate the last reachable point. Never teleport THE GUEST through walls or closed doors.

## 6. Navigation and fallback

- Require a valid navigation destination before entering Chase.
- If path request fails, attempt one alternate waypoint/route query; if that fails, transition to Search at the last valid point.
- If stuck (movement progress < 50 cm over 2 seconds), request path refresh once; if still stuck after another 2 seconds, abandon chase.
- Never teleport during player-visible gameplay. Off-camera recovery may reposition to a designated patrol node only if distance > 2500 cm, no player has LOS, and no chase is active.
- Keep authored doors/thresholds traversable for the configured NPC agent. Test stairs, narrow corridors, room thresholds and service route independently.
- If the chosen NPC/navigation API cannot satisfy this, use an explicitly authored patrol/investigation waypoint system and document its limitations. Do not pretend full navmesh support exists.

## 7. Capture and protected states

Capture occurs only after valid target, reachable path, capture radius and confirmation duration. On capture, hand off to CAPTURE_AND_RESCUE_SPEC.md. The AI does not own inventory loss, checkpoint restore or rescue completion.

Protected windows:
- puzzle transaction: from lock acquisition through authoritative commit, maximum 2 seconds;
- evidence read: no protection while reading journal; only initial world interaction may have 0.5-second input protection;
- reveal cinematic: presentation policy in CINEMATIC_AND_PRESENTATION_SPEC.md;
- ending resolver/ending commit: AI threat disabled.

If protection lasts longer than its budget due to a failed actor, cancel the interaction and restore the previous state; do not hold AI disabled indefinitely.

## 8. First calibration protocol

Run solo, duo and four-player tests in the same authored route. Record:
- sight-to-chase latency;
- hearing stimulus-to-investigation latency;
- median chase duration;
- percentage of chases ending in capture;
- path failures/stuck incidents;
- captures during protected windows (must be zero);
- time spent in each tension band;
- rescue completion rate;
- perceived unfairness notes.

Minimum initial sample: 3 complete runs per party size and at least 20 chase events total. Change one parameter family per iteration. Keep a dated table of old/new value, observed evidence and decision. Do not label any value FINAL until the target UEFN build has been playtested.

## 9. Acceptance gates

- AI-NT-01: vision requires LOS.
- AI-NT-02: rear cone does not detect at long range.
- AI-NT-03: sprint noise investigates last known stimulus, not player tracking.
- AI-NT-04: lost LOS transitions to Search after grace.
- AI-NT-05: chase aborts on unreachable route.
- AI-NT-06: no capture during puzzle commit/reveal/ending protection.
- AI-NT-07: target selection does not oscillate between players.
- AI-NT-08: solo self-recovery remains achievable.
- AI-NT-09: tension does not rise from reading/exploration alone.
- AI-NT-10: all values are adjustable without changing state-machine logic.
