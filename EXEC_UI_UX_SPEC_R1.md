# THE MOTEL: ROOM 13 — EXECUTION UI/UX SPEC R1
Status: DESIGN BASELINE — implementation and in-editor validation pending
Authority: this document defines the player-facing behavior. Existing narrative, objective, interaction and ending specifications remain authoritative for content and game-state predicates.

## 1. UX principles
- Diegetic presentation first; critical information must remain readable and must never depend on reading optional environmental text.
- No permanent quest waypoint that reveals the solution. Use objective text, directional language and contextual interaction prompts.
- Every state-changing action receives immediate acknowledgement: accepted, progress, completed, unavailable, interrupted or failed.
- Never communicate success before the authoritative game state commits.
- Co-op players receive the same objective state, while personal inventory/charges remain personal where the existing system specifies them.
- Never hide a critical prompt behind THE GUEST, a cinematic overlay or another modal.

## 2. HUD layout and priority
Safe-area layout, responsive to supported screen aspect ratios:
1. Top-left: current act label and primary objective (one headline, maximum two wrapped lines).
2. Top-centre: temporary critical alert only (capture, power failure, finale vote).
3. Bottom-centre: contextual interaction prompt, visible only in range and when interaction is valid or explainably blocked.
4. Bottom-left: player condition/status indicators only for mechanics already present in the authoritative gameplay spec. Do not invent health, stamina or weapon meters.
5. Bottom-right: held/selected usable item and its charge/quantity only when relevant.
6. Objective tracker: compact current objective plus at most two explicit substeps. Never display completed historical objectives by default.

Priority order: capture/critical failure > finale voting > interaction prompt > objective update > item feedback > ambient notifications. Lower-priority messages queue or expire; they must not overlap.

## 3. Objective tracker
States: HiddenBeforeFirstObjective, Active, Updated, Completed, FailedOrBlocked, Finale.
- Show one active objective and optional substeps. Use verb + target, e.g. "Restore the motel power".
- On update, animate a short confirmation then settle to the new state.
- Completion is driven only by the authoritative objective event; never by client proximity or UI animation.
- If blocked, state the missing prerequisite in plain language without exposing a puzzle solution.
- Co-op objective updates are session-wide and appear for all connected players.
- Reconnecting players reconstruct the tracker from authoritative session state, not from local UI history.

## 4. Interaction prompts
Prompt anatomy: action verb + object label + input glyph. Example: "Inspect — Guest Register — [Interact]".
- Show only the highest-priority interactable target in the player's focus/range cone.
- If two targets have equal priority, choose nearest; final tie-break is stable unique interaction ID.
- Prompt appears only when the interaction is currently executable. If a known prerequisite blocks it, show a short disabled reason only when the player deliberately focuses the object.
- Hold interactions show progress, cancel on release, range loss, capture, incapacitation, cinematic lock or target invalidation.
- Tap interactions commit once. Repeated input cannot duplicate rewards or state changes.
- On server rejection, remove progress and show a concise failure reason; never leave a false success state.

## 5. Phone, diary, evidence and inventory
- Phone is a modal diegetic screen. Opening pauses no world simulation and does not make the player invulnerable.
- Diary/evidence pages are readable panels with title, source/location and content. New evidence is visually marked until opened.
- Evidence collection is persistent for the session and idempotent. A second pickup attempt displays "Already recorded".
- Inventory shows only items actually held by that player. Shared quest flags are not falsely presented as physical inventory.
- Closing any panel returns focus to gameplay and clears stale interaction prompts.
- A capture, ending transition or disconnect closes transient panels safely.

## 6. Evidence journal
Each evidence entry has: EvidenceID, display title, room/source, short factual description, discovery state and (if applicable) relationship clue.
- Journal entries are unlocked by authoritative evidence events.
- The journal may show collected evidence and known relationships; it must not infer uncollected evidence.
- Truth-chain completion is evaluated by the authoritative ending predicate only; UI count is informational, never the source of truth.
- The three END-A02 evidence items are the Room 06 missing-guest archive, Room 09 night-manager diary and Room 11 child's drawing. They are mandatory only for THE TRUTH if END-A02 is the approved current owner decision.

## 7. Voting and ending resolver UI
- Show only endings currently eligible under Ending Implementation Spec.
- Each option displays title, one-sentence consequence and a clear eligibility state.
- ESCAPE/THE TRUTH use strict majority of currently eligible connected players. THE NEW GUEST requires explicit unanimous affirmative consent.
- Default voting window: 20 seconds. Display countdown; resolve early only when a valid quorum/result is reached.
- Abstention, timeout and disconnect are never affirmative consent for THE NEW GUEST.
- Tie/timeout for ESCAPE/THE TRUTH selects ESCAPE only if eligible; otherwise reopen vote. Never auto-select THE TRUTH.
- During THE NEW GUEST, any eligible player's No/timeout prevents unanimity and returns to the resolver; disconnect removes that player and requires fresh unanimity among remaining eligible players.
- Disable duplicate voting after a player's valid vote; allow vote change only until resolution and communicate that rule consistently.
- Ending commit is session-wide and atomic. UI transitions only after commit acknowledgement.

## 8. Accessibility and readability
- All critical text uses high-contrast backing or outline; do not rely on hue alone.
- Distinguish objective, warning, success and failure with icon + wording, not color alone.
- Provide subtitle toggle and scalable subtitle size where supported by project settings.
- Subtitle lines should be concise, remain on-screen long enough to read, and identify speaker when not visually obvious.
- Avoid rapid full-screen flashes. Use fades and controlled luminance transitions.
- Interaction glyphs must map to the active input device and update when the device changes.

## 9. UI state recovery
On join/rejoin or UI reconstruction, read authoritative state in this order: session phase/ending lock, player eligibility/capture state, objective state, personal inventory/charges, evidence collection, active interaction. Never replay old success notifications as if newly earned.
On failure to retrieve state, show a neutral reconnect/synchronising state and disable state-changing actions until reconciliation completes.

## 10. Acceptance criteria
UIX-001 objective tracker always matches authoritative objective state.
UIX-002 no client-only action can complete an objective or evidence item.
UIX-003 every valid/invalid interaction has clear feedback.
UIX-004 prompt never overlaps critical capture/finale UI.
UIX-005 evidence cannot be duplicated by repeated input or co-op race.
UIX-006 reconnect reconstructs correct objective, evidence and inventory state.
UIX-007 ending options exactly match server-authoritative eligibility.
UIX-008 THE NEW GUEST never resolves without explicit unanimity.
UIX-009 UI remains legible at supported aspect ratios and safe areas.
UIX-010 subtitles and interaction glyphs follow accessibility/input settings.

## 11. UEFN implementation notes
Use Verse-authored state as the authority for progression and ending resolution. Use widgets/UI devices only as presentation surfaces. Avoid assuming arbitrary widget persistence or client authority. Validate actual widget APIs, input routing, safe-area behavior and multiplayer replication in the target UEFN version before implementation is marked complete.
