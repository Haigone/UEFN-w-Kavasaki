# OWNER DECISION GATE — LD-GEO R2.2
Project: THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **GEOMETRY APPROVED BY PROJECT OWNER ON 2026-11-16 — UEFN VERIFICATION PENDING**

## Purpose
This document records the owner's approval of geometry decisions GEO-A01–GEO-A21 and separately tracks ending decisions END-A01/END-A02, which remain unapproved. Claude may implement the approved geometry baseline LD-GEO R2.3, subject to editor verification.

## Decision method
The detailed final review and recommendations are in LD_GEO_R2.2_FINAL_OWNER_APPROVAL_PACKET.md. The owner replied **APPROVO TUTTO, PROCEDI** on 2026-11-16, approving the R2.2 geometry proposal and recommendations for GEO-A01–GEO-A21. The approved and synchronized geometry baseline is LD-GEO R2.3. The VEST-13 correction and approved reserve/pad/stair/roof clarifications have been applied. This approval does not include END-A01/END-A02 and does not constitute UEFN verification.

## A. Geometry decisions

| ID | Approved decision | Approved R2.2 baseline | Implementation constraint |
|---|---|---|---|
| GEO-A01 | Ground-floor room orientation | Guest rooms face courtyard; circulation corridors occupy outer west/east bands | No room placement or greybox freeze |
| GEO-A02 | Ground-floor room Y bands | 20–27, 29–36, 38–45 m; two 2.00 m gross cross-bays per wing (1.70 m clear between finished wall faces) | Cross-bay topology remains unresolved |
| GEO-A03 | Ground-floor cross-bay openings | 1.50 m clear openings through corridor-side and courtyard-side partitions at Y=28 and 37 m | Do not cut openings |
| GEO-A04 | Upper rooms 07–12 | Side wings, 8.70 m nominal width; replace R2.1 5.90 m width | Upper room layout remains blocked |
| GEO-A05 | Upper cross-bays | Two 2.00 m cross-bays per wing with 1.50 m clear openings to balcony | Upper circulation not frozen |
| GEO-A06 | South-end buffers | Retain 1.55 m ground-floor buffers and upper-floor equivalents, open to adjacent circulation | South-end room/corridor junctions unresolved |
| GEO-A07 | Ground north connector | Retain NW link/lobby, reception, office, storage, service bay, electrical ending X=72.90 and NE link X=73.20–75.70 | North connector partitions not frozen |
| GEO-A08 | Upper north connector | Retain stair landing, U-service, ROOM 13 at X49.00–63.70 / Y51.10–59.70 and two non-playable service reserves; decide explicit U-service access/collision under GEO-A18 | Upper connector allocation not frozen |
| GEO-A09 | Stair geometry | North location fixed; approve U-turn footprint, handedness, 20 risers, two flights, 9 goings per flight, 1.20 m flight widths, 2.70×1.20 m landing, 1.20 m upper approach, 1.35 m nominal lower south approach and 2.80 m nominal headroom (subject to beams/MEP) | No stair build |
| GEO-A10 | Wall thicknesses | 0.30 m exterior/courtyard-facing; 0.15 m standard partitions; 0.30 m selected connector partitions | Wall schedule not final |
| GEO-A11 | Vertical stack | GF FFL 0.00; GF slab 0.20 m; GF ceiling 3.00; UF slab underside/top 3.35/3.60; UF clear/roof underside 6.40; roof slab top 6.65; parapet top 7.10 m | No vertical geometry freeze |
| GEO-A12 | Balcony | Continuous U route; minimum 2.50 m clear, 2.55 m side legs, 3.00×3.80 m corner pads and 1.10 m guardrail; approve pad clipping to the U-slab boundary under GEO-A19 | No upper circulation/rail build |
| GEO-A13 | Roof | Flat U-shaped roof; 0.25 m slab; 0.20 m parapet thickness and 0.45 m parapet height; courtyard excluded; drainage and player-access rule under GEO-A21 | Roof package incomplete |
| GEO-A14 | Openings and secret route | Approve proposed door/window centres, sizes/sills, ROOM 12 vestibule FIF 5.90×1.65 m and D-13A/B/C positions/0.90×2.10 m clearances | No final opening cuts or secret-route build |
| GEO-A15 | Room interiors | R2.2 controls room envelopes only; bathrooms and interior partitions are not invented until a separate fit-out decision | No bathroom wall/fixture placement |

### Fixed intent already recorded (not being re-asked)
- Site envelope 84×72 m; origin south-west (0,0,0), +X east, +Y north, +Z up; metres.
- Two-floor U-shaped motel around open courtyard.
- ROOM 01–12 plus concealed ROOM 13.
- Stair is in north connector/reception zone.
- Continuous courtyard-facing upper balcony.
- ROOM 13 is in north connector, upper floor.
- Flat roof.
- THE GUEST must access both floors.

The owner subsequently approved the detailed dimensions and all GEO-A01–GEO-A21 dispositions on 2026-11-16; see Section F and the R2.3 approval record.


## A2. Additional geometry decisions from final R2.2 review

Detailed dimensions, diagrams and approved outcomes: LD_GEO_R2.2_FINAL_OWNER_APPROVAL_PACKET.md and LD_GEO_R2.3_APPROVAL_RECORD.md.

