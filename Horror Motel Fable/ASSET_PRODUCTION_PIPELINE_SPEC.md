# ASSET PRODUCTION & IMPORT PIPELINE SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **PIPELINE DESIGN BASELINE — NO ASSET ACQUISITION OR IMPORT CLAIMED**

## 1. Purpose and authority

Defines the controlled route from concept/source to accepted UEFN asset. The ASSET_AND_CONTENT_REGISTER.md and asset_manifest.csv remain the content inventory; GUEST_MODEL_SPEC.md controls THE GUEST. This document controls naming, metadata, review, import and acceptance.

No marketplace listing, concept image, external file or source project is considered acquired, licensed, imported or usable until the exact asset and rights are verified.

## 2. Asset identity and naming

Every asset must have a unique immutable Asset_ID in the manifest. Use:
- **SM_MOTEL_MODULE_VARIANT** — static mesh.
- **SK_GUEST_VARIANT** — skeletal mesh.
- **M_SURFACE / MI_SURFACE_VARIANT** — master/material instance.
- **T_ASSET_MAP** — texture.
- **A_SEQUENCE_VARIANT** — animation.
- **SFX_EVENT_VARIANT** — sound effect.
- **VO_SCENE_LINE** — voice line.
- **VFX_EVENT_VARIANT** — visual effect.
- **UI_SCREEN_ELEMENT** — UI texture/icon if imported.

Asset_ID is not the same as filename or display name. Never reuse an ID after deleting an asset; mark it RETIRED and create a new ID for replacements.

## 3. Mandatory manifest fields

Every row must contain:
- Asset_ID; display name; asset type; target location/actor.
- Source provider/creator and exact source URL or local project path.
- License name, commercial-use rights, modification rights, redistribution/UEFN publishing rights, attribution requirement and proof/archive.
- Original source filename, source revision/date and checksum where practical.
- Intended UEFN import format and target editor version.
- Dimensions in metres, scale, pivot, forward axis and units.
- Material slots and texture dependencies.
- Collision profile and whether collision is gameplay-critical.
- LOD/mesh/texture/audio memory notes and performance test status.
- Interaction/AI/navigation role and anchor IDs.
- Import status: NOT SOURCED / SOURCE VERIFIED / RIGHTS VERIFIED / PREPARED / IMPORTED / EDITOR VERIFIED / ACCEPTED / REJECTED / RETIRED.
- Owner and reviewer; acceptance evidence path.

No blank license/source field is allowed for an asset intended for publication.

## 4. Source and licensing gate

1. Prefer original project-owned assets or sources explicitly licensed for commercial use and Fortnite/UEFN publishing.
2. Confirm the exact listing/variant includes the claimed source files. A generic Unreal Engine format label does not automatically mean UEFN Source.
3. Archive license text, invoice/receipt if applicable, provider, version and date.
4. Verify whether modification, redistribution, team use and publishing in a Fortnite island are permitted.
5. Reject unclear rights, scraped assets, ripped game content, trademarked motel branding or third-party copyrighted character designs.
6. Keep source and imported output linked by Asset_ID.
7. No asset can move to RIGHTS VERIFIED based on a search snippet alone.

## 5. Geometry, pivots and collision

- Use metres in design registers; convert to Unreal centimetres only at import/build boundary.
- Static mesh pivot must match the placement convention (floor-centre or documented hinge/anchor). Doors pivot at hinge; modular wall pieces pivot at a defined end/centre.
- Document forward axis and rotation convention. No arbitrary per-instance scale to hide incorrect source dimensions.
- Modular wall/floor pieces must snap to approved R2.3 grid and FIF/centre-line conventions.
- Gameplay collision must be simple, predictable and aligned with visible geometry. Avoid per-triangle collision for walkable modular pieces unless specifically required and tested.
- Door collision must follow open/closed state; secret panels must not leave a blocking collision after opening.
- Glass collision is intentional and separately documented.
- Stair, balcony, guardrail and floor collision are mandatory acceptance targets.
- No duplicate collision surfaces at shared wall/slab junctions or U-shaped corner pads.
- AI navigation collision must not create inaccessible gaps or false walkable surfaces.

## 6. Performance targets — provisional budgets

These are authoring targets, not Fortnite guarantees. Final acceptance uses actual UEFN island memory/performance profiling.

