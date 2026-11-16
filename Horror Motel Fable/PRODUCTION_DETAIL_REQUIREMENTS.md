# PRODUCTION DETAIL REQUIREMENTS — REVISION 2
## THE MOTEL: ROOM 13 | Executable level, furniture, creature and asset specification

**Purpose:** this document upgrades the design package from a concept brief to a production handoff. Claude must turn every design intention into measurable, reviewable deliverables. It is not permission to claim that assets have been created or that UEFN has been modified.

**Units and status vocabulary**
- All world dimensions are metres unless a field explicitly says cm, mm, Unreal units or pixels.
- World coordinates use the site datum in `EXECUTIVE_BUILD_DOSSIER.md`; convert metres to Unreal centimetres by multiplying by 100.
- Every measurement must be tagged as one of: `FIXED REQUIREMENT`, `PROPOSED TARGET`, `ENGINE-VERIFIED`, `EDITOR-TEST REQUIRED`.
- Never silently promote a proposed target to a verified fact.
- Use a single coordinate convention and one authoritative schedule. If a layout changes, update every plan, schedule, route, asset placement and prompt reference.

---

# 1. MANDATORY OUTPUT PACKAGE

Claude must produce all of the following before declaring the design handoff complete:

1. Dimensioned ground-floor plan, with exterior dimensions, internal clear dimensions, wall centre-lines, wall thickness, door/window openings and room labels.
2. Dimensioned upper-floor plan, including balcony, guardrails, stair landing, secret route and ROOM 13.
3. Roof plan and at least two building sections: north-south through courtyard and east-west through the secret room.
4. Stair plan and section with exact rise, number of risers, tread depth, total run, landing dimensions, handrail and head clearance.
5. Room-by-room furniture plans with every prop assigned an ID, world X/Y/Z, yaw, width, depth, height and wall clearance.
6. Door and window schedule with exact centre coordinates, orientation, rough opening, clear opening, sill height, swing direction and collision behaviour.
7. Wall/floor/ceiling schedule with start/end coordinates, thickness, height, material ID and collision.
8. Player and THE GUEST route maps, patrol points, investigation points, hiding locations, capture/rescue areas, chase loops and no-go volumes.
9. A complete asset register for every mesh, material, texture, decal, VFX and sound.
10. THE GUEST visual model pack: front/side/back orthographic, 3/4 view, face close-up, hand close-up, neutral rig pose, scale comparison, material callouts and animation list.
11. THE GUEST production model specification: dimensions, proportions, topology targets, UV/texture sets, rig, collision, LODs, naming and export/import checks.
12. A coordinate CSV for all placed geometry and gameplay objects, plus a human-readable Markdown summary.
13. A geometry validation report identifying intersections, unreachable rooms, blocked clearances, collision risks and unresolved assumptions.
14. A build checklist in dependency order, with each task marked `NOT STARTED`, `IN PROGRESS`, `BLOCKED`, `EDITOR VERIFIED` or `ACCEPTED`.

**No handoff may be called complete if a plan is only a mood-board, a furniture list has no positions, or a 3D creature brief has no production specifications.**

# 2. GEOMETRY — SOURCE OF TRUTH AND VALIDATION

The existing site envelope and room allocation are preliminary. The old sketch and the current dossier contain zones that may conflict when converted into solid walls, floors, circulation and vertical connections. Claude must not copy coordinates blindly.

## 2.1 Required geometry method
1. Establish a room/space polygon for every enclosed area on each floor.
2. Establish wall centre-lines and wall thickness separately from room clear dimensions.
3. Model shared walls once, not twice.
4. Use a consistent wall-face convention: state whether each room bound refers to finished inside face, wall centre-line or exterior face.
5. Calculate net clear room dimensions after wall thickness and finishes.
6. Check all room polygons for unintended overlap and all required connections for actual openings.
7. Check every door swing against furniture, walls and player capsule.
8. Check every vertical opening, stair, slab edge and ceiling height in section as well as plan.
9. Check that ROOM 13 is reachable from ROOM 12 through a continuous, collision-free route and can be exited.
10. Check that the ground-floor utility spaces do not occupy the same world volume as upper-floor secret spaces unless a deliberate floor/ceiling separation is shown.
11. Provide a route graph for solo progression and for THE GUEST. No mandatory objective may require a teammate.
12. Do not solve a spatial problem by placing overlapping collision meshes, invisible teleport assumptions or an unexplained hole through a room.

