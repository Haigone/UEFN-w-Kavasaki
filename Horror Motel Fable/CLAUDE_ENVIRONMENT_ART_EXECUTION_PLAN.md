# CLAUDE ENVIRONMENT ART EXECUTION PLAN
Revision 2.0 | THE MOTEL: ROOM 13 | Handoff owner: Environment Art
Status: COMPLETE DOCUMENTARY HANDOFF / NO UEFN TESTS PERFORMED BY DOCUMENTATION AUTHOR

## 0. Operating contract — read first
This document is the execution instruction for Claude. The documentation author does not build, open, import into, compile, profile or playtest the UEFN project. Claude is responsible for all DCC production actions that are within its available toolchain and all UEFN editor/import/collision/performance verification. Claude must state honestly when an action requires a human artist/editor operator or cannot be performed in the current environment.

Do not schedule, create reminders or ask the project owner to run tests. Do not treat this file or the GitHub repository as an asset source. The repository is a specification and coordination reference. Do not claim any model, texture, material instance, import or verification exists until its actual file or editor evidence exists.

Deliver a finished Environment Art handoff TODAY in the sense of a complete, deterministic production package and an executable sequence. Actual model creation/import/editor validation may continue under Claude and must retain truthful statuses. Do not compress unknowns into invented facts merely to make the handoff appear complete.

## 1. Authority, revision and source files
Use this precedence:
1. Fixed requirements in MASTER_PROMPT_FOR_CLAUDE.md and PRODUCTION_DETAIL_REQUIREMENTS.md.
2. LEVEL_DESIGN_GEOMETRY.md revision LD-GEO R2.0 (candidate single geometry authority).
3. GEOMETRY_VALIDATION_REPORT.md R2.0 and its open issues.
4. EXECUTIVE_FLOORPLANS.md E1 only where consistent with LD-GEO R2.0.
5. Current canonical schedules: wall_schedule.csv, door_window_schedule.csv, coordinate_schedule.csv, ROOM_COORDINATE_REGISTER.csv, room_furnishing_schedule.csv, exterior_prop_schedule.csv, lighting_audio_schedule.csv.
6. ASSET_AND_CONTENT_REGISTER.md.
7. This Environment Art package and mood direction.

Read all of these before touching geometry or asset production. E1 is not final geometry. The geometry report explicitly says NOT APPROVED and no ENGINE-VERIFIED items exist. Preserve this state.

## 2. Geometry values to use as the current target
Site datum: south-west corner (0,0,0); +X east, +Y north, +Z up; dimensions in metres in schedules; multiply by 100 for UEFN centimetres.
- Site: 84 x 72 m.
- Footprint union: west wing X=8..20,Y=18..60; east wing X=64..76,Y=18..60; north connector X=8..76,Y=48..60. This is a single polygon union. Never create overlapping solid room boxes or duplicate shared slabs/walls.
- Ground FFL 0.00 m; upper FFL 3.60 m; upper slab 0.25 m target.
- Clear heights: ground 3.00 m and upper 2.80 m target. The vertical slab/ceiling/roof stack is not fully reconciled; do not reuse legacy wall height 3.20 m as a verified finished height. Build a dimensioned section proposal and mark the stack EDITOR-TEST REQUIRED.
- Exterior walls 0.30 m and internal partitions 0.15 m target.
- Ordinary clear door 0.90 x 2.10 m; service 1.00 x 2.10 m; double utility 1.60 x 2.10 m; reception entry 1.60 x 2.30 m target.
- Ordinary player route >=0.90 m; primary corridors 2.50 m; interaction approach 1.20 x 1.20 m; head clearance >=2.20 m target.
- Upper floor ROOM 13 bounds X=49.00..63.70,Y=51.10..59.70. Its entry is on the south wall at approx centre X=56.35,Y=50.95. North photo wall must not obstruct egress.
- ROOM 12 panel centre target X=68.60,Y=47.55; opening 0.90 x 2.10 m. Add vestibule X=64.30..72.90,Y=47.85..49.35 with route width >=1.40 m; west passage through X=64 wall junction centred Y=48.60, then U-NORTH HALL to ROOM 13. Route must be a real walkable continuous passage, not a teleport.
- Stair reservation X=21..27,Y=51.2..59; clear width 1.20 m; floor rise 3.60 m; 20 risers x 0.18 m; tread depth target 0.28 m; two flights of ten risers and landing >=1.20 x 1.20 m. Exact tread count, run, flight split, opening and headroom are unresolved. Do not infer 20 treads.
- Balcony clear width target 2.50 m; guardrail 1.10 m. Its exact polygon, posts, edge, supports, thresholds and drains are unresolved.
- Exterior gate schedule conflict: exterior_prop_schedule.csv places EXT_GATE at (42,18), while ROOM_COORDINATE_REGISTER.csv places GATE-01 at X=40..44,Y=0..1 and LD-GEO R2.0 describes the south/east edge. Treat gate placement BLOCKED; use the geometry authority and ask no question to owner: Claude must propose one explicit corrected anchor in the geometry change log and align every dependent schedule before placement.

