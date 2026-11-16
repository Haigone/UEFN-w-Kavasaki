# MASTER PROMPT — CLAUDE
## THE MOTEL: ROOM 13 | Complete UEFN / Fortnite island

You are the lead game director, UEFN technical designer, Verse programmer, level designer, environment artist, character artist, narrative designer, sound designer, QA lead and release coordinator for **THE MOTEL: ROOM 13**.

Your assignment is to deliver the **complete playable Fortnite island**, not a demo, not a vertical slice, not a mock-up and not a substitute web game. The target platform is **Unreal Editor for Fortnite (UEFN)** and the deliverable must be a real Fortnite island project suitable for end-to-end testing, creator review and eventual publication.

Read every file in this folder before acting, including:
- `README.md`
- `GAME_DESIGN_BIBLE.md`
- `GAMEPLAY_FLOW_AND_TESTS.md`
- `UEFN_IMPLEMENTATION_SPEC.md`
- `LEVEL_DESIGN_GEOMETRY.md`
- `ASSET_AND_CONTENT_REGISTER.md`
- `EXECUTIVE_BUILD_DOSSIER.md`
- `PRODUCTION_DETAIL_REQUIREMENTS.md`

Also inspect all CSV, diagrams, source files and other project artefacts present in the folder. Treat fixed requirements in this prompt and the detail requirements document as controlling. If two documents conflict, report the conflict and resolve it in the authoritative source files before implementation.

---

# 1. NON-NEGOTIABLE PRODUCT REQUIREMENTS

- Platform: UEFN / Fortnite island only.
- Players: 1–4; solo play must be fully completable.
- Camera: first person throughout normal gameplay.
- Genre: atmospheric survival horror, exploration, puzzle solving, stealth, pursuit and co-op rescue.
- Target playtime: 40–50 minutes for a normal first playthrough.
- Art direction: grounded, realistic motel horror, adapted to Fortnite's visual language and technical limits.
- Setting: isolated American roadside motel, 1986.
- Language of the shipped experience: English only. All in-game UI, objectives, signage, notes, documents, subtitles, voice lines, radio, item names and endings must be in English.
- Narrative location: Raven Motel.
- Main entity: THE GUEST.
- Exactly three designed endings: ESCAPE, THE TRUTH, THE NEW GUEST.
- Difficulty: adaptive tension system.
- Multiplayer: shared objective progression and inventory, capture/rescue loop, no softlocks from disconnects or simultaneous interactions.
- No demo or prototype phase as the requested final outcome. Internal blockout and test passes are development necessities, not separate demo deliverables.
- Do not change the platform or silently reduce scope.
- Do not claim completion, compilation, successful testing, publishing or direct UEFN access unless verified by actual tool access and evidence.

# 2. YOUR FIRST TASK: VERIFY THE ENVIRONMENT AND CAPABILITIES

Before creating assets or writing implementation code:
1. Establish what files, tools, project access, editor access and build capabilities you actually have.
2. Determine whether you can directly manipulate a UEFN project in this environment. If not, state exactly what you can produce (Verse source, build instructions, asset manifests, coordinate tables, prompts, validation scripts) and what requires the user to execute in UEFN.
3. Check the current official UEFN / Verse documentation and target editor version for every API and device workflow you intend to use.
4. Separate each technical item into VERIFIED, NEEDS EDITOR VERIFICATION or PSEUDOCODE.
5. Never invent Verse API names, NPC capabilities, navigation functions, device properties or cinematic controls.
6. Do not imply that a two-hour time budget guarantees the complete island. Work efficiently, report actual progress and identify blockers.

# 3. PRODUCTION ORDER — DO NOT SKIP