## 2.2 Geometry acceptance tolerances
These are design QA tolerances, not engine guarantees:
- No unintended room polygon overlap.
- No unintended wall centre-line intersection except planned junctions.
- Minimum ordinary player route width target: 0.90 m; primary corridors target 2.50 m.
- Interaction approach area target: 1.20 m × 1.20 m clear where multiple players may gather.
- Door clear opening target: 0.90 m ordinary; 1.00 m service; 1.60 m double utility; 1.60 m main reception.
- Minimum overhead clearance target: 2.20 m on player routes; verify camera and capsule.
- No furniture in door swing or mandatory route.
- No required pickup inside non-walkable collision.
- No patrol point inside geometry or outside navigable space.
- Every chase segment must have a valid continuation or retreat path; no unavoidable monster/player deadlock.
- Verify all of the above in first-person play mode and with the actual NPC implementation.

## 2.3 Required plan annotations
Every plan must show:
- North arrow and scale bar.
- Site boundary and origin.
- Grid lines and grid spacing.
- Floor elevation and ceiling elevation.
- Exterior and interior dimensions.
- Room IDs and net clear dimensions.
- Door/window IDs.
- Stair direction arrows and landing limits.
- Furniture IDs.
- Interactable/gameplay prop IDs.
- Trigger, barrier and audio-zone IDs.
- Player and monster route arrows.
- Legend for fixed, proposed and unverified elements.

# 3. ROOM-BY-ROOM FURNITURE AND PROP PLACEMENT

The standard furniture dimensions in `EXECUTIVE_BUILD_DOSSIER.md` are bounding-box targets. Claude must now place each object precisely in the corrected plan. Do not leave entries such as “near the bed” or “on the wall”.

For every object, record:
`Asset_ID, Floor, Room_ID, X_m, Y_m, Z_m, Yaw_deg, Width_m, Depth_m, Height_m, Wall_Clearance_m, Collision, Interactable, Interaction_Range_m, Material_ID, Gameplay_Role, Status`.

## 3.1 Standard room kit — target dimensions
- Double bed and mattress: 1.60 × 2.10 × 0.55 m.
- Headboard: 1.65 × 0.10 × 1.10 m.
- Bedside table: 0.45 × 0.45 × 0.55 m, two per standard room unless story dressing says otherwise.
- Wardrobe: 1.20 × 0.60 × 2.00 m.
- Luggage rack: 0.75 × 0.45 × 0.55 m.
- Writing desk: 1.10 × 0.55 × 0.75 m.
- Chair: 0.48 × 0.50 × 0.90 m.
- CRT television: 0.55 × 0.50 × 0.50 m; screen centre target 1.20 m above floor.
- TV cabinet: 0.90 × 0.45 × 0.65 m.
- Telephone: 0.18 × 0.22 × 0.12 m.
- Floor lamp: 0.30 m base diameter × 1.50 m high.
- Bathroom vanity: 0.80 × 0.50 × 0.85 m.
- Toilet: 0.40 × 0.70 × 0.75 m.
- Shower: 0.90 × 0.90 m footprint.
- Bathroom mirror: 0.60 × 0.90 m.
- Waste bin: 0.25 × 0.25 × 0.35 m.
- Suitcase: 0.70 × 0.45 × 0.25 m.
- Wall picture frame: 0.30 × 0.05 × 0.40 m typical.

## 3.2 Required room furnishing plans
Claude must create one placement table and one top-down furniture diagram for each room, including rooms with intentionally sparse dressing.

