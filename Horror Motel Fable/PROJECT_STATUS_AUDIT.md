# PROJECT STATUS AUDIT — THE MOTEL: ROOM 13
**Audit date:** 2026-11-16  
**Repository:** Haigone/UEFN-w-Kavasaki  
**Branch inspected:** main  
**Scope:** repository tree and readable source files under `Horror Motel Fable/` plus root README  
**Method:** read-only GitHub inspection. No UEFN editor, island session, asset importer, Verse compiler or playtest was available during this audit.

## 1. Executive verdict
**Production state: DOCUMENTATION / PRE-PRODUCTION. No UEFN implementation is evidenced by this repository snapshot.**

The repository contains a substantial written design and production-planning package: game design, act flow, implementation architecture, geometry proposals, SVG drawings, CSV schedules, asset registers, creature specification and QA cases. These are real documentation artifacts. They are not evidence that the island, meshes, devices, Verse systems, lighting, audio or gameplay have been implemented.

No file in the inspected tree demonstrates a native UEFN project or compiled Verse implementation. No editor screenshots, island test results, memory/performance reports, publish validation or release evidence were found.

## 2. Repository inventory
- Root README: 1 file.
- `Horror Motel Fable/`: 29 files.
- Total inspected tree entries: 30 files plus the folder entry.
- Markdown documents: project identity, game design, gameplay flow, UEFN architecture, geometry, build dossier, production requirements, asset register, QA, guest model, README and validation reports.
- CSV schedules: asset manifest(s), coordinate, doors/windows, exterior props, lighting/audio, room furnishing, device bindings and wall schedule.
- SVG diagrams: ground-floor plan, upper-floor plan and combined vertical sections.
- Verse source files: none found.
- Native UEFN project/map/content files: none found.

The tree is a text/design package, not a UEFN project export.

## 3. Classification rules
Only these project statuses are used:
- **COMPLETATO CON EVIDENZA** — the specific documentation or artifact exists and is inspectable. This status does not imply that an in-game feature exists.
- **PRESENTE MA NON VERIFICATO** — a proposal/specification/schedule exists, but implementation or validation evidence is absent.
- **INCOMPLETO** — a required artifact or implementation is absent or materially unfinished.
- **BLOCCATO** — a known contradiction, dependency or unresolved issue prevents safe acceptance or downstream work.

## 4. Sector assessment

| Sector | Evidence found | Status | Audit finding |
|---|---|---|---|
| Game identity / narrative | GAME_DESIGN_BIBLE.md, README.md, MASTER_PROMPT_FOR_CLAUDE.md | COMPLETATO CON EVIDENZA | Written concept, six acts, cast premise and three endings documented |
| Gameplay design | GAMEPLAY_FLOW_AND_TESTS.md, VERSE_SYSTEM_DESIGN.md | PRESENTE MA NON VERIFICATO | Logical flow and test scenarios exist; no playable implementation |
| Geometry design | EXECUTIVE_BUILD_DOSSIER.md, LEVEL_DESIGN_GEOMETRY.md, EXECUTIVE_FLOORPLANS.md, SVGs, CSVs | BLOCCATO | Several competing layouts and unresolved route/junction issues |
| Furniture / props | room_furnishing_schedule.csv, exterior_prop_schedule.csv | PRESENTE MA NON VERIFICATO | Proposed placements only; not checked against final geometry/editor |
| Asset production | asset manifests and ASSET_AND_CONTENT_REGISTER.md | INCOMPLETO | Mostly proposed targets; manifest explicitly marks character/material/audio items NOT CREATED |
| THE GUEST model | GUEST_MODEL_SPEC.md / guest_model_spec.md | PRESENTE MA NON VERIFICATO | Detailed design brief exists; no mesh, rig, textures, LODs or animation files |
| UEFN architecture | UEFN_IMPLEMENTATION_SPEC.md, UEFN_DEVICE_BINDINGS.csv | PRESENTE MA NON VERIFICATO | Device/manager architecture proposed; bindings require editor tests |
| Verse implementation | VERSE_SYSTEM_DESIGN.md | INCOMPLETO | Explicitly API-neutral pseudocode / logical contract; no .verse source |
| QA | QA_ACCEPTANCE_MATRIX.md, gameplay test list | PRESENTE MA NON VERIFICATO | Test definitions exist; matrix statuses are NOT RUN except a blocked geometry route |
| UEFN build / integration | No project/map/content files | INCOMPLETO | No build evidence or editor state supplied |
| Performance / release | Requirements only | INCOMPLETO | No measured memory, performance, island validation or publication evidence |

