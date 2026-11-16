# MODULAR ASSET SPECIFICATION
Revision 1.0 | THE MOTEL: ROOM 13 | Status: SPECIFICATION ONLY

## 1. Grid and module strategy
Primary architectural grid: 100 cm. Secondary trim increments: 10 cm and 5 cm only where needed. Proposed standard wall module length 400 cm, with 200 cm, 100 cm, 50 cm infill/end-cap variants. These are production targets and must be reconciled against the final wall schedule before modelling.

- Exterior wall thickness target: 30 cm.
- Interior partition thickness target: 15 cm.
- Ground finished floor: Z=0 cm; upper finished floor: Z=360 cm (candidate target).
- Clear-height targets: ground 300 cm; upper 280 cm. Exact wall mesh top, slab soffit, ceiling underside and roof elevations are not frozen.
- Do not author a fixed wall height or roof module as final-fit until a coordinated section reconciles the 25 cm upper slab target, ceiling void/services and roof build-up.

## 2. Required modular families
| Family | Required variants | Proposed module envelope | Pivot |
|---|---|---:|---|
| Exterior wall | straight, inside/outside corner, T-junction, end cap, window opening, service opening | 400×30×variable; clear height target 300 cm GF / 280 cm UF | lower-left-back |
| Interior wall | straight, corner, T-junction, end cap, door opening, concealed panel opening | 400×15×variable; clear height target 300 cm GF / 280 cm UF | lower-left-back |
| Floor | interior tile, exterior slab, balcony, threshold, stair landing | 400×400×25 cm | lower-left |
| Ceiling | plain, access hatch, damaged/leak variant | 400×400×15 cm | lower-left |
| Trim | baseboard, crown, corner trim, door casing, window casing | 400 cm linear | start end |
| Door frame | guest, service, double utility, reception | opening-specific | lower-left |
| Door leaf | standard, service, double, concealed | schedule-specific | hinge axis |
| Window | guest, reception, dirty glass, broken pane | schedule-specific | lower-left |
| Stair | flight, intermediate landing, handrail, guardrail | geometry-specific | bottom-left |
| Balcony | slab, fascia, rail, post, drain | geometry-specific | lower-left |
| Roof | parapet, edge, gutter, downspout, flashing | 400 cm linear | start end |
| Secret route | wall panel, concealed door, frame, trim | 90×210 cm clear target | hinge axis / wall datum |

## 3. Wall construction
Model the wall shell as one consistent thickness per wall class. Do not model two coincident wall meshes for adjacent rooms. Openings must be authored from the approved door/window schedule. For reusable wall openings, expose the opening dimensions as variant metadata; do not stretch a finished opening mesh to arbitrary dimensions.

Architectural mesh bounds must be exact to centimetre in source file. Any bevel/chamfer must remain inside the stated envelope unless an explicit overhang is recorded. UV seams and trim alignment must not become visible at module joins.

## 4. Floor and ceiling
Use separate floor and ceiling modules so collision, material and damage variants can be controlled. Floor modules should not overlap wall collision. Add dedicated thresholds and stair nosings. Wet exterior paving is a separate material/decals treatment, not a second coplanar floor surface.

Ceiling stains are decals or shallow geometry only where silhouette matters. Ceiling access panels require explicit interaction clearance and must not overlap lights or beams.

## 5. Doors and windows
Door mesh pivot is at hinge axis, at floor level. Local +Z is up. Door swing direction is driven by schedule, not inferred from mesh orientation. Provide separate frame, leaf, handle, lock and hinge meshes where interaction or animation requires them. Collision states: closed blocking, open non-blocking as appropriate; test in UEFN.

Windows require frame, sill, glass and optional shutter. Glass collision must match gameplay; dirty glass material must not create an unintended sightline or traversal opening. Broken glass is a visual variant unless gameplay explicitly requires fragments.

## 6. Stair and balcony
Stair asset cannot be finalized from the current target alone. E1 proposes 20 risers at 18 cm and 28 cm tread depth, two flights of ten, 120 cm clear width and 120×120 cm intermediate landing. Resolve the exact flight footprint, nosing, railing, floor opening and head clearance in the approved geometry before modelling. Provide left/right handrail variants and end caps.

Balcony: 150 cm clear walking width target, 110 cm guardrail height target. Exact slab polygon, rail segments, post spacing, door thresholds and drainage are BLOCKED pending geometry approval.

## 7. Hidden passage / ROOM 13
Build only after the geometry issue is resolved. Candidate LD-GEO R2.0 route: ROOM 12 north-wall concealed panel centre approx X=68.60,Y=47.55; east vestibule X=64.30..72.90,Y=47.85..49.35; west junction passage centred near Y=48.60; upper north hall; ROOM 13 south-wall door near X=56.35,Y=50.95. Align wall schedule, door schedule, prop placement and section D-D to one continuous physical route. Do not create the superseded west-wall opening or duplicate doors.

## 8. Collision and LOD
- Architecture: simple box/convex collision, no detailed collision on decorative bevels.
- Props: simple collision for large furniture; no collision for paper, photos, cables, small clutter unless interaction requires it.
- Interactables: separate simple interaction proxy; visual mesh collision should not be the only gameplay interaction definition.
- LOD0/1/2 triangle targets are in ENVIRONMENT_ASSET_REGISTER.csv. Use actual screen-size transitions after UEFN import review; do not assume a specific engine transition threshold.
- LODs for small props may be omitted when screen contribution is negligible; record rationale.
- Nanite, virtual textures and advanced material features are not assumed. Test only against the target UEFN version and project settings.

