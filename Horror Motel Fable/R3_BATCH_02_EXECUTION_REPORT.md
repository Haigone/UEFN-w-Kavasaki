# R3 BATCH 02 EXECUTION REPORT

Project: THE MOTEL: ROOM 13
Batch: R3-B02 (GATE F fit-out, THE GUEST interim body, audio/VFX gaps, runtime regression, performance sample)
Date: 2026-11-17
Branch: r3-batch-01 (continues PR #2)
Executor: Claude (autonomous, per CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md)
Native project: MotelHorrorFable (1b9a97d9-c7de-416c-b046-aeb97e125690), UEFN 6.0.0-60458657 (Release-43.10), Lore revision control
Previous batch: [R3_BATCH_01_EXECUTION_REPORT.md](R3_BATCH_01_EXECUTION_REPORT.md)

Status vocabulary: **COMPLETED** (done, with evidence), **PARTIAL** (done in part; the rest is listed), **BLOCKED** (cannot be done with the tools available; fallback used), **NOT RUN** (test not executed — never counted as a pass).

## 1. Summary

| Area | Result |
|---|---|
| Starting state | Branch clean and in sync with origin; editor project matched the batch 01 report (589 actors: 236 greybox, 183 furnishing blockouts, 133 devices). Repository validator: 0 errors |
| Room fit-out (183 schedule rows) | **COMPLETED** — 169 first-party Epic props replace 181 blockouts (13 headboards merged into their bed). 2 rows intentionally kept as blockouts (battery marker, secret wall panel) |
| Non-room areas | **COMPLETED (first pass)** — new [area_dressing_schedule_R1.csv](area_dressing_schedule_R1.csv), 51 props: reception, owner office, storage, electrical room, service bay, west lobby, courtyard, parking/exterior |
| Clearance checks | **COMPLETED (editor-side)** — 26/26 doors keep a 1.2 m clear zone, 63/63 buttons reachable from a free stand point, 0 props in walls, 0 overlaps, stair reservation and approaches clear, THE GUEST waypoint route clear of furniture |
| Island validation | **COMPLETED** — the first two pushes were refused (asset reference policy, 9 then 1 prop classes); replaced; the third push validated and the session started |
| THE GUEST | **PARTIAL** — visible proxy rebuilt as a 2.60 m pale, elongated humanoid from the first-party Creative mannequin mesh with an original material. Final custom mesh/rig/animations **BLOCKED** (R3-BLK-001); full production brief written in [GUEST_PRODUCTION_PACKAGE_R3.md](GUEST_PRODUCTION_PACKAGE_R3.md) |
| NPC navigation | **BLOCKED** (re-verified) — R3-BLK-010 unchanged; waypoint fallback kept |
| Audio | **PARTIAL** — 10 new audio players (rain, fluorescent hum, CRT, generator, breaker, Guest footsteps that follow THE GUEST, Room 13 whispers, document open, keypad, door creak). Phone ring, voice, desk bell, player/cloth foley still have no allowed source |
| VFX / post-process | **COMPLETED (first pass)** — 12 VFX spawners (rain ×4, ground fog ×2, flies, dust ×2, lightning, reveal ghosts, Guest appearance burst) and 5 post-process devices (base vignette, capture red, reveal, THE TRUTH VHS, NEW GUEST desolation) |
| Verse | Compiles, 0 errors (13 deprecation warnings, all in the disabled NPC proof). 148/148 editor bindings |
| Runtime regression | **COMPLETED (scripted solo)** — self-test run 10: every step PASS through THE TRUTH ending, 0 Verse runtime errors |
| Performance sample | **PARTIAL** — client within every budget; local server frame time and UObject count flagged (see §8) |
| Human play-through, 2P/4P, disconnect/rejoin | **NOT RUN** — no human player or second client available to the executor |
| Publication | **NOT AUTHORIZED** — not attempted |

## 2. Pre-change verification (brief items 1–7)

1. Git: branch `r3-batch-01`, HEAD `b3a1593`, working tree clean, nothing new on origin.
2. Native project opened via the UEFN MCP (toolset names changed in this editor build: `editor_toolset.toolsets.python_scripting.PythonScriptingTools` etc.).
3. Level audit: 589 actors — R3_GREYBOX 236, R3_FURNISH 183, R3_DEVICE 133, R3_EXT 2 (sign, car). Materials, Verse device, 30 practical + 10 register lights and 16 audio players present as reported.
4–5. Compared with the batch 01 report: no difference between declared and actual state.
6. `tools/validate_r3_repository.py`: 0 errors.
7. Open tasks: GATE F fit-out, THE GUEST, audio/VFX gaps, human/MP tests, performance/validation (taken in this batch where possible).

## 3. Tasks

| ID | Description | Status | Dependencies | Files / actors changed | Evidence | Tests | Blocks | Next |
|---|---|---|---|---|---|---|---|---|
| B02-01 | Measure candidate Epic props (bounds, pivot, facing) | COMPLETED | — | `tools/uefn/probe_props.py`, `tools/uefn/prop_probe_bounds.json` | Probe JSON; renders show prop front = local +Y | — | — | B02-02 |
| B02-02 | Replace the 183 furnishing blockouts with first-party props | COMPLETED | B02-01 | 169 actors tagged `R3_PROPS` (folders `R3/Props/ROOM_xx`); 181 `R3_FURNISH` boxes removed; `tools/uefn/place_props.py` | `evidence/B02/B02_room01_*.png`, `B02_room04_topdown.png` | Door, reach, wall, overlap checks (B02-05) | — | B02-05 |
| B02-03 | Fix schedule defects found during fit-out | COMPLETED | B02-02 | `room_furnishing_schedule.csv` (28 rows), `INTERACTION_ANCHOR_SCHEDULE_R1.csv` (IA-013, IA-030, IA-031), `tools/uefn/place_devices.py`; devices `BTN IN-013`, `BTN IN-030`, `BTN IN-031` moved | R3-DEC-018…020 below | Re-ran all checks | — | — |
| B02-04 | Dress reception, office, storage, electrical, service bay, lobby, exterior | COMPLETED (first pass) | B02-02 | `area_dressing_schedule_R1.csv` (51 rows), 51 actors tagged `R3_DRESSING` | `evidence/B02/B02_reception_topdown.png`, `B02_storage_service_electrical_topdown.png` | B02-05 checks | — | Human legibility pass |
| B02-05 | Editor-side clearance checks | COMPLETED | B02-02, B02-04 | `tools/uefn/check_props.py` | Results in §5 | 4 checks + route check | Human walk-through still NOT RUN | QA-B03-01 |
| B02-06 | THE GUEST interim body | PARTIAL | — | `BP_R3_Guest` mesh → `CP_Device_Mannequin_01`, scale 0.75 × 0.8 × 1.57 (260 × 90 × 26 cm), material `R3/Materials/M_R3_GuestSkin` (new, Nanite flag set); Verse offsets (pivot at feet, yaw +90°) | `evidence/B02/B02_guest_vs_180cm_front.png`, `_side.png`; self-test T17 Guest Z = 386 (floor datum) | Self-test run 10 | R3-BLK-001 (final mesh/rig/anims) | External production per GUEST_PRODUCTION_PACKAGE_R3.md |
| B02-07 | Re-check NPC navigation options in this build | BLOCKED | — | none | Nav Modifier / AI Patrol Path devices exist, but the level's `NullNavSysConfig` disables navigation; island setting `bNavMeshVisualizationEnabled` is inactive | — | R3-BLK-010 | Batch 03 proposal R3-PROP-001 |
| B02-08 | Audio gaps (AUDIO_REGISTER / CUE_SHEET) | PARTIAL | — | 10 audio players (`AUD SFX_RAIN loop`, `AUD SFX_FLUORESCENT reception`, `AUD SFX_CRT room01`, `AUD SFX_GENERATOR`, `AUD SFX_BREAKER lever`, `AUD SFX_GUEST_FOOTSTEPS`, `AUD ROOM13 whispers`, `AUD page turn`, `AUD keypad press`, `AUD door open`); `tools/uefn/audio_map.py`; Verse hooks | §6 | Verse build; self-test run 10 | Phone ring, VO, desk bell, player/cloth foley: no allowed source (R3-BLK-002) | — |
| B02-09 | VFX and post-process (lighting cue/cinematic gaps) | COMPLETED (first pass) | — | 12 `VFX …` and 5 `PP …` devices; `tools/uefn/vfx_map.py`; Verse hooks | §6 | Verse build; self-test run 10 (reveal, capture, THE TRUTH paths) | Visual tuning needs a human | Human look pass |
| B02-10 | Island validation / session push | COMPLETED | B02-02, B02-04 | 9 + 1 prop classes swapped (R3-DEC-023) | `evidence/B02_uefn_validation_and_asset_policy.md` | 3 pushes: 2 refused, 3rd validated | — | — |
| B02-11 | Runtime regression | COMPLETED (scripted solo) | B02-10 | none (SelfTest set back to false) | `evidence/B02/B02_selftest_run10.log` | Self-test run 10 | Human + MP NOT RUN | QA-B03-01…03 |
| B02-12 | Performance sample | PARTIAL | B02-10 | none | `evidence/B02/B02_spatial_profiler_stats.json` | Spatial Profiler, 1 client + local server | Server frame time / UObject warning to investigate | PERF-B03-01 |
| B02-13 | Asset/rights registration | COMPLETED | B02-02…09 | New [EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv](EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv) (72 rows); 45 rows of `ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv` marked SUBSTITUTED | Validator 0 errors | — | 54 rows of the R1 register still need a source (mostly the custom Guest, VO, UI icons) | — |

## 4. Decisions

| ID | Decision | Rationale |
|---|---|---|
| R3-DEC-018 | Child bed F11 moved from (68.4, 32.0) to (69.7, 31.6) | The scheduled bed overlapped the main bed and took 0.18 m of the D-U11 door zone. Furniture only |
| R3-DEC-019 | CRT, phone and diary rows corrected; dumpster moved outside the east wing (77.8, 22) | 13 CRT rows hung 0.48 m off the desk into the chair and 10 cm into the desktop: CRT now on the desk (X−0.25, Y = desk, Z = desk top); phone at X+0.35; Room 09 diary was floating in the doorway, now on the Room 09 desk (15.94, 40.22, top 0.75). `exterior_prop_schedule.csv` put the dumpster inside ROOM 04. Linked buttons IN-013/030/031 moved with their props |
| R3-DEC-020 | `Yaw_deg` in the furnishing schedule is the facing direction (0 = north, 90 = east); engine yaw = `Yaw_deg − 90` for props facing local +Y | Fits every wall-backed item (bed, desk, chair-to-desk, wardrobe). The batch 01 blockout formula only produced correct footprints for 0/90/180/270; affected blockouts were replaced. Audio: an Audio Player may point at a sound asset through its `audio` property; the project's asset reference policy allows only `/Game/Sounds/Creative/…` |
| R3-DEC-021 | Rain, fog, lightning, ghosts and screen grades use the first-party VFX Spawner V2 and Post Process devices, driven from Verse | Only supported route for these effects without imported assets |
| R3-DEC-022 | THE GUEST interim body = Creative mannequin mesh, non-uniform scale to 2.60 m, pale waxy original material, no glowing eyes | GUEST_MODEL_SPEC identity lock (tall, thin, blank near-human face, stillness). No skeletal/animated mesh can be produced in this environment |
| R3-DEC-023 | Replaced props refused by UEFN validation: Commerce lobby chair → Suburban easy chair; Industrial electrical box → Oak fuse box 01/02; WildEstate cork boards → Suburban wood frame / medicine cabinet key box; WildEstate wall clock → Athena standing clock (also F13_CLOCK, now a 1.8 m standing clock); WildEstate toy box → NeoTilted hope chest; WildEstate caution sign → NeoTilted construction sign; Agency/TightSweater/PalletJack frames → Suburban frames | UEFN asset reference policy (UEFNValidation "Disallowed reference"); only validated classes are kept |
| R3-DEC-024 | Two THE GUEST waypoint nodes moved: (29.0, 55.0) → (26.9, 56.6) and (52.0, 51.0) → (52.0, 52.4); office desk set and generator moved off the route | The prop Guest passes straight through geometry when patrolling; nodes sat inside the new reception counter and Fuse B cabinet. Same node count/order, so patrol indices are unchanged |

## 5. Editor-side checks (after the final prop set)

| Check | Method | Result |
|---|---|---|
| Door clearance | Every Door row in `door_window_schedule.csv`: zone (clear width + 0.3 m) × 1.2 m each side, floor to 2.0 m, against colliding prop bounds | 26/26 clear |
| Interaction reach | Each of the 63 buttons: at least one of 32 stand points (1.0/1.6 m, 16 bearings) with floor below, a free 0.35 m × 1.8 m capsule and an eye-level line whose first hit is the button | 63/63 reachable |
| Wall penetration | Prop vs greybox wall bounds, tolerance 6 cm | 0 |
| Prop overlaps | All colliding props, pairwise, > 3 cm in all axes | 0 |
| Stair | STAIR_PLAN_R2 assembly + both approaches | Clear |
| Room envelopes | Every room prop inside its ROOM_COORDINATE_REGISTER envelope ± 5 cm | 0 outside |
| Guest route | 84 route/test points, segment sampling vs prop bounds + 0.25 m | Clear (the only remaining hit is the checkpoint list, not a route) |

These are geometric checks in the editor. They do not replace a human walk-through (R3-BLK-005).

## 6. Audio and VFX implemented (cue IDs)

| Cue | Implementation | Status |
|---|---|---|
| AUC-001 SFX_RAIN | `AUD SFX_RAIN loop` (Creative graveyard rain loop, 2D, 0.3) at start + VFX `PIOGGIA` ×4 | COMPLETED |
| AUC-002 SFX_NEON | unchanged preset (batch 01) | COMPLETED |
| AUC-003 SFX_FLUORESCENT | `AUD SFX_FLUORESCENT reception` (electric buzz loop, spatial 2–9 m) | COMPLETED (substitute sound) |
| AUC-004/005 SFX_PHONE / PHONE_VO | no ring or voice in the allowed library | BLOCKED → subtitles + reader text (existing fallback) |
| AUC-006 SFX_CRT | `AUD SFX_CRT room01` (screen hum loop) | COMPLETED (substitute) |
| AUC-007 ROOM13_DRONE | batch 01 + whispers during the reveal | COMPLETED |
| AUC-008 GUEST_FOOTSTEPS | `AUD SFX_GUEST_FOOTSTEPS` (floorboard creaks) moved with THE GUEST every step; the emitter is invisible, so this is not an NPC teleport | COMPLETED |
| AUC-009 GUEST_BREATH | heartbeat per player (batch 01); no monster breath in the allowed library | PARTIAL |
| AUC-010/013/014 stingers | batch 01 | COMPLETED |
| AUC-011 FUSE_INSERT | no dedicated cue | PARTIAL (pickup/power stingers only) |
| AUC-012/026 BREAKER | `AUD SFX_BREAKER lever` (power-on) + generator idle loop after power restore | COMPLETED |
| AUC-015/025 VO | none | BLOCKED → reader text |
| AUC-017 WIND | batch 01 | COMPLETED |
| AUC-018 DESK_BELL, 019/020 player foley, 021 Guest cloth, 024 ceiling footsteps | none | NOT IMPLEMENTED |
| AUC-022/023 DOOR | `AUD door open` (creak, moved to the door, stopped after 2.5 s) when a scripted door opens | PARTIAL (lock sound = existing fail stinger) |
| Document read | `AUD page turn` (UI open cue, per player) | COMPLETED (substitute) |
| Keypad | `AUD keypad press` (tick) on each dial | COMPLETED |
| Lightning | `VFX lightning` 1 s, 0.4–1.6 s before each thunder | COMPLETED |
| Capture | `PP capture red` blend-in for the captured player only, out on release | COMPLETED |
| Reveal | `PP reveal spooky` + `VFX reveal ghosts` for the 9 s reveal | COMPLETED |
| Endings | THE TRUTH → `PP truth VHS`; NEW GUEST → `PP new guest desolation` | COMPLETED |
| Guest appearance | dust burst at the spawn point when THE GUEST first appears | COMPLETED |
| Ambient | ground fog ×2, flies over the dumpster, dust in Room 13 and storage, base vignette | COMPLETED |

## 7. Runtime regression — self-test run 10

Every step passed (T00–T21, F01–F08, J01–J02, L01–L03) and THE TRUTH was committed; 0 Verse runtime errors. Full log: [evidence/B02/B02_selftest_run10.log](evidence/B02/B02_selftest_run10.log). Client warnings: only two "audio hasn't loaded, retrying" lines at match start. ESCAPE and NEW GUEST were last run in batch 01 (runs 7–8); their code paths changed only by added sound/post-process calls, so a rerun is listed for Batch 03.

## 8. Performance sample (Spatial Profiler, play-in-client, 1 client)

| Metric | Client | Budget | Server (local) | Budget |
|---|---:|---:|---:|---:|
| Frame time (median) | 8.3 ms | 16.7 ms | **33.4 ms (all samples over)** | 16.7 ms |
| Game thread | 2.1 ms | 15 ms | — | — |
| GPU | 2.1 ms | 15 ms | — | — |
| Draw calls | 266 (max 544) | 2500 | — | — |
| Primitives | 0.48 M | 2.0 M | — | — |
| Memory | 2.99 GB | 7.68 GB | 6.21 GB | 7.68 GB |
| UObjects | 0.79 M | 1.8 M | **1.72 M (95 %)** | 1.8 M |
| Actors | 851 | 10 000 | 1403 | 10 000 |
| Unique collision meshes | 64 | 2000 | 65 | 2000 |

Client: inside every budget. Server: frame time sits at a steady 33.4 ms in every sample, which looks like a fixed 30 Hz server tick rather than load, and the UObject count is near budget. Neither is accepted as a pass: PERF-B03-01 must compare with an empty template island on the same machine before deciding. Memory snapshots and console/mobile targets: NOT RUN.

## 9. Blockers (updated)

| ID | Blocker | Status after B02 |
|---|---|---|
| R3-BLK-001 | Final THE GUEST mesh/rig/LOD/animations | BLOCKED — interim mannequin body in place; production brief ready |
| R3-BLK-002 | Audio | PARTIAL — rain, hum, CRT, generator, breaker, footsteps, whispers, doors done; phone ring, all VO, desk bell, player/cloth foley missing (no allowed source; imported audio needs owner-sourced files) |
| R3-BLK-004 | 2P/4P, disconnect/rejoin, join in progress | NOT RUN — one client only |
| R3-BLK-005 | Human walk-through, legibility, fairness | NOT RUN |
| R3-BLK-006 | Furnishing / exterior / VFX | Resolved for the first pass (COMPLETED); polish pass pending a human look |
| R3-BLK-007 | Asset rights | PARTIAL — every asset placed in the level is first-party and registered; 54 R1 rows remain unsourced (custom Guest, VO, UI icons, optional sets) |
| R3-BLK-008 | Performance / validation | PARTIAL — island validation PASS; client perf PASS; server tick and UObject count to investigate |
| R3-BLK-010 | NPC navigation | BLOCKED — unchanged; R3-PROP-001 (migrate to a navigable template) needs an R2.4-style structural proposal |
| R3-BLK-011 (new) | Asset reference policy | Fortnite sound roots other than `/Game/Sounds/Creative` and some prop families are refused; validated only by pushing. Keep `EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv` as the allow-list |

## 10. Incident

While cleaning up probe actors I deleted six existing map backdrop actors (`S_BackDrop_*`) that sit below Z −10000. Nothing had been saved since; the level was reloaded from disk with `LevelToolset.LoadLevel`, all 16 backdrops came back, and the actor count matched the audit (589). Since then actors are only deleted by their own label or R3 tag.

## 11. Batch 03 (ordered by dependency and priority)

1. **QA-B03-01 (P0)** Human solo play-through of the full critical path with the new furniture; legibility of every document, label and journal page; flashlight/battery feel; capture/rescue fairness. Record as video + checklist.
2. **QA-B03-02 (P0)** 2P and 4P sessions: shared quest/inventory, per-player flashlight, capture/rescue, vote, disconnect/rejoin, join in progress, simultaneous interactions. Needs second/third/fourth clients (owner or testers).
3. **QA-B03-03 (P1)** Re-run self-test with SelfTestEnding = 1 (ESCAPE) and 3 (NEW GUEST) after the B02 audio/VFX hooks.
4. **PERF-B03-01 (P1)** Compare server frame time / UObject count with an empty template island; memory snapshot; reduce if needed (VFX spawner count, rain emitters).
5. **R3-PROP-001 (P1, owner-visible proposal)** NPC navigation: migrate the R2.3 geometry into a level created from a UEFN template with navigation, or keep the waypoint Guest permanently. Structural migration only after approval.
6. **ART-B03-01 (P1)** THE GUEST final character per [GUEST_PRODUCTION_PACKAGE_R3.md](GUEST_PRODUCTION_PACKAGE_R3.md) (external DCC; import as skeletal mesh; then NPC proof).
7. **AUD-B03-01 (P2)** Owner-sourced or original recordings for phone ring, VO (phone, radio, recorder), desk bell, fuse/door foley; import as SoundWave and register.
8. **LD-B03-01 (P2)** Visual polish pass after QA-B03-01: bathroom partitions (needs R2.4 proposal — the approved geometry has none), light placement over new furniture, corridor dressing.