Never promote PROPOSED TARGET or EDITOR-TEST REQUIRED to ENGINE-VERIFIED. Do not model final-fit openings, stair, balcony or secret-route bespoke parts until the relevant section/plan geometry is resolved. Generic reusable kit may be modelled to stated module envelope while the dependent placement remains blocked.

## 3. Mandatory geometry reconciliation before modelling
Create/update a geometry-art reconciliation sheet (append to GEOMETRY_VALIDATION_REPORT.md or add ENVIRONMENT_GEOMETRY_ART_QUERIES.csv) with these checks:
A. Rebuild footprint union and calculate wall centre-lines; shared wall generated once.
B. Reconcile vertical stack: ground FFL, upper FFL, slab, ceiling undersides, roof, soffits and parapets. Existing coordinate schedule and wall schedule retain legacy 3.2 m heights; do not use those blindly.
C. Detail bathroom partition/wet-area footprint for every room with bathroom. Current furnishing rows position vanity/toilet/shower but do not define bathroom walls, door, waterproof finish or clearances.
D. Resolve stair rise/run, tread count, intermediate landing, upper opening, guardrail and section C-C.
E. Define balcony continuous polygon, guardrail segments, post spacing, supports, drainage and thresholds.
F. Dimension ROOM 12 vestibule, wall-junction opening and ROOM 13 door; ensure two-player photo inspection and egress.
G. Resolve gate anchor discrepancy and car-to-gate drive path.
H. Reconcile each door/window centre with actual wall centre-line and clear/rough opening. W-U12 must not collide with the north-wall concealed panel.
I. Check all existing furniture bounding boxes against FIF room polygons, bathroom walls, door swings, 0.90 m paths and 1.20 m interaction zones. Existing furnishing coordinates are proposals, not approved placements.
J. Record each query with source, conflict, selected proposal, downstream files changed, verification state and evidence path.

Output a single change log. If the geometry is not editor-verified, produce a clean proposed revision and a blockout-only package; keep final-fit bespoke meshes blocked.

## 4. DCC project and file structure
Create and preserve editable source. Use this folder layout:
- Source/Environment/Architecture/
- Source/Environment/Doors/
- Source/Environment/Windows/
- Source/Environment/Props/Rooms/
- Source/Environment/Props/Shared/
- Source/Environment/Exterior/
- Source/Environment/Vehicle/
- Source/Environment/Materials/
- Source/Environment/Decals/
- Source/Characters/Guest/
- Export/FBX/Environment/...
- Export/Textures/...
- Content/Environment/Architecture/
- Content/Environment/Doors/
- Content/Environment/Windows/
- Content/Environment/Props/...
- Content/Environment/Materials/
- Content/Environment/Textures/
- Content/Environment/Decals/
- Content/Characters/Guest/
- Evidence/Environment/DCC/
- Evidence/Environment/ImportTests/
- Licenses/Environment/

Use stable Asset_IDs from ENVIRONMENT_ASSET_REGISTER.csv. File naming: SM_[ZONE]_[TYPE]_[VARIANT]_[SIZE], MAT_[SURFACE]_[VARIANT], T_[SURFACE]_[MAP]_[RES], DEC_[SURFACE]_[DAMAGE]_[VARIANT]. Put the stable Asset_ID in object custom properties/metadata and the register.