| Asset class | Initial target | Review requirement |
|---|---|---|
| Repeated modular static mesh | 1 material slot preferred; simple collision | Instancing/reuse and draw-call review |
| Hero prop | 1–3 material slots | Collision, texture memory and visibility review |
| THE GUEST LOD0 | 25k–45k triangles target | Profile; reduce if island budget requires |
| THE GUEST LOD1/2 | 12k–20k / 4k–8k triangles target | Silhouette transition and actual LOD behaviour |
| Hero textures | 2K target | Confirm supported maps/packing and memory |
| Common prop textures | 1K target | Avoid unique texture per minor prop |
| Audio loops | One logical loop per zone/emitter | Concurrency, attenuation and voice budget |
| VFX | Minimal particles/overdraw | Test in dark interior and exterior rain |

No final triangle, texture or audio memory number is accepted without measurement in the target project.

## 7. Material and texture contract

- Define one master material per surface family and use instances for variants.
- Use only texture channels/maps supported by the selected UEFN import/material workflow.
- Keep texture naming and channel packing explicit; do not infer roughness/metallic packing from filenames.
- Maintain consistent texel density within each visual kit.
- Avoid expensive transparency and overdraw on rain, glass, grime and neon effects.
- Emissive values and post-process effects must be tested for visual readability and performance.
- Wet surfaces must not make required floor edges, steps or interactables unreadable.

## 8. Character pipeline — THE GUEST

Follow GUEST_MODEL_SPEC.md exactly for identity, dimensions, topology, rig, materials, LOD, animation list and import acceptance. Required checkpoints:
1. Owner-approved concept/turnaround.
2. Mesh and topology review.
3. Scale/pivot/axis validation.
4. Skeleton hierarchy and bind-pose review.
5. Animation clips and root-motion policy.
6. Collision capsule and door/stair clearance.
7. UEFN import test.
8. NPC/AI navigation and animation test.
9. Multiplayer replication and performance profile.

If the target UEFN release cannot import the custom rig/animations, present a compatible alternative that preserves the approved silhouette and behaviour. Do not claim equivalence without owner review if the design changes materially.

## 9. Audio and presentation asset pipeline

- AUDIO_REGISTER.csv lists source assets and emitter intent.
- AUDIO_CUE_SHEET.csv lists event triggers, priority, concurrency, spatial policy and fallback.
- UI_STRING_TABLE.csv controls subtitle and player-facing text.
- Every VO line has a stable String_ID and subtitle; mandatory clue audio has readable transcript fallback.
- Normalize/compare assets in a common review environment; document loudness target and mix priority before import.
- Use loop metadata and loop-point QA for ambience; no loop clicks.
- Spatial attenuation must be tested in rooms, corridors, stairwell and courtyard.
- Voice lines must not be masked by ambient loops or chase stingers.
- No final voice/music is accepted without rights/source and subtitle approval.

## 10. Import and acceptance sequence

1. Validate source and rights.
2. Validate file format against the actual target UEFN importer/version.
3. Normalize scale, pivot, axes, naming and dependencies.
4. Import to a dedicated content folder matching asset category.
5. Assign Asset_ID metadata and source link.
6. Apply material instances and collision profile.
7. Validate LOD/texture/audio properties in editor.
8. Place a test instance in a controlled test map.
9. Check visual quality, collision, interaction anchors, navigation and memory.
10. Record editor screenshot/log, UEFN version, asset path and measured properties.
11. Mark EDITOR VERIFIED only after reproducible evidence.
12. Mark ACCEPTED only after discipline owner review.

## 11. Folder and revision convention

Suggested project content folders:
- /Motel/Environment/Architecture
- /Motel/Environment/Props
- /Motel/Characters/TheGuest
- /Motel/Materials
- /Motel/Textures
- /Motel/Animations
- /Motel/Audio/Ambience
- /Motel/Audio/SFX
- /Motel/Audio/VO
- /Motel/VFX
- /Motel/UI
- /Motel/Maps/Test

The actual UEFN content browser path may differ; keep the Asset_ID and manifest mapping stable. Never rename/relocate a referenced asset without updating the manifest and all dependent device/Verse references.

## 12. Acceptance and rejection criteria

An asset is REJECTED if:
- source/license cannot be proven;
- scale/pivot/axis is undocumented or incorrect;
- collision blocks required routes or permits unintended traversal;
- materials/textures are unsupported or excessively expensive;
- LOD changes the approved silhouette or gameplay readability;
- import fails in target UEFN version;
- required animation/navigation/interaction dependency is unsupported;
- actual memory/performance is outside the approved island budget.

A rejected asset requires a replacement proposal linked to the same gameplay role and a new Asset_ID. It does not silently alter geometry, narrative or gameplay.
