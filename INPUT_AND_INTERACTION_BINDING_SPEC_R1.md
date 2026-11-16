# THE MOTEL: ROOM 13 — INPUT & INTERACTION BINDING SPEC R1
Status: DESIGN BASELINE — exact platform glyph/API validation pending.

## 1. Input principles
- Use the active Fortnite input mapping and current device glyphs; do not hard-code keyboard symbols into UI.
- One gameplay action maps to one semantic action regardless of device.
- Input changes (keyboard/mouse <-> controller) update prompts immediately.
- Menus and gameplay never consume the same press twice.
- Critical actions require an explicit prompt; destructive/ending choices cannot be triggered by accidental double tap.

## 2. Semantic action map
| Action | Keyboard/mouse default | Controller semantic |
|---|---|---|
| Move | WASD | Left stick |
| Look | Mouse | Right stick |
| Interact / confirm | E | Contextual interact |
| Cancel / close panel | Esc | Back |
| Phone / evidence journal | Project-approved dedicated binding | Project-approved dedicated binding |
| Navigate UI | Mouse / arrows | D-pad / stick |
| Select UI option | Left click / Enter | Confirm |
| Change selected option | Scroll / arrows | D-pad / shoulder only if UI design needs it |
| Pause / system menu | Fortnite system binding | Fortnite system binding |

Do not override Fortnite system controls. Phone/journal dedicated bindings must be checked for conflicts in the target project; if a dedicated binding cannot be safely exposed, provide an on-screen contextual button and a UI navigation route.

## 3. Interaction behavior
- Tap interaction: press once; one request; lock duplicate requests until response.
- Hold interaction: begin on press, show progress, commit at configured hold duration; release cancels.
- Hold cancels on release, target loss, range loss, capture, cinematic lock, player incapacitation or session-ending lock.
- No hold interaction may require more than 2.0 seconds unless the registered interaction explicitly justifies a longer deliberate action.
- Puzzle sequences must be usable with controller alone.
- All interactive UI elements expose visible focus, selected and disabled states.
- Controller focus order follows visual reading order; focus never jumps to hidden elements.

## 4. Context resolution
Choose one target by:
1. valid and executable target over blocked target;
2. highest authored interaction priority;
3. nearest valid target;
4. stable InteractionID lexical tie-break.
The prompt and the interaction request must use the same resolved target. If target changes before commit, cancel and require a fresh press.

## 5. Device-change behavior
When active input device changes:
- replace glyphs without changing current objective or interaction state;
- preserve UI focus where possible;
- cancel a hold if the underlying input action is no longer held;
- do not trigger an interaction from the device-change event itself.

## 6. Accessibility
- Interaction prompt text is not conveyed by glyph alone.
- Support remappable actions to the extent permitted by Fortnite/UEFN input settings.
- Avoid simultaneous hold + repeated mash requirements.
- Any timed puzzle must have an accessible timing window and clear progress feedback; no color-only signal.
- Subtitle and UI scaling settings must not hide interaction prompts.

## 7. Acceptance tests
INP-001 every registered interaction works on keyboard/mouse.
INP-002 every registered interaction works on controller.
INP-003 prompts show correct active-device glyph.
INP-004 switching device does not trigger or duplicate an action.
INP-005 releasing a hold cancels without committing.
INP-006 capture/cinematic lock cancels active hold.
INP-007 controller can navigate, read and close phone/journal and ending resolver.
INP-008 no puzzle requires mouse precision or keyboard-only input.
INP-009 duplicate presses cannot double-award items or progress.
INP-010 system menu controls remain available.
