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

## 7. Current blockers
1. E1 geometry is proposal, not editor-verified.
2. ROOM 13 secret door location conflicts between room/door/wall schedules.
3. Stair exact footprint, riser numbering and headroom unresolved.
4. Balcony polygon and rail layout unresolved.
5. Bathroom partitions and door/furniture clearances need plan-level resolution.
6. Several external prop anchors are only approximate.
7. THE GUEST rig and custom animation workflow require UEFN/NPC compatibility proof.

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
