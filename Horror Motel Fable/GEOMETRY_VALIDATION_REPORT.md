# GEOMETRY VALIDATION REPORT — LD-GEO R2.0
Audit date 2026-11-16. Result: DOCUMENT AUDIT COMPLETE; GEOMETRY NOT APPROVED.

## Conflict register
| ID | Conflict | R2.0 resolution | Remaining proof |
|---|---|---|---|
| C01 | Ground room positions/corridor side differ | Select E1 allocation | Wall openings and circulation |
| C02 | Reception 14.00 vs 17.40 m | Select 17.40 m | Internal partition/furniture |
| C03 | Office/storage/electrical differ | Select E1 | Shared wall and service route |
| C04 | Upper six rooms in north wing vs side wings | Select E1 side-wing rooms 07–12 | Slab and wall support |
| C05 | ROOM 13 east pocket vs north connector | Select E1 north connector pocket | Section and route collision |
| C06 | Stair X10–14/Y44–48 vs X21–27/Y51.2–59 | Select north-west connector reservation | Stair flight layout |
| C07 | Balcony 2.50 vs 1.50 m | 2.50 m target | Edge polygon/guardrail |
| C08 | Upper floor 3.50 vs 3.60 m | Select 3.60 m | Slab/ceiling stack |
| C09 | Ceiling/roof elevations inconsistent | Clear-height targets only; datum stack unresolved | Section and editor |
| C10 | ROOM 12 route has undefined 0.30 m junction | Add vestibule and explicit openings | Wall segmentation/collision |
| C11 | 20 risers and 5.32 m run underspecified | Keep 20×0.18 m rise; withhold total run | Tread/landing calculation |
| C12 | Room rectangles used as solid overlapping boxes | FIF convention; shared walls once | Polygon intersection check |

## Arithmetic
Site area 6,048 m². Courtyard nominal area 1,320 m². Reception nominal area 198.36 m². Office 102.60 m². Storage 52.38 m². Electrical 209.76 m². ROOM 13 126.42 m². These are nominal rectangular areas before partitions/returns. 20×0.18 m = 3.60 m rise. Twenty risers do not imply twenty treads.

## Risks
- U-footprint corners require polygon union and no duplicate collision.
- Room bounds do not yet define every partition, wall return or bathroom.
- Storage door/partition arrangement and office/service connectivity require a wall plan.
- ROOM 12 panel needs clear vestibule depth and a fully dimensioned opening junction.
- ROOM 13 entry approach and two-player photo inspection must preserve egress.
- Stair reservation overlaps upper connector program conceptually; exact stair and ground-floor use below need coordination.
- Balcony edge and guardrail are not yet defined as continuous geometry.
- Windows must not overlap concealed panel or create unintended exits.
- Electrical room below ROOM 13 requires continuous slab and separate collision volumes.

## Test matrix
Solo mandatory progression — EDITOR-TEST REQUIRED. Two-player passing/inspection — EDITOR-TEST REQUIRED. Four-player reception and ROOM 13 flow — EDITOR-TEST REQUIRED. First-person door/camera/capsule — EDITOR-TEST REQUIRED. Stair ascent/headroom — EDITOR-TEST REQUIRED. Balcony rail — EDITOR-TEST REQUIRED. THE GUEST patrol/LOS/chase/recovery — EDITOR-TEST REQUIRED. Disconnect/rejoin and pickup persistence — EDITOR-TEST REQUIRED. Collision seams and floor thresholds — EDITOR-TEST REQUIRED.

## Approval
NOT APPROVED for final environmental asset production. Greybox only as a validation method after polygons, wall centre-lines, stair and secret route are dimensioned. No ENGINE-VERIFIED items exist in this audit.