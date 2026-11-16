# ASSET IMPORT PIPELINE — BLENDER / DCC TO UEFN
Revision 1.0 | Status: PIPELINE PROPOSAL — ENGINE TEST REQUIRED

## 1. Gate 0 — source and rights
Before modelling or downloading:
- Record creator, source URL, license name/version, proof of purchase or permission, attribution obligations, modification rights, redistribution restrictions and project usage scope.
- Keep a copy/screenshot/PDF of the license in the project asset evidence folder.
- Marketplace/Epic content must follow its applicable license and UEFN usage rules; do not assume a marketplace listing grants unrestricted reuse outside its ecosystem.
- No asset with unknown provenance enters production.
- For third-party branded vehicles, signage, photographs, logos or fonts, obtain clearance or create an original generic alternative.

## 2. Gate 1 — DCC preparation
- Work in centimetres; scene unit scale consistent with export.
- Apply object scale and rotation; verify dimensions against register.
- Set pivot according to modular spec; origin must be intentional.
- Ensure outward normals, no duplicate faces, no non-manifold geometry on collision surfaces, no accidental loose objects.
- Use clean naming and stable Asset_ID.
- UV0: texture UVs, no unintended overlap for unique maps. UV1 only if required by selected import/lighting workflow.
- Keep material slots minimal and consistent with MATERIAL_MASTER_REGISTER.csv.
- Triangulate only with a controlled modifier/export rule and inspect shading after triangulation.
- Export selected objects only; no cameras, lights, hidden prototypes or unrelated collections.

## 3. Gate 2 — export package
Static mesh FBX:
- FBX, centimetre scale, applied transforms, +Z up, correct forward axis agreed by DCC team and tested with a calibration cube.
- Smoothing/normals exported and checked.
- One file per logical asset or tightly related modular family.
- Native editable source retained (.blend/.max/.ma as applicable).
- Filename must match asset register.
Textures:
- PNG/TGA source; Base Color, Normal and packed ORM only where supported by chosen material workflow.
- sRGB for base colour/emissive colour; linear data treatment for normal/roughness/metallic/AO.
- Explicitly document channel packing and normal convention.
- Avoid unsupported alpha/translucency until tested.
Character:
- Skeletal FBX only after skeleton, bone naming, scale, root orientation and animation import path are validated with a minimal test character.

## 4. Gate 3 — UEFN import
For each test import:
1. Create a clean test folder/project copy or isolated test area.
2. Import one calibration asset and verify dimensions, orientation, pivot and normals.
3. Import a representative wall, door, prop and material before batch import.
4. Configure collision deliberately; inspect simple/complex collision and player traversal.
5. Check texture compression, normal orientation, material parameter compatibility and emissive behaviour.
6. Verify LOD import and screen-size transition in the actual target project; do not assume automatic LOD behaviour.
7. Check memory, draw calls/material count and frame time in a representative scene.
8. Capture screenshots and record UEFN version, project settings, import options and test date.

## 5. Collision standards
- Architectural collision: simple boxes/convex hulls; avoid per-triangle collision on walkable architecture unless a specific test proves it necessary.
- Doors: closed state blocks traversal; open state permits traversal; hinge/pivot and interaction proxy verified.
- Furniture: collision only where player movement, cover or gameplay needs it. Decorative clutter generally non-colliding.
- Interactables: separate interaction volume/proxy; do not rely on mesh collision alone.
- Glass: test visibility and collision separately. A transparent material does not imply correct physical behaviour.
- No collision on photos, paper sheets, tiny debris or emissive tubes unless required.

## 6. Gate 4 — validation and release
Checklist per asset:
- Dimensions and scale match register.
- Pivot matches spec.
- Materials and texture maps resolve.
- Collision does not snag player capsule or NPC.
- LODs switch without silhouette pop or material loss.
- Naming and content path match.
- License evidence exists.
- UEFN import screenshot and test notes attached.
- Status updated only with evidence.
A failed check returns asset to IN PROGRESS; do not mark accepted by visual inspection alone.

## 7. Folder convention
Content/Environment/Architecture
Content/Environment/Doors
Content/Environment/Windows
Content/Environment/Props
Content/Environment/Exterior
Content/Environment/Materials
Content/Environment/Textures
Content/Characters/Guest
Source/Environment/...
Evidence/Environment/ImportTests/...
Licenses/Environment/...