Follow this order and maintain a checklist:
1. Inspect repository and available UEFN project files.
2. Resolve the level geometry. The old coordinate sketch has overlaps. Rebuild a coherent two-level U-shaped motel plan with dimensioned walls, openings, rooms, stairs, balcony, secret route and monster navigation. Check every room polygon and door clearance for intersections.
3. Produce dimensioned top-down plans for both floors, roof plan, vertical sections, stair plan/section, secret passage plan/section and chase route diagrams.
4. Produce exact coordinate schedules for every wall, floor, ceiling, opening, stair, railing, prop, trigger, light, audio source and patrol point.
5. Produce room-by-room furniture plans. Every object must have a unique ID, exact X/Y/Z, yaw, width, depth, height, wall clearance, collision setting and gameplay purpose. “Near the bed” is not an acceptable placement instruction.
6. Produce THE GUEST full character pack: consistent front/side/back orthographic turnaround, 3/4 hero view, face and hand close-ups, 1.80 m human scale comparison, A/T-pose, material callouts, mesh/UV/texture/rig/collision/LOD specification and animation list.
7. Validate player scale, first-person camera, door widths, corridor widths, turning radii, line of sight, chase loops, hiding spots, accessibility and solo traversal.
8. Build a functional greybox/blockout before decoration.
9. Implement player movement assumptions, interaction framework, shared objectives and shared inventory.
10. Implement puzzle progression and checkpoints.
11. Implement THE GUEST as a verified UEFN-compatible NPC/AI solution, or explicitly document a feasible fallback within UEFN. Scripted scares and systemic AI must remain distinct.
12. Implement adaptive tension, capture, rescue and solo escape.
13. Implement all six story acts, ROOM 13 and all three endings.
14. Add environment art, props, materials, lighting, VFX and audio.
15. Add English-only UI, subtitles and accessibility options.
16. Run solo, 2-player and 4-player tests; test disconnects, simultaneous interactions, puzzle recovery, AI pathing, checkpoint restoration and all endings.
17. Optimize memory, performance, draw calls, lighting, audio and island validation.
18. Prepare a publication-readiness checklist. Do not publish without explicit user authorization and the required account/editor workflow.

Do not spend time polishing decorative props while geometry, navigation or game logic is broken.

# 4. GEOMETRY AND FURNITURE ARE NOT OPTIONAL DETAILS

The existing coordinates are preliminary design targets, not an approved executable floor plan. Reconcile `LEVEL_DESIGN_GEOMETRY.md` and `EXECUTIVE_BUILD_DOSSIER.md`; do not copy contradictory bounds blindly.

Use `PRODUCTION_DETAIL_REQUIREMENTS.md` as a mandatory production specification. You must create and maintain:
- `coordinate_schedule.csv`
- `wall_schedule.csv`
- `door_window_schedule.csv`
- `room_furnishing_schedule.csv`
- `EXECUTIVE_FLOORPLANS.md`
- `GUEST_MODEL_SPEC.md`
- `GEOMETRY_VALIDATION_REPORT.md`
- `QA_ACCEPTANCE_MATRIX.md`
- `ASSET_MANIFEST_EXECUTIVE.csv`
- `UEFN_DEVICE_BINDINGS.csv`
- `exterior_prop_schedule.csv`
- `lighting_audio_schedule.csv`
- `room_furnishing_schedule.csv`
- `door_window_schedule.csv`
- `asset_manifest.csv`
- `guest_model_spec.md`
- `geometry_validation_report.md`
- `uefn_device_bindings.csv`
- `qa_acceptance_matrix.md`

All plans, sections, tables and CSVs must describe the same geometry revision. Use metres with a dot decimal separator in CSV; convert to Unreal centimetres only when entering world coordinates in UEFN. Every measurement must be labelled FIXED REQUIREMENT, PROPOSED TARGET, ENGINE-VERIFIED or EDITOR-TEST REQUIRED.

Do not declare the geometry complete while room polygons overlap, shared walls are duplicated, doors are blocked, the stair does not connect both floors, or ROOM 13 lacks a physically continuous entrance and exit. No furniture schedule is complete without exact placements. No creature asset handoff is complete without a consistent model turnaround and a technical production brief.

