# SERVICE CONTROL BAY — LOCATION AND INTERACTION SPEC R1
Project: THE MOTEL: ROOM 13
Status: **CANONICAL FUNCTIONAL LOCATION DECISION — USE EXISTING R2.3 GEOMETRY ONLY**
Authority: LD-GEO R2.3 / ROOM_COORDINATE_REGISTER.csv / DOOR_WINDOW_SCHEDULE.csv / wall_schedule.csv.

## 1. Resolve the naming ambiguity

The player-accessible Service Control Room referred to by the ending and gameplay documents is the existing ground-floor zone **GF-SERVICE-BAY**. Treat this zone as the **SERVICE CONTROL BAY** in all player-facing and technical documentation.

Do not place any gameplay actor, objective, service console or finale player in **U-SERVICE**. U-SERVICE is an upper-floor sealed technical reserve with no access and no navmesh by owner-approved R2.3 design. It is not the service control room.

This decision does not add or move structural geometry.

## 2. Exact approved envelope and access

- Zone ID: GF-SERVICE-BAY.
- Floor: ground floor.
- Bounds: X 47.30–57.00 m; Y 53.85–59.70 m; floor Z 0.00 m.
- Size: 9.70 × 5.85 m.
- Entry: D-G16, centre X 52.15 m, Y 53.775 m, clear width 0.90 m, clear height 2.10 m.
- D-G16 is in wall GF-STORAGE-SERVICE-BAY and opens north into the Service Control Bay from Storage.
- No second door, new wall, new opening or shortcut may be added.
- The service bay is enclosed by existing R2.3 wall geometry; preserve all host wall references.
- Maximum simultaneous finale occupancy: four players plus the Guest/sequence actors. Keep a 1.20 m clear shared standing zone and 0.90 m clear route from D-G16 to both consoles.

## 3. Interaction and prop anchors

All XYZ values are metres, floor-relative world coordinates. These are selected placement targets inside the approved envelope; confirm pivots/collision in editor. Actor local +X forward is assumed for yaw values; adjust only the mesh pivot/orientation, not the anchor position.

| Anchor ID | Function | X | Y | Z | Yaw target | Interaction |
|---|---|---:|---:|---:|---|---|
| SVC-DOOR-READER | Service Key reader on bay side of D-G16 | 52.15 | 54.05 | 1.10 | Face south toward Storage door | Key opens D-G16; key is not consumed |
| SVC-GATE-CONSOLE | IN-018 service gate control console | 49.70 | 58.95 | 1.10 | Face south into bay | Requires PowerRestored and ServiceKeyObtained; activates service route once |
| SVC-NIGHT-AUDIT | IN-032 NIGHT AUDIT — END CYCLE breaker | 54.60 | 58.95 | 1.10 | Face south into bay | Enabled only after EndingSelected=THE_TRUTH; hold 2 seconds |
| SVC-STATUS-LAMP | Service route status indicator | 52.15 | 58.95 | 1.70 | Face south into bay | Presentation only; reads GatePowered / ServiceRouteReady |

The door reader is an access control, not a new progression flag. IN-018 remains the sole service route commit. IN-032 remains the sole Night Audit commit. Status lamp has no state-writing authority.

## 4. Service key origin and use

- Service Key pickup actor is in the ROOM 13 desk drawer at F13_DESK (X 58.90, Y 52.75, floor Z 3.60; desk top Z 4.35). Place the key pickup anchor at X 58.90, Y 52.75, Z 4.10.
- IN-017 is the only ServiceKey grant; it is enabled only after Room13RevealComplete.
- Service Key is a reusable team item and is never consumed.
- Use the key at SVC-DOOR-READER to open D-G16, then at SVC-GATE-CONSOLE if the console requires a key check. A single item can satisfy both checks.
- If D-G16 actor/lock fails, recovery proxy may open only D-G16 when ServiceKeyObtained=true; it must not set GatePowered or ServiceRouteReady.
- If gate console actor fails, equivalent proxy may commit IN-018 only when PowerRestored AND ServiceKeyObtained.

## 5. Ending staging

- The final selector appears in the Service Control Bay after FinaleReady. Only currently eligible options are displayed.
- THE_TRUTH sequence is staged in this bay. After THE_TRUTH is atomically selected, play the recorder/reveal beats, align portrait and THE GUEST reflection, then enable SVC-NIGHT-AUDIT. All connected players remain together in this bay after blackout.
- THE_NEW_GUEST acceptance is session-wide; the group remains together in the same bay for the shared outcome.
- ESCAPE leaves the bay via Storage/approved route and proceeds to EXT_BROKEN_CAR and EXT_GATE. Do not route ESCAPE through U-SERVICE.
- THE GUEST must not spawn inside the 1.20 m player staging zone during ending selection or Night Audit.

## 6. Required document synchronization

This location decision controls references to “service control room/bay” in:
- ENDING_IMPLEMENTATION_SPEC.md
- ENDING_DESIGN_SPEC.md
- OBJECTIVE_AND_EVENT_CATALOG.md
- PUZZLE_EXECUTION_DETAIL_R2.md
- INTERACTION_EXECUTION_SPEC.md
- UEFN_DEVICE_BINDINGS.csv
- CINEMATIC_AND_PRESENTATION_SPEC.md
- ROOM_INTERIOR_FITOUT_SPEC_R1.md

If any document names U-SERVICE as a playable service room, correct it. R2.3 U-SERVICE remains sealed and untouched.

## 7. Acceptance

- [ ] D-G16 opens from Storage into GF-SERVICE-BAY using ServiceKey.
- [ ] Service Key is not consumed and duplicate use is harmless.
- [ ] IN-018 activates gate only with PowerRestored + ServiceKeyObtained.
- [ ] IN-032 is disabled before THE_TRUTH commit and enabled afterward.
- [ ] Four players can stand, interact and leave without blocking each other.
- [ ] No gameplay actor or player spawn is placed in U-SERVICE.
- [ ] Service bay and escape route work in solo, 2P and 4P.
