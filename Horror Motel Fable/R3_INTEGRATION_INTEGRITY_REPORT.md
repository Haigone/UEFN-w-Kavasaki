# R3 INTEGRATION INTEGRITY REPORT
Project: THE MOTEL: ROOM 13
Date: 2026-11-16
Branch: main
Status: **STATIC DOCUMENT / CSV CROSS-CHECK COMPLETE FOR THE LISTED SCOPE — UEFN / SEMANTIC RUNTIME VERIFICATION NOT RUN**

## 1. Scope and method

Read the current main-branch source files and ran structural CSV parsing plus cross-reference checks on geometry, furnishing, interaction, puzzle, event, device, UI, audio and lighting registers. Checks performed:
- CSV header/data row widths and duplicate stable IDs.
- Opening-to-host-wall and wall-to-opening reference integrity.
- Furniture footprint against assigned room envelope using schedule dimensions, yaw-aware footprint and the room register's axis-aligned bounds.
- Interaction ID coverage against the event crosswalk.
- Event catalog ID continuity.
- Device binding ID uniqueness and row count.
- Audio cue Audio_ID and Subtitle_String_ID resolution.
- Lighting cue Light_ID resolution.

This is a static repository audit. It does not run UEFN, prove mesh pivots, wall collision, navmesh, actor reach, Verse compilation, multiplayer replication or gameplay.

## 2. Geometry register checks

| Check | Result | Status |
|---|---:|---|
| Room coordinate register | 57 data rows; 16 columns | PASS — structural |
| Room furnishing schedule | 183 data rows; 17 columns | PASS — structural |
| Door/window schedule | 51 openings; 16 columns | PASS — structural |
| Wall schedule | 72 rows; 15 columns; 72 unique Wall_IDs | PASS — structural |
| Opening IDs resolve to host walls | 51/51 | PASS — reference |
| Wall opening references resolve to opening IDs | 100% | PASS — reference |
| Duplicate opening references | 0 | PASS |
| Furniture footprints outside room envelope | 0 after corrections | PASS — static bounds |

### Furniture corrections applied

Six wardrobe footprints were outside their assigned room bounds in the previous schedule. Their X coordinates were corrected in room_furnishing_schedule.csv:

| FURN_ID | Old X | New X | Room |
|---|---:|---:|---|
| F01_WARDROBE | 10.40 | 11.70 | ROOM 01 |
| F02_WARDROBE | 10.40 | 11.70 | ROOM 02 |
| F03_WARDROBE | 10.40 | 11.70 | ROOM 03 |
| F10_WARDROBE | 66.00 | 67.30 | ROOM 10 |
| F11_WARDROBE | 66.00 | 67.30 | ROOM 11 |
| F12_WARDROBE | 66.00 | 67.30 | ROOM 12 |

All 183 furniture footprints now fit the assigned room's axis-aligned envelope under the schedule's centre-origin assumption and yaw-aware footprint calculation. Door swings, mesh pivots, wall clearance, collision and NPC traversal still require editor verification.

## 3. Gameplay and event cross-reference

| Check | Result | Status |
|---|---:|---|
| Interaction register | 32 rows; IN-001–IN-032; unique IDs | PASS — structural |
| Puzzle register | 5 rows; PZ-01–PZ-05; unique IDs | PASS — structural |
| Event/interaction crosswalk | 32 unique interaction rows; every IN-001–IN-032 present exactly once | PASS — mapping coverage |
| Event catalog | EVT-001–EVT-051; 51 unique IDs | PASS — structural |
| Device binding register | 50 rows; 50 unique Device_IDs | PASS — structural |
| UI string table | 100 unique String_ID rows | PASS — structural |

### Logic conflicts resolved in this pass

1. **ESCAPE CarKeys dependency cycle:** CarKeys pickup is now optionally available after FinaleReady in Act VI. Picking up the keys does not select or commit ESCAPE. Vehicle ignition commits VehicleIgnitionSucceeded; CoreEscapeReady is derived. If ESCAPE is not yet eligible, it is omitted from the ending selector; players may close the selector, collect keys, ignite the vehicle and reopen it. THE_TRUTH and THE_NEW_GUEST never require CarKeys.
2. **THE_NEW_GUEST eligibility cycle:** NewGuestInvitationAvailable is the pre-confirmation predicate (FinaleReady plus invitation presentation). NewGuestAccepted is the EndingManager output only after every currently connected eligible player explicitly accepts. The acceptance result is not a prerequisite to displaying the invitation.

