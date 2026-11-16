# OWNER DECISION GATE — LD-GEO R2.2
Project: THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **WAITING FOR PROJECT OWNER — NO GEOMETRY APPROVAL IMPLIED**

## Purpose
This document turns the open R2.2 geometry and ending decisions into one explicit approval gate. It does not silently select creative or structural alternatives. Claude must not build final geometry from R2.2 until the owner approves this package or supplies a revised choice.

## Decision method
The owner may approve the complete R2.2 proposal with one response:
**APPROVE R2.2 AS WRITTEN**
or reply **APPROVE WITH EXCEPTIONS** and identify item numbers and replacement values.
A rejection must identify the preferred alternative. Silence is not approval.

## A. Geometry decisions

| ID | Decision required | R2.2 proposal to approve | Consequence if not approved |
|---|---|---|---|
| GEO-A01 | Ground-floor room orientation | Guest rooms face courtyard; circulation corridors occupy outer west/east bands | No room placement or greybox freeze |
| GEO-A02 | Ground-floor room Y bands | 20–27, 29–36, 38–45 m; two 2.00 m cross-bays per wing | Cross-bay topology remains unresolved |
| GEO-A03 | Ground-floor cross-bay openings | 1.50 m clear openings through corridor-side and courtyard-side partitions at Y=28 and 37 m | Do not cut openings |
| GEO-A04 | Upper rooms 07–12 | Side wings, 8.70 m nominal width; replace R2.1 5.90 m width | Upper room layout remains blocked |
| GEO-A05 | Upper cross-bays | Two 2.00 m cross-bays per wing with 1.50 m clear openings to balcony | Upper circulation not frozen |
| GEO-A06 | South-end buffers | Retain 1.55 m ground-floor buffers and upper-floor equivalents, open to adjacent circulation | South-end room/corridor junctions unresolved |
| GEO-A07 | Ground north connector | Retain NW link/lobby, reception, office, storage, service bay, electrical ending X=72.90 and NE link X=73.20–75.70 | North connector partitions not frozen |
| GEO-A08 | Upper north connector | Retain stair landing, U-service, ROOM 13 at X49.00–63.70 / Y51.10–59.70 and two non-playable service reserves | Upper connector allocation not frozen |
| GEO-A09 | Stair geometry | North location fixed; approve U-turn footprint, handedness, 20 risers, two flights, 9 goings per flight, landing and headroom targets | No stair build |
| GEO-A10 | Wall thicknesses | 0.30 m exterior/courtyard-facing; 0.15 m standard partitions; 0.30 m selected connector partitions | Wall schedule not final |
| GEO-A11 | Vertical stack | GF FFL 0.00; GF ceiling 3.00; slab underside/top 3.35/3.60; UF ceiling/roof underside 6.40; roof top 6.65; parapet top 7.10 m | No vertical geometry freeze |
| GEO-A12 | Balcony | Continuous U route; minimum 2.50 m clear, 2.55 m side legs, corner pads and 1.10 m guardrail | No upper circulation/rail build |
| GEO-A13 | Roof | Flat U-shaped roof; 0.25 m slab; 0.20 m parapet thickness and 0.45 m parapet height; courtyard excluded | Roof package incomplete |
| GEO-A14 | Openings and secret route | Approve proposed door/window centres, sizes/sills, ROOM 12 vestibule and D-13A/B/C positions/clearances | No final opening cuts or secret-route build |
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

These fixed intent points do not approve the proposed detailed dimensions.

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

Owner response: NOT RECEIVED  
Approved geometry revision: NONE  
Approved co-op quorum: NONE  
Approved truth evidence gate: NONE  
Approval date: NOT RECORDED

Once approved, update this record with the owner's exact decision, then synchronize LEVEL_DESIGN_GEOMETRY.md, all controlled schedules, ENDING_DESIGN_SPEC.md, ENDING_IMPLEMENTATION_SPEC.md, GAMEPLAY_FLOW_AND_TESTS.md, QA matrices and Claude execution packets.

## E. Stop conditions
- No final geometry placement before GEO-A01–A15 are resolved.
- Claude may inspect the existing project and report feasibility/measurements while waiting.
- Do not merge Environment Art PR #1 or treat its placements as approved geometry.
- Do not mark any editor-dependent task complete without Claude's UEFN evidence.
