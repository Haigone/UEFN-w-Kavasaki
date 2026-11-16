# ASSET & CONTENT REGISTER
## THE MOTEL: ROOM 13

This is the initial asset brief for modelling, kitbashing or selecting UEFN-compatible assets. Asset dimensions are targets; confirm against the final corrected geometry. Use original or properly licensed assets. Do not use assets with unclear rights.

## 1. Core architectural kit
Create modular pieces with consistent pivots, grid increments and collision:
- Exterior wall straight segments, corners and end caps.
- Interior partition segments and corners.
- Floor modules and ceiling modules.
- Door frames: standard, service, double utility and reception entrance.
- Door leaves, handles, locks and hinges.
- Window frames, dirty glass, sill and shutters.
- Stair flight, landing, handrail and guardrail.
- Balcony floor, railings and support posts.
- Roof edge, parapet, gutter and downspout.
- Courtyard paving and drainage.
- Parking curb, asphalt patch and road shoulder.
- Secret passage wall panels and concealed door.
- ROOM 13 transition pieces designed to create spatial disorientation without blocking navigation.

## 2. Exterior props
- RAVEN MOTEL neon sign (red/blue emissive).
- Broken 1980s-style car, interior and exterior variants.
- Parking lines, wheel stops and oil stains.
- Dumpster and scattered service waste.
- Vending machine.
- Outdoor wall lamps and parking fixtures.
- Rain puddles, wet asphalt decals, weeds and dead plants.
- Roadside signpost and motel information board.
- Utility box, cable conduit, generator and gate motor.

## 3. Reception props
- Reception counter and back shelving.
- Desk bell.
- Guest register and pen.
- Key rack with numbered hooks.
- ROOM 13 key and tag.
- Telephone.
- Wall clock.
- CRT security monitor.
- Filing drawer and combination lock.
- Desk lamp, ashtray, papers and stationery.
- Waiting chairs and side table.
- Old framed motel photograph.

## 4. Office props
- Owner desk and chair.
- Filing cabinet and document folders.
- Calendar and wall notes.
- Photograph frames and photo board.
- Employee badge / motel uniform detail.
- Desk phone and lamp.
- Locked drawer and office key.
- Old computer or typewriter only if visually consistent with 1986.

## 5. Room kit and room-specific props
Common kit:
- Bed frame, mattress, pillow, blanket.
- Bedside table and lamp.
- Wardrobe, luggage rack and suitcase.
- Curtains, blinds and dirty windows.
- Carpet, wallpaper, ceiling stains.
- Bathroom sink, mirror, shower/tub, toilet and tiles.
- TV CRT, remote, telephone and wall art.
- Hiding furniture if gameplay supports it.

Unique props:
- ROOM 01: CRT image/screen material showing impossible corridor feed.
- ROOM 02: open suitcase, loose papers and battery pickup.
- ROOM 03: cracked mirror with controlled reflection scare.
- ROOM 04: ringing telephone and clue recording.
- ROOM 05: ceiling sound source / hidden speaker placement.
- ROOM 06: missing guest photographs.
- ROOM 09: diary and history documents.
- ROOM 11: toys, child's drawing and small furniture.
- ROOM 12: concealed panel and wall damage.
- ROOM 13: owner portrait, four chronological photos, 02:13 clock, CRT, bed, wardrobe and phone.

## 6. Utility and service props
- Fuse cabinet and labelled slots A/B/C.
- Three distinct fuse pickups.
- Breaker panel and lever.
- Electrical conduit, cable trays and warning labels.
- Maintenance shelves.
- Toolbox, screwdriver, ladder and cleaning cart.
- Generator, fuel tank dressing and service key lock.
- Gate control panel and motor.

## 7. THE GUEST asset requirements
Model package:
- Full-body skeletal mesh or verified UEFN-compatible character solution.
- Height target 2.5–2.7 m.
- Very thin silhouette.
- Pale/grey skin.
- Long arms and slightly unnatural proportions.
- Old motel employee uniform.
- Almost human blank face.
- Footwear and cloth details readable at distance.
- LODs and collision appropriate to Fortnite performance.

Animation / pose needs (subject to verified rig and NPC workflow):
- Idle / distant observation.
- Slow walk.
- Patrol turn.
- Head turn / observe.
- Investigate sound.
- Chase run.
- Capture pose.
- Search / lean.
- Retreat / disappear.
- Scripted balcony silhouette.
If custom animation integration is unavailable, use only a verified compatible rig/animation path and adjust presentation accordingly. Do not claim custom skeletal animation is working until tested in UEFN.

## 8. Materials and surface library
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
- MAT_Paint_Peeling
- MAT_Ceiling_Water_Damage
- MAT_Fabric_Motel
- MAT_Skin_Guest_Pale

## 9. Lighting and VFX register
- Exterior cold-blue fill and rain visibility.
- Neon sign emissive with controlled bloom.
- Reception warm practical light.
- Corridor low amber fixtures.
- Room lamps with individual on/off states.
- Upper floor night-blue ambience.
- ROOM 13 red practical and subtle flicker.
- Emergency red final chase lighting.
- Fog and post-process volumes where performance permits.
- Mirror/reflection scare method verified for UEFN.
- Dust motes and restrained environmental particles.
- Rain VFX and puddle response if within budget.

## 10. Audio register
- SFX_Rain_Exterior_Loop
- SFX_Wind_Roadside_Loop
- SFX_Neon_Hum_Loop
- SFX_Fluorescent_Buzz_Loop
- SFX_CRT_Static_Loop
- SFX_Phone_Ring
- SFX_Desk_Bell
- SFX_Footsteps_Player_Walk
- SFX_Footsteps_Player_Run
- SFX_Guest_Footsteps
- SFX_Guest_Breath
- SFX_Guest_Cloth
- SFX_Fuse_Insert
- SFX_Breaker_Activate
- SFX_Door_Lock
- SFX_Door_Creak
- SFX_Capture_Stinger
- SFX_Chase_Stinger
- SFX_Room13_Ambience
- SFX_Final_Radio
- VO_Reception_Welcome

All voice and written content in game must be English. Provide subtitle text and trigger conditions for all narrative VO.

## 11. Asset metadata required
Every asset entry must include:
- Asset ID and display name.
- Type and intended location.
- Dimensions and pivot.
- Material assignments.
- Collision profile.
- LOD / performance notes.
- Gameplay role (if any).
- Source / license.
- Import status and UEFN validation status.

## 12. Asset priority
Priority 0 — playable blockout:
- Walls, floors, doors, stairs, balcony, room boundaries, key interaction props, puzzle props, basic monster proxy, chase barriers.

Priority 1 — readable gameplay:
- Reception, register, fuse panel, photographs, CRTs, telephone, hiding props, key props, generator and gate.

Priority 2 — atmosphere:
- Neon, signage, room dressing, wallpaper, carpets, grime, weather, lighting and audio.

Priority 3 — polish:
- Custom creature detail, unique animations, high-quality cinematic dressing, extra decals and optional environmental storytelling.

Do not build Priority 2 or 3 while Priority 0 geometry or critical interactions are failing.