# 5. GAME IDENTITY AND STORY

The game is **THE MOTEL: ROOM 13**. The location is the Raven Motel, a roadside motel officially closed for years. Every night, at exactly 02:13, its neon sign lights up.

Four friends are driving through a storm in 1986 when their car breaks down near the motel. They enter to ask for help. The reception appears abandoned, but a key is waiting on the counter. Its tag reads **ROOM 13**, although the motel visibly has only twelve rooms.

The telephone rings. A calm voice says:

> “Welcome. We've been expecting you.”

The players discover records of missing guests, photographs, impossible room layouts and a history that seems to repeat. The owner is connected to THE GUEST; inside ROOM 13, the players discover that the motel owner looks exactly like the creature stalking them.

The story must be told through environmental details, documents, short voice lines, staged sightings and player discoveries. Avoid long exposition dumps.

# 6. THE GUEST — CREATURE DIRECTION

THE GUEST is a 2.5–2.7 metre humanoid, extremely thin, pale grey, with disproportionately long arms. It wears an old motel employee uniform. Its face is almost human but unnaturally blank and expressionless.

Behaviour goals:
- Slow, deliberate patrol when unaware.
- Investigates sound and suspicious activity.
- Pursues only when a valid, reachable target is detected.
- Uses last-known player position rather than omniscient wall tracking.
- Searches plausible hiding locations.
- Captures rather than instantly kills.
- Must not permanently block the only exit or trap the whole team without a recovery path.
- Scripted appearances are separate from normal AI.
- Do not promise specific animation, pathfinding or perception APIs until verified in the target editor.

# 7. GAMEPLAY LOOP

Explore → find evidence/items → solve a puzzle → restore access/power → evade THE GUEST → rescue captured teammates → uncover ROOM 13 → choose/trigger an ending → escape or accept the motel's cycle.

First-person actions:
- Walk, sprint, crouch.
- Manual flashlight.
- Contextual interaction within approximately 2 metres.
- Examine readable clues.
- Hide in designated locations.
- Carry/use quest items.
- Co-operate on rescue and shared objectives.

Flashlight design target:
- 180 seconds of total charge per battery.
- 3–4 replacement batteries placed in the level.
- Battery swap approximately 2 seconds.
- Under 15% charge, light flickers; at zero it turns off.
These are balancing targets, not engine defaults.

# 8. CO-OP AND SOLO RULES

Shared team quest inventory:
- Room 13 Key
- Office Key
- Fuse A, Fuse B, Fuse C
- Screwdriver
- Car Keys
- Service Key

The item state belongs to the team objective system, not only to the player who picked it up. A disconnect must not erase a required quest item.

Player states:
- ACTIVE
- THREATENED
- CAPTURED
- RESCUE_PENDING
- RESCUED
- SOLO_ESCAPE
- SAFE

Capture:
- When THE GUEST catches a player, use a short controlled capture sequence and mark that player CAPTURED.
- A teammate can rescue by interacting within approximately 2 metres for 5 seconds.
- On rescue, grant approximately 8 seconds of brief protection.
- Prevent multiple capture sequences from racing the same state.
- A 90-second emergency threshold may trigger assistance or a recovery event, but never use an untested hard death timer.
- In solo, provide an autonomous escape/recovery interaction or alternate route.
- If the whole team is captured, trigger a defeat/recovery state and restore the latest checkpoint. Never create a permanent softlock.
- Confirm the actual UEFN method for immobilization, camera presentation, NPC interaction and player-state handling.

# 9. ADAPTIVE TENSION

Maintain a team-level tension variable from 0 to 100, called conceptually `TensionLevel`.

- 0–24 DORMANT: distant sounds, silhouettes, rare appearances; no prolonged chase.
- 25–49 UNEASY: patrol and investigation become more likely.
- 50–74 HUNTING: active pursuit and hiding-place checks.
- 75–100 RELENTLESS: higher pressure and shorter recovery windows.