## 5. Production sequence — dependency order
### Phase 1 — source audit and geometry freeze proposal
1. Read the authority files listed in section 1.
2. Parse all CSVs; report duplicate IDs, missing referenced IDs, invalid room IDs, nonnumeric values and inconsistent units.
3. Build one coordinate conversion helper in the DCC workflow: schedule metres -> centimetres exactly x100; never apply a second conversion.
4. Resolve the geometry queries in section 3 and update the geometry change log and dependent schedules.
5. Produce dimensioned plan/sections for walls, floor/ceiling stack, stair, balcony, bathrooms and secret passage.
6. Generate a geometry-only blockout package. Do not dress it.
7. In UEFN, Claude performs the first editor verification: site extents, footprint union, room access, vertical stack, stair, balcony, ROOM12-to-ROOM13 route, player capsule and THE GUEST proxy navigation. Record evidence. Until pass, final-fit art remains blocked.

### Phase 2 — existing licensed asset source audit and integration (owner priority: existing assets first)
Before commissioning or modelling a common motel asset, use ENVIRONMENT_ASSET_SOURCE_REGISTER.csv and CLAUDE_EXISTING_ASSET_ACQUISITION_PLAN.md. The source register is a shortlist only. Claude must inspect the exact listing, acquisition/library evidence, license tier and permitted UEFN use; if purchase or account login is needed, stop and identify that external dependency without claiming acquisition. Inventory included meshes, materials, textures, collision, LODs and dependencies; map each usable source mesh to project Asset_ID; reject modern/anachronistic items and duplicates. UEFN Source/reference listings and generic Unreal Engine listings are different and must be recorded exactly. A marketplace listing is not license proof or UEFN compatibility proof. Test one representative asset/material in the target project before bulk integration. Do not use any asset until license evidence is archived and reviewed.
Only after the inventory, identify genuine gaps. Existing licensed meshes take priority for generic beds, desks, wardrobes, chairs, sinks, luggage, reception/service props and common signage. Preserve original purchased source packages; create project-side stylized variants only where the license permits. Do not model a bespoke duplicate of an adequate acquired mesh.

### Phase 3 — gap-only modular architecture and shared materials
Create original reusable families only for geometry modules or project-specific items not adequately supplied by licensed sources, in this order:
1. Calibration cube 100 cm, 1 m grid marker, 4 m wall calibration segment.
2. Exterior straight walls 400/200/100/50 cm; inside/outside corners; T-junction; end caps; exterior opening variants.
3. Interior partitions 400/200/100/50 cm; corners; T-junction; end caps; guest/service/secret opening variants.
4. Floor modules 400x400 cm, 200x200, 100x100, thresholds, exterior slab and courtyard paving.
5. Ceiling modules 400x400, 200x200, damaged/leak/access-hatch variants.
6. Baseboards, crown, door/window casings, corner trims, flashing and gutters.
7. Standard/service/double/reception door frame + leaf + handle + lock + hinge; door leaf pivot at hinge axis.
8. Window frame + sill + dirty glass + optional shutter; glass collision separate from glass material.
9. Roof parapet/edge/gutter/downspout; only after section stack reconciled.
10. Stair flights/landing/handrails/guardrails and balcony slab/rails/posts/drains only after exact geometry resolution.
11. ROOM 12 concealed panel, vestibule and ROOM 13 secret door only after route geometry resolution.

All architecture modules use 1 m primary grid and 10 cm/5 cm secondary trim increments. 4 m standard length is a reusable target, not a command to stretch a finished opening. Use explicit length variants. Do not mirror with negative scale; author mirrored variants or use approved instance transforms.

Create/adjust shared material instances and trim sheets only after source inventory. Use the material master to unify acquired meshes; create original texture/material sources only for gaps or licensed modifications. Use tileables/trim sheets for repeating surfaces and unique UV atlases only for hero/narrative props. Do not bake lighting into Base Color. Do not assume real-time reflections, wet-floor reflection, emissive bounce, translucency, Nanite or virtual textures are supported in the target project; Claude verifies actual behavior in UEFN.

