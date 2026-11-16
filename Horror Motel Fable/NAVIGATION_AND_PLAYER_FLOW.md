# NAVIGATION AND PLAYER FLOW — LD-GEO R2.2
Status: navigation design intent. All routes and THE GUEST behaviour require UEFN editor tests.

## Player progression graph
PARKING / SOUTH GATE → RECEPTION → WEST/EAST GROUND CORRIDORS → ROOMS 01–06 + service objectives → NORTH STAIR → UPPER CONTINUOUS COURTYARD BALCONY → ROOMS 07–12 → ROOM 12 PANEL D-13A (69.95,47.475) → EAST VESTIBULE X67–72.9,Y47.55–49.20 → D-13C (66.925,48.45) → EAST CORNER PAD / BALCONY LEG → NORTH BALCONY → D-13B (56.35,50.95) → ROOM 13 → RETURN SAME ROUTE → GENERATOR / GATE / ESCAPE.
No mandatory objective may require a second player. Every pickup and clue must be recoverable after disconnect or failed interaction.

## Continuous balcony geometry
West leg X=17.15–19.70,Y=18.30–48.30; north crossbar X=19.70–64.30,Y=48.30–50.80; east leg X=64.30–66.85,Y=18.30–48.30. Corner pads west X17.15–20.15,Y47.00–50.80 and east X63.85–66.85,Y47.00–50.80. Guardrail centre-lines X19.85, X64.15 and Y48.15; these sit outside the clear walkable area. Corner turning pads connect each leg to the north crossbar; actual floor polygons and rail corners must be one continuous union. Courtyard-side rail 1.10 m target. Clear width 2.50 m.

## THE GUEST — both floors
The Guest is allowed a designed route on ground and upper floors. The primary vertical link is the north U-turn stair (assembly X22.65–25.35,Y52.45–56.17; upper slab cut X22.50–25.50,Y52.30–56.32; south approach clear 1.20 m). No assumption is made that a generic NPC can traverse this stair: pathfinding is EDITOR-TEST REQUIRED. Provisional patrol nodes (centres, metres):
- G-GF-01 Reception (30.0,54.0,0.0)
- G-GF-02 West connector (14.5,49.0,0.0)
- G-GF-03 West corridor (9.55,33.0,0.0)
- G-GF-04 East corridor (74.45,33.0,0.0)
- G-GF-05 Electrical approach (60.0,50.0,0.0)
- G-UF-01 Upper stair approach (24.0,51.70,3.6)
- G-UF-02 West balcony (18.45,33.0,3.6)
- G-UF-03 North balcony (42.0,49.55,3.6)
- G-UF-04 East balcony (65.55,33.0,3.6)
- G-UF-05 Room 12 approach (69.95,46.0,3.6)
- G-UF-06 Room 13 reveal approach (56.35,52.0,3.6)
These are nav-marker proposals, not confirmed reachable points. G-UF-01 is deliberately south of the UF stairwell void (X22.50–25.50,Y52.30–56.32); do not place an NPC/player nav target inside the slab opening. Keep patrol points at least 0.60 m from wall collision and outside rail edge/door swing. THE GUEST may enter both side corridors and balcony; entry into bedrooms, electrical, ROOM 13 or hidden passage is gated by story state. Roof is a no-go volume.

## Chase and recovery
Use a connected loop with at least two player continuation options on each floor. Stair is the only vertical transition; test bidirectional NPC movement and prevent stair landing bottlenecks. Chase termination requires line-of-sight loss or scripted reset; no wall vision, no clipping, no permanent dead-end. Solo capture recovery must exist. 1P, 2P, 3P and 4P tests required.

## Multiplayer acceptance
1P full progression; 2P passing/inspection; 3P capture/rescue; 4P reception queue, stair, balcony and ROOM 13 photo inspection. Validate join-in-progress, disconnect/rejoin, collision seams, player capsule, NPC capsule and navmesh. Record build, revision, player count, route, pass/fail and evidence. No navigation success claimed from document review.