## 5. Documents and assets actually present
### Markdown
- ASSET_AND_CONTENT_REGISTER.md
- EXECUTIVE_BUILD_DOSSIER.md
- EXECUTIVE_FLOORPLANS.md
- GAMEPLAY_FLOW_AND_TESTS.md
- GAME_DESIGN_BIBLE.md
- GEOMETRY_VALIDATION_REPORT.md
- GUEST_MODEL_SPEC.md
- LEVEL_DESIGN_GEOMETRY.md
- MASTER_PROMPT_FOR_CLAUDE.md
- PRODUCTION_DETAIL_REQUIREMENTS.md
- QA_ACCEPTANCE_MATRIX.md
- README.md
- UEFN_IMPLEMENTATION_SPEC.md
- VERSE_SYSTEM_DESIGN.md
- lowercase duplicate copies: geometry_validation_report.md, guest_model_spec.md, qa_acceptance_matrix.md
### CSV
- ASSET_MANIFEST_EXECUTIVE.csv and asset_manifest.csv
- coordinate_schedule.csv
- door_window_schedule.csv
- exterior_prop_schedule.csv
- lighting_audio_schedule.csv
- room_furnishing_schedule.csv
- UEFN_DEVICE_BINDINGS.csv and uefn_device_bindings.csv
- wall_schedule.csv
### SVG
- floorplan_ground.svg
- floorplan_upper.svg
- sections_AA_CC_DD.svg

## 6. Duplicate / naming findings
The following pairs have identical blob SHA/content in the inspected branch:
- ASSET_MANIFEST_EXECUTIVE.csv / asset_manifest.csv
- GEOMETRY_VALIDATION_REPORT.md / geometry_validation_report.md
- GUEST_MODEL_SPEC.md / guest_model_spec.md
- QA_ACCEPTANCE_MATRIX.md / qa_acceptance_matrix.md
- UEFN_DEVICE_BINDINGS.csv / uefn_device_bindings.csv

They are exact content duplicates, not merely similar documents. Preserve them until a canonical naming decision is approved. Do not delete or rename as part of this audit.

## 7. Contradictions and production risks
1. ROOM 13 has incompatible positions: dossier places it in the upper east wing (X 67.00–75.70, Y 43.00–47.50); coordinate schedule and SVGs depict it in the north body/service band.
2. Upper-floor rooms 07–12 are assigned differently in the dossier (north wing) versus coordinate_schedule.csv / SVGs (west/east wing room strips).
3. Ground-floor room bounds and door wall/orientation data are not consistent between dossier, coordinate schedule, door/window schedule and wall schedule.
4. The geometry validation report itself says NOT ACCEPTED FOR FINAL BUILD and identifies the ROOM 12–ROOM 13 route, stair, balcony, wall junctions, openings and furniture clearances as unresolved.
5. The coordinate schedule and SVGs are not a single fully reconciled source of truth; their matching labels do not prove the underlying geometry is coherent.
6. Wall schedule is only a partial wall list and does not establish a complete, collision-ready model.
7. Stair is a target (20 risers at 0.18 m) without a resolved two-flight plan, landing, headroom and editor test.
8. The device binding CSV lists conceptual event names and marks entries EDITOR-TEST REQUIRED / ENGINE-VERIFIED REQUIRED; it is not proof of configured devices.
9. The Verse design explicitly states that it is pseudocode / API-neutral and requires verification against the current UEFN Verse digest.
10. The asset manifest explicitly identifies several assets as NOT CREATED; other entries are PROPOSED TARGET, not imported assets.

