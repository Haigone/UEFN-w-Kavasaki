# THE GUEST — 3D CHARACTER PRODUCTION SPECIFICATION
**Status:** design specification only; no mesh, rig or animation asset is included or claimed to exist.

## Identity lock
A 2.60 m tall (target) unnaturally thin adult humanoid. Pale desaturated grey skin with subtle blue undertone; long arms, narrow shoulders, shallow chest, long fingers; nearly human blank face. Worn 1980s motel employee shirt, dark trousers, old shoes, plain badge. No horns, fantasy armour, glowing eyes or gore. Fear relies on stillness, timing, silhouette and movement.

## Dimension targets
| Landmark | Target |
|---|---:|
| Total height, floor to crown | 2.60 m |
| Shoulder breadth | 0.52 m |
| Head crown-to-chin | 0.30 m |
| Neck | 0.14 m |
| Shoulder to fingertip | 1.12 m |
| Hand length | 0.24 m |
| Hand span | 0.20 m |
| Chest depth | 0.25 m |
| Pelvis breadth | 0.34 m |
| Neutral fingertip height | near knee, approximately 0.52 m above floor |
| Shoe length | 0.31 m |

These are proportion targets; build a coherent mannequin whose measured landmarks add to 2.60 m. Front/side orthographic drawings with a 1.80 m human reference are mandatory.

## Mesh and topology targets
- Hero LOD0: 25k–45k triangles target; profile in UEFN and reduce if needed.
- LOD1: 12k–20k triangles; LOD2: 4k–8k triangles.
- Skeletal mesh with separate material slots: skin, shirt, trousers, shoes, eyes/badge as required.
- UV layout: face and hands receive sufficient texel density; hide seams in low-visibility areas; avoid mirrored unique markings.
- Texture target: 2K hero base colour/normal/roughness; 1K lower LOD if justified. Confirm exact texture packing/import path.
- Pivot/root at floor between feet; document forward axis, units and scale.
- Use simple capsule collision for gameplay; do not use per-triangle collision for navigation.
- Rig must include root, pelvis, spine chain, neck, head, clavicles, upper/lower arms, hands/fingers, upper/lower legs and feet. Provide bind-pose screenshot and bone hierarchy.
- Confirm custom skeletal mesh and animation import compatibility with the current UEFN release before production.

## Material direction
- Skin: rough, waxy, desaturated, subtle mottling; no wet gore.
- Shirt: faded grey-beige cotton, collar softened, sweat/dirt staining subtle.
- Trousers: charcoal-brown, worn knees and hems.
- Shoes: dark, matte, scuffed.
- Badge: small tarnished rectangle; no legible brand or real-world trademark.
- Provide Base Color, Normal and roughness data; use only maps supported by the selected pipeline.

## Required turnaround deliverables
1. Front orthographic neutral pose, full body, annotated height.
2. Side orthographic neutral pose, full body.
3. Back orthographic neutral pose, full body.
4. Three-quarter hero render.
5. Face close-up.
6. Hand close-up with scale.
7. 1.80 m human comparison.
8. A-pose/T-pose rigging view.
9. Silhouette at 5, 10 and 15 m in actual motel corridor lighting.
10. Material callout sheet.
All views must show the same exact character proportions, clothing, badge, face and materials.

## Animation list
| Animation | Duration target | Loop | Gameplay purpose |
|---|---:|---|---|
| Idle / near-still breathing | 6–10 s | Yes | Distant presence |
| Slow walk | 2–3 s cycle | Yes | Patrol |
| Head turn | 1.2–2.0 s | No | Detection/unease |
| Investigate lean | 1.5–2.5 s | No | Sound investigation |
| Chase run | 0.8–1.2 s cycle | Yes | Pursuit |
| Reach/capture | 1.0–1.5 s | No | Player capture |
| Search lean | 2–3 s | No | Hiding search |
| Retreat/disappear | 1.5–3 s | No | Scare beat |
| Balcony still silhouette | 4–8 s | Yes/hold | Scripted sighting |
| Owner reveal pose | 3–5 s | Hold | ROOM 13 reveal |

## LOD and performance validation
Check silhouette readability at target distance; test shadows and material cost in dark corridor. LOD transitions must not visibly alter the long-arm silhouette. Record actual triangle count, texture memory, material slots and measured frame impact. These targets are not Fortnite performance guarantees.