- ROOM 01: bed, two bedside tables, wardrobe, desk/cabinet, CRT, chair, phone, lamp, bathroom fixtures; TV must face the doorway/bed sightline needed for the impossible feed scare.
- ROOM 02: standard room kit plus open suitcase and battery pickup. Battery must be reachable without blocking the exit.
- ROOM 03: standard room kit plus bathroom mirror scare. Define mirror position, player viewing mark, scare trigger and alternate staged visual if true reflections are unavailable.
- ROOM 04: standard room kit plus phone clue. Provide subtitle-readable clue and a clear interaction spot.
- ROOM 05: intentionally sparse room; specify exactly which props remain and where the ceiling footsteps sound originates.
- ROOM 06: standard kit plus missing-guest photo wall. Each photo gets its own ID, dimensions, text/visual clue and readable distance.
- ROOM 07: standard kit, with a restrained clue that foreshadows the owner.
- ROOM 08: standard kit, with environmental storytelling that does not introduce a mandatory hidden dependency.
- ROOM 09: standard kit plus diary; diary interaction position, readable page layout and exact English text.
- ROOM 10: standard kit plus optional scare/foreshadowing; do not add a mandatory puzzle without updating progression.
- ROOM 11: child bed 0.90 × 1.90 m, toy chest 0.80 × 0.45 × 0.50 m, toys, drawing, light and sound source; maintain player route.
- ROOM 12: standard room kit adjusted around concealed panel; panel 0.90 × 2.10 m target, latch around 1.10 m, interaction clearance and hidden passage connection.
- ROOM 13: bed, wardrobe, CRT, phone, four photo frames, owner portrait, clock frozen at 02:13, hidden compartment and clue props. Two players must be able to inspect the four photos simultaneously without blocking the only exit.

## 3.3 Shared spaces
Reception:
- Counter target 3.60 × 0.90 × 1.10 m.
- Desk bell 0.10 × 0.10 × 0.08 m.
- Register 0.30 × 0.22 × 0.05 m.
- Key rack 1.20 × 0.12 × 0.80 m.
- Wall clock diameter 0.35 m, centre height 2.10 m.
- Phone 0.20 × 0.22 × 0.15 m.
- CRT security monitor 0.55 × 0.50 × 0.50 m.
- Two waiting chairs, each 0.65 × 0.65 × 0.90 m.
- Queue/interaction space in front of desk: target 1.50 m deep and at least 2.50 m wide.

Owner office:
- Desk 1.80 × 0.80 × 0.75 m.
- Chair 0.65 × 0.65 × 1.10 m.
- Filing cabinet 0.90 × 0.45 × 1.30 m.
- Photo board 1.50 × 0.08 × 1.00 m.
- Locked drawer 0.50 × 0.45 × 0.20 m.
- Define exact photo-board content and interaction order.

Storage:
- Shelving units 0.90 × 0.45 × 2.00 m.
- Cleaning cart 0.90 × 0.50 × 1.00 m.
- Toolbox 0.50 × 0.30 × 0.25 m.
- Screwdriver pickup and spare battery placement.
- Maintain a 0.90 m route from entrance to exit.

Electrical room:
- Fuse panel 1.20 × 0.25 × 1.40 m.
- Fuse sockets A/B/C individually labelled and spaced for clear interaction.
- Workbench 1.50 × 0.70 × 0.90 m.
- Shelving 0.90 × 0.45 × 2.00 m.
- Generator control console 0.80 × 0.50 × 1.10 m.
- Clear working area in front of panel: target 1.20 m.
- Mark all live electrical hazard volumes and interaction-safe zones.

# 4. THE GUEST — FULL 3D CHARACTER PRODUCTION PACK

The existing character description is a visual starting point. Claude must turn it into a complete model sheet and a mesh/rig production brief.

## 4.1 Locked visual identity
- Name: THE GUEST.
- Apparent height: 2.60 m target; permitted design range 2.50–2.70 m.
- Very thin, adult humanoid, pale grey skin, subtly blue/desaturated undertone.
- Narrow shoulders, shallow chest, long torso, disproportionately long arms, hands hanging close to knees.
- Almost human, expressionless face. No glowing eyes, horns, fangs or fantasy armour.
- Worn motel employee uniform: faded grey-beige shirt, dark charcoal/brown trousers, worn dark shoes, plain rectangular name badge, small raven motif optional.
- Silhouette must be recognizable at 5 m in dim corridor light and at 10–15 m as a readable shape.
- Fear comes from proportions, stillness, timing and movement, not gore.

