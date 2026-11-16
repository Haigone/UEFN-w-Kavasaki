# LEVEL DESIGN R2.1 — DOCUMENT INDEX & SOURCE-OF-TRUTH NOTICE
Revision: LD-GEO R2.1 | Date: 2026-11-16

## Authority
For all other project chats and production disciplines, LEVEL_DESIGN_GEOMETRY.md revision R2.1 is the sole candidate geometry authority. Earlier geometry values in EXECUTIVE_BUILD_DOSSIER.md, EXECUTIVE_FLOORPLANS.md and R1/R2.0 drafts are superseded wherever they conflict with R2.1. The original files remain historical references and must not be used to place assets.

## Owner-locked decisions
- North stair in reception/north connector.
- Continuous U-shaped upper balcony facing courtyard, 2.50 m clear target.
- ROOM 13 in north connector, upper floor.
- Flat, non-playable roof.
- THE GUEST intended to navigate both floors via north stair.

## Controlled files
LEVEL_DESIGN_GEOMETRY.md — authority; FINAL_GROUND_FLOOR_PLAN.md and FINAL_UPPER_FLOOR_PLAN.md — plans; GROUND_FLOOR_PLAN_R2.svg and UPPER_FLOOR_PLAN_R2.svg — schematic graphics, not CAD; LEVEL_SECTIONS.md — section control; STAIR_PLAN_R2.md — stair; ROOF_PLAN_R2.md — roof; ROOM_COORDINATE_REGISTER.csv — coordinates; DOOR_WINDOW_SCHEDULE.csv — openings; ROOM_FURNISHING_SCHEDULE.csv — initial placed prop subset, not complete furnishing; NAVIGATION_AND_PLAYER_FLOW.md — player/NPC routes; GEOMETRY_VALIDATION_REPORT.md — risks and acceptance; UEFN_BLOCKOUT_BUILD_GUIDE.md — greybox build; CLAUDE_GEOMETRY_EXECUTION_BRIEF_R2.1.md — Claude handoff.

## Status and restrictions
R2.1 is a design proposal and handoff baseline, not a final approved construction package. No ENGINE-VERIFIED claim is made. Claude performs all UEFN editor tests and supplies evidence. Until geometry, wall/floor/ceiling schedules, all furniture placements, stair, balcony, secret route and THE GUEST navigation are closed and tested, only greybox work is authorized. Final environmental asset production remains blocked.

## Update protocol
Any geometry change must update the authority file first, then all affected plans, sections, coordinate/opening/furniture schedules, navigation and Claude brief. Record revision, commit SHA, reason, affected IDs and validation evidence. Other chats must quote current revision and must not silently retain obsolete coordinates.