| ID | Approved decision | Observed R2.2 condition | Approved disposition |
|---|---|---|---|
| GEO-A16 | Ground-floor north pockets | Two sealed pockets, each 8.60×2.85 m | Approved: register as sealed no-access/no-navmesh reserves; retain structural floor collision; no openings. |
| GEO-A17 | Upper-floor north side pockets | West reserve 8.70×3.25 m; east L-shaped reserve 17.39 m² | Approved: close and register both as no-access/no-navmesh reserves; west and east closure walls scheduled. |
| GEO-A18 | U-SERVICE access and collision | U-SERVICE is 19.70×8.60 m (169.42 m²), enclosed with no scheduled door | Approved: sealed/no-access/no-navmesh; retain structural floor collision; no door. |
| GEO-A19 | Balcony corner-pad clipping | Each 3.00×3.80 m pad extends 0.15×1.00 m (0.15 m²) into the courtyard void beyond UF-SLAB. | Clip pads to the U-slab polygon and coordinate rail edge; or explicitly extend/structurally support slab into courtyard and redesign guardrail. Recommendation: clip; do not create floor collision over the void. |
| GEO-A20 | Cross-bay clear depth | 2.00 m nominal gap yields 1.70 m clear | Approved: 2.00 m gross / 1.70 m net. |
| GEO-A21 | Flat-roof drainage and access | Flat roof, drainage falls/outlets previously unspecified | Approved: no player access; concealed 1.0% falls to coordinated perimeter drainage; outlet positions remain technical coordination. |

## A3. Objective register corrections — no design choice required

- ROOM_COORDINATE_REGISTER.csv / COURTYARD: RESOLVED in main. The Material_Asset_ID placeholder NA is present; the row has 16 fields and Verification_Status remains FIXED REQUIREMENT.
- ROOM_COORDINATE_REGISTER.csv / VEST-13: RESOLVED in R2.3. Length_m=1.65 from Y=47.55–49.20.
- GEOMETRY_VALIDATION_REPORT.md: correct the previous claim that every ROOM_COORDINATE_REGISTER row matches the 16-column header and include the final-review findings.


## B. Ending multiplayer rule

**END-A01 — Co-op ending quorum.** The documents conflict:
- ENDING_DESIGN_SPEC.md proposes unanimous confirmation for THE NEW GUEST and says quorum for other branches needs approval.
- ENDING_IMPLEMENTATION_SPEC.md specifies majority vote for all eligible endings, with tie/no response defaulting to ESCAPE.

Choose one rule:
1. **MAJORITY** — majority of currently connected eligible players; define tie/no-response handling. THE NEW GUEST still requires a positive explicit vote.
2. **UNANIMOUS** — every currently connected player must explicitly confirm; define disconnect and timeout handling.
3. **OTHER** — provide exact quorum, timeout, disconnect and default rules.

Until this is approved, Claude may implement only the solo ending selection and the ending state lock/atomic commit. Do not implement the co-op voting/quorum resolver.

## C. Truth-ending evidence gate

**END-A02 — Mandatory truth evidence.** Current implementation spec lists DiaryFound, ChildRoomClueFound, MissingGuestEvidenceFound, SecretPanelOpened, PhotoSequenceSolved and OwnerIdentityRevealed as mandatory. Confirm whether all six are mandatory, or identify which are optional. No missable clue may silently become a mandatory progression gate.

## D. Approval record

Owner response: APPROVED — “APPROVO TUTTO, PROCEDI” — 2026-11-16  
Approved geometry revision: LD-GEO R2.3  
Approved co-op quorum: NONE — outside geometry scope  
Approved truth evidence gate: NONE — outside geometry scope  
Approval date: 2026-11-16

Once approved, update this record with the owner's exact decision, then synchronize LEVEL_DESIGN_GEOMETRY.md, all controlled schedules, ENDING_DESIGN_SPEC.md, ENDING_IMPLEMENTATION_SPEC.md, GAMEPLAY_FLOW_AND_TESTS.md, QA matrices and Claude execution packets.

## E. Stop conditions
- Geometry decisions GEO-A01–GEO-A21 are approved and synchronized as LD-GEO R2.3. No editor-dependent item may be marked complete without Claude's UEFN evidence.
- Claude may inspect the existing project and report feasibility/measurements while waiting.
- Do not merge Environment Art PR #1 or treat its placements as approved geometry.
- Do not mark any editor-dependent task complete without Claude's UEFN evidence.


## F. Recorded GEO-A01–GEO-A21 approval outcome

All GEO-A01–GEO-A21 approved as proposed, with these explicit final dispositions:
- GEO-A01–A08: retain R2.2 room orientation, room bands, cross-bay openings, upper room widths, south buffers and north connector allocations; cross-bays are 2.00 m gross / 1.70 m net.
- GEO-A09: approve U-turn stair, 20 risers, two 1.20 m flights, nine 0.28 m goings per flight, 2.70×1.20 m landing at Z1.80; west lower flight rises south-to-north, east upper flight returns north-to-south; lower south approach 1.35 m, upper south approach 1.20 m.
- GEO-A10–A15: approve wall thicknesses, vertical stack, continuous balcony, clipped corner pads, flat roof, opening schedule/secret route, and envelope-only room scope (bathrooms/interior fit-out remain excluded).
- GEO-A16: both ground north pockets are sealed no-access reserves; structural floor collision retained, navmesh disabled.
- GEO-A17: both upper side pockets are sealed no-access reserves; west pocket closed by UF-W-SEALED-RESERVE-WEST; east L-shaped pocket split into two registered components and closed by UF-E-SEALED-RESERVE-WEST.
- GEO-A18: U-SERVICE is sealed/no-access/no-navmesh; no door added.
- GEO-A19: turning pads clipped to UF-SLAB boundary; no collision over courtyard void.
- GEO-A20: 2.00 m gross / 1.70 m net cross-bays.
- GEO-A21: visually flat, non-accessible roof; concealed 1.0% falls to coordinated perimeter drainage; outlets remain technical coordination.

END-A01 and END-A02 remain unapproved and must not be treated as decided by this geometry-only approval.