Inputs may include:
- Time without objective progress.
- Number of captures.
- Time spent on a puzzle.
- Recent detections and chase frequency.
- Team size and player separation.

Do not punish exploration by itself. Do not raise tension during protected narrative sequences. Reduce tension after a difficult puzzle or completed chase. Use smoothing and cooldowns to prevent abrupt oscillation.

Initial tuning targets, to be tested:
- Patrol interval: about 35 s at DORMANT, 18 s at RELENTLESS.
- Investigation duration: about 12 s / 8 s.
- Hiding search window: about 5 s / 10 s.
- Post-chase recovery: about 25 s / 12 s.
These are game-design parameters, not UEFN defaults.

# 10. STORY STRUCTURE AND TIMING

Target total 40–50 minutes; act timings are pacing targets, not hard timers.

1. ACT I — THE ARRIVAL (0–8 min): car, storm, sign, first sighting, reception and ROOM 13 key.
2. ACT II — THE REGISTER (8–17 min): guest register, office, early rooms, first evidence.
3. ACT III — THE POWER (17–27 min): three fuses, electrical room, first full pursuit.
4. ACT IV — THE SECOND FLOOR (27–36 min): upper rooms, diary, child's room, hidden passage.
5. ACT V — ROOM 13 (36–43 min): four-photo chronological puzzle, owner reveal, service key.
6. ACT VI — NO VACANCY (43–50 min): car/gate escape sequence and ending resolution.

# 11. LEVEL AND ROOM CONTENT

The motel is a compact two-storey U-shaped American roadside motel with a central courtyard, twelve visible numbered rooms and one secret ROOM 13. The intended lot is approximately 84 × 72 metres. See the geometry and executive dossier for all dimensions and required correction work.

Required areas:
- Parking lot and broken car.
- Neon RAVEN MOTEL sign.
- Central courtyard and motel access.
- Reception and front desk.
- Owner's office.
- Storage room.
- Electrical/utility room.
- Ground-floor rooms 01–06.
- Upper-floor rooms 07–12.
- Balcony and upper corridor.
- Hidden passage and ROOM 13.
- Service exit / gate / final escape route.

Required room story beats:
- ROOM 01: CRT television displays the corridor from an impossible angle.
- ROOM 02: open suitcase and a usable battery.
- ROOM 03: cracked bathroom mirror; THE GUEST appears only in the reflection.
- ROOM 04: telephone with a clue.
- ROOM 05: apparently empty; footsteps sound from the ceiling.
- ROOM 06: photographs of missing guests connect to ROOM 13.
- ROOM 09: diary with the motel's history.
- ROOM 11: unsettling child's room.
- ROOM 12: sealed wall or concealed panel leading toward the hidden route.
- ROOM 13: impossible room with bed, wardrobe, CRT, photographs, telephone and clock frozen at 02:13.

# 12. PUZZLES AND PROGRESSION

Design every puzzle with:
- Player-facing clue in English.
- Exact interaction sequence.
- Expected solution.
- Feedback for correct and incorrect input.
- Co-op behaviour.
- Solo solvability.
- Reset/recovery rules.
- Required devices or Verse state.
- QA cases.

Required puzzle beats:
1. Reception register: infer a three-part date/number from guest records and open a desk drawer.
2. Owner's office: photo-based clue; obtain upper-floor access.
3. Power restoration: find Fuse A/B/C and restore the electrical system.
4. ROOM 13: arrange four photographs chronologically to reveal the truth and unlock the service key.
5. Final escape: recover car keys, reactivate gate/generator and survive the final chase.

Never make a mandatory clue depend on an optional collectible or a single player remaining connected.

# 13. THREE ENDINGS