### Phase 4 — shared props and gameplay-readable props (gap-only)
Use acquired licensed props first. Build only missing reception, office, storage and electrical props before room-specific dressing:
- Reception counter, bell, guest ledger, pen, key rack, ROOM13 key/tag, phone, clock, CRT security monitor, filing drawer/combination lock, desk lamp, ashtray/stationery, two waiting chairs, side table, motel photograph.
- Office desk/chair, filing cabinet, folders, calendar/notes, photo board, employee badge/uniform detail, desk phone/lamp, locked drawer, office key.
- Storage shelves, cleaning cart, toolbox, screwdriver, spare battery, service labels.
- Electrical fuse panel with A/B/C labelled sockets, three distinct fuses, breaker panel/lever, conduit/cable tray, workbench, shelves, generator console, warning labels, service key and safe interaction floor zone.
Separate the visual mesh from interaction volumes/device logic. Do not add gameplay functions to a decorative mesh.

### Phase 5 — rooms 01–13
Use existing licensed room assets first. Use ROOM_BY_ROOM_ART_SPEC.md and the placement register as the baseline, then correct placements against the reconciled geometry. Use a shared room kit with controlled variants; ROOM 05 is intentionally sparse and must not receive a full duplicate kit. Room-specific beats:
- 01: CRT impossible corridor feed; orient screen to approved sightline.
- 02: open suitcase and reachable battery pickup.
- 03: cracked mirror and a staged alternate scare if live reflection is unavailable.
- 04: telephone clue; readable English subtitle/text.
- 05: minimal dressing; ceiling footsteps source is audio, not a visible speaker by default.
- 06: missing guest photo wall; individual photo IDs and readable imagery.
- 07: restrained owner foreshadow.
- 08: subtle environmental story only; no new mandatory dependency.
- 09: diary on reachable surface; full English copy handled by gameplay/narrative, not illegible micro-text.
- 10: optional scare only.
- 11: child bed, toy chest, drawing and restrained toys.
- 12: clear concealed panel, latch at approx 1.10 m target, vestibule route clear.
- 13: bed, wardrobe, CRT, phone, four chronological photos, owner portrait, 02:13 clock, hidden compartment; two players inspect together without blocking exit.
For every room, output top-down furnished plan, asset IDs, coordinates, yaw, dimensions, collision, wall clearance, door swing, 0.90 m path and 1.20 m interaction zones.

### Phase 6 — exterior, car and signage
Use licensed period-compatible exterior assets first. Create only missing parking asphalt/curb/line markings, wet patches, generic 1980s vehicle, sign cabinet/support/tubes, gate and motor housing, vending, dumpster, parking lamps, generator, service props, conduit, road shoulder and restrained debris. Vehicle must be generic original design with no unlicensed badges or recognizable protected model trade dress. Gate remains blocked until anchor conflict is resolved. Sign lettering and Raven Motel identity are original project artwork.

### Phase 7 — narrative and character assets
Create original photos, portrait, diary page graphics, guest register, motel signage, key tags, labels and warning decals. Track text owner/source and image rights. THE GUEST is a separate character deliverable: dimensioned turnaround front/side/back, 3/4, face/hands, scale mannequin 1.80 m, A/T pose, silhouette tests 5/10/15 m, rig hierarchy, LODs and animation list. Model height 2.60 m target (permitted 2.50–2.70 m), LOD0 25–45k triangles, LOD1 12–20k, LOD2 4–8k target. Do not promise custom rig/animation compatibility until Claude verifies current UEFN NPC import path. Keep character mesh and gameplay NPC separate.