## 8. UEFN evidence check
**No implementation evidence found in the inspected repository tree.**
- No `.uproject`, `.umap`, `.uasset` or native UEFN project structure.
- No `.verse` source file.
- No mesh, skeletal mesh, texture, material, audio or animation source/import package.
- No editor screenshots or device Outliner evidence.
- No Verse compile logs or test output.
- No gameplay recordings, QA pass records or publish validation.

This is a finding about the repository snapshot only. It does not prove that no separate local UEFN project exists outside this repository.

## 9. Manual UEFN work required
All of the following require a human/editor workflow unless a verified connected editor/build integration is later provided:
- Create/open the actual UEFN island project and establish target editor version.
- Reconcile and approve the canonical floor geometry before building.
- Build blockout, walls, floors, stairs, balcony, openings and ROOM 13 secret route.
- Validate player capsule, camera, collision, navigation, chase routes and multiplayer traversal.
- Import/create meshes, materials, textures, THE GUEST skeleton, animations, audio and VFX.
- Place and configure devices; bind Verse events.
- Implement and compile Verse modules against actual current API signatures.
- Test solo, 2-player and 4-player behaviour, disconnects, capture/rescue, checkpoints and endings.
- Profile memory/performance, run island validation and prepare publication.

## 10. Immediate production decision
**First sector: GEOMETRY / LEVEL DESIGN TECHNICAL RESOLUTION.** Freeze downstream environment placement and final blockout until one canonical geometry revision is approved. Narrative and gameplay logic can be refined in parallel without changing physical layout. Asset research and prototype character turnaround can proceed as non-integrated work, but final import/placement should wait for the relevant interfaces and geometry.

## 11. Audit limitations
This audit reads the GitHub repository contents available on branch main. Binary assets are not represented in this tree; no separate Epic/UEFN project, local workspace or island session was inspected. The audit does not certify that the project is absent elsewhere. No files existing before this audit were deleted or overwritten.


## 12. Execution responsibility clarification (binding)
This repository is a specification/reference package for Claude, not proof of an implemented island. ChatGPT's role is limited to preparing detailed, ordered execution packets, specifications, acceptance criteria and evidence checklists. **Claude is the designated executor** for all UEFN editor operations, asset imports, device configuration, Verse implementation/compilation, playtests, QA, profiling and island validation. The project owner approves design decisions and publication. ChatGPT must not claim or certify any editor test it did not perform. See `CLAUDE_EXECUTION_PROTOCOL.md`.

The statuses in this audit describe repository evidence only. Any editor-dependent item remains PRESENTE MA NON VERIFICATO / INCOMPLETO / BLOCCATO until Claude returns reproducible evidence tied to the project and UEFN version.


## 13. RE-AUDIT ADDENDUM — CURRENT REPOSITORY AND OPEN WORK

**Re-audit date:** 2026-11-16. This section supersedes earlier inventory counts and adds checks not covered by the first snapshot. Main was inspected at commit `c9dc01f9be3a6ef94fc06270917319ad24e0d305`; recursive tree returned 65 files in `Horror Motel Fable/` plus 1 root README (66 file blobs total): 46 Markdown, 14 CSV and 5 SVG. No other file types were present.

### 13.1 Updated source inventory and geometry authority

The current main branch now includes `CLAUDE_EXECUTION_PLAN.md`, `CLAUDE_EXECUTION_PROTOCOL.md`, `FINAL_GROUND_FLOOR_PLAN.md`, `FINAL_UPPER_FLOOR_PLAN.md`, `LEVEL_SECTIONS.md`, `UEFN_BLOCKOUT_BUILD_GUIDE.md`, `GROUND_FLOOR_PLAN_R2.svg` and `UPPER_FLOOR_PLAN_R2.svg`, in addition to the earlier design package.