Implement exactly three endings with explicit trigger conditions, gameplay steps, cinematics/VO, team outcome, checkpoint handling and replay behaviour:
- ESCAPE: players escape the motel grounds.
- THE TRUTH: players expose/confirm the owner's identity and choose the truth over immediate escape.
- THE NEW GUEST: the cycle repeats and one or more players become part of the motel's next story.

The three endings must be meaningfully distinct, reachable in solo and co-op, and must not rely on an arbitrary hidden timer. Define exact state flags and mutually exclusive ending resolution.

# 14. VISUAL, AUDIO AND ACCESSIBILITY REQUIREMENTS

Materials:
- Worn burgundy carpet.
- Yellowed beige wallpaper.
- Dark reception wood.
- Cream bathroom tile.
- Wet asphalt.
- Aged concrete.
- Rusted metal.
- Dirty glass.
- Red/blue neon.
- Peeling paint and water-damaged ceiling.
- Pale creature skin and faded uniform.

Lighting intent:
- Parking: cold blue.
- Reception: warm 2700–3200 K visual reference.
- Corridors: dirty amber.
- Rooms: muted warm practicals.
- Upper floor: cool night blue.
- ROOM 13: restrained dark red with readable clues.
- Final escape: emergency red accents plus navigational fill.
These are art-direction references; confirm supported light properties and performance in UEFN.

Audio:
- Rain, roadside wind, neon hum, fluorescent buzz, CRT static, phone ring, desk bell, player/monster footsteps, monster breath/cloth, fuse/breaker, door sounds, capture/chase stingers, ROOM 13 ambience and final radio.
- Provide subtitles for every required voice clue.
- No mandatory clue may be audio-only.
- Use spatial audio intentionally; avoid revealing THE GUEST unfairly through walls.

Accessibility:
- Subtitle toggle and readable text size.
- Non-colour-only puzzle clues.
- Audio clue subtitles.
- Motion/flash reduction option where feasible.
- Clear objective feedback and interaction affordances.
- No required rapid input sequence without an accessibility alternative.

# 15. UEFN IMPLEMENTATION AND VERSE

Suggested architecture:
- Game_Manager
- Player_Manager
- Puzzle_Manager
- Monster_Controller
- Difficulty_Manager
- Audio_Manager
- Cinematic_Manager
- Interaction_Manager

These are architectural responsibilities, not claims that specific APIs or class templates exist. For each Verse file and device, specify filename, responsibility, verified API imports, editable properties, event bindings, state ownership, replication, disconnect handling, failure recovery and compile status.

Potential device categories include player spawners, triggers, timers, trackers, conditional buttons, buttons, item granters, barriers, audio players, VFX spawners, HUD messages, cinematic sequences and prop movers. Choose exact device types/settings only after checking the current UEFN version. Do not invent device properties.

# 16. QA AND ACCEPTANCE

Test and record:
- Solo full completion and each of three endings.
- Two-player full completion and rescue.
- Four-player synchronized puzzle and objective progression.
- Disconnect/reconnect at every act and while carrying a quest item.
- Simultaneous interaction attempts.
- Captured-player rescue and solo recovery.
- All checkpoint restore states.
- AI pathing, line of sight, sound investigation and chase termination.
- Every door, window, stair, hidden passage and room transition.
- All clues readable in first person.
- No mandatory prop trapped behind collision.
- Performance/memory and island validation in target UEFN version.

A test is not passed because code exists. Record actual steps, expected result, observed result, platform/editor version and evidence.

# 17. FINAL RESPONSE REQUIRED FROM CLAUDE

At the end of each work session report:
1. Files created/changed.
2. Exact implementation work completed.
3. Commit SHA if Git changes were made.
4. Verified outcomes and evidence.
5. Proposed values not yet verified.
6. Blockers and tasks requiring the user/editor.
7. Next exact task in dependency order.

Never say “the game is finished”, “ready to publish”, “compiled”, “tested” or “published” unless those facts are demonstrably true. The target is a complete game, but honesty about capabilities and validation is mandatory.
