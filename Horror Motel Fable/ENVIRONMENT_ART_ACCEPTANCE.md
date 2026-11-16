# ENVIRONMENT ART ACCEPTANCE
Revision 1.0 | THE MOTEL: ROOM 13

## 1. Acceptance states
- NOT STARTED: no production work.
- IN PROGRESS: source work exists, incomplete.
- MODEL REVIEW: mesh exists and awaits topology/scale/pivot review.
- TEXTURE REVIEW: materials and texture set await review.
- READY FOR IMPORT: source/export package passes DCC checks.
- IMPORTED: content exists in UEFN project; no engine pass implied.
- ENGINE VERIFIED: tested in target UEFN project with evidence.
- ACCEPTED: all applicable criteria pass and reviewer/date are recorded.
- BLOCKED: upstream dependency prevents safe completion.

## 2. Per-asset acceptance checklist
- [ ] Asset_ID and filename match register.
- [ ] Dimensions match approved schedule within 1 cm or documented tolerance.
- [ ] Scale is 1, transforms applied, orientation correct.
- [ ] Pivot is at specified location and verified with test placement.
- [ ] No non-manifold or duplicate geometry; normals and smoothing clean.
- [ ] UVs are valid; texel density consistent with family; no visible seams at module joins.
- [ ] Material slots match master register; no accidental unique materials.
- [ ] Texture resolution and map packing documented.
- [ ] Collision is simple and gameplay-appropriate; capsule traversal tested.
- [ ] LODs are present where required and transitions reviewed in engine.
- [ ] Polycount and material count recorded.
- [ ] License evidence and attribution obligations recorded.
- [ ] Export files and editable source archived.
- [ ] UEFN import screenshot, version, date and test notes attached.
- [ ] Asset has no unintended visual, collision, lighting or performance regressions.

## 3. Architecture acceptance
- [ ] Wall/floor/ceiling module dimensions align to approved geometry.
- [ ] Corners, T-junctions, end caps and openings close without gaps or overlaps.
- [ ] Shared walls are not duplicated.
- [ ] Door swing, hinge pivot, frame clearance and collision states pass.
- [ ] Window sill, glass and opening collision pass.
- [ ] Stair rise/run/landing/headroom and rails pass.
- [ ] Balcony slab, guardrail, posts, thresholds and drainage pass.
- [ ] ROOM 12 to ROOM 13 route is physically continuous and editor-verified.

## 4. Room and prop acceptance
- [ ] All room dressing IDs exist in PROP_PLACEMENT_REGISTER.csv.
- [ ] Every placed prop is inside its approved room polygon.
- [ ] Door swing and 90 cm route targets are clear.
- [ ] Interaction approach zones are unobstructed.
- [ ] Narrative prop text/images readable at intended distance.
- [ ] Two-player ROOM 13 photo inspection test passes.
- [ ] Exterior prop placements do not obstruct escape path, gate or service access.

## 5. Material acceptance
- [ ] Base colour is authored without baked lighting.
- [ ] Roughness/normal scale reads correctly at first-person distance.
- [ ] Tileable seams are not visible at module boundaries.
- [ ] Emissive neon is legible without blowing out exposure.
- [ ] Actual light contribution is provided by tested UEFN lighting, not assumed emissive bounce.
- [ ] Wet asphalt, glass, CRT and mirror behaviour verified in target settings.

## 6. Performance acceptance
Run a representative benchmark containing one full room, corridor, reception, courtyard and exterior sign. Record:
- UEFN version / project build / target platform.
- Visible mesh count, material slots, texture memory and triangle count.
- Frame time and performance capture under the intended lighting/VFX.
- LOD transitions and worst-case camera view.
- Any asset reductions and resulting visual changes.

No universal frame-rate or memory pass value is invented here; production owner must set target platform and measurable budget before final optimization. Compare against the approved project performance target.