## Import acceptance
- Scale check: 2.60 m in editor.
- Correct forward axis and floor pivot.
- Skeleton retarget/import tested.
- Collision capsule does not snag doorframes.
- LODs switch correctly.
- Animations play without root drift or foot sliding.
- Multiplayer replication and NPC locomotion tested.
- If any requirement is unsupported, document the limitation and a UEFN-compatible fallback.


## UEFN production execution addendum — R1

### A. Deliverable package and naming

Deliver the following source package under one immutable character revision:
- GUEST_TURNAROUND_FRONT.png, GUEST_TURNAROUND_SIDE.png, GUEST_TURNAROUND_BACK.png.
- GUEST_HERO_3Q.png, GUEST_FACE_CLOSEUP.png, GUEST_HAND_CLOSEUP.png, GUEST_SCALE_180.png.
- GUEST_RIG_APOSE.png and GUEST_BONE_HIERARCHY.png.
- GUEST_MATERIAL_CALLOUT.png.
- Source mesh, UV layout, texture sources, skeleton file, animation source files and export settings.
- Imported asset paths and UEFN screenshots for skeletal mesh, skeleton tree, animation preview and NPC Character Definition.

Use stable names: SK_GUEST_LOD0, SK_GUEST_LOD1, SK_GUEST_LOD2, SKEL_GUEST, MI_GUEST_SKIN, MI_GUEST_SHIRT, MI_GUEST_TROUSERS, MI_GUEST_SHOES and AN_GUEST_[STATE]. The manifest Asset_ID remains the immutable join key; filenames may change only through manifest revision.

### B. Build and rig order

1. Lock the approved concept and dimensions before sculpting.
2. Build neutral base mesh in A-pose; confirm 2.60 m from sole to crown.
3. Separate material zones and establish clean deformation topology at shoulders, elbows, wrists, hips, knees, ankles, neck and jaw.
4. UV unwrap; keep face/hands highest texel density; avoid unique mirrored marks.
5. Rig root/pelvis/spine/chest/neck/head/clavicles/upper arms/lower arms/hands/fingers/upper legs/lower legs/feet/toes. Use consistent naming and documented retarget pose.
6. Skin weights: test deep crouch, reach, fast run, head turn and capture reach; no collapsing elbows/knees or stretched shoulder seams.
7. Author animation clips in the order Idle, Walk, HeadTurn, Investigate, Chase, Capture, Search, Retreat, BalconySilhouette, OwnerReveal.
8. Keep root motion disabled unless the target NPC behavior proof specifically requires and supports it. Default to in-place clips with navigation driving translation.
9. Export mesh and animations using one compatible skeleton and one documented unit/axis convention.
10. Import into a clean UEFN test project. Confirm mesh, skeleton, materials, animation assets and device/character definition workflow.
11. Attach the mesh to the selected NPC Character Definition and behavior script; test animation transitions while navigating.
12. Only then integrate with motel geometry.

### C. Platform capability status

Epic documents skeletal mesh and animation import/playback in UEFN, including the Animated Mesh device. Epic also documents custom NPC Character Definitions and NPC behavior scripts. NPC Spawner is Beta. These references establish the availability of an import and NPC implementation route, not proof that this exact mesh, rig, animation set or NPC behavior works in the island.

The combined proof is mandatory: imported SK_GUEST + NPC Character Definition + custom behavior + navigatable movement + each required animation state. Record exact UEFN build, import settings, compile output, screenshots and solo/2P/4P results. See UEFN_VERIFIED_REFERENCE_REGISTER_R1.md.

### D. Acceptance gates

- GUEST-A01 concept dimensions and identity locked.
- GUEST-A02 mesh dimensions measured at 2.60 m in editor.
- GUEST-A03 topology and material slots reviewed.
- GUEST-A04 skeleton hierarchy and bind pose reviewed.
- GUEST-A05 every animation clip plays on the same skeleton.
- GUEST-A06 no root drift or foot sliding outside approved tolerance.
- GUEST-A07 capsule fits all approved doors and stair route.
- GUEST-A08 NPC navigates ground and upper floors including stair without clipping/stuck state.
- GUEST-A09 capture animation aligns with the capture transaction; animation failure uses deterministic fallback.
- GUEST-A10 LOD silhouette remains consistent at 5/10/15 m.
- GUEST-A11 memory/performance measured in target island.
- GUEST-A12 1/2/4 player replication tested.
