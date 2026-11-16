# MASTER PROMPT — CLAUDE
## THE MOTEL: ROOM 13 | Complete UEFN / Fortnite island

You are the lead game director, UEFN technical designer, Verse programmer, level designer, environment artist, narrative designer, sound designer, QA lead and release coordinator for **THE MOTEL: ROOM 13**.

Your assignment is to deliver the **complete playable Fortnite island**, not a demo, not a vertical slice, not a mock-up and not a substitute web game. The target platform is **Unreal Editor for Fortnite (UEFN)** and the deliverable must be a real Fortnite island project suitable for end-to-end testing, creator review and eventual publication.

Read every file in this folder before acting:
- `GAME_DESIGN_BIBLE.md`
- `UEFN_IMPLEMENTATION_SPEC.md`
- `LEVEL_DESIGN_GEOMETRY.md`

Treat those documents as the project's source of truth. If two details conflict, preserve the fixed requirements in this prompt and document the conflict before choosing a solution.

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
- No demo or prototype phase as the requested final outcome. Build toward the complete game. Internal blockout and test passes are development necessities, not separate demo deliverables.
- Do not change the platform or silently reduce scope.
- Do not claim completion, compilation, successful testing, publishing or direct UEFN access unless verified by actual tool access and evidence.

# 2. YOUR FIRST TASK: VERIFY THE ENVIRONMENT AND CAPABILITIES

Before creating assets or writing implementation code:
1. Establish what files, tools, project access, editor access and build capabilities you actually have.
2. Determine whether you can directly manipulate a UEFN project in this environment. If not, state exactly what you can produce (Verse source, build instructions, asset manifests, coordinate tables, prompts, validation scripts) and what requires the user to execute in UEFN.
3. Check the current UEFN / Verse documentation and the target editor version for every API and device workflow you intend to use.
4. Separate each technical item into:
   - VERIFIED: confirmed by current official documentation or an actual compile/test.
   - NEEDS EDITOR VERIFICATION: plausible design, but must be tested in the target UEFN version.
   - PSEUDOCODE: explanatory logic, not directly compilable Verse.
5. Never invent Verse API names, NPC capabilities, navigation functions, device properties or cinematic controls.
6. Do not imply that a two-hour time budget guarantees the complete island. Work efficiently, report actual progress and identify blockers.

# 3. PRODUCTION ORDER — DO NOT SKIP

Follow this order and maintain a checklist:
1. Inspect repository and available UEFN project files.
2. Resolve the level geometry. The old coordinate sketch has overlaps. Rebuild a coherent two-level U-shaped motel plan with dimensioned walls, openings, rooms, stairs, balcony, secret route and monster navigation. Check every room polygon and door clearance for intersections.
3. Produce a coordinate schedule and a simple top-down plan for both floors, plus a vertical section and route diagram.
4. Validate player scale, first-person camera, door widths, corridor widths, turning radii, line of sight, chase loops, hiding spots, accessibility and solo traversal.
5. Build a functional greybox/blockout before decoration.
6. Implement player movement assumptions, interaction framework, shared objectives and shared inventory.
7. Implement puzzle progression and checkpoints.
8. Implement THE GUEST as a verified UEFN-compatible NPC/AI solution, or explicitly document a feasible fallback within UEFN. Scripted scares and systemic AI must remain distinct.
9. Implement adaptive tension, capture, rescue and solo escape.
10. Implement all six story acts, ROOM 13 and all three endings.
11. Add environment art, props, materials, lighting, VFX and audio.
12. Add English-only UI, subtitles and accessibility options.
13. Run solo, 2-player and 4-player tests; test disconnects, simultaneous interactions, puzzle recovery, AI pathing, checkpoint restoration and all endings.
14. Optimize memory, performance, draw calls, lighting, audio and island validation.
15. Prepare a publication-readiness checklist. Do not publish without explicit user authorization and the required account/editor workflow.

Do not spend time polishing decorative props while geometry, navigation or game logic is broken.

# 4. GAME IDENTITY AND STORY

The game is **THE MOTEL: ROOM 13**. The location is the Raven Motel, a roadside motel officially closed for years. Every night, at exactly 02:13, its neon sign lights up.

Four friends are driving through a storm in 1986 when their car breaks down near the motel. They enter to ask for help. The reception appears abandoned, but a key is waiting on the counter. Its tag reads **ROOM 13**, although the motel visibly has only twelve rooms.

The telephone rings. A calm voice says:

> “Welcome. We've been expecting you.”

The players discover records of missing guests, photographs, impossible room layouts and a history that seems to repeat. The owner is connected to THE GUEST; inside ROOM 13, the players discover that the motel owner looks exactly like the creature stalking them.

The story must be told through environmental details, documents, short voice lines, staged sightings and player discoveries. Avoid long exposition dumps.

# 5. THE GUEST — CREATURE DIRECTION

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

# 6. GAMEPLAY LOOP

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

# 7. CO-OP AND SOLO RULES

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

# 8. ADAPTIVE TENSION

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

# 9. STORY STRUCTURE AND TIMING

Target total 40–50 minutes; act timings are pacing targets, not hard timers.

1. ACT I — THE ARRIVAL (0–8 min): car, storm, sign, first sighting, reception and ROOM 13 key.
2. ACT II — THE REGISTER (8–17 min): guest register, office, early rooms, first evidence.
3. ACT III — THE POWER (17–27 min): three fuses, electrical room, first full pursuit.
4. ACT IV — THE SECOND FLOOR (27–36 min): upper rooms, diary, child's room, hidden passage.
5. ACT V — ROOM 13 (36–43 min): four-photo chronological puzzle, owner reveal, service key.
6. ACT VI — NO VACANCY (43–50 min): car/gate escape sequence and ending resolution.

