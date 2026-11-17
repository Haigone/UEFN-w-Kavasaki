# THE GUEST — PRODUCTION PACKAGE R3 (batch 02)

Authority: [GUEST_MODEL_SPEC.md](GUEST_MODEL_SPEC.md) (identity lock, dimensions, animation list) and [CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md](CLAUDE_AUTONOMOUS_EXECUTION_ADDENDUM_R1.md) §4. This file records what exists, what the executor could verify, and the exact external brief for the final character. It does not claim a game-ready character exists.

## 1. Current in-game state (COMPLETED interim, R3-DEC-022)

| Item | Value |
|---|---|
| Actor | `THE GUEST proxy` (`BP_R3_Guest`, a project Blueprint that Verse drives as `creative_prop`) |
| Mesh | `/Game/Creative/Devices/Mannequin/Meshes/CP_Device_Mannequin_01` (first-party static mesh, 165.6 cm, A-pose, blank head) |
| Scale | 0.75 × 0.80 × 1.57 → 260 cm tall, 90 cm across the hanging hands, 26 cm deep |
| Material | `R3/Materials/M_R3_GuestSkin` (original): base colour 0.30/0.32/0.35, roughness 0.72, specular 0.35. Waxy, desaturated grey with a cool tint; no emissive and no eyes |
| Pivot | Feet on the floor datum (self-test T17: Z = 386) |
| Facing | Mesh faces −Y; Verse applies `Yaw + 90°` so it faces its direction of travel |
| Movement | Waypoint patrol / chase by `MoveTo` (0.3 s steps, 2.6 m/s chase) — never teleported while visible |
| Presence cues | Floorboard creak emitter follows it; per-player heartbeat within 8 m; dust burst on first appearance; capture red-out |
| Evidence | `evidence/B02/B02_guest_vs_180cm_front.png`, `…_side.png` (next to a 1.80 m reference) |

Limitations of the interim body: rigid (no walk cycle, head turn or reach); arms do not hang to the knee (spec ≈ 0.52 m fingertip height); no shirt/trousers/badge material split (single material slot); no LODs beyond the source mesh. Silhouette, height, thinness and blank face follow the identity lock.

## 2. Tool availability (verified in this editor build)

| Need | Available here? | Notes |
|---|---|---|
| Sculpt / model / retopo / UV / texture | NO | No DCC tool or authorised 3D generation tool in the executor environment |
| Rig and skin | NO | Control Rig exists in UEFN for animating existing skeletons, not for authoring a new skinned rig |
| Import skeletal mesh | YES | `EditorToolset.SkeletalMeshToolset` (import mesh file as SkeletalMesh; inspect LOD, materials, bones, physics asset, sockets) |
| Import static mesh / textures / audio | YES | `StaticMeshToolset`, `TextureToolset`, `SoundWaveToolset` |
| Physics asset (capsule collision) | YES | `PhysicsToolsets.PhysicsAssetToolset` |
| Animation authoring / retarget | PARTIAL | Sequencer + Control Rig tools exist; source animations must come from the rig author |
| Fab library install (glb/gltf) | YES, owner account only | `EmporiumToolset.FabLibraryToolset` installs listings the owner already licenses; any purchase is owner-only |
| NPC with custom character | UNVERIFIED | Requires a working navmesh first (R3-BLK-010); prove in an isolated test level before replacing the waypoint Guest |

## 3. Definitive visual design (final character)

- **Silhouette:** 2.60 m, narrow shoulders (0.52 m), shallow chest (0.25 m), arms long enough that fingertips rest near the knee (≈ 0.52 m above the floor); head 0.30 m; slight forward neck tilt. It must read in one glance at 15 m in the dark corridor.
- **Face:** almost human, smooth, no visible eyes (deep shadowed sockets with no shine), closed thin mouth; no horns, gore, glow or teeth.
- **Clothing:** faded grey-beige 1980s motel employee short-sleeve shirt with soft collar, plain tarnished rectangular badge with no legible text or brand, charcoal-brown trousers worn at the knees, dark scuffed shoes (0.31 m).
- **Skin:** rough, waxy, desaturated grey with a cold blue undertone and faint mottling; hands and face get the most texel density.
- **Motion character:** slow, mostly still, sudden repositioning between still poses; never runs on all fours, never leaps.