The controlling files were synchronized: OBJECTIVE_AND_EVENT_CATALOG.md, INTERACTION_EXECUTION_SPEC.md, PUZZLE_EXECUTION_DETAIL_R2.md, ENDING_IMPLEMENTATION_SPEC.md, ENDING_DESIGN_SPEC.md, EVENT_AND_STATE_TRANSITION_CATALOG_R2.md and EVENT_INTERACTION_VERSE_CROSSWALK_R1.md.

## 4. UI, audio and lighting cross-references

| Check | Result | Status |
|---|---:|---|
| Audio register | 24 Audio_ID rows | PASS — structural |
| Audio cue sheet | 25 cue rows | PASS — structural |
| Audio cue Audio_ID references | All resolve to AUDIO_REGISTER.csv | PASS — reference |
| Audio cue Subtitle_String_ID references | All non-NONE values resolve to UI_STRING_TABLE.csv | PASS — reference |
| Lighting register | 10 Light_ID rows | PASS — structural |
| Lighting cue sheet | 9 cue rows | PASS — structural |
| Lighting cue Light_ID references | All resolve to LIGHTING_REGISTER.csv | PASS — reference |

Repeated audio/light IDs in cue sheets are intentional when one asset is used by multiple authored cues. The historical combined lighting_audio_schedule.csv remains non-authoritative.

## 5. Asset inventory and rights readiness

- asset_manifest.csv and ASSET_MANIFEST_EXECUTIVE.csv have been expanded and synchronized to 94 unique Asset_ID rows.
- ASSET_PRODUCTION_BACKLOG_R1.csv contains 60 production packages with priority, deliverable, dependency and import/source status.
- ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv contains 94 rows, one per master Asset_ID.
- All 94 rights rows currently remain NOT SOURCED; source URL, license proof and commercial/UEFN publishing rights are intentionally blank until actual sourcing occurs.
- No asset is claimed to have been acquired, licensed, created or imported by this audit.

## 6. Official UEFN capability evidence reviewed

Official Epic documentation currently documents:
- NPC Spawner and custom NPC behavior, with NPC Spawner explicitly Beta.
- NPC navigation to a position/agent through the navigatable interface.
- Skeletal mesh and animation import/playback workflows.
- Per-player custom UI built with Verse and UMG; documented player_ui add/remove/focus and interactable Button/Slider workflows.

References and implementation consequences are recorded in UEFN_VERIFIED_REFERENCE_REGISTER_R1.md. These platform features are documented, but the project-specific combination is not verified: THE GUEST route navigation, stair traversal, hearing/perception model, animation state transitions, multiplayer synchronization, journal input/focus and device configuration all require minimal project proofs.

## 7. Remaining blockers — not closable by repository parsing

| Priority | Blocker | Required evidence |
|---|---|---|
| P0 | Native UEFN project and target editor version not evidenced in this repository | Openable project, version/build, project inventory and recoverable backup |
| P0 | R2.3 greybox not evidenced | UEFN map build, Outliner, collision and traversal recordings |
| P0 | Exact Verse API/device compatibility for this project | Minimal proofs and compile logs on target editor |
| P0 | THE GUEST route/navigation feasibility | NPC route tests across both floors, stair, balcony and secret passage |
| P1 | Furniture mesh pivot/door swing/player clearance | Editor placement and traversal evidence for all 183 rows |
| P1 | Asset source/licensing | 94 per-asset source/rights records completed with archived license proof |
| P1 | Asset creation/import | Accepted imported assets with UEFN version and measured properties |
| P1 | Verse implementation | Source modules, compile output and runtime state tests |
| P0 final | Solo/2P/4P gameplay QA | Full runs, edge-case recordings, test logs |
| P0 final | Performance/memory/island validation | Target platform reports and validation output |
| P0 final | Publication | Explicit owner authorization after all gates pass |

## 8. Additional R3 location resolution — Service Control Bay

A location ambiguity was resolved after the static CSV audit. The player-accessible Service Control Room is the existing ground-floor GF-SERVICE-BAY (X 47.30–57.00 m, Y 53.85–59.70 m), entered from Storage through D-G16 using the reusable Service Key. The two finale controls are anchored inside this existing envelope. U-SERVICE remains sealed/no-access/no-navmesh and must never receive gameplay actors or player spawns. Exact anchors and access behavior are in SERVICE_CONTROL_BAY_LOCATION_AND_INTERACTION_SPEC_R1.md. No structural geometry changed.

## 9. Current conclusion

**Documentation and static cross-register coverage are materially complete for this pass.** The repository now has a canonical R3 execution brief, expanded asset backlog and rights register, room fit-out rules, official UEFN reference register, expanded device bindings and an explicit static integrity report.

The project is not an implemented or release-ready island. All engine/editor/runtime gates remain open until reproducible UEFN evidence is committed.