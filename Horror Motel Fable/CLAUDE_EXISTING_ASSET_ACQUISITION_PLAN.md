# CLAUDE — EXISTING ENVIRONMENT ASSET ACQUISITION & INTEGRATION PLAN
Revision 1.0 | THE MOTEL: ROOM 13 | Owner decision: existing assets first / stylized realism / geometry UNKNOWN
Status: EXECUTION PLAN ONLY — NO ASSETS ACQUIRED OR IMPORTED BY THIS DOCUMENT

## 0. Non-negotiable operating contract
The repository is a specification and coordination reference, not an asset source. Do not claim an asset is owned, licensed, downloaded, imported, compatible or verified until you have the relevant library/package evidence and, for UEFN, an editor test record. Do not invent Fab account access or make purchases. If purchase/login is required, stop and identify the exact user action needed. The documentation author has not performed UEFN tests; Claude owns editor verification.

The geometry is UNKNOWN. LD-GEO R2.0 is a candidate reference, not an approved final plan. Do not final-place or finalize any fit-dependent asset. The site envelope and coordinate convention can guide preview only.

## 1. Read in this exact order
1. MASTER_PROMPT_FOR_CLAUDE.md
2. PRODUCTION_DETAIL_REQUIREMENTS.md
3. LEVEL_DESIGN_GEOMETRY.md
4. GEOMETRY_VALIDATION_REPORT.md
5. CLAUDE_ENVIRONMENT_ART_EXECUTION_PLAN.md
6. ENVIRONMENT_ART_BIBLE.md
7. MODULAR_ASSET_SPEC.md
8. ENVIRONMENT_ASSET_SOURCE_REGISTER.csv
9. ENVIRONMENT_ASSET_REGISTER.csv
10. MATERIAL_MASTER_REGISTER.csv
11. ROOM_BY_ROOM_ART_SPEC.md
12. room_furnishing_schedule.csv and exterior_prop_schedule.csv
13. PROP_PLACEMENT_REGISTER.csv
14. ASSET_IMPORT_PIPELINE.md and ENVIRONMENT_ART_ACCEPTANCE.md

If a path or document is absent in the working repository, report it. Do not silently replace it with an older revision.

## 2. Candidate acquisition priority
Use ENVIRONMENT_ASSET_SOURCE_REGISTER.csv as the only current shortlist. Candidates are research leads, not approved assets.

### Priority A — test first
- SRC_MOTEL_UEFN — Motel by Volodymyr Stepaniuk. Fab listing advertises UEFN referenced assets. Verify exact product, acquired format, reference path restrictions and source availability. Candidate for shell/modules only after scale, collision and style inspection.
- SRC_PROPHAUS_BUNDLE — Motel and Hotel Props Bundle by PropHaus. Listing states 50+ static meshes across 14 listings and includes UEFN Source, FBX, Blender, USD and glTF. Candidate for reusable furniture/props. Exclude flat-screen TV, pool assets and any non-1986 object.
- SRC_MOTEL_SIGNS — Motel Signs by PropHaus. Listing states UEFN Source and 14 sign meshes. Candidate for generic wayfinding only; do not reuse brand artwork as Raven Motel without explicit modification/branding rights.

### Priority B — only if a gap remains
- SRC_MOTEL_ROOM_BEFour — 68 motel-room meshes, Unreal Engine format. UEFN compatibility not confirmed; avoid duplicate purchase if PropHaus bundle supplies adequate furniture.
- SRC_RECEPTION_BEFour — 86 reception/laundry meshes, Unreal Engine format. UEFN compatibility not confirmed; inspect overlap with primary prop bundle.
- SRC_1980S_SEDAN — 1980s Sedan. Listing describes static and drivable variants and LODs; Unreal Engine format only. Prefer static mesh; UEFN compatibility and license must be checked.
- SRC_ABANDONED_CARS — damaged vehicle pack, UE/Blender. Era match and UEFN compatibility not confirmed; fallback only.
- SRC_PARADISE_MOTEL_PROPS — 104 meshes, UE5 only noted; likely overlaps the bundle; compare before acquisition.
- SRC_MODULAR_HOTEL — secondary modular hotel, review quality and format first.
- SRC_FORGOTTEN_HOTEL — low user rating in listing; hold until reviews and current compatibility are reviewed.

## 3. Source audit procedure
For each candidate:
1. Open the exact listing URL from the CSV; confirm title, publisher, availability and current included formats.
2. Confirm Fab Library ownership/acquisition. If not owned, report purchase required; do not claim possession.
3. Capture the license type/tier, EULA/version, product receipt/library record and attribution obligations in Licenses/Environment/[candidate_id]/.
4. Record whether UEFN Source, UEFN Reference Only or generic Unreal Engine content is supplied. Distinguish these exactly.
5. Inventory actual assets, source object paths, material instances, texture maps, dependencies/plugins, collision and LODs.
6. Identify mesh overlap with other purchased packages and avoid duplicate content.
7. Match useful meshes to project Asset_IDs. Add exact source mesh name and source path to the register.
8. Reject content with unclear rights, incompatible license, unsupported dependencies, bad quality, or unsuitable period design.