`LEVEL_DESIGN_GEOMETRY.md` identifies itself as the candidate single geometry authority and selects the E1 side-wing allocation for rooms 07–12 and the north-connector pocket for ROOM 13. This materially improves the written source-of-truth situation compared with the earlier dossier/CSV/SVG conflict. It is still labelled PROPOSED TARGET / NOT UEFN-VERIFIED, and `GEOMETRY_VALIDATION_REPORT.md` explicitly concludes: document audit complete, geometry not approved. `FINAL_GROUND_FLOOR_PLAN.md` and `FINAL_UPPER_FLOOR_PLAN.md` also state NOT APPROVED FOR FINAL ART. Their filenames must not be interpreted as acceptance.

The current geometry package still lacks a complete wall plan and finished construction sections. `LEVEL_SECTIONS.md` specifies an E–E courtyard/balcony section, but the available `sections_AA_CC_DD.svg` does not contain it. The older `floorplan_upper.svg` and section SVG do not depict the new ROOM 12 vestibule. The R2 upper SVG depicts it schematically, not as editor-verified construction geometry. The vertical slab/ceiling/roof stack, stair flight/tread count, balcony edge polygon and ROOM 12 junction remain open.

### 13.2 Main-branch CSV integrity checks

All 14 CSV files in main were parsed for consistent row widths. The following defects were confirmed:

| File | Finding | Consequence |
|---|---|---|
| `INTERACTION_MASTER_REGISTER.csv` | IN-021, IN-022 and IN-023 each have 12 fields against a 13-column header; the action/prerequisite fields are shifted or absent | These rows cannot be consumed reliably as structured interaction data |
| `PUZZLE_MASTER_REGISTER.csv` | PZ-03 has 14 fields against a 15-column header | Electrical puzzle field alignment is incomplete |
| `coordinate_schedule.csv` | UPPER_ROOM11 has 13 fields against a 14-column header; the expected 8.6 m width value is missing and later columns shift | Do not import or use this legacy row as a valid dimension record |
| `lighting_audio_schedule.csv` | Contains two different tables and two headers in one file: a 14-column lighting table and an 11-column audio table | Split into separate files or define a documented multi-table format before automated ingestion |

Other CSVs had consistent row widths in this check. This does not certify semantic correctness, coordinate alignment, collisions or completeness. `ROOM_COORDINATE_REGISTER.csv` (34 data rows) and `DOOR_WINDOW_SCHEDULE.csv` (32 data rows) are the newer detailed uppercase schedules; the lower-case `coordinate_schedule.csv` and `door_window_schedule.csv` remain legacy alternatives. README still points primarily to the lower-case schedules, so the authoritative CSV naming/hierarchy must be stated explicitly.

### 13.3 Wall/opening register integrity

`wall_schedule.csv` contains 23 data rows and is a partial structural list, not a complete wall/floor/ceiling model. Its opening identifiers (for example `D_W01`, `D_OFFICE`, `D_ROOM12_PANEL`, `D_ROOM13_SECRET`) do not match the IDs in `DOOR_WINDOW_SCHEDULE.csv` (for example `D-G01`, `D-G08`, `D-13A`, `D-13B`). The D-13C vestibule-to-hall passage is not represented in the wall schedule. This prevents dependable cross-reference from an opening to its host wall.

### 13.4 Environment Art Pull Request #1

The repository has two branches: `main` and `environment-art/room13-v1`. Pull Request #1, “Add Environment Art production package for THE MOTEL: ROOM 13”, is OPEN and DRAFT. It adds eight files: an art bible, modular asset specification, room-by-room art specification, asset/material/prop registers, import pipeline and acceptance checklist. The PR description correctly says these are specifications/proposed placements, not created assets or UEFN imports.

At re-audit, the PR branch was 11 commits ahead and 42 commits behind current main (diverged). It had no submitted reviews, no discussion comments and no status checks registered on its head commit. GitHub's mergeable flag alone is not acceptance. Rebase/synchronisation, fresh comparison, review and data corrections are required before integration. No merge was performed.

The PR package contains 43 asset rows, 20 material rows and 195 placement rows. All 43 asset IDs and 20 material IDs are unique; all material references resolve. One placement row, `EXT_SIGN_TRIGGER`, references `GAMEPLAY_SIGN_TRIGGER`, which is not an asset ID in the asset register; it should be represented as a gameplay/device reference rather than silently treated as a mesh asset.

