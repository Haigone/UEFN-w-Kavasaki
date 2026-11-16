# ROOM-BY-ROOM ENVIRONMENT ART SPEC
Revision 1.0 | Status: PROPOSED DRESSING — PLACEMENT SUBJECT TO GEOMETRY VALIDATION

## Shared guest-room kit
Standard kit target dimensions (metres): bed 1.60×2.10×0.55; headboard 1.65×0.10×1.10; bedside table 0.45×0.45×0.55 (2); wardrobe 1.20×0.60×2.00; luggage rack 0.75×0.45×0.55; desk 1.10×0.55×0.75; chair 0.48×0.50×0.90; CRT 0.55×0.50×0.50; TV cabinet 0.90×0.45×0.65; phone 0.18×0.22×0.12; bathroom vanity 0.80×0.50×0.85; toilet 0.40×0.70×0.75; shower 0.90×0.90 footprint; mirror 0.60×0.05×0.90. All are PROPOSED TARGETS from production requirements.

Every room must retain a continuous 90 cm minimum route target, door swing clearance and interaction approach. Do not use the repeated kit blindly: inspect the actual room polygon and bathroom partition layout first. The current furnishing schedule is a proposal and requires collision/clearance review.

## Ground-floor rooms
### ROOM 01 — Impossible feed
Standard kit. CRT screen aimed along the approved doorway/bed sightline; create a controlled CRT screen material and a separately testable feed sequence. Do not assume true reflection or live camera feed support.
### ROOM 02 — Abandoned luggage
Standard kit plus open suitcase (0.70×0.45×0.25 m target) and battery pickup. Keep battery in a reachable, non-blocking interaction zone. Suitcase contents must read clearly from player height.
### ROOM 03 — Mirror scare
Standard kit plus mirror. Specify a player viewing mark, trigger volume and staged alternate scare if true reflections are unavailable. Mirror mesh collision disabled unless gameplay needs it.
### ROOM 04 — Telephone clue
Standard kit plus phone clue. Phone interaction point must be reachable from the route; clue text and subtitles are English and readable at first-person distance.
### ROOM 05 — Sparse room
Do not populate with the full standard kit. Retain only the approved minimal bed/fixture set and selected narrative clue. Footstep source is ceiling/audio implementation, not a visible speaker unless story calls for it.
### ROOM 06 — Missing guests
Standard kit plus photo wall. Each photo has a unique ID, readable content, consistent frame style and controlled roughness/glass. Keep photos visible without blocking door or circulation.

## Upper-floor rooms
### ROOM 07 — Owner foreshadow
Standard kit with one restrained owner-related clue. No new mandatory puzzle.
### ROOM 08 — Unease
Standard kit with environmental storytelling and subtle dressing; do not add a progression dependency.
### ROOM 09 — Diary
Standard kit plus diary. Diary lies on a reachable surface with an interaction approach. Page layout supports English text at readable size; use texture/UMG/UI approach approved by gameplay, not tiny mesh lettering.
### ROOM 10 — Optional foreshadow
Standard kit and optional scare. Any new interaction must remain optional unless game design updates progression.
### ROOM 11 — Child's room
Child bed 0.90×1.90×0.45 m target, toy chest 0.80×0.45×0.50 m target, restrained toys, child's drawing, period-correct light and defined sound origin. Preserve clear player path and avoid overly saturated toy colours.
### ROOM 12 — Concealed panel
Standard kit rearranged to keep the north-wall panel clear. Panel target 0.90×2.10 m, latch target 1.10 m above floor. Keep 1.20×1.20 m interaction approach target. Hidden route must be physically continuous and approved before modelling.
### ROOM 13 — Secret room
Bed, wardrobe, CRT, phone, four chronological photos, owner portrait, clock frozen at 02:13, hidden compartment and clue props. The north photo wall is the intended focal point in the current plan. Two players should be able to inspect the photos simultaneously without blocking the only exit; verify with actual player capsules. Keep entrance swing and 1.20×1.20 m approach clear.

## Shared spaces
### Reception
Counter target 3.60×0.90×1.10 m; bell 0.10×0.10×0.08; ledger 0.30×0.22×0.05; key rack 1.20×0.12×0.80; clock Ø0.35; telephone; CRT security monitor; two waiting chairs. Reserve queue/interaction area 2.50 m wide × 1.50 m deep target. Warm desk lamp against cool exterior spill.
### Owner office
Desk 1.80×0.80×0.75; chair 0.65×0.65×1.10; filing cabinet 0.90×0.45×1.30; photo board 1.50×0.08×1.00; locked drawer 0.50×0.45×0.20. Board content and clue order must follow narrative/gameplay authority.
### Storage
Shelving 0.90×0.45×2.00; cleaning cart 0.90×0.50×1.00; toolbox 0.50×0.30×0.25; screwdriver and spare battery. Keep 0.90 m route from entrance to exit.
### Electrical room
Fuse panel 1.20×0.25×1.40; labelled A/B/C sockets; workbench 1.50×0.70×0.90; shelving 0.90×0.45×2.00; generator console 0.80×0.50×1.10. Reserve 1.20 m clear working zone in front of panel. Distinguish safe interaction zone from live hazard volume.

## Exterior
- Parking: aged asphalt, paint lines, wheel stops, oil, puddles, broken vehicle and road shoulder.
- Arrival: RAVEN MOTEL neon, entrance/gate, roadside information sign.
- Courtyard: wet paving, drains, vending machine, weeds, dead plants, restrained trash.
- Service yard: dumpster, utility boxes, conduit, generator, gate motor and service waste.
- Vehicle: 1980s silhouette approved by narrative; create separate exterior, interior and damaged-state assets if required. Do not reproduce a real manufacturer badge without clearance.
- Sign: separate support, cabinet, face, neon tubes/emissive elements and electrical service details. Verify emissive and actual lighting separately.

## Prop placement authority
Use PROP_PLACEMENT_REGISTER.csv as the placement index. Existing coordinates from room_furnishing_schedule.csv and exterior_prop_schedule.csv remain PROPOSED TARGET until geometry and first-person collision tests pass. Do not infer absent prop coordinates.
