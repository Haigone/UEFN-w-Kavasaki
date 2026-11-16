# NAVIGATION AND PLAYER FLOW — LD-GEO R2.0
Status: route intent; all movement checks EDITOR-TEST REQUIRED.

## Player flow
```text
PARKING / SOUTH GATE
        ↓
MOTEL ENTRY / RECEPTION
        ↓
NORTH LINK + WEST / EAST CORRIDORS
        ↓
ROOMS 01–06 + SERVICE OBJECTIVES
        ↓
STAIR → UPPER CORRIDOR
        ↓
ROOMS 07–12
        ↓
ROOM 12 PANEL → EAST VESTIBULE → U-NORTH HALL → ROOM 13
        ↓
RETURN THROUGH SAME SECRET ROUTE
        ↓
GENERATOR / GATE / VEHICLE ESCAPE
```

## Player requirements
Primary corridors 2.50 m clear target; ordinary routes 0.90 m minimum target; interaction approach 1.20×1.20 m; reception queue 2.50×1.50 m. Four players must not deadlock in stair doors, reception or ROOM 13. Two players should inspect photos simultaneously while another pair can wait without blocking the only exit. Every required pickup and clue must be solo-accessible and recoverable after disconnect. No mandatory jump/mantle unless enabled and tested.

## THE GUEST
Do not assign final patrol coordinates until blockout nav and wall geometry exist. Candidate node classes: reception/lobby, west corridor, east corridor, upper stair landing, ROOM 12 investigation point. Nodes must be placed on walkable floor, outside wall/furniture collision and door swing. Secret route access is a narrative decision; do not assume the NPC can traverse it.

Chase loop needs at least two viable player continuation choices, line-of-sight occlusion, a recoverable termination state and no forced dead-end capture. No-go zones: solid walls, electrical hazards, locked service spaces, inaccessible prop backs, balcony edges and secret passage unless explicitly enabled. Solo capture recovery must exist independently of teammate rescue.

## Multiplayer test cases
1P: full completion. 2P: pass and inspect together. 3P: one captured, two rescue. 4P: reception queue, rooms, stairs and secret-room inspection. Join-in-progress/disconnect: no unique objective permanently lost. Record map revision, player count, NPC/device setup, route, pass/fail and evidence for every test. No navigation success is claimed from plan review alone.