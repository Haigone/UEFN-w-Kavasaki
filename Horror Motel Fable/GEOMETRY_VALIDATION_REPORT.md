# GEOMETRY VALIDATION REPORT — LD-GEO R2.1
Audit date 2026-11-16. Status: DOCUMENT DESIGN UPDATED; NOT GEOMETRY APPROVED.

## Owner decisions applied
North stair at reception; continuous courtyard-facing upper balcony; ROOM 13 north connector; flat roof; THE GUEST both floors.

## Conflict resolutions
| ID | Conflict | R2.1 resolution | Remaining proof |
|---|---|---|---|
| C01 | Ground room allocation differs between dossier and E1 | Retain E1/R2.0 ground room strip and north service allocation | Full wall/polygon plan |
| C02 | Reception 14.00 vs 17.40 m | Select E1 17.40 m width | Furniture and circulation |
| C03 | Upper 6-room north band vs side wings | Select side wings | Vertical support/partitions |
| C04 | ROOM 13 east pocket vs north connector | North connector pocket | Secret route section |
| C05 | Stair west connector vs north/reception | Owner confirms north; reserve X21–27,Y51.2–59 in reception | Exact stair CAD/blockout |
| C06 | Balcony 1.50 vs 2.50 m | Continuous U balcony 2.50 m | Corner polygon/guardrail |
| C07 | Upper side room width 8.60 vs balcony integration | Revised 5.90 m FIF width | Furniture fit |
| C08 | Upper floor elevation variants | FFL 3.60 m | Slab/ceiling proof |
| C09 | Flat roof/roof elevations | Ceiling 6.40; slab top 6.65; parapet 7.10 | Roof section/drainage |
| C10 | ROOM 12 route junction undefined | Vestibule and east-to-north balcony opening | Wall cuts/collision |
| C11 | Stair 20 risers vs 5.32 m run ambiguity | 20 risers, 18 goings total, two flights; 2.52 m run per flight | CAD layout/headroom |
| C12 | NPC on both floors | Stair-connected nav nodes both floors | Actual NPC pathfinding |

## Room and furniture fit risks
The upper side rooms are now 5.90 m wide, not 8.60 m. Standard double bed, wardrobe, desk and bathroom package must be re-laid out. The 2.20×2.40 m bathroom allowance from the dossier must be checked against the new width and door position. Do not reuse R2.0 furniture coordinates. Ground room furniture is also not yet instance-positioned.

## Geometry risks
- Balcony corner pads and side legs must form one continuous collision/floor polygon.
- Rail segments must terminate at room doors and stair opening without gaps or blocked egress.
- The stair envelope is a reservation, not an exact mesh; confirm landing, run, headroom and guardrail.
- North stair lies inside reception; preserve reception queue, counter access and entrance.
- ROOM 12 vestibule and D-13C opening must join the east balcony to north crossbar.
- Room windows must face exterior, room doors must face balcony.
- Flat roof needs drainage but no player access.
- THE GUEST height 2.60 m does not define capsule; both-floor navigation must be tested.

## Arithmetic
Site 84×72=6,048 m². Courtyard nominal 44×30=1,320 m². Upper balcony side legs each 2.50×30.00=75 m²; north crossbar 44.60×2.50=111.50 m² before corner union adjustments. 20×0.18=3.60 m rise. 9×0.28=2.52 m run per flight.

## Required validation matrix
1P full completion; 2P simultaneous photo inspection; 3P capture/rescue; 4P queue, stair, balcony and ROOM 13. Player and NPC stair ascent/descent. NPC no wall vision/clipping. Door/camera/capsule. Balcony guardrail and fall prevention. ROOM 12 enter, traverse, inspect ROOM 13, return. Disconnect/rejoin and pickup persistence. All EDITOR-TEST REQUIRED.

## Approval
NOT APPROVED for final environmental asset production. R2.1 is PROPOSED TARGET only. No ENGINE-VERIFIED items are asserted.