## 9. Export conventions
Static meshes: FBX, centimetres, applied transforms, triangulation controlled and verified, smoothing groups/normals exported, no hidden objects, no duplicate faces, UV0 for texture, UV1/lightmap only if the target pipeline requires it. Keep a native editable source file (e.g. .blend or .max) alongside exports.
Texture sources: PNG or TGA; final import format chosen to match UEFN pipeline. Normal maps exported with correct tangent-space convention. Use consistent naming and avoid embedded colour-profile surprises.
Character: separate pipeline; skeletal FBX only after rig, skeleton and animation compatibility are validated with the actual UEFN/NPC workflow.

## 10. Required review package per family
Provide front/side/top orthographic screenshots, dimensions, pivot marker, wireframe, UV layout, material preview, collision preview, LOD comparison, source/export file list and a UEFN import screenshot. No family is ACCEPTED based only on a beauty render.


## Revision 2.0 — LD-GEO R2.0 implementation override
Use `LEVEL_DESIGN_GEOMETRY.md` LD-GEO R2.0 as geometry authority. The standard 4m module length and 1m grid remain reusable production targets. Exterior thickness = 30cm; interior partition thickness = 15cm. Floor levels: ground FFL 0cm; upper FFL 360cm. Do not freeze wall height at 320cm or ceiling/roof levels until a coordinated section defines ground clear height 300cm, upper clear height 280cm, upper slab 25cm, ceiling undersides and roof stack.
Balcony is 250cm clear width target, not the E1 150cm value. Stair target is 120cm clear width, 20 risers x18cm, 28cm tread depth; exact tread count, run, intermediate landing and headroom must be dimensioned. Stair flight/landing/handrail assets remain BLOCKED for final fit.
ROOM 12 panel centre target is (68.60,47.55); route includes a 1.40m-minimum vestibule, 0.90m west wall junction opening centred near Y48.60, north hall and ROOM 13 south entry near (56.35,50.95). The secret panel is not the old west-wall opening described in earlier schedule variants. Align wall schedule, door schedule, prop placement and section D-D before creating bespoke pieces.
Gate anchor conflict remains BLOCKED. Do not use EXT_GATE (42,18) as final without reconciling it with GATE-01 at X40..44/Y0..1 and the R2 south/east edge description.
All modules may be modelled as reusable generic pieces, but any opening, stair, balcony, roof, bathroom or secret-route custom variant is final-fit BLOCKED until its dimensions are coordinated. All measurements remain PROPOSED TARGET or EDITOR-TEST REQUIRED, never ENGINE-VERIFIED without Claude's UEFN evidence.



## Revision 3.0 — existing asset integration and stylized-realism adapter

Owner preference is existing licensed assets first. Do not start by modelling the full architecture/prop list. Evaluate the candidate packs in ENVIRONMENT_ASSET_SOURCE_REGISTER.csv and map their actual included mesh names to the stable project Asset_IDs only after the files are acquired and inspected.

### Asset acceptance before adoption
For each candidate pack:
1. Confirm exact product and publisher in Fab Library.
2. Archive license terms and acquisition evidence.
3. Confirm the acquired product includes the format actually needed (prefer UEFN Source/reference path; FBX/Blender source only where legally supplied and importable).
4. Inspect the overview/demo map and enumerate actual meshes/materials/textures.
5. Measure representative assets in DCC/UEFN; do not rely on promotional dimensions.
6. Check pivot, axis, scale, UVs, material slots, texture sizes, collision, LODs and dependency/plugin requirements.
7. Test one representative asset in the target UEFN project; record version, options, screenshot and result.
8. Only then set the source mapping and update Asset_ID status.

### Stylized-realism adapter
Use one common art-direction pass across packs:
- Desaturate and remap base colours to the project palette; maintain readable warm/cool separation.
- Normalize roughness ranges by surface family; remove glossy plastic unless period object requires it.
- Keep normals moderate; do not turn bevels or damage into high-frequency noise.
- Apply controlled, reusable dirt/leak/edge-wear decals as separate project assets.
- Use a small number of shared master materials/instances; do not preserve dozens of redundant pack-specific material instances without reason.
- Remove or hide anachronistic content (flat-screen TVs, modern electronics, pool accessories, contemporary logos) from selected sets.
- Do not recolour, edit, repackage or redistribute third-party assets unless the exact license permits it.

### Geometry dependency classes
- **Independent / safe to evaluate now:** loose furniture, desk clutter, phones, CRTs, photo frames, lamps, vending machine, dumpster, signage props, car static mesh and material samples. Their final placement remains pending.
- **Fit-dependent / blocked:** wall modules with openings, window assemblies, stairs, balcony, roof, bathroom partitions, secret door/vestibule and gate assembly. Source candidates may be previewed, but final-fit placement/variants cannot be approved until geometry is approved.
- **Original-only gap candidates:** Raven Motel custom sign face, ROOM 13 clock/photographic narrative art, hidden panel disguise, unique puzzle props, custom collision proxies and any geometry that must match the final floorplan exactly.

### Revised geometry correction
Use the geometry authority and current execution plan only as proposed coordination references. Remove stale values from earlier spec text: balcony 150 cm is superseded by 250 cm clear-width target; legacy 320 cm wall height and 680/710 cm ceiling/roof stack are not approved. Stair run/tread count/landing, vertical stack, bathroom partitions, gate anchor and secret route remain BLOCKED.