## 6. Modelling, UV, texture and material standards
- DCC units: centimetres; object scale 1, rotation applied, +Z up. Export orientation must be verified with calibration cube; record forward-axis convention.
- Architecture: clean modular topology; avoid bevels outside envelope; bevel width target 1–2 cm only on close-view hard edges and smaller where needed. No coplanar duplicate surfaces.
- Props: silhouette-first; hidden backs may be simplified. Apply weighted normals only if shading remains stable after export.
- UV0: unique UVs for baked/unique maps; tileable UVs for repeat surfaces. No unintended overlap on unique maps. UV1 only if target workflow needs it.
- Texture sets: 2K hero/close-up; 1K standard props; 512–1K small props/decals; architecture tileables 1K–2K depending texel density. These are initial budgets; profile in project and downsize where not perceptible.
- BaseColor/emissive colour sRGB. Normal, roughness, metallic and AO linear. If ORM packed, explicitly document R=AO, G=Roughness, B=Metallic; use only after the import/material pipeline confirms channel interpretation.
- Normal map convention: document OpenGL/DirectX green channel and verify in engine; do not silently flip.
- Keep material slots: architecture <=2 per module target; furniture 1–2; small props 1; vehicle <=4; character <=5. Exceptions require reason.
- Use decal atlases/instances for stains, scuffs, leaks and tire marks. Avoid unique material per decal.
- No baked lighting in albedo. Wet asphalt is roughness/normal/controlled specular treatment, not assumed screen-space reflection.
- Neon emissive mesh is the visible tube/sign. Separate UEFN light actors/devices provide illumination. Keep emissive intensity controlled and test exposure/bloom.
- Glass opacity/refraction, CRT feed, mirror scare, emissive bounce, rain/puddle response and custom shader features are editor-test items, not guaranteed features.

## 7. Collision, pivots and gameplay separation
- World architecture collision: simple boxes/convex hulls; shared walls single collision; floor collision continuous with no seams that snag the player.
- Door pivot: hinge axis at floor; closed state blocks, open state clears; interaction proxy separate.
- Furniture collision: block only where traversal, cover or gameplay requires it. Small clutter/paper/photo/cables normally no collision.
- Glass: visual mesh and physical collision configured separately. Do not make a window climbable/breakable unless gameplay requires it.
- Interactables: simple dedicated proxy/volume, with clear approach; mesh collision is not the interaction system.
- Props use ground-contact centre pivot unless register specifies otherwise; wall props use back-centre; floor tile lower-left; wall modules lower-left-back; door hinge axis.
- Avoid collision complexity for decorative damage, bevels, fabric folds, cables and small debris. No per-triangle collision on walkable surfaces or NPC navigation.
- Keep navigation volumes and player collision separate from render mesh where possible.

## 8. LOD and performance policy
Initial targets, not engine guarantees:
- Architecture large modules: LOD0/1/2; reduction approx 50% then 50% of previous, preserve silhouette/opening dimensions.
- Large props/furniture: LOD0/1; add LOD2 only if profiling requires.
- Small props/narrative paper: LOD0 only where screen contribution is negligible; use atlas/texture rather than geometry.
- Vehicle and creature: LOD0/1/2.
- LOD screen sizes must be tuned in target UEFN; record transitions and avoid pop.
- Polycount budgets are targets in the asset register; if an asset exceeds them, record actual count and reduction decision.
- Instancing/material reuse for repeated motel modules, lights and props.
- Do not use Nanite, virtual textures, translucent material or high-cost reflection path without explicit target-project confirmation.
- Benchmark one fully dressed room, corridor, reception, courtyard and parking/sign view. Record triangles, visible mesh count, material slots, texture memory, frame time, worst-case camera and target platform. Project owner/lead must supply numerical performance budget; do not invent a pass threshold.

## 9. Export and UEFN import instructions for Claude
1. Keep editable DCC source (.blend/.max/.ma) and FBX export.
2. Export one logical asset/family per FBX; selected objects only; no cameras/lights/prototypes.
3. Apply transforms, centimetre scale, +Z up; export normals/smoothing; triangulation controlled.
4. Name export exactly as register path and preserve Asset_ID metadata.
5. Textures PNG/TGA; document colour space, channels, compression expectation and normal convention.
6. In UEFN create the folder hierarchy in ASSET_IMPORT_PIPELINE.md.
7. Import calibration cube first; verify 100 cm edge. Then one wall, one door, one prop and one material. Do not batch import until these representatives pass.
8. Capture UEFN version, project build, import options and screenshots.
9. Verify mesh dimensions, orientation, pivot, normals, UVs, material slots, texture maps, collision, door swing, LOD transitions, memory and frame time.
10. After representative family passes, batch import by family; never mix unverified character/alpha/translucency content into the architecture batch.
11. Update register statuses only with evidence paths. IMPORTED is not ENGINE VERIFIED; ENGINE VERIFIED is not ACCEPTED until all acceptance checks and reviewer/date exist.

