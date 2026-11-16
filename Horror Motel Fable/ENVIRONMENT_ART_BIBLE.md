# ENVIRONMENT ART BIBLE — THE MOTEL: ROOM 13
Revision 1.0 | 2026-11-16 | Status: PRODUCTION SPECIFICATION — GEOMETRY DEPENDENT

## 1. Purpose and authority
This document defines the environment-art target for the 1986 American motel. It is a production specification, not evidence that meshes, textures or UEFN content have been created. Geometry authority remains the approved, editor-verified level package. Current Executive Floorplans E1 are a dimensioned proposal and are NOT accepted for final art placement.

Priority of authority:
1. Editor-verified geometry and approved change log.
2. Current approved schedules and coordinate datum.
3. This art bible and its linked registers.
4. Conceptual mood references.

When a conflict exists, stop the affected asset and raise a geometry query; do not silently move a wall, door or prop.

## 2. Project visual identity
- Setting: roadside American motel, 1986.
- Mood: isolated, rain-soaked, neglected but once commercially ordinary; dread through believable decay and spatial repetition.
- Primary read: faded roadside hospitality, cheap maintenance, damp interiors, unreliable electrical systems and one impossible room.
- Avoid: contemporary fixtures, modern flat screens, RGB gaming aesthetics, excessive gore, fantasy ornament, uniformly ruined surfaces.

## 3. Visual language by zone
| Zone | Base condition | Accent / focal point | Wear story |
|---|---|---|---|
| Exterior / parking | aged asphalt, stained concrete, wet surfaces | Raven Motel red/blue neon | tire marks, oil, puddles, weeds |
| Courtyard | damp concrete, cracked paving | cold practicals, vending machine | runoff, algae, chipped curb |
| Guest corridors | burgundy worn carpet, yellowed wallpaper | weak amber wall lights | traffic lanes, corner scuffs |
| Guest rooms | beige/yellowed paper, dark wood, faded fabric | warm bedside practical | water marks, faded sun patches |
| Bathrooms | cream ceramic, stained grout, dull chrome | cold/greenish fluorescent | limescale, rust, cracked sealant |
| Reception | dark stained timber, aged tile | warm desk lamp and neon spill | hand polish, scratches, paper clutter |
| Office / service | painted plaster, utilitarian metal | desk lamp / bare fluorescent | labels, dust, grease, oxidation |
| ROOM 13 | same motel vocabulary but subtly wrong | red practical, 02:13 clock, photo wall | deliberate visual discontinuity, not random clutter |

## 4. Palette and material response
Use restrained, low-saturation base colors. Keep color values in material source files and master register; final values require in-engine lighting review.
- Warm aged paper: muted cream / nicotine yellow, never bright white.
- Carpet: deep burgundy with desaturated traffic wear.
- Wood: dark walnut-stained veneer, chipped edges and exposed substrate.
- Metal: oxidized steel, dull brass and worn chrome only where period-appropriate.
- Exterior: cold blue ambient, neutral wet asphalt and controlled red/blue neon.
- ROOM 13: red practical is an accent, not a full-screen red wash.

## 5. Surface construction rules
- Build believable roughness variation; do not use color noise as a substitute for surface form.
- Damage follows use and water flow: edge wear, foot traffic, corners, leaks beneath roof/wet areas.
- Decals must be separate, atlased or instanced where practical; avoid unique materials for every stain.
- Use trim sheets and tileables for repeated architecture. Reserve unique UVs for hero props and readable narrative objects.
- Keep texture detail legible at intended camera distance; no micro-detail that disappears in first-person play.
- Use normal maps for shallow surface detail; do not model every crack or carpet fibre.

## 6. Period-authenticity rules (1986)
Preferred: CRT televisions, rotary or push-button corded phones consistent with the chosen art reference, paper guest ledgers, physical keys and tags, mechanical wall clocks, fluorescent tubes, incandescent practical lamps, analog signage, metal luggage racks and period-appropriate furniture.
Do not introduce smartphones, LED panels, modern card readers, contemporary smart appliances or modern vehicle design language. Any computer must be approved against the narrative and period.

## 7. Lighting and VFX handoff
Environment meshes must support the lighting plan; lighting is authored in UEFN and is not baked into albedo. Emissive neon meshes provide the visible tube/sign surface; separate lighting actors or approved lighting devices provide actual illumination. Avoid relying on emissive alone to light the scene.
Rain, puddle response, fog, particles, mirror scare and flicker require in-editor performance and visual validation. No shader or reflection trick is assumed available until tested in the target UEFN project.

## 8. Scale, axes and pivots
- World datum: site south-west corner = (0,0,0); +X east, +Y north, +Z up.
- World schedules are metres; UEFN placement is centimetres (m × 100).
- Mesh source units: centimetres; apply transforms before export.
- Architectural modules: pivot at lower-left / lower-back corner for wall segments; floor tiles at lower-left corner; doors at hinge axis; props at ground contact centre unless the register says otherwise.
- Local +X is module length, +Y thickness/depth, +Z up. Front-facing prop direction is local +X unless specified.
- No negative scale; use mirrored variants or approved instancing.

## 9. Asset naming
Meshes: SM_[ZONE]_[TYPE]_[VARIANT]_[SIZE]
Materials: MAT_[SURFACE]_[VARIANT]
Textures: T_[SURFACE]_[MAP]_[RES]
Decals: DEC_[SURFACE]_[DAMAGE]_[VARIANT]
Examples: SM_ARCH_WALL_EXT_STRAIGHT_400, SM_PROP_CRT_01, MAT_CARPET_BURGUNDY_WORN, T_WALLPAPER_BASECOLOR_2K.
Use stable Asset_ID from ENVIRONMENT_ASSET_REGISTER.csv as the source identifier. Do not rename IDs to match file names without updating all registers.

## 10. Performance intent
All budgets in the registers are proposed targets, not engine guarantees. Prefer modular reuse, material sharing, atlases, simple collision and restrained material slots. Establish a representative room + corridor + exterior benchmark scene before scaling production. Record actual frame time, memory and asset count from UEFN profiling; do not claim a performance pass from polygon counts alone.

## 11. Production status vocabulary
NOT STARTED / BLOCKED / IN PROGRESS / MODEL REVIEW / TEXTURE REVIEW / READY FOR IMPORT / IMPORTED / ENGINE VERIFIED / ACCEPTED.
A design row is not a model. IMPORTED is not ENGINE VERIFIED. ACCEPTED requires evidence and reviewer/date.
