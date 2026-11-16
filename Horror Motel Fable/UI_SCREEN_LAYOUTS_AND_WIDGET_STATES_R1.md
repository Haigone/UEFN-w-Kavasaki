# UI SCREEN LAYOUTS & WIDGET STATES R1

**Authority:** GAMEPLAY_UI_UX_SPEC.md and EXEC_UI_UX_SPEC_R1.md. This document resolves screen-by-screen layout, content hierarchy and state transitions.  
**Status:** Design specification; exact UEFN widget API and visual implementation remain editor verification tasks.

## 1. Global visual system

- Canvas reference: 1920×1080; all positions are normalized anchors, not fixed pixels. Preserve safe zones on console/TV and mobile.
- Visual language: motel-night analog technology; near-black translucent panels, warm off-white text, muted amber for actionable highlights, desaturated red only for danger/error. No permanent minimap, GPS line, through-wall markers or monster marker.
- Typography: one condensed display face for headings and one highly legible sans-serif for body. Minimum readable body equivalent 22 px at 1080p; subtitles 26 px. Do not encode meaning by color alone.
- Motion: 150–220 ms panel transitions; no continuous UI pulsing except low-battery warning and explicitly authored threat cues. Respect reduced-motion setting.
- Input: every screen has keyboard/mouse and controller focus order; close/back action is consistent. Never trap focus.

## 2. HUD — gameplay default

**Persistent elements**
- Top-left: primary objective title, one-line instruction, optional substep count (e.g. FUSES 1/3).
- Bottom-center: contextual interaction prompt only when a valid interactable is in range and line-of-sight rules pass.
- Bottom-left: flashlight icon and charge ring/percentage for the local player only. Battery warning begins below 15%.
- Bottom-right: optional small teammate status stack (portrait/name + NORMAL / CAPTURED / RESCUING); show only when co-op party size >1.
- Center: reticle only if required by interaction design; never display a permanent crosshair if it is not used for aiming.

**HUD states**
- NORMAL: objective + local flashlight + contextual prompt if applicable.
- OBJECTIVE_UPDATE: title slides/fades in, holds 3 seconds, then returns to normal.
- INTERACTION_FOCUS: prompt displays verb and object (e.g. “HOLD [Interact] — OPEN REGISTER”).
- LOW_BATTERY: icon changes shape and text says “BATTERY LOW”; no screen-wide red flash.
- CAPTURED: normal objective remains visible but input hint changes to rescue/recovery; teammate status shows captured.
- FINAL_CHOICE: suppress routine objective card; show selector prompt and ending eligibility state.
- HIDDEN: during title card or authored full-screen cinematic only.

## 3. Interaction prompt

Anchor bottom-center, max width 40% of screen. First line action in uppercase, second line optional requirement/feedback. Example:
- “HOLD [INTERACT] — OPEN PANEL”
- “REQUIRES: SCREWDRIVER”
- “FUSE B SLOT ALREADY FILLED”

Rules:
- Show only the highest-priority interactable under focus.
- If two targets overlap, nearest valid target wins; tie uses authored priority.
- Prompt disappears within 150 ms after leaving range or losing valid focus.
- Hold progress is a thin ring/line; cancel immediately on release, damage, capture or range exit.
- Never show hidden item names before discovery.

## 4. Journal overlay

Open/close via one semantic Journal action. Overlay occupies 76% width × 82% height, centered, with left navigation and right reading pane.

Tabs in fixed order:
1. OBJECTIVES
2. EVIDENCE
3. NOTES
4. CONTROLS

OBJECTIVES: current objective first; completed objectives collapsed chronologically.  
EVIDENCE: list only discovered evidence; each entry contains title, room, readable transcript, optional image, discovery state. Three Truth evidence entries are marked with a small linked-chain motif only after discovered; do not label them as mandatory until the player has enough narrative context.  
NOTES: discovered puzzle hints, dates and photos. No auto-spoiler answers.  
CONTROLS: semantic input list and accessibility toggles.

Focus defaults to the last-opened tab; first open defaults OBJECTIVES. Close returns focus to the world and restores previous HUD state. Journal is pause-safe and does not stop THE GUEST globally. Reading never increments tension.

## 5. Phone / diegetic message screen

- Opens as a compact centered device frame, max 58% width.
- Message transcript is readable in a scroll pane; playback is optional and never required.
- Buttons: PLAY AUDIO, READ TRANSCRIPT, CLOSE.
- Transcript is the authoritative completion criterion for PhoneMessageHeard when presentation fallback is used.
- If audio fails, transcript still completes the objective. If player closes early, reopening resumes at top but does not duplicate the one-shot audio cue.