## 4.2 Proportion targets
- Height: 2.60 m.
- Shoulder width: 0.52 m target.
- Chest depth: 0.25 m target.
- Head height: 0.30 m target.
- Neck length: 0.14 m target.
- Shoulder-to-fingertip arm length: 1.12 m target.
- Hand length: 0.24 m target.
- Hip-to-floor leg length: 1.30 m target.
- Hand position in neutral pose: near knee height.
- Claude/artist must provide a dimensioned front and side drawing with a 1.80 m human scale mannequin. Proportions must be adjusted coherently so the total height adds up; the values are targets, not independent segments that may overlap.

## 4.3 Mesh, UV and texture targets
- Hero LOD0: 25k–45k triangles target; profile on target platform and reduce if needed.
- LOD1: 12k–20k triangles target.
- LOD2: 4k–8k triangles target.
- One main skeletal mesh; separate eye/teeth/accessory meshes only if needed.
- Texture set targets: Base Color, Normal, packed ORM or the exact maps supported by the selected import pipeline.
- Hero textures 2K target; 1K for lower LOD/distance where suitable.
- Keep material slots low: skin, shirt, trousers, shoes, eyes/accessories.
- UVs must avoid visible seams on face/hands and support consistent texel density.
- Use simple character collision/capsule; do not use per-triangle collision for navigation.
- Root/pivot at floor between feet; state forward axis and scale convention.
- Include neutral A-pose or T-pose, bind-pose screenshot and rig hierarchy.
- Do not promise a custom skeleton/animation import path until verified in the target UEFN release.

## 4.4 Required model-sheet views
Create a single consistent character turnaround pack:
1. Front orthographic, neutral pose, full body, dimension annotations.
2. Side orthographic, neutral pose, full body, dimension annotations.
3. Back orthographic, neutral pose, full body.
4. Three-quarter hero render.
5. Face close-up, neutral expression.
6. Hand close-up with scale reference.
7. Uniform material and wear callouts.
8. 1.80 m human mannequin comparison.
9. Silhouette test at 5 m, 10 m and 15 m in motel lighting.
10. A-pose/T-pose suitable for rigging.

The turnaround must depict the same exact character in every view: same clothing, body proportions, face, height and details. Do not return unrelated concept variations.

## 4.5 Animation specification
Specify start/end pose, duration target, root motion expectation, loop status and gameplay use for:
- Idle breathing (near-motionless).
- Head turn.
- Slow walk.
- Patrol turn (torso leads feet).
- Investigate sound (lean/head tilt).
- Chase run (long strides, controlled silhouette).
- Capture reach.
- Search/lean into hiding location.
- Retreat/disappear.
- Balcony silhouette.
- ROOM 13 owner reveal pose.

If the custom animation path is unsupported, propose a verified UEFN-compatible substitute and explicitly state what visual fidelity is lost. Never label an animation as implemented until it has been imported and tested.

# 5. MONSTER IMPLEMENTATION AND GAMEPLAY COLLISION

The visual mesh and the gameplay NPC are separate deliverables. Specify:
- Chosen NPC/character implementation path and current official documentation reference.
- Collision capsule dimensions and offset.
- Navigation footprint and minimum doorway clearance.
- Target movement speed for patrol and chase as tuning values, not engine facts.
- Perception range and field-of-view targets as tuning values, not assumed APIs.
- Patrol point IDs and their coordinates.
- Investigate point behaviour based on last-known sound/player position.
- Chase termination and recovery conditions.
- Hiding-spot query method and fallback.
- Capture volume/interaction logic and rescue interruption rules.
- A test proving THE GUEST does not see through walls or patrol through solid geometry.
- A test proving a captured solo player can recover/escape.
- A separate scripted-scare sequence list that does not depend on systemic AI.

# 6. MATERIALS, LIGHTS, AUDIO AND VFX — INSTANCE-LEVEL DETAILS

For every material, light, sound and VFX instance, provide:
- Unique asset ID.
- Exact room/area.
- World coordinate and rotation.
- Size/range/attenuation where applicable.
- Intensity/colour/temperature target where supported.
- Trigger condition and duration.
- Whether it is static, dynamic or scripted.
- Performance budget and priority.
- Verification status.

