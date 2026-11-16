 > **GEOMETRY STATUS NOTICE — 2026-11-16:** This file is retained as historical source material. Its room allocations, door positions, stair location, balcony dimensions, ROOM 13 placement and vertical datums conflict with owner-approved LD-GEO R2.3. Do not use this file as a placement authority. The sole current geometry authority is `LD_GEO_R2.3_APPROVAL_RECORD.md`, `LEVEL_DESIGN_R2.3_INDEX.md`, `LEVEL_DESIGN_GEOMETRY.md` and the controlled R2.3 schedules. R2.3 is approved as design only and is not UEFN/editor verified.

# EXECUTIVE BUILD DOSSIER — GEOMETRY, FURNITURE & THE GUEST
## THE MOTEL: ROOM 13 | Revision 1 — dimensional design specification

**Status:** detailed design proposal for UEFN blockout. Dimensions below are authored targets, not measurements of an existing island. They must be checked in the editor against modular kit dimensions, player collision, selected NPC navigation and UEFN memory/performance. This file does not claim that a mesh, map or NPC has already been created.

**Units:** metres unless stated otherwise. Coordinates are world metres; convert to Unreal centimetres by multiplying by 100.

---

# A. SITE AND LEVEL DATUM

- Site: 84 × 72 m.
- Origin: south-west site corner (0,0,0).
- +X east; +Y north; +Z up.
- Ground-floor finished floor: Z=0.00.
- Upper-floor finished floor: Z=3.60.
- Ground-floor clear ceiling target: 3.00 m; underside upper slab approx. Z=3.20.
- Upper-floor clear ceiling target: 2.80 m; roof/ceiling top target Z=6.55.
- Exterior wall thickness: 0.30 m.
- Interior partition thickness: 0.15 m.
- Floor slab target: 0.20 m.
- Standard door clear opening: 0.90 W × 2.10 H.
- Service door: 1.00 × 2.10.
- Double utility door: 1.60 × 2.10.
- Main reception entry: 1.60 × 2.30.
- Standard corridor clear width: 2.50 m.
- Balcony clear width: 2.50 m.
- Stair clear width: 1.20 m.
- All heights and widths must be tested in first person with the actual player capsule.

# B. BUILDING FOOTPRINT — CONTROLLED U SHAPE

Use three connected rectangular wings, modelled as a single coherent footprint. The courtyard remains open to sky.

| Wing | Outer bounds (X min–max, Y min–max) | Purpose |
|---|---|---|
| West | X 8.00–20.00, Y 18.00–60.00 | Ground rooms 01–03; upper circulation/rooms where scheduled |
| East | X 64.00–76.00, Y 18.00–60.00 | Ground rooms 04–06; upper secret-room/service zone |
| North | X 8.00–76.00, Y 48.00–60.00 | Reception and service functions; upper rooms 07–12 |
| Courtyard | X 20.00–64.00, Y 18.00–48.00 | Open-air central court |

**Boolean footprint rule:** the north wing joins the west/east wings at their north ends. Do not place duplicate floor slabs or duplicate wall segments inside the 12×12 m corner intersections. Build one continuous footprint polygon or trim the intersecting rectangles into non-overlapping polygons. The courtyard polygon must remain empty.

# C. GROUND FLOOR — ROOM AND CIRCULATION SCHEDULE

The west and east wings are mirrored. Each has an outer room strip 8.70 m wide and an inner corridor strip 2.50 m wide.

## C1. West wing — rooms 01–03

- Outer room strip: X 8.30–17.00.
- Corridor: X 17.20–19.70; clear width 2.50.
- Wall/service tolerance: 0.20 m between room strip and corridor reserved for partitions and finishes.
- Room 01: X 8.30–17.00, Y 20.00–27.00; nominal clear footprint 8.70×7.00.
- Room 02: X 8.30–17.00, Y 27.50–34.50; 8.70×7.00.
- Room 03: X 8.30–17.00, Y 35.00–42.00; 8.70×7.00.
- Cross-connection at north end: keep Y 42.00–48.00 available as corridor/turning and connection zone.
- Doors: 0.90×2.10, on east wall of each room, centred at Y 23.50, 31.00 and 38.50 respectively; swing into room unless collision tests require sliding/alternate hinge.
- Windows: on west exterior wall, 1.60×1.20, sill Z=0.90, centred in each room's Y span.
- Bathroom allowance per room: reserve 2.20×2.40 m in north-west corner; do not reduce clear route from entry to bed.