## 4. External production brief (deliverable package)

1. **Concept / model sheet** (front, side, back, 3/4, face, hand with scale, 1.80 m comparison, silhouettes at 5/10/15 m in corridor light). Same proportions in every view.
2. **Mesh:** LOD0 25–45 k triangles, LOD1 12–20 k, LOD2 4–8 k; material slots skin / shirt / trousers / shoes / badge; 2K base colour, normal and ORM per slot (1K for LOD2 if required).
3. **Skeleton:** root at the floor between the feet, Z-up, X-forward, centimetres; root → pelvis → spine_01…03 → neck → head; clavicle/upper/lower arm/hand with 5-finger chains; thigh/calf/foot/ball. Use the UE5 mannequin bone names where possible so Fortnite retargeting is easiest. Bind pose = A-pose.
4. **Collision:** physics asset with a simple capsule (radius 0.30 m, half-height 1.30 m) for gameplay; no per-poly collision.
5. **Animations** (30 fps, root motion off unless noted, same skeleton):

| ID | Clip | Length | Loop | Gameplay hook |
|---|---|---:|---|---|
| ANM-01 | Idle / near-still breathing | 6–10 s | yes | dormant, balcony sighting |
| ANM-02 | Slow walk | 2–3 s cycle | yes | patrol |
| ANM-03 | Head turn L/R | 1.2–2.0 s | no | detection / unease |
| ANM-04 | Investigate lean | 1.5–2.5 s | no | sound investigation |
| ANM-05 | Search lean (hiding spots) | 2–3 s | no | wardrobe search |
| ANM-06 | Chase run | 0.8–1.2 s cycle | yes | pursuit (2.6 m/s) |
| ANM-07 | Reach / capture | 1.0–1.5 s | no | capture (IN-022 start) |
| ANM-08 | Retreat / disappear | 1.5–3 s | no | scare beat |
| ANM-09 | Balcony still silhouette | 4–8 s | hold | scripted sighting |
| ANM-10 | Owner reveal pose | 3–5 s | hold | ROOM 13 reveal |
| ANM-11 | Turn-in-place 90°/180° | 0.8–1.2 s | no | transitions between patrol legs |
| ANM-12 | Idle → walk / walk → chase transitions | 0.3–0.6 s | no | blend smoothing |

6. **Export:** FBX 2020, Z-up, cm, separate files for the skinned mesh (all LODs) and each clip; texture PNG/TGA. Include a licence/authorship statement (original work, all rights transferable to the project owner).

## 5. UEFN integration and acceptance (when the files exist)

1. Import with `SkeletalMeshToolset` into `R3/Characters/Guest/`; check 2.60 m height, forward axis, floor pivot, bone count, LOD switch distances.
2. Build the physics asset (capsule) with `PhysicsAssetToolset`; door-frame snag test at every 0.9 m door.
3. Import the clips; verify no root drift / foot sliding in Sequencer.
4. Validate with a push (asset reference policy, memory). Record triangle count, texture memory and frame impact (Spatial Profiler) against §8 of the batch 02 report.
5. Prove the NPC path in an isolated test level first (navigation required, R3-BLK-010). Until it passes, keep the waypoint Guest and drive the skeletal mesh as a `creative_prop`/animated prop only if UEFN supports it.
6. Register every file in `ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv` (CHAR_GUEST_* rows) with source, licence and checksum.

## 6. Status

| Item | Status |
|---|---|
| Interim in-game body | COMPLETED (R3-DEC-022) |
| Design definition and production brief | COMPLETED (this file) |
| Model sheet images | BLOCKED — no authorised image/3D generation tool in the executor environment |
| Mesh, rig, LODs, animations | BLOCKED (R3-BLK-001) — external production required |
| Import / NPC integration test | NOT RUN — no source files; navigation blocked (R3-BLK-010) |