Do not give only a list of material names. Define texture scale, roughness/normal intent, tiling direction, decal density and where each material is applied. Avoid wet-floor reflections or real-time mirrors unless the chosen UEFN rendering path is verified.

# 7. UEFN / VERSE IMPLEMENTATION DETAIL

For every Verse file and device:
- Exact filename and responsibility.
- Imports and API symbols checked against current official docs.
- Device type, editable properties, event bindings and placement ID.
- State ownership: per-player, per-team or per-round.
- Replication/network expectations.
- Join-in-progress and disconnect behaviour.
- Failure recovery and checkpoint interaction.
- Compile/test status.

Use separate files where useful:
- Game_Manager
- Player_Manager
- Puzzle_Manager
- Monster_Controller
- Difficulty_Manager
- Audio_Manager
- Cinematic_Manager
- Interaction_Manager

These names are architectural labels, not proof that a given class or API exists. Verify syntax and supported APIs before producing compile-ready code. Clearly label pseudocode.

# 8. REQUIRED DATA FILES

Create and maintain:
- `coordinate_schedule.csv` — every wall, floor, ceiling, door, window, stair, rail, furniture prop, pickup, trigger, light, audio source and patrol point.
- `asset_manifest.csv` — all mesh/material/texture/audio/VFX assets with IDs, dimensions, source/license, status and UEFN validation.
- `room_furnishing_schedule.csv` — every furniture item by room with coordinates, yaw, dimensions and clearances.
- `door_window_schedule.csv` — all openings and their properties.
- `guest_model_spec.md` — creature modelling/rigging/animation specification.
- `geometry_validation_report.md` — overlap and route test results.
- `uefn_device_bindings.csv` — device ID, type, settings, Verse binding and test state.
- `qa_acceptance_matrix.md` — solo, 2-player, 4-player, disconnect, capture/rescue, checkpoint, puzzle, ending, performance and publication tests.

CSV files must use UTF-8, comma delimiter, dot decimal separator, header row, no merged cells, and one object per row. Do not use placeholder rows such as “all other props”.

# 9. PROMPT EXECUTION RULES FOR CLAUDE

1. Read every Markdown and data file in this folder before editing.
2. Inspect the actual repository tree and preserve existing work.
3. Do not create a demo as the requested deliverable. Greybox and internal QA are mandatory development methods for the complete game.
4. Work in dependency order: geometry → greybox → traversal → puzzle logic → NPC/AI → capture/rescue → story/endings → art/audio → optimization → QA.
5. When a measurement is unknown, propose a value, label it `PROPOSED TARGET`, and explain how it will be verified.
6. When two measurements conflict, stop and resolve the conflict in the authoritative geometry file before generating assets.
7. Never invent a coordinate, API or asset status to make the report look complete.
8. Never claim UEFN project access, asset import, Verse compilation, playtest, memory validation or publishing unless the action actually occurred and evidence is available.
9. Keep all in-game content in English. Production documentation may be Italian or English.
10. Preserve the fixed project identity and all approved narrative/gameplay requirements.
11. The two-hour target is aspirational only. Report what is genuinely complete and what remains; do not misrepresent an incomplete island as publication-ready.
12. End each work session with changed files, commit SHA, verified outcomes, blockers, next exact task and commands/actions the user must perform in UEFN.

# 10. FINAL ACCEPTANCE GATE

The production package is accepted only when:
- Plans, sections and schedules use the same geometry revision.
- Every room has net dimensions and furniture coordinates.
- Every required object has a unique asset ID and dimensions.
- Every door/window/stair/rail has exact measurements and placement.
- ROOM 13 passage is physically coherent in plan and section.
- THE GUEST has a complete consistent turnaround and technical character brief.
- The model/rig/animation path is compatible or its fallback is explicitly documented.
- Verse/device references are verified or clearly marked for editor testing.
- All three endings have complete trigger and recovery logic.
- Solo completion and 1–4 player behaviour are covered by QA.
- No mandatory clue or quest item can be lost through disconnect or a failed interaction.
- No unresolved geometry conflict is hidden behind a “complete” status.