## 6. Inventory panel

Compact overlay, 52% width × 58% height. Categories: KEYS / TOOLS / OBJECTS. Show shared team items with a small TEAM marker; flashlight batteries remain local-personal. Each item has icon, name, count and concise description. No drag-and-drop. Items cannot be discarded unless a future spec explicitly allows it. Repeated key items display count 1 and never duplicate.

## 7. Evidence detail

Right-side reading pane with title, room, body, optional image, “ADDED TO JOURNAL” state. Close returns to evidence list at same scroll position. Evidence discovery flag commits only after the text/transcript is actually available to the player. Reinspection is allowed and does not duplicate evidence.

## 8. Puzzle UI layouts

- PZ-01 keypad: centered 3×4 numeric pad, code slots 2-2-2, CLEAR and ENTER. Clue panel sits beside it and remains readable. No countdown.
- PZ-02/PZ-04 photo board: four chronological slots across the board; photo selection opens a 2×2 card tray. Each card shows date on reverse; selected card is visibly outlined. RESET and CONFIRM remain fixed. Do not show correct answer until the puzzle is solved.
- PZ-03 fuse panel: three labelled sockets A/B/C; installed slots show matching letter and icon. Breaker is disabled until all three slots are committed. Missing labels are explicit.
- PZ-05 service control: clear SERVICE KEY requirement, POWER status, GATE status and one ACTIVATE control. Car key/ignition interface appears only after ESCAPE is the chosen path.

## 9. Ending resolver

Centered panel, 70% width × 70% height. Heading “THE MOTEL IS WAITING.” Show only eligible endings as selectable cards:
- ESCAPE — “Leave before the night repeats.” Eligible only when CoreEscapeReady.
- THE TRUTH — “End the cycle.” Eligible only when FinaleReady + TruthChainComplete.
- THE NEW GUEST — “Take the room's place.” Eligible only after invitation interaction; then explicit unanimous confirmation.

For each option show a short eligibility line and vote tally, not hidden requirements. Majority vote for ESCAPE/TRUTH; unanimous explicit acceptance for NEW GUEST. Timer 20 seconds. A no-vote/timeout is not consent. Tie/timeout selects ESCAPE only if eligible; otherwise close/reopen resolver. Solo selects directly. On disconnect recalculate majority; for NEW GUEST reset all remaining confirmations and request them again.

## 10. Capture, rescue and reconnect screens

CAPTURED overlay: “YOU HAVE BEEN TAKEN” plus one clear instruction (wait for rescue / attempt self-recovery). No false death screen. Rescue progress ring appears to rescuer and captured player. After rescue, show “BACK IN THE MOTEL” for 2 seconds; protection duration follows GAME_BALANCING_SPEC.md.

RECONNECT: on return, restore HUD from authoritative flags; show a 3-second summary of current objective and teammates. Do not replay completed cinematic/audio one-shots. Journal, inventory and objective state are rebuilt from session state.

## 11. Subtitle system

Bottom-center, above interaction prompt. Maximum two lines, 42 characters per line target; wrap naturally. Speaker label optional. Hold minimum 1.5 s; duration = max(1.5 s, character_count / 15). Critical clue subtitle persists until dismissed or until equivalent transcript is added to journal. Audio-off run must retain every clue in readable form.

## 12. Accessibility

- Subtitle size: 100/125/150%.
- UI scale: 90/100/110/125%.
- High-contrast text option.
- Reduced motion option.
- Hold-to-interact default; optional tap where safe and supported.
- No puzzle depends on color discrimination, sound alone, tiny text or rapid input.
- Flashlight flicker is low-frequency and never full-screen strobe; include an option to reduce flicker intensity.

## 13. UI acceptance tests

UI-R1-01 objective never reveals undiscovered location; UI-R1-02 objective update does not obscure subtitles; UI-R1-03 journal readable with audio off; UI-R1-04 controller focus order and back action; UI-R1-05 interaction hold cancels on range exit; UI-R1-06 shared items vs personal battery clearly distinguished; UI-R1-07 unavailable endings hidden or clearly locked without leaking clue names; UI-R1-08 New Guest requires explicit unanimous action; UI-R1-09 reconnect restores exact state without duplicate cues; UI-R1-10 16:9 safe zone and UI scale variants; UI-R1-11 high contrast/reduced motion; UI-R1-12 four-player teammate status legible.