A footprint check against the proposed room bounds found six wardrobe placements entirely outside their assigned west-wing room bounds: `F01_WARDROBE`, `F02_WARDROBE`, `F03_WARDROBE`, `F07_WARDROBE`, `F08_WARDROBE`, `F09_WARDROBE`. Their rotated footprint lies at approximately X=10.10–10.70 m, while the assigned room minimum X is 11.10 m. These positions intrude into the corridor/outside the room envelope and must be corrected before placement. The check found no other room-boundary footprint violations among the tested room-assigned rows; it did not test door swings, bathrooms, player capsules or editor collision.

The `F12_SECRET_PANEL` placement is at Y=47.25 m, while opening `D-13A` is centred at Y=47.55 m, a 0.30 m mismatch. Reconcile against the approved wall centre-line and pivot convention before use. The asset/material rows remain NOT STARTED / NOT VERIFIED; no source meshes, textures, license evidence or UEFN import evidence are included.

### 13.5 Execution-order and index issues

`CLAUDE_EXECUTION_PROTOCOL.md` and `CLAUDE_EXECUTION_PLAN.md` correctly establish that ChatGPT prepares plans/specifications only and Claude performs all UEFN implementation, compilation, playtests, QA, profiling and validation. No editor test has been claimed in this audit.

A sequencing conflict remains: `PRODUCTION_ROADMAP.md` and `MASTER_TASK_REGISTER.md` put geometry resolution on the critical path, while `CLAUDE_EXECUTION_PLAN.md` labels Narrative Lock as Phase 1 / first priority before geometry Phase 2. Narrative document work can run in parallel, but the project owner/production lead must clarify that it does not delay the geometry gate.

README is not a current complete index: it omits several R2.0 and Claude governance files and continues to present legacy lower-case schedules as primary outputs. Update the index after the canonical file hierarchy is approved.

### 13.6 Updated evidence conclusion

The repository remains a documentation/specification package, not an evidenced UEFN project. The re-audit found no native UEFN project/map/content files, no `.verse` source, no binary asset production, no editor screenshots, no compile logs, no playtest evidence, no performance profile and no island validation/publication record. The repository tree also contains no `.github/workflows/` CI workflow files; the PR head has no registered status checks in the inspected commit status response.

**Current production state remains DOCUMENTATION / PRE-PRODUCTION.** The new R2.0 geometry candidate and Environment Art package improve planning completeness but do not change implementation status. Claude remains the designated executor/tester; ChatGPT remains limited to detailed plans, documentation, review of returned evidence and corrective instructions.


## 14. R2.1 AND REVISED ENVIRONMENT ART RE-AUDIT — LATEST SNAPSHOT

**Snapshot:** main commit `e76b61527e381fbf37354c7616d5375c94f0f5aa`; Environment Art branch commit `8a06b37ad2805d23db9ed54fdfdfac6546647168`. This section supersedes the earlier file counts and the R2.0/first-version PR counts in section 13.

### 14.1 Current main inventory and geometry authority

The current tree contains 72 files in `Horror Motel Fable/` plus the root README (73 file blobs): 50 Markdown, 17 CSV and 5 SVG. New R2.1 control documents include `LEVEL_DESIGN_R2.1_INDEX.md`, `CLAUDE_GEOMETRY_EXECUTION_BRIEF_R2.1.md`, `STAIR_PLAN_R2.md`, `ROOF_PLAN_R2.md`, and updated R2.1 plans, sections, navigation and blockout guide. Separate `AUDIO_REGISTER.csv` and `LIGHTING_REGISTER.csv` now replace the mixed lighting/audio table for future edits. `ROOM_FURNISHING_SCHEDULE.csv` is explicitly an initial subset, not a complete furnishing register.

R2.1 supersedes R2.0 and E1 wherever they conflict. Owner-locked decisions now recorded are: north stair at reception, continuous courtyard-facing U-shaped upper balcony with 2.50 m clear target, ROOM 13 in the north connector, flat non-playable roof, and intended THE GUEST navigation across both floors. R2.1 remains PROPOSED TARGET / NOT APPROVED / NOT UEFN-VERIFIED. The R2.1 index and geometry validation report expressly authorize greybox-only work until the required geometry and traversal evidence is closed; final environmental art is not authorized.