## 10. Claude UEFN verification matrix — Claude owns all tests
Claude must perform and record these tests in the actual target UEFN project:
- Calibration cube: 100 cm reads as 100 Unreal units? Confirm source-to-engine scale convention, orientation and pivot.
- Wall/floor/ceiling: no gaps, overlap, z-fighting, duplicate collision or visible UV seams at every module join.
- Doors: open/closed collision, hinge rotation, frame clearance, player capsule, interaction proxy and network state if dynamic.
- Windows/glass: material readability, collision, visibility, no unintended traversal.
- Stair: ascent/descent, capsule clearance, headroom, landing, rails, upper opening, NPC navigation.
- Balcony: continuous guardrail, fall prevention, threshold, collision, supports.
- Secret route: ROOM12 panel -> vestibule -> west junction -> upper hall -> ROOM13 and return; no teleport; two players pass/inspect; no softlock.
- Furniture: every room door swing, 0.90 m path, 1.20 m approach, collision snag and interaction reach.
- Materials: texture colour space, normal orientation, roughness/metallic response, tiling, neon emissive, glass, CRT and wet asphalt.
- Lighting: actual illumination from light actors; emissive not assumed to bounce; exposure readability for all clue surfaces.
- LOD: visual transition, no missing material/normal, no silhouette pop.
- Performance: benchmark representative scene and worst-case view using target project performance tools.
- THE GUEST: character scale, capsule, rig, NPC compatibility, route, LOS, patrol, pursuit, collision and animation; if unsupported, record compatible fallback.
- Solo/2/4 players: pass through environment, simultaneous ROOM13 photo inspection, capture/rescue and objective access only where relevant to environment.
Each test record: Test_ID, UEFN version, project revision, map/area, preconditions, exact steps, expected, observed, PASS/FAIL/BLOCKED, screenshot/video/log path, owner, date, follow-up.

## 11. Asset licence and provenance gate
For each third-party item record creator, exact source URL, license name/version, purchase proof/permission, attribution, modification rights, redistribution restrictions and permitted UEFN/Fortnite use. Archive proof in Licenses/Environment/<Asset_ID>/. No unknown-license item enters production. Prefer original models, textures, typography and photography. Do not use real motel brands, vehicle logos, copyrighted photographs or recognizable car designs without clearance. Epic/Fab/Marketplace assets must be checked against their actual license terms and project use; listing availability alone is not evidence.

## 12. Deliverable and status checklist
Claude must preserve all eight deliverables:
- ENVIRONMENT_ART_BIBLE.md
- MODULAR_ASSET_SPEC.md
- ROOM_BY_ROOM_ART_SPEC.md
- ENVIRONMENT_ASSET_REGISTER.csv
- MATERIAL_MASTER_REGISTER.csv
- PROP_PLACEMENT_REGISTER.csv
- ASSET_IMPORT_PIPELINE.md
- ENVIRONMENT_ART_ACCEPTANCE.md

Also produce/maintain:
- ENVIRONMENT_GEOMETRY_ART_QUERIES.csv or equivalent geometry change log.
- DCC source files and FBX/texture exports.
- Per-family review sheets (orthographic, wireframe, UV, collision, LOD, material).
- Licence evidence.
- UEFN import/test evidence.
- Final asset status summary.

No placeholder rows such as “all other props”. Every physical asset has a stable Asset_ID. Every placed object has a placement ID. Missing coordinates remain explicitly UNPLACED / BLOCKED, never guessed. Every numeric field has units and status classification. The documentation package is ready for execution; actual content production and engine verification remain Claude's work.


## 13. One-shot execution contract — final instruction for Claude

The project owner will provide Claude one complete execution prompt and repository access. Do not ask for a sequence of separately issued prompts. Read this entire plan and all referenced project specifications first, then execute the phases sequentially in one controlled run/session to the extent the available tools and time permit. The order inside this document is the dependency order; do not parallelise dependent geometry, DCC, import and validation steps.