## 7. Current blockers — authoritative status
1. Geometry status is UNKNOWN / NOT ACCEPTED. LD-GEO R2.0 is a candidate reference only; no final-fit asset placement is authorized until the geometry owner/Claude reconciles the source files and editor evidence.
2. Vertical stack: upper FFL 3.60m and clear-height targets 3.00m ground / 2.80m upper; exact slab/soffit/ceiling/roof elevations require one coordinated section.
3. Stair: 20 risers × 0.18m, 0.28m tread depth, 1.20m clear width and landing >=1.20x1.20m are targets; tread count/run/landing split/headroom remain unresolved.
4. Balcony: 2.50m clear width and 1.10m guardrail are targets; exact polygon, edge, posts, supports, thresholds and drainage unresolved.
5. ROOM 12 -> ROOM 13 candidate route includes panel, east vestibule, west wall-junction opening, north hall and ROOM 13 south entry; plan/section/collision still require proof.
6. Bathroom partitions and wet-area clearances are absent/incomplete in source schedules; no final bathroom dressing without a coordinated plan.
7. Gate anchor conflicts between exterior_prop_schedule.csv and ROOM_COORDINATE_REGISTER.csv; EXT_GATE placement remains BLOCKED.
8. Existing room furnishing coordinates are proposed only. Shared reception/office/storage/electrical prop placements remain UNPLACED until exact plans are reconciled.
9. Third-party asset candidates remain SHORTLISTED_NOT_ACQUIRED. No license evidence, acquisition or UEFN compatibility is assumed.
10. THE GUEST rig, skeleton and custom animation workflow require current UEFN/NPC compatibility proof.
11. Claude owns all UEFN editor, import, collision, gameplay traversal and performance tests. No UEFN test is claimed by this documentation author.

## 8. Final sign-off
Asset_ID / Family:
Artist:
Reviewer:
Source file:
Export file:
License evidence:
UEFN version:
Test date:
Evidence path:
Open issues:
Decision: ACCEPTED / REJECTED / BLOCKED


## Revision 2.0 — authority and acceptance ownership
Claude is the sole owner of UEFN editor/import/playtest verification. The documentation author has not opened UEFN, imported assets, run collision tests, profiled performance or verified editor results. Do not infer these from this checklist.
Geometry reference is `LEVEL_DESIGN_GEOMETRY.md` LD-GEO R2.0. It remains PROPOSED TARGET / NOT UEFN-VERIFIED. The geometry validation report explicitly records NOT APPROVED and no ENGINE-VERIFIED items. Therefore final-fit stair, balcony, secret passage, door/window openings, bathroom partitions, vertical stack and gate remain blocked until Claude resolves them and captures evidence.
Update the previous blocker list: use R2 values (upper FFL 3.60m, clear heights 3.00m/2.80m, balcony 2.50m, secret vestibule route); do not carry forward the stale E1 1.50m balcony or the earlier conflicting secret-door wall descriptions.
Acceptance evidence must include exact UEFN version/project revision, test steps, expected/observed result, screenshots/video/logs, reviewer and date. The documentation package can be READY FOR CLAUDE EXECUTION while physical assets remain NOT STARTED and UEFN verification remains NOT TESTED.



## Revision 3.0 — owner decision gates: existing assets / stylized realism / geometry unknown

### Source acquisition gate
- [ ] Candidate product and publisher match the source register.
- [ ] Asset actually appears in the acquired library/package.
- [ ] License tier, EULA version, attribution and UEFN scope recorded.
- [ ] Modification and redistribution permissions checked.
- [ ] No asset accepted from a screenshot, demo video or unverified listing claim.
- [ ] UEFN Source/reference availability checked; Unreal Engine format alone is not compatibility proof.
- [ ] Candidate source inventory mapped to stable project Asset_IDs.

### Stylized-realism gate
- [ ] Common palette matches the 1986 motel art bible.
- [ ] Silhouette and material readability work in first-person low light.
- [ ] Modern/anachronistic items are removed or excluded.
- [ ] Roughness, normal intensity, wear and material slots are unified.
- [ ] No unlicensed modification or derivative redistribution.

### Geometry UNKNOWN gate
- [ ] LD-GEO R2.0 remains explicitly candidate/proposed, not approved.
- [ ] Final-fit openings, stair, balcony, roof stack, bathrooms, gate and secret route remain BLOCKED.
- [ ] Loose assets can be source-audited without committing final placement.
- [ ] Every placement coordinate remains PROPOSED TARGET until geometry approval.
- [ ] Shared-space placement gaps are recorded, not filled with invented coordinates.