No license tier is preselected. Fab Standard Personal/Professional eligibility and the exact permitted use must be checked against the owner's circumstances and Fab terms. A listing's marketing page is not a substitute for the license agreement.

## 4. Stylized-realism integration
Target: stylized realism, not low-poly/toon and not photoreal. Preserve 1986 silhouette and function; unify:
- warm cream/yellowed paper, deep burgundy, aged walnut, faded beige fabric;
- cold blue rainy exterior ambience; controlled red/blue neon;
- moderate normal strength, readable roughness and broad wear patterns;
- restrained edge wear, water run-off and dirt decals;
- shared project palette and limited material slots.
Exclude or hide contemporary flat-screen TVs, modern card readers, smartphones, current electronics, modern vehicle branding and unrelated pool/holiday objects.
Do not edit third-party assets unless the license allows it. Keep original package untouched and create project-side variants only where permitted.

## 5. Gap-only original work
After inventory, create/commission only the missing project-specific items:
- Raven Motel lettering/sign face and custom 02:13 neon story treatment;
- ROOM 13 clock dial, chronological photo content, owner portrait and diary pages;
- custom hidden-panel disguise and passage-specific architecture after geometry approval;
- unique puzzle pickups/interactables if no suitable licensed mesh exists;
- custom gameplay collision/interaction proxies.
Do not model a bespoke bed, wardrobe, chair, desk, sink or generic motel prop if an acquired licensed mesh already satisfies scale/style/quality.

## 6. Geometry freeze blockers
Before final-fit architecture, produce a coordinated geometry reconciliation and get geometry owner approval. The current validation report states NOT ACCEPTED FOR FINAL BUILD. Required blockers:
- continuous collision-free ROOM 12 → vestibule → north hall → ROOM 13 path and south entry;
- vertical stack: ground 3.00 m clear, upper 2.80 m clear, upper FFL 3.60 m, 0.25 m slab target, roof/ceiling coordination;
- stair: actual riser count, tread count, run, landing, floor opening and headroom;
- balcony: exact polygon, 2.50 m clear width target, rail segments, post spacing, thresholds and drainage;
- bathroom partition/wet-area layouts for every applicable room;
- door/window centre alignment and rough openings;
- gate anchor discrepancy and car-to-gate path;
- every furnishing bounding box against room polygons, door swings, 0.90 m route and 1.20 m interaction approaches;
- missing shared-area prop placement coordinates.
Do not resolve conflicts by guessing. Produce a geometry change log and update all dependent schedules together.

## 7. Import test sequence (Claude in target UEFN project)
1. Confirm target UEFN version and project revision.
2. Import/open one calibration cube or a single UEFN reference asset; verify scale and availability.
3. Test one wall/static mesh, one door or pivoted prop, one furniture prop, one material and one texture.
4. Verify scale, axes, pivot, normals, UVs, texture compression, material compatibility, collision, LOD and memory.
5. Test player capsule traversal around furniture and through representative door openings.
6. Test the acquired pack's dependencies and remove unsupported features; do not assume Nanite, Lumen, translucency, virtual textures, Blueprint logic or Chaos vehicle systems are available.
7. Only after the representative test passes, proceed with batch integration.
8. Capture evidence: UEFN version, project revision, asset ID/source path, import settings, exact steps, expected/observed results, PASS/FAIL/BLOCKED, screenshot/video/log path, operator and date.

Keep IMPORTED, ENGINE VERIFIED and ACCEPTED separate. No acceptance without evidence.

## 8. Required outputs from Claude
- Source inventory per acquired pack.
- License evidence index.
- Asset-to-project-ID mapping.
- Duplicate/overlap report.
- Stylized material adaptation list.
- UEFN compatibility/import test report.
- Gap-only custom asset list.
- Geometry change log and blocked asset list.
- Updated ENVIRONMENT_ASSET_REGISTER.csv and ENVIRONMENT_ASSET_SOURCE_REGISTER.csv.
- Updated statuses only where evidence exists.

## 9. Stop conditions
Stop and report if Fab account access/purchase is required, license terms are ambiguous, a listing no longer exists, a UEFN reference path is inaccessible, source files are missing, an asset depends on unsupported engine features, or geometry prevents final fit. Do not fill the gap with invented assets, guessed coordinates or unlicensed downloads.