## C2. East wing — rooms 04–06

- Outer room strip: X 67.00–75.70.
- Corridor: X 64.30–66.80; clear width 2.50.
- Room 04: X 67.00–75.70, Y 20.00–27.00.
- Room 05: X 67.00–75.70, Y 27.50–34.50.
- Room 06: X 67.00–75.70, Y 35.00–42.00.
- Doors: 0.90×2.10 on west wall, centred at Y 23.50, 31.00 and 38.50.
- Windows: east exterior wall, 1.60×1.20, sill Z=0.90.
- Bathroom allowance: 2.20×2.40 m in north-east corner.
- Keep Y 42.00–48.00 as turning/connection zone.

## C3. North wing — ground-floor functions

North wing bounds X 8–76, Y 48–60. Ground-floor plan uses:
- Reception: X 20.00–34.00, Y 48.30–59.70 (14.00×11.40).
- Owner office: X 34.30–43.30, Y 48.30–54.00 (9.00×5.70).
- Storage: X 43.60–52.60, Y 48.30–54.00 (9.00×5.70).
- Electrical/utility: X 52.90–64.00, Y 48.30–59.70 (11.10×11.40).
- West connector/lobby: X 8.30–19.70, Y 48.30–59.70.
- East connector/service lobby: X 64.30–75.70, Y 48.30–59.70.
- Use partitions to separate rooms; ensure each zone has a 0.90 m minimum door or open circulation connection.
- Reception main entry faces courtyard/south, centred near X=27.00, on south wall Y=48.00; 1.60 m wide.
- Reception-to-office door: 0.90 m, on shared wall near Y=51.00.
- Office-to-storage door: 0.90 m, on shared wall near Y=51.00.
- Storage-to-utility connection: 0.90 m on shared wall near Y=51.00.
- Utility service exit: 1.00 m on east or north exterior wall; do not let it bypass mandatory progression unintentionally.
- Provide an unobstructed route from courtyard to reception and from each wing corridor to the north connector.

**Important drafting instruction:** these bounds define room allocation zones, not permission to create intersecting solid rectangles. Draw internal walls as shared boundaries exactly once. Check that door positions do not overlap corner junctions, furniture or each other.

# D. UPPER FLOOR AND BALCONY

## D1. North upper wing rooms 07–12

Reserve upper-floor room band X=8.30–63.70, Y=50.80–59.70. Split into six bays of equal nominal width 9.23 m:
- Room 07: X 8.30–17.53.
- Room 08: X 17.53–26.76.
- Room 09: X 26.76–35.99.
- Room 10: X 35.99–45.22.
- Room 11: X 45.22–54.45.
- Room 12: X 54.45–63.70.
- Each room nominal depth 8.90 m; adjust clear internal dimensions for 0.15 m partitions.
- Corridor/balcony band: Y=48.10–50.60, clear width 2.50 m.
- Doors open from south-facing room wall into balcony corridor; standard 0.90×2.10.
- Exterior windows on north wall where appropriate; 1.60×1.20, sill 0.90 m above upper floor.
- Room 09 contains diary; Room 11 child room; Room 12 concealed access panel.

## D2. Stair
- Main stair located in west connector zone; reserve rectangle X=10.00–14.00, Y=44.00–48.00 for stair/landing connection, subject to a continuous path to upper balcony.
- Clear stair width 1.20 m.
- Floor-to-floor rise 3.60 m.
- Preliminary 20 risers at 0.18 m each; tread depth target 0.28 m; verify total run and landing geometry in editor.
- Provide top and bottom landing at least 1.20 m deep.
- Guardrail height target 1.00 m.
- Do not accept this stair until actual UEFN collision and player movement tests pass.

## D3. Balcony
- Balcony/corridor follows courtyard-facing south side of upper north wing, Y=48.10–50.60.
- Guardrail on courtyard edge, height target 1.05 m.
- Provide clear 2.50 m walking width after rails/props.
- No decorative furniture may narrow the clear path.
- Stair landing connects without a step or collision seam.
- Keep one continuous safe route between rooms 07–12 and the stair/secret route.

# E. ROOM 13 — SECRET SPATIAL POCKET

