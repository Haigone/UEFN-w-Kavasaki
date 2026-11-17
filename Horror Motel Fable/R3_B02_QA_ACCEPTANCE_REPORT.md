# R3 BATCH 02 — QA AND ACCEPTANCE REPORT

Date: 2026-11-17. Build: UEFN 43.10, project MotelHorrorFable. Companion to [R3_BATCH_02_EXECUTION_REPORT.md](R3_BATCH_02_EXECUTION_REPORT.md) and [QA_ACCEPTANCE_MATRIX.md](QA_ACCEPTANCE_MATRIX.md).

Rule applied: an automated or editor-side check is reported as such. Anything that needs a human player or more than one client is **NOT RUN** and is not counted as passed.

## 1. Solo verification

| Check | Method | Result | Evidence |
|---|---|---|---|
| Critical path start → end | Scripted self-test (Verse drives every interaction in order) | PASS (scripted) | evidence/B02/B02_selftest_run10.log |
| Critical path by a human | Play-through | NOT RUN | — |
| Room traversal / collisions | Editor: door zones, wall penetration, overlaps, stair zone, room envelopes | PASS (editor-side) | Batch 02 report §5 |
| Room traversal by a human | Walk every room, corridor, balcony | NOT RUN | — |
| Stairs and balconies | Batch 01 line traces 24/24 + stair zone kept clear in B02 | PASS (editor-side); human NOT RUN | Batch 01 report |
| Doors and devices | 26/26 door zones clear; 63/63 buttons reachable by geometry; scripted doors open in self-test | PASS (editor-side + scripted) | §5, run 10 |
| Clue collection (evidence, documents) | Self-test T10, J01 (8 docs read by the script) | PASS (scripted) | run 10 |
| Journal and quest tracker | Self-test J01/J02; objective counter obj 1→8 | PASS (scripted); legibility NOT RUN | run 10 |
| Puzzles PZ-01…05 | Self-test T03–T13 including wrong-order recovery | PASS (scripted) | run 10 |
| Flashlight and batteries | Self-test F01–F08 | PASS (scripted); feel/brightness NOT RUN | run 10 |
| Capture and rescue | T17 capture, T18 solo recovery (16 s, expect ≈15 s) | PASS (scripted solo); rescue by a second player NOT RUN | run 10 |
| Checkpoints | cp 0→4 across the run | PASS (scripted) | run 10 |
| Ending THE TRUTH | T20/T21 + commit | PASS (scripted, run 10) | run 10 |
| Ending ESCAPE | Batch 01 run 7 | PASS (scripted, batch 01); not re-run after B02 audio/VFX hooks | Batch 01 evidence |
| Ending NEW GUEST | Batch 01 run 8 | PASS (scripted, batch 01); not re-run after B02 | Batch 01 evidence |
| Night Audit | T21 | PASS (scripted) | run 10 |
| Text legibility and clue visibility | Needs eyes in game | NOT RUN | — |
| Guest fairness / scare timing | Needs a human | NOT RUN | — |

## 2. Multiplayer verification

Only one client is available to the executor, so every row is **NOT RUN**: shared quest state, shared inventory, per-player flashlight, capture and rescue by a teammate, final vote with 2/4 players, disconnect and reconnect, join in progress, simultaneous events, softlock search. The code paths exist (session-authoritative flags, per-player `motel_player` records, vote resolver); they are untested with real players. A solo run is not evidence of multiplayer behaviour.

## 3. Technical verification

| Check | Result | Evidence |
|---|---|---|
| Actor count | Editor 655 actors (236 greybox, 169 room props, 51 dressing, 160 devices, 2 kept blockouts, 2 exterior, 16 backdrops, other world actors). Runtime: client 851, server 1403 (budget 10 000) | Profiler JSON |
| Useless collisions | Wall-mounted frames/clocks/lamps/phones with Collision=No in the schedule have collision disabled; unique collision meshes 64/2000 | Profiler JSON |
| Duplicate assets | 42 prop classes reused across 220 placements; no duplicate imports (nothing imported) | EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv |
| Memory | Client 2.99 GB / 7.68 GB; server 6.21 GB / 7.68 GB | Profiler JSON |
| Performance | Client frame 8.3 ms, GPU 2.1 ms, 266 draw calls — PASS. Server frame 33.4 ms in every sample (budget 16.7 ms) and UObjects 95 % — OPEN (PERF-B03-01) | Profiler JSON |
| Lighting | Lighting cues L01–L03 PASS (scripted); visual look NOT RUN | run 10 |
| Loading | Session upload and start completed; 2 benign "audio not loaded yet, retrying" client warnings | Batch 02 report §7 |
| Verse stability | Build 0 errors; run 10 0 runtime errors | run 10 |
| UEFN validation | PASS on the third push after replacing refused classes | evidence/B02_uefn_validation_and_asset_policy.md |
| Unused elements | 181 replaced blockouts removed (rebuildable from the CSV with `tools/uefn/place_furnishing.py`); 2 kept on purpose | Batch 02 report §3 |

## 4. Acceptance position

GATE F (assets/fit-out) moves from OPEN to PARTIAL: room and area fit-out done with first-party assets, final Guest character and part of the audio still blocked. GATE G (QA/release) stays OPEN: no human, multiplayer or target-platform evidence yet. Publication is not authorized.