### 14.2 R2.1 geometry checks

Positive changes:
- Upper side rooms are now 5.90 m wide, with doors facing the courtyard balcony and windows facing the exterior.
- The upper balcony is specified as a continuous U-shaped route with 2.50 m clear width and 1.10 m guardrail target.
- The north stair now has coherent arithmetic: 20 risers total, two flights of 10, nine goings per flight at 0.28 m, intermediate landing at Z=1.80 m.
- The vertical stack is now explicitly proposed: ground ceiling Z=3.00 m; upper slab underside/top Z=3.35/3.60 m; upper ceiling Z=6.40 m; roof top Z=6.65 m; parapet top Z=7.10 m.
- `DOOR_WINDOW_SCHEDULE.csv` has 32 consistent rows and its upper room doors/windows reflect the R2.1 5.90 m room strips.

Remaining geometry blockers:
- `wall_schedule.csv` is still the old 23-row partial schedule. It does not define the full R2.1 side walls, balcony rails/corner pads, vestibule cuts, all wall returns, floor polygons or ceiling/roof boundaries. Its old opening IDs do not match the 32 current opening IDs. It cannot drive a complete R2.1 build.
- `ROOM_COORDINATE_REGISTER.csv` has 46 consistent rows, but it uses bounds rather than explicit non-overlapping floor polygon vertices. The two courtyard balcony corner turning pads described in `LEVEL_DESIGN_GEOMETRY.md` are not explicit register rows. The continuous U-shaped collision/floor union therefore remains to be authored and checked.
- The ROOM 12 → ROOM 13 route depends on the vestibule and corner pad being modelled as a continuous floor/wall system. `VEST-13` is X=67.00–72.90, Y=47.70–49.20; D-13C is centred at X=64.30, Y=49.55. The intended corner pad is described in the geometry authority but is not separately registered as a polygon/wall assembly. Produce a dimensioned plan/section and prove the 0.90 m opening, approach and return route; do not infer continuity from room labels.
- `STAIR_PLAN_R2.md` resolves the riser/going arithmetic but still withholds exact stair origin, flight direction, landing polygon and upper slab opening. It is not a finished CAD plan.
- `ROOF_PLAN_R2.md` gives levels and footprint intent, but drainage positions/falls and a polygonal roof cut-out around the open courtyard still require explicit geometry. The coordinate register's roof row is only a bounding envelope.
- The gate anchor remains unresolved: `ROOM_COORDINATE_REGISTER.csv` places GATE-01 at X=40–44, Y=0–1, while `exterior_prop_schedule.csv` places EXT_GATE at (42,18). The art query register correctly marks it blocked. Claude must propose a correction and wait for project-owner approval before changing the geometry authority or dependent schedules.

### 14.3 Current main CSV integrity

All 17 main-branch CSV files were parsed. Current R2.1 `ROOM_COORDINATE_REGISTER.csv`, `DOOR_WINDOW_SCHEDULE.csv`, `ROOM_FURNISHING_SCHEDULE.csv`, `AUDIO_REGISTER.csv` and `LIGHTING_REGISTER.csv` have consistent row widths. However, structural width alone does not guarantee correct field semantics:

- `INTERACTION_MASTER_REGISTER.csv`: IN-021, IN-022 and IN-023 have been padded to the 13-column width, but their target/action/prerequisite/range/duration/state/feedback fields remain shifted; each ends with an empty FailureFallback. For example, IN-021 has `Player ACTIVE; spot available` in Action and `PlayerHidden` in DurationSec.
- `PUZZLE_MASTER_REGISTER.csv`: PZ-03 now has 15 columns, but the Solution field is missing; the success state appears under Solution, failure behaviour under SuccessState, and the final AcceptanceTest cell is empty. Rebuild the row semantically, not just by adding a trailing comma.
- `ROOM_FURNISHING_SCHEDULE.csv`: 15 rows only, covering a subset of rooms. Its `Material_ID` values are `PROP-...` identifiers, not material IDs from the Material Master, and its first-column identifiers do not map to the current Environment Asset Register IDs. Separate Placement_ID, Asset_ID and Material_ID and establish explicit cross-references.
- `LIGHTING_REGISTER.csv`: row widths are consistent, but `Intensity_Target` contains values such as “3000K visual ref”, “Red accent” and “Material emission”; these are colour-temperature/description values, not numeric light intensity. Separate CCT/colour intent from the actual intensity value and unit.
- `AUDIO_REGISTER.csv`: two NPC audio rows use the text “Dynamic” in X/Y/Z columns. Define an attachment/emitter mode (for example, attach to THE GUEST) rather than pretending these are numeric coordinates.
- Legacy `coordinate_schedule.csv` still has the malformed UPPER_ROOM11 row (missing the 8.6 m width value). The R2.1 index points to `ROOM_COORDINATE_REGISTER.csv`; mark the lower-case file legacy and do not import it.
- Legacy `lighting_audio_schedule.csv` still contains two different headers/tables in one file. The README now says to use the separate AUDIO/LIGHTING registers for future edits; keep the combined file historical only.
- `room_furnishing_schedule.csv` (183 rows) and `ROOM_FURNISHING_SCHEDULE.csv` (15 rows) are different datasets/schemas. The R2.1 index describes the uppercase file as an initial placed subset. Declare the lower-case file's status and the merge/precedence rule.

### 14.4 Revised Environment Art PR #1 — current state

The current branch comparison reports **44 commits ahead and 87 behind main**, status DIVERGED. PR #1 remains OPEN and DRAFT, and GitHub reports `mergeable=false`. It has 12 changed files, no submitted reviews, no discussion comments and no status checks on the inspected head. Branch head at this snapshot is `8a06b37ad2805d23db9ed54fdfdfac6546647168`. Do not merge this branch in its current state.

Current PR data:
- `ENVIRONMENT_ASSET_REGISTER.csv`: 119 rows / 119 unique IDs, 111 NOT STARTED and 8 BLOCKED. The PR description still says 102 asset rows.
- `MATERIAL_MASTER_REGISTER.csv`: 20 rows.
- `ENVIRONMENT_ASSET_SOURCE_REGISTER.csv`: 10 candidate rows, but 8 rows have more fields than the 12-column header because comma-containing descriptions are not quoted.
- `ENVIRONMENT_GEOMETRY_ART_QUERIES.csv`: 10 rows; GQ-007 has an unquoted comma in the source-conflict field and therefore 11 fields against 10 headers.
- `PROP_PLACEMENT_REGISTER.csv`: 286 rows total; 195 have coordinates (192 PROPOSED TARGET, 2 EDITOR-TEST REQUIRED, 1 BLOCKED) and 91 are explicitly UNPLACED. This matches the 195-placement claim only if unplaced rows are excluded.

The PR still uses R2.0 coordinates and its Environment Art execution plan says R2.0 is the candidate authority. Main now declares R2.1 the sole candidate authority and narrows upper rooms from 8.60 m to 5.90 m. The PR must be rewritten/rebased against R2.1, not merely merged or mechanically rebased.

A footprint comparison against R2.1 room bounds found nine wardrobe placements outside their assigned rooms: F01/F02/F03_WARDROBE, F07/F08/F09_WARDROBE and F10/F11/F12_WARDROBE. The first six lie at X≈10.10–10.70 m while west room X-min is 11.10 m; the upper east three lie at X≈65.70–66.30 m while upper east room X-min is 67.00 m. The PR's F12_SECRET_PANEL remains at X=68.60 m while R2.1 opening D-13A is centred at X=69.95 m (1.35 m offset); Y=47.55 m now matches. All upper-floor placements must be rechecked because the room widths and door sides changed in R2.1.

The PR's former EXT_SIGN_TRIGGER reference issue is corrected in the current branch: the placement now references ENV_TRIGGER_VOLUME and all Asset_ID references resolve against the current asset register. Do not carry the earlier missing-asset finding forward as an active defect.