ROOM 13 must not overlap rooms 07–12 or the ground-floor utility room. Use the upper east wing's northern end as a concealed pocket:
- Secret access vestibule: X=64.30–66.80, Y=52.00–56.00.
- Concealed passage: nominal clear width 1.40 m, height 2.30 m, routed from Room 12's east-side concealed panel through the east connector zone.
- ROOM 13 pocket: X=67.00–75.70, Y=43.00–47.50, upper level only; nominal 8.70×4.50 m.
- Entry door hidden in false wall, clear 0.90×2.10.
- Provide an exit back to the passage; no dead-end trap.
- The room's apparent impossible geometry is achieved by controlled sightlines, offset interior wall, false depth and sound, not by intersecting collision volumes.
- Validate that the route is connected to upper-floor circulation and does not require players to cross exterior space.
- If this routing cannot be made collision-free with the actual wall kit, revise the pocket location and update all schedules before construction. No room is approved until top-down and vertical section agree.

# F. EXTERIOR LANDMARKS AND PROP ANCHORS

Approximate placement anchors:
- Broken car: X=34–40, Y=5–10; orient front toward site exit/road.
- Neon sign: X=39–45, Y=15; face toward south approach.
- Courtyard entrance: centred around X=42, Y=18; keep a clear 3 m player route.
- Vending machine: X=21–24, Y=25–28; leave 1.2 m interaction space.
- Dumpster: X=70–74, Y=20–24; keep outside the critical chase route.
- Light anchors: (25,12), (59,12), (25,43), (59,43). Adjust to avoid glare and maintain readable contrast.
- Generator: east service side, reserve approx. 3×2 m footprint with 1.5 m interaction clearance.
- Gate: south/east site boundary; provide clear vehicle route at least 4 m wide.

# G. FURNITURE PLACEMENT — STANDARD MOTEL ROOM KIT

Furniture sizes are bounding-box targets (W×D×H), not vendor asset dimensions. Position with 0.10–0.20 m wall clearance and preserve a 0.90 m player route wherever possible.

For each ordinary room:
- Bed: 1.60×2.10×0.55 m; headboard against outer wall.
- Two bedside tables: 0.45×0.45×0.55 m.
- Wardrobe: 1.20×0.60×2.00 m.
- Luggage rack: 0.75×0.45×0.55 m.
- Desk: 1.10×0.55×0.75 m.
- Chair: 0.48×0.50×0.90 m.
- CRT TV: 0.55×0.50×0.50 m, on desk or cabinet; screen centre approx. 1.20 m above floor.
- Telephone: 0.18×0.22×0.12 m.
- Floor lamp: base diameter 0.30 m, height 1.50 m.
- Bathroom vanity: 0.80×0.50×0.85 m.
- Toilet: approx. 0.40×0.70×0.75 m.
- Shower footprint: 0.90×0.90 m.
- Mirror: 0.60×0.90 m.
- Curtain rod/window dressing aligned to window opening.
- No prop collision should block the door swing or player capsule.

## G1. Unique room dressing

ROOM 01:
- CRT on cabinet facing bed; screen visible from doorway.
- TV cabinet 0.90×0.45×0.65 m.
- Screen material shows a pre-authored impossible corridor view; do not rely on a live camera feature until verified.
- Place one chair 0.50×0.50 m at 1.2 m from TV.

ROOM 02:
- Suitcase 0.70×0.45×0.25 m open on luggage rack or floor.
- Battery pickup on suitcase insert; interaction radius 2 m.
- Leave clear 0.90 m path to exit.

ROOM 03:
- Bathroom mirror 0.60×0.90 m, mounted above vanity.
- Crack decal/material; reflection scare can be a timed visual replacement or staged prop, not an assumed real-time mirror reflection.
- Keep bathroom light switch reachable.

ROOM 04:
- Telephone on bedside table.
- Audio clue triggered once; subtitles always available.
- Do not make the clue audible only.

ROOM 05:
- Keep room visually sparse.
- Place hidden audio source above ceiling or use spatialized audio from an adjacent volume.
- No physical object should imply an inaccessible crawlspace unless one exists.

ROOM 06:
- Photo wall with 4–6 frames, each approx. 0.20×0.25 m.
- One framed image duplicates the owner portrait motif.
- Ensure at least one readable clue at close inspection.

ROOM 09:
- Diary approx. 0.18×0.24 m, placed on bedside table or desk.
- Open-page readable text panel; no tiny texture-only mandatory clue.

ROOM 11:
- Child bed 0.90×1.90 m.
- Toy chest 0.80×0.45×0.50 m.
- Toy blocks and drawing; keep floor route open.
- Drawing includes a silhouette with long arms.