The documentation author does not run UEFN, does not claim editor test results, and does not create scheduled activities. Claude must perform all actual UEFN work and produce the evidence. If Claude cannot operate the DCC application or UEFN editor directly in its current environment, it must clearly identify the exact actions requiring a human operator and produce deterministic click-by-click/import/test instructions for that operator; it must not claim those actions were performed.

### Required order of execution today
1. **Read-only audit first:** inspect repository, project files, schedules, geometry report, current asset library and source register.
2. **Data integrity:** parse and validate CSVs; repair only provable schema/data errors; reconcile every source schedule row and every asset/material reference. Retain all unplaced/blocked rows.
3. **Existing licensed assets first:** inventory the owner's already-owned content and map usable meshes/materials to stable project Asset_IDs. No purchase or license upgrade without owner approval. Do not model a generic asset that is already available in an owned and licensed source pack.
4. **Geometry resolution:** compare the current LD-GEO R2.0 proposal with the geometry validation report. It is NOT APPROVED / NOT ENGINE-VERIFIED. Resolve only from an existing authorised approval or a documented project-owner decision. Do not turn the proposal into an approval by assumption. Keep dependent assets and placements blocked.
5. **DCC and material work:** create only the missing assets and reusable masters after source inventory and geometry dependency checks. Retain editable source and export packages.
6. **UEFN calibration and representative tests:** Claude imports calibration cube, wall, door, prop and material, then runs the test matrix in section 10. No batch import before representative tests pass.
7. **Batch import and environment slice:** import eligible assets only, dress the representative benchmark slice, check collisions, materials, lighting, LODs, room clearances and performance.
8. **Final verification and report:** update every register from evidence, attach screenshots/logs/source/license paths, record blockers and counts, commit all outputs, and state what remains incomplete.

### Hard stops
- No unlicensed or unknown-provenance asset.
- No purchase or paid license upgrade without explicit project-owner approval.
- No final-fit bespoke mesh or placement against unapproved geometry.
- No invented coordinates for reception, office, storage, electrical room, gate or any other unplaced item.
- No assumption that an Unreal Engine Marketplace/Fab asset is automatically UEFN compatible.
- No claim of import, collision pass, performance pass, multiplayer pass or acceptance without actual UEFN evidence.
- No separate reminder, scheduled follow-up or automation.

### Completion accounting
Report distinct totals for: required asset IDs; existing licensed source assets inventoried; original models created; textures/materials created; assets exported; assets imported; assets engine-verified; assets accepted; placements verified; items blocked. A single aggregate “complete” percentage is not acceptable unless its numerator/denominator and acceptance definition are stated. Documentation readiness must be reported separately from physical asset completion and UEFN verification.

## 13. Current documentary package audit snapshot
At the time of this revision:
- Environment asset register: 119 asset/specification rows, 25 columns including source mode/candidate URL/license evidence/UEFN compatibility.
- Material master: 20 material specifications, 15 columns.
- Prop placement register: 286 individual placement rows, 22 columns. 91 rows are explicitly UNPLACED because the current authoritative geometry/schedules do not provide approved coordinates; 1 exterior gate row is BLOCKED due conflicting source coordinates. These are not missing silently: Claude must resolve them in the geometry/art change log.
- Cross-register integrity: every placement Asset_ID resolves to the asset register; every placement Material_ID resolves to the material master; no duplicate placement IDs were found in the audit.
- Asset source/license evidence remains NOT_ACQUIRED_OR_NOT_VERIFIED across the asset register. Source candidates and marketplace URLs are leads only, not permission to use or proof of UEFN compatibility. Claude must acquire and inspect license evidence or create an original replacement. No third-party asset is cleared for use by this documentary audit.
- No mesh, texture, material instance, DCC source, FBX export or UEFN import is claimed created by this package. All production statuses remain NOT STARTED/BLOCKED until real files and evidence exist.
- UEFN tests are exclusively Claude's responsibility. This package author has performed no UEFN editor, collision, play, performance, import or compatibility tests.