### 14.5 External asset listing verification

The ten Fab candidate URLs were checked against current listing pages and Epic documentation. No asset is claimed acquired, licensed, downloaded, imported or accepted.

- PropHaus “Motel and Hotel Props” bundle lists UEFN Source plus USD/FBX/glTF and 50+ meshes across 14 listings. PropHaus “Motel Signs” lists UEFN Source and 14 sign meshes. These are the strongest direct UEFN-source candidates, subject to owner acquisition and license selection.
- “Motel” by Volodymyr Stepaniuk lists UEFN Reference, not UEFN Source. Treat it as a referenced asset, not as an editable source project.
- Befour “Motel Room Interior Environment” (68 meshes) and “Motel Reception Interior Environment” (86 meshes), PropHaus “Motel Room Props” (104 meshes), “Modular Hotel”, “Forgotten Hotel”, “1980s Sedan Car” and “Abandoned Cars” list Unreal Engine and/or Blender/glTF formats but not UEFN Source on the checked pages. UEFN import/compatibility is therefore unconfirmed; do not infer it from “Unreal Engine” format or Blueprint functionality.
- Current “Abandoned Cars” listing reports 42 static vehicle variants, 7 Blueprints and 10 road props, with 4.0/5 from 4 ratings. The PR source register says 28 variants and 5.0/5 from 1 rating, so its listing evidence is stale.
- Fab license tier and exact project-use rights still require checkout/account verification. No purchase or license decision is implied.

Epic's documentation states that UEFN Source listings provide the publisher project files for download/editing, and listings without UEFN Source do not offer that source-project path. See the official [UEFN Fab import guide](https://dev.epicgames.com/documentation/fortnite/import-from-fab-in-unreal-editor-for-fortnite) and [Fab license/pricing guide](https://dev.epicgames.com/documentation/fab/licenses-and-pricing-in-fab).

### 14.6 Current status conclusion

R2.1 is a materially improved geometry design handoff, not a final approved or engine-verified build. The revised Environment Art package is useful as a sourcing/design proposal but is stale against R2.1 and has CSV, placement, licence and compatibility gaps. The current main branch still contains no native UEFN project, Verse source, imported binary art package, editor screenshots, compile logs, gameplay test evidence, performance profile or island validation.

**Production remains DOCUMENTATION / PRE-PRODUCTION.** Only greybox work is authorized by the R2.1 index; final environment art, final placements, imports and engine acceptance remain blocked pending owner-approved geometry and Claude's reproducible UEFN evidence. ChatGPT continues to prepare plans and review evidence only; Claude executes all editor operations and tests.


## 15. FINAL PR METADATA CORRECTION — LATEST LIVE CHECK

A final live check after the R2.1 document updates supersedes the PR mergeability wording in section 14.4:

- Current compare: branch `environment-art/room13-v1` is **49 commits ahead and 94 behind** `main`, status DIVERGED.
- Pull Request #1 is OPEN and DRAFT. GitHub currently reports `mergeable=true` (no merge conflict detected at the metadata check), not mergeable=false. This does not mean reviewed, approved, current or production-ready.
- The PR still changes 12 files, has zero submitted reviews, zero discussion comments and zero status checks on its current head.
- The PR description is now updated to 119 asset rows, 20 material specifications and 286 placement rows (91 unplaced). Its earlier “102 asset rows” statement is no longer current.
- The PR description claims “CSV schemas normalized”; direct parsing still finds 8 malformed rows in ENVIRONMENT_ASSET_SOURCE_REGISTER.csv and malformed GQ-007 in ENVIRONMENT_GEOMETRY_ART_QUERIES.csv. That claim is not supported by the actual files.
- The PR still declares LD-GEO R2.0 as its candidate reference, while main's R2.1 index/brief explicitly supersede R2.0. Its placement and execution plans therefore remain stale even though GitHub reports no merge conflict.

**Decision:** do not merge in the current state. The reason is stale geometry authority, unreviewed/draft status and unresolved data/placement defects, not a reported Git conflict. Reauthor against R2.1, rerun the register checks, obtain review and owner approval, then reassess.