ROOM 12:
- Concealed panel 0.90×2.10 m or equivalent wall section.
- Hidden latch at approx. 1.10 m height.
- Panel opening animation only if supported; otherwise use a controlled visibility/collision transition.

ROOM 13:
- Bed 1.60×2.10 m, wardrobe 1.20×0.60×2.00 m, CRT 0.55×0.50×0.50 m, phone, four photos, owner portrait and clock.
- Clock face approx. 0.35 m diameter fixed at 02:13.
- Four photo frames approx. 0.25×0.30 m each, mounted at reachable height 1.30–1.70 m.
- Four interaction points spaced at least 0.50 m apart.
- Hidden compartment approx. 0.60×0.30×0.25 m.
- Ensure room supports two players inspecting simultaneously without collision overlap.

## G2. Reception furniture
- Main counter: 3.60×0.90×1.10 m; counter interaction side at 0.75–1.10 m height.
- Desk bell: 0.10×0.10×0.08 m.
- Register book: 0.30×0.22×0.05 m.
- Key rack: 1.20×0.12×0.80 m.
- Wall clock: 0.35 m diameter, centre 2.10 m high.
- Telephone: 0.20×0.22×0.15 m.
- CRT security monitor: 0.55×0.50×0.50 m.
- Waiting chair: 0.65×0.65×0.90 m; two units.
- Keep 1.50 m clear space in front of the counter for multiple players.

## G3. Office furniture
- Desk: 1.80×0.80×0.75 m.
- Office chair: 0.65×0.65×1.10 m.
- Filing cabinet: 0.90×0.45×1.30 m.
- Photo board: 1.50×0.08×1.00 m.
- Desk lamp: 0.25×0.25×0.45 m.
- Locked drawer: 0.50×0.45×0.20 m.
- Maintain a 0.90 m clear route from entry to puzzle board.

## G4. Electrical room
- Fuse panel: 1.20×0.25×1.40 m, interaction centre 1.20 m above floor.
- Three labelled fuse sockets A/B/C, each approx. 0.15 m apart.
- Workbench: 1.50×0.70×0.90 m.
- Shelving: 0.90×0.45×2.00 m.
- Generator control console: 0.80×0.50×1.10 m.
- Keep 1.20 m clearance in front of panel and 0.90 m circulation route.

# H. THE GUEST — 3D CHARACTER MODEL SPECIFICATION

## H1. Silhouette and proportions
- Overall height: 2.60 m target; acceptable design range 2.50–2.70 m.
- Adult humanoid silhouette, extremely thin.
- Shoulder width: 0.48–0.55 m.
- Chest depth: 0.22–0.28 m.
- Head height: 0.28–0.32 m.
- Neck length: 0.12–0.16 m.
- Arm length shoulder-to-fingertip: 1.05–1.20 m.
- Hand length: 0.22–0.26 m.
- Leg length hip-to-floor: 1.25–1.35 m.
- Hands hang near knee level in neutral pose.
- Slight forward head posture; shoulders narrow and uneven.
- Avoid exaggerated gore; fear is from anatomy, timing and expression.

## H2. Head and face
- Head: elongated oval, slightly narrow jaw.
- Skin: pale grey with subtle desaturated blue undertone.
- Eyes: dark, small-to-medium, minimal visible sclera; no glowing fantasy eyes.
- Mouth: nearly neutral horizontal line, minimal expression.
- Nose and ears human-like but slightly simplified.
- No obvious exposed teeth in default idle.
- Face must read at 5–10 m in low light; avoid tiny detail as the only source of expression.

## H3. Uniform
- Old motel employee uniform, late-1970s/1980s cut.
- Faded charcoal/brown trousers.
- Pale grey-beige short-sleeve or long-sleeve work shirt.
- Small rectangular name badge with no legible real-world brand.
- Dark belt, worn shoes.
- Fabric staining and wear subtle, not excessively bloody.
- Optional small embroidered raven motif on chest.
- Uniform silhouette must remain readable against dark corridors.

