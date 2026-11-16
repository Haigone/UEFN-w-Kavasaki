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


## Revision 2.0 — execution responsibility and verification record
All DCC export and UEFN import/test actions in this pipeline are assigned to Claude (or a named human artist/editor operator explicitly delegated by Claude). The documentation author does not perform UEFN tests. Claude must verify the calibration cube, then one representative wall, door, prop and material before batch import. No engine compatibility is assumed from an FBX export alone.
Use `LEVEL_DESIGN_GEOMETRY.md` LD-GEO R2.0 for placement; do not treat E1 legacy wall heights, balcony width or ROOM 13 door coordinates as approved. Reconcile vertical stack, stair, balcony, bathroom partitions, ROOM 12 vestibule/secret route and gate anchor before final-fit assets. Generic modular pieces can be authored independently.
Required test report fields: Test_ID, Asset_ID/Family, UEFN version, project revision, import options, test map/area, preconditions, exact steps, expected result, observed result, PASS/FAIL/BLOCKED, evidence path, owner and date. Update asset status only after evidence exists. IMPORTED, ENGINE VERIFIED and ACCEPTED are distinct states.



## Revision 3.0 — existing asset acquisition and integration (owner decision)

The preferred route is existing assets first. Use ENVIRONMENT_ASSET_SOURCE_REGISTER.csv as a research shortlist only. No candidate is acquired, licensed, downloaded or imported by virtue of appearing there.

### Phase A — acquisition evidence (human/Fab account owner)
1. Open the exact listing URL and confirm product title and publisher.
2. Confirm the product remains available and inspect the included format panel.
3. Select the license tier permitted by the project owner's actual revenue/eligibility and intended use. Do not choose a tier by guess.
4. Save invoice/library proof and the license/EULA version to Licenses/Environment/[Source_Candidate_ID]/.
5. Record modification rights, redistribution restrictions, attribution, UEFN reference-only limitations, source access and any third-party exclusions.
6. If the product has no UEFN Source/reference option, mark UEFN compatibility UNCONFIRMED until an authorized import test passes.
7. Do not place a purchased Unreal Engine pack into UEFN solely because the listing says Unreal Engine.

### Phase B — source inventory (Claude)
For each acquired package, Claude must:
- Inventory every included Static Mesh, material, texture, Blueprint, plugin and demo map.
- Identify useful meshes and map each to project Asset_ID; record source object path and source package.
- Mark duplicate/overlapping assets so the project does not acquire redundant packs.
- Flag modern/anachronistic objects, branding, unsupported Blueprint dependencies, Nanite/virtual texture/translucency assumptions and missing collision/LODs.
- Preserve original source assets; create project variants only where the license permits modification.
- Prefer native UEFN reference content when the purchased listing supplies it. Otherwise test a representative static mesh and material import path before bulk adoption.

### Phase C — art-direction integration
Apply the stylized-realism adapter in ENVIRONMENT_ART_BIBLE.md: restrained desaturation, warm/cool palette, controlled roughness, moderate normals, readable wear decals and limited shared material instances. Remove/hide modern flat screens, contemporary electronics, pool accessories and non-period signage from placed scenes. Do not alter source files or redistribute derivative packages beyond the license.

### Phase D — gap production
Only after inventory and geometry approval may original project-specific meshes be commissioned/created for gaps: Raven Motel sign artwork, ROOM 13 unique clock/photo/diary narrative props, secret panel geometry, custom gameplay interaction proxies and any fit-dependent architecture. Existing assets are not to be recreated without a documented gap justification.

### Status definitions
SHORTLISTED_NOT_ACQUIRED; ACQUIRED_LICENSE_PENDING_REVIEW; LICENSE_VERIFIED; SOURCE_INVENTORIED; IMPORT_TEST_REQUIRED; IMPORTED; ENGINE_VERIFIED; ACCEPTED; REJECTED. Listing presence is not acquisition. Acquisition is not compatibility. Import is not acceptance.


## Revision 4.0 — current production gate (2026-11-16)

This pipeline does not authorize a bulk import or imply that any source pack is acquired. Current register state is design-only: all asset rows remain NOT IMPORTED and NOT VERIFIED; source candidates are shortlist entries, not rights-cleared inventory. Before acquisition, record owner-confirmed package possession and exact license evidence. Before mapping source meshes to Asset_IDs, inspect actual package contents and dimensions. Generic, geometry-independent samples may be evaluated in a separate test project only by the designated operator; no UEFN tests are part of this document audit. Final-fit architecture, door/window openings, stairs, balcony, roof, bathrooms, gate and ROOM 12/13 route remain blocked until CHAT 02 canonical geometry is approved. Claude must record any later UEFN import evidence; never change status based on a listing or a planned test.
