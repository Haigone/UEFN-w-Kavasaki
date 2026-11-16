# GAME BALANCING SPECIFICATION — THE MOTEL: ROOM 13

## Experience target
First-playthrough target 40–50 minutes. Nominal act targets total 50 minutes: 8 + 9 + 10 + 9 + 7 + 7. These are pacing targets, not countdowns. Do not punish exploration or reading.

| Act | Target | Pacing intent |
|---|---:|---|
| I — THE ARRIVAL | 8 min | Low pressure; establish dread |
| II — THE REGISTER | 9 min | Investigation; low/moderate threat |
| III — THE POWER | 10 min | First full chase; first-half threat peak |
| IV — THE SECOND FLOOR | 9 min | Mystery and spatial unease |
| V — ROOM 13 | 7 min | Revelation and readable puzzle |
| VI — NO VACANCY | 7 min | High tempo, clear navigation, branch |

## Existing interaction targets
| Parameter | Target | Status |
|---|---:|---|
| Context interaction range | 2 m | Design target |
| Flashlight battery duration | 180 s | Design target |
| Replacement batteries | 3–4 | Distribution target |
| Battery replacement | ~2 s | Design target |
| Low-battery flicker | below 15% | Design target |
| Rescue range | 2 m | Design target |
| Rescue duration | 5 s uninterrupted | Design target |
| Post-rescue protection | ~8 s | Design target |
| Emergency assistance threshold | 90 s | Assistance only; never automatic death |
| Solo self-recovery | Required | Hard design requirement |

These are not engine defaults and require playtesting.

## Adaptive tension
Team-level TensionLevel 0–100:
- 0–24 DORMANT
- 25–49 UNEASY
- 50–74 HUNTING
- 75–100 RELENTLESS

| Parameter | DORMANT | RELENTLESS |
|---|---:|---:|
| Patrol interval | 35 s | 18 s |
| Investigation duration | 12 s | 8 s |
| Hiding search duration | 5 s | 10 s |
| Post-chase recovery | 25 s | 12 s |

Inputs may include time without objective progress, captures, puzzle duration with grace/cap, detections/chases and team separation. Exploration alone never increases tension. Pause/clamp during protected puzzles and narrative beats. Reduce pressure after hard puzzles and completed chases. Smooth transitions and cooldowns. Solo must not be unfairly harder because fewer rescuers are available.

## Threat fairness
- First full chase follows power restoration in ACT III.
- ACT I silhouette and ROOM 03 reflection are scripted scares, not automatic capture.
- THE GUEST investigates last-known sound position, not continuous wall tracking.
- Chase only when target is reachable through verified navigation.
- Never capture during protected mandatory interactions.
- Do not block only required route; provide loop/alternate route.
- One unscripted capture transition at a time unless a separately tested sequence exists.
- All-captured state restores latest checkpoint.

## Playtest matrix
Test solo, duo and four-player separately. Record median and 90th percentile act times, puzzle retries, captures, rescue success, backtracking, separation, checkpoint reloads and ending choice.

| Scenario | Desired result |
|---|---|
| Solo, no optional lore | Complete; self-rescue never blocks progress |
| Solo, all core clues | No unfair pressure during reading |
| Duo, one capture | Rescue achievable; remaining player can progress |
| Four players, simultaneous puzzle | One authoritative completion |
| Slow exploration | Tension does not punish looking/reading |
| Repeated puzzle failure | Grace/cap prevents runaway pressure |
| Final chase | Route readable; one navigation error recoverable |

**PROPOSAL:** perform at least three full playtests per party size before tuning. Change one variable group at a time and record before/after values. No adjustment becomes canon without test data.

## Open balancing questions
Starting flashlight charge; per-player vs shared battery state; exact battery placements beyond Room 02; fuse locations/backtracking; free vs gated room exploration; final chase length; party-size scaling model.