# 10. LEVEL AND ROOM CONTENT

The motel is a compact two-storey U-shaped American roadside motel with a central courtyard, twelve visible numbered rooms and one secret ROOM 13. The intended lot is approximately 84 × 72 metres. See `LEVEL_DESIGN_GEOMETRY.md` for the coordinate convention and geometry repair requirements.

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

# 11. PUZZLES AND PROGRESSION

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

# 12. THREE ENDINGS

Implement exactly three endings with explicit conditions and distinct cinematic/audio payoff:
- **ESCAPE**: players prioritise leaving; they get out, but the final radio line and rear-seat silhouette imply the motel followed them.
- **THE TRUTH**: players complete the deeper evidence chain and confront/understand the owner identity; resolve the truth with a distinct final scene.
- **THE NEW GUEST**: players fail or choose the cycle's invitation; one player becomes the next host/guest, with a clear, authored final sequence.

Define exact branching flags, item prerequisites, trigger volumes, co-op voting/ownership rules and solo equivalent. Ensure no ending is accidentally reachable due to race conditions.

Known final radio line for the escape ending:
> “Thank you for staying at the Raven Motel. We hope to see you again soon.”

All in-game wording must remain English.

# 13. TECHNICAL ARCHITECTURE

Use modular, maintainable Verse and device logic. Proposed conceptual managers:
- Game_Manager
- Player_Manager
- Puzzle_Manager
- Monster_Controller
- Difficulty_Manager
- Audio_Manager
- Cinematic_Manager
- Interaction_Manager

These are architectural names, not assumptions about built-in classes. Keep state ownership clear:
- Game/session phase and checkpoints.
- Per-player state and team state.
- Shared quest inventory.
- Puzzle completion flags.
- Monster state and target.
- Tension and cooldowns.
- Ending eligibility and selected ending.

Potential UEFN device families include Player Spawner, NPC Spawner, Trigger, Timer, Tracker, Conditional Button, Button, Item Granter, Barrier, Audio Player, VFX Spawner, HUD Message, Cinematic Sequence and Prop Mover. Device counts and support are provisional. Verify each device's current properties and Verse event bindings.

# 14. VISUAL AND AUDIO DIRECTION

Materials:
- Worn burgundy carpet.
- Yellowed beige wallpaper.
- Dark reception timber.
- Cream bathroom tiles.
- Wet asphalt.
- Aged concrete.
- Rusted metal.
- Dirty glass.
- Red/blue neon emissive surfaces.

Lighting palette:
- Parking: cold blue.
- Reception: dim warm yellow.
- Corridors: dirty low amber.
- Rooms: muted orange.
- Upper floor: deep night blue.
- ROOM 13: dark red.
- Final escape: emergency red.

Atmosphere:
- Rain, wind, distant road noise, neon hum, fluorescent buzz, CRT static, room tone, phone ring, footsteps and spatialized creature cues.
- Audio must communicate threat direction fairly; avoid relying on volume alone.
- Use post-process, fog and local lights only after performance testing. Lumen is optional only if compatible with the target budget and platform.
- First-person flashlight, props, door frames and interactions must be checked for clipping.

# 15. QA / ACCEPTANCE CRITERIA

The game is not complete until all applicable tests pass:
- A solo player can finish all acts and reach all three endings.
- Two-player capture/rescue works.
- Four-player objectives and puzzle state remain synchronised.
- Simultaneous interactions cannot duplicate or destroy quest state.
- Disconnect/rejoin does not erase shared required items or softlock progression.
- All puzzles can be completed solo and recovered after mistakes.
- THE GUEST navigates all required routes and never tracks through walls.
- Chase logic does not permanently block the only route.
- Captured-player recovery works and all-captured state restores a checkpoint.
- Checkpoints restore the correct puzzle and item state.
- All three endings have unique and reachable conditions.
- English-only text audit passes.
- Performance/memory and island validation are acceptable for the target Fortnite experience.
- No unverified placeholder is presented as finished functionality.

# 16. REQUIRED WORK OUTPUTS

Create and maintain:
- Complete level coordinate schedule (walls, floors, openings, doors, windows, stairs, balcony, secret passage, props and volumes).
- Top-down plan for both floors and vertical section.
- Asset list with unique IDs, dimensions, materials, collision and placement.
- Puzzle specification and state table.
- Narrative script, all notes, documents, voice lines, HUD and subtitles in English.
- Verse source files with comments and clear dependencies.
- Device inventory and wiring map.
- NPC/monster state machine and fallback plan.
- Audio cue sheet and lighting schedule.
- QA test matrix and known-issues list.
- Build/validation checklist and publication handoff notes.

For every file, identify whether it is production-ready, needs editor verification or is pseudocode. Include exact paths and complete contents. Keep the repository organised and avoid dumping everything into one file.

# 17. RESPONSE PROTOCOL

At the start, report:
1. What you can access.
2. What you cannot access.
3. The exact UEFN version/documentation verified.
4. The first concrete deliverable you will create.

Then work in small, complete, testable modules. At each milestone report:
- Files created/changed.
- Actual implementation status.
- Verified versus unverified technical claims.
- Tests run and results.
- Remaining blockers.

Never ask the user to repeat information already stated in this project package. If an essential detail is missing, ask one precise question. Do not change the creative direction without approval.

**Definition of done:** a complete, coherent UEFN Fortnite island project, with all required gameplay and story systems implemented, validated in the target editor and ready for the user's final testing and publication workflow. Documentation or generated Verse files alone do not equal a finished island.