## H4. Mesh, rig and materials
- Create one full-body skeletal character mesh plus separate optional eyes/teeth if required.
- Target triangle budget: 25k–45k triangles for the hero creature LOD0; reduce if platform performance requires.
- LOD1 target: 12k–20k; LOD2 target: 4k–8k.
- Texture sets: BaseColor, Normal, ORM or equivalent supported packing; 2K primary textures, reduce to 1K where distance/performance allows.
- Material slots target: skin, shirt, trousers, shoes, eyes, accessories (keep slots minimal).
- Skeleton: humanoid-compatible rig if the selected UEFN NPC pipeline requires it; validate retargeting and animation support.
- Collision: simple capsule/character collision; do not use complex per-triangle collision for navigation.
- Root/pivot at floor between feet; forward axis must match the chosen UEFN character convention.
- Test silhouette at 3 m, 8 m and 15 m under the motel lighting.

## H5. Required animation set
1. Idle — nearly motionless, subtle breathing.
2. Head turn — slow, unnatural rotation.
3. Walk — deliberate long stride, arms hanging.
4. Patrol turn — upper body turns before feet.
5. Investigate — lean/head tilt toward sound.
6. Chase — long, fast strides; avoid exaggerated monster sprint.
7. Capture — reach forward with long arms.
8. Search — slow bend/lean into hiding space.
9. Retreat — reverse into darkness or turn away.
10. Scripted balcony silhouette — static pose.
11. ROOM 13 reveal pose — same body proportions as owner portrait.
Animation duration and blending must be authored and tested in the actual rig/UEFN path. Do not claim these animations play until imported and validated.

## H6. Model sheet deliverables for artist / 3D generation
Produce:
- Front orthographic full-body view.
- Side orthographic full-body view.
- Back orthographic full-body view.
- 3/4 hero view.
- Face close-up neutral.
- Hand close-up showing length and proportions.
- Uniform material callouts.
- Neutral A-pose or T-pose suitable for rigging.
- Scale reference beside a 1.80 m human mannequin.
- Separate silhouette sheet in dark corridor lighting.
The model sheet is a visual reference; the production mesh, skeleton, textures and animations are separate deliverables.

# I. LIGHTING, MATERIALS AND WEATHER TARGETS

- Parking: cold blue ambience, target 6500–8000 K visual impression.
- Reception: warm practicals, target 2700–3200 K.
- Corridors: dirty amber, target 2200–2800 K.
- Rooms: muted warm lamps, target 2400–3000 K.
- Upper floor: cool blue, target 7000–9000 K visual impression.
- ROOM 13: dark red practicals, avoid making clue text unreadable.
- Escape: red emergency accents plus sufficient neutral fill to read routes.
- Neon: red/blue emissive surfaces; use bloom sparingly.
- Rain: visible in exterior light cones, not so dense that it obscures navigation.
Colour-temperature values are artistic references, not guaranteed UEFN light controls.

Material library:
- MAT_Carpet_Burgundy_Worn
- MAT_Wallpaper_Beige_Yellowed
- MAT_Wood_Reception_Dark
- MAT_Tile_Bathroom_Cream
- MAT_Asphalt_Wet
- MAT_Concrete_Aged
- MAT_Metal_Rusted
- MAT_Glass_Dirty
- MAT_Neon_Red_Emissive
- MAT_Neon_Blue_Emissive
- MAT_Guest_Skin_Pale
- MAT_Guest_Uniform_Faded

# J. DOOR, WINDOW AND PROP SCHEDULE REQUIREMENTS

For every placed object in the final coordinate CSV, record:
- Unique ID.
- Floor and room.
- World X/Y/Z.
- Rotation yaw.
- Bounding dimensions W/D/H.
- Asset or mesh name.
- Material set.
- Collision setting.
- Interactable? yes/no.
- Interaction range.
- Gameplay function.
- Verification status: proposed / placed / collision-tested / gameplay-tested.

For every door and window, record centre coordinate, wall orientation, opening width/height, sill height (window), swing/slide direction and collision behaviour.

# K. REQUIRED OUTPUTS BEFORE LEVEL ART APPROVAL

Claude must generate and commit:
1. Ground floor plan with dimensions and room labels.
2. Upper floor plan with dimensions and room labels.
3. Building section showing both floors, ceiling heights and roof.
4. Stair plan and section with riser/tread count.
5. Secret passage / ROOM 13 plan and section.
6. Monster/player chase route diagram.
7. Full coordinate CSV for walls, openings, furniture, pickups, triggers, lights and patrol points.
8. THE GUEST model sheet and production asset brief.
9. Room-by-room furniture placement table.
10. Collision and navigation validation report.

**No decorative build approval** until all ten outputs are internally consistent. If the proposed ROOM 13 coordinates or stair routing fail collision checks, revise the geometry rather than forcing overlapping meshes.
