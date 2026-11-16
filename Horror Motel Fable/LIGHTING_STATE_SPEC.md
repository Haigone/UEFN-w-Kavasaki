# LIGHTING STATE & READABILITY SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **LIGHTING DESIGN TARGETS — NOT ENGINE-CALIBRATED**

## 1. Intensity scale

Use a relative visual scale from 0.0 (off) to 1.0 (full authored key) for design communication only. These values are not lumens, candelas or verified UEFN intensity units. Calibrate in the actual project after exposure/post-process settings are fixed.

## 2. State targets

| StateId | Trigger | Zone | Relative target | Colour direction | Transition |
|---|---|---|---:|---|---|
| LSTATE-EXT-BASE | SessionStarted | Exterior | 0.25–0.35 | Cold blue/green night fill | 1.5 s |
| LSTATE-COURTYARD | SessionStarted | Courtyard | 0.15–0.25 | Cold desaturated fill | 1.5 s |
| LSTATE-RECEPTION | ReceptionEntered | Reception | 0.55–0.70 | Warm tungsten 2700–3000 K | 0.8 s |
| LSTATE-POWER-FAIL | Session start before breaker | Ground corridors | 0.10–0.18 | Cold emergency practicals | 1.0 s |
| LSTATE-POWER-ON | PowerRestored | Ground corridors | 0.35–0.50 | Dirty warm fluorescent 3500–4200 K | 1.5 s |
| LSTATE-ROOM13 | Room13Entered | ROOM 13 | 0.30–0.45 red practical | Deep red accent + neutral readable fill | 1.0 s |
| LSTATE-CHASE | FinalChaseStarted | Final route | 0.25–0.40 emergency accents | Red practicals; preserve neutral path fill | 0.5 s |
| LSTATE-NEON-0213 | WorldClock_02_13 / NeonActivated | Exterior sign | 0.70–0.90 emissive | Approved Raven sign palette | 0.5 s pulse; no rapid strobe |
| LSTATE-NEW-GUEST | EndingCommitted_NEW_GUEST | Motel exterior/interior | Restore baseline then staged room-light sequence | Warm/cold contrast resolves into cycle motif | 0.5–1.0 s per authored step |

## 3. Readability invariants

- Every mandatory interactable and clue must remain readable with the flashlight OFF.
- The register, fuse labels, photo dates, diary, drawing, hidden compartment and service control need a minimum local readability fill.
- No light animation may obscure text or make a doorway/step edge disappear.
- Avoid high-frequency flashing and full-screen white flashes. Any flicker is slow, localized and optional for photosensitive safety.
- Corridor, stair, balcony, guardrail and secret route edges must remain visible during chase.
- Red emergency accents never replace neutral route lighting.
- ROOM 13 red lighting must preserve face/portrait and photo-date readability.
- Do not use darkness as a substitute for a clear collision/navigation solution.

## 4. Event and priority rules

- Lighting is driven by the named gameplay event in LIGHTING_CUE_SHEET.csv; no independent timer may mutate objective or ending state.
- PowerRestored transitions corridor lights once; repeat breaker activation cannot replay the transition.
- Room13Entered starts ROOM 13 local state; leaving the room restores its prior state.
- FinalChaseStarted overrides corridor accents but not the readability fill.
- EndingSelected locks the corresponding ending state; a cinematic failure must not leave lights in an intermediate state.
- WorldClock_02_13 is an authored story event, not a real-time system clock unless separately designed.

## 5. Calibration and acceptance

1. Fix exposure/post-process baseline in the target UEFN project.
2. Place a test sample for each light family.
3. Measure/record actual engine units and resulting luminance only after confirming the target workflow.
4. Validate at flashlight OFF/ON, dark display, high brightness and supported console/PC settings.
5. Test 1-, 2- and 4-player sessions and all ending transitions.
6. Confirm the navmesh/collision route remains readable during the final chase.
7. Record UEFN version, light properties, screenshots and performance/memory impact.

No numerical value in this document is an editor-verified light setting.


## THE_TRUTH Night Audit lighting override
When `NightAuditActivated` commits, use LCS-009 to fade corridor and public-room practicals out sequentially, preserving route/edge readability until each authored blackout beat. Keep the exterior neon sign emissive and fixed at the 02:13 motif through the register print and THE TRUTH title card. Do not use strobe, random flicker or a full-screen flash. After title-card completion, the ending world-state remains dark except for the authored neon hold; do not restore normal lighting during the committed ending.
