# THE MOTEL: ROOM 13 — PERFORMANCE & RELEASE QA BASELINE R1
Status: TARGETS AND TEST PLAN — no engine measurements are implied by this document.
This file defines proposed acceptance targets for the first playable/release candidate. Actual budgets must be measured in UEFN on representative target platforms and revised only with recorded evidence.

## 1. Performance targets
- Frame rate: target stable 60 FPS on the agreed reference platform; minimum acceptable sustained 30 FPS on the lowest supported target. Record platform and capture method.
- Frame pacing: no recurring gameplay hitch caused by monster perception, objective updates, UI refresh or audio cue dispatch.
- Memory: remain below the current UEFN/Island memory budget with at least 10% headroom at the heaviest gameplay location. Use current editor memory calculation, not a guessed static MB limit.
- Streaming: no critical gameplay room, door, monster navigation link or required interactable may be absent when needed.
- Texture/mesh cost: use platform-appropriate texture sizes, LODs and collision complexity. Every imported asset must be listed in the asset manifest.
- AI: avoid per-frame full-world scans. Use bounded sensing intervals, event-driven target updates and capped candidate sets.
- UI: update only when relevant state changes; do not poll all widgets every frame.
- Audio: enforce authored concurrency limits and stop/replace loops on state exit.

## 2. Required measurement scenes
PERF-A: initial motel exterior/arrival.
PERF-B: busiest corridor with THE GUEST active and multiple players.
PERF-C: electrical puzzle with active lighting/audio changes.
PERF-D: Room 13 reveal cinematic and transition.
PERF-E: finale resolver with all connected players and UI.
PERF-F: worst-case co-op scene with all required players, monster, effects and ambient audio.

For each capture record: UEFN version, island revision, platform/device, player count, scene, duration, average FPS, 1% low if available, memory budget result, visible streaming errors, hitch notes and reproduction steps.

## 3. Release gates
GATE-01 document integrity: all referenced authoritative docs exist; no contradictory active versions.
GATE-02 content integrity: all registered interactions, puzzles, assets, audio, lighting and UI string IDs resolve.
GATE-03 functional: all critical-path objectives and three ending eligibility paths pass.
GATE-04 multiplayer: join-in-progress, disconnect, reconnect, vote quorum and race tests pass.
GATE-05 AI: all THE GUEST states and fallback navigation cases pass without trapping players unfairly.
GATE-06 accessibility: subtitles, contrast, controller navigation and non-color-only feedback pass.
GATE-07 performance: measured results meet the approved platform targets and memory headroom.
GATE-08 recovery: checkpoint and all-player capture recovery pass without free resources or lost committed progress.
GATE-09 content: no missing/placeholder critical audio, UI string, collision, material or required asset.
GATE-10 final regression: clean session, full critical path, all endings, solo and co-op.

## 4. Minimum QA matrix
Run each relevant test in solo and supported co-op party sizes; record exact player count and platform. Do not mark a test PASS without a recorded execution result.
- Main critical path from arrival to FinaleReady.
- ESCAPE with and without optional truth evidence.
- THE TRUTH with all three approved evidence flags; verify no car keys dependency.
- THE NEW GUEST unanimous consent, one refusal, timeout and disconnect.
- Each registered puzzle: valid input, invalid input, interruption, retry, simultaneous interaction.
- Every registered interaction: tap/hold, range exit, target change, capture and cinematic interruption.
- THE GUEST: Dormant, patrol, suspicion/investigation, chase, search, capture, return/reset and navigation fallback as defined in AI spec.
- Battery drain, charge, checkpoint snapshot and exact restore.
- Join-in-progress, disconnect, reconnect, AFK and late join during vote.
- Subtitle on/off, controller-only playthrough, input device switching and safe-area checks.
- Worst-case performance scenes PERF-A through PERF-F.

## 5. Evidence required for a PASS
Every test record includes TestID, build/revision, UEFN version, date, tester, party size, platform, preconditions, exact steps, expected result, actual result, evidence capture reference, PASS/FAIL/BLOCKED and defect ID.
A document review, static CSV validation or design approval is not an in-editor functional test.
A test is BLOCKED if the required device/API/asset is not yet implemented or the required platform is unavailable.

## 6. Release blockers
- Any critical-path softlock.
- Any ending selectable when its predicate is false, or unavailable when its predicate is true.
- THE TRUTH incorrectly gated by CarKeys.
- THE NEW GUEST resolving without explicit unanimous consent.
- Duplicate evidence/reward/ending commit.
- Loss of committed progression on reconnect/checkpoint restore.
- Monster navigation failure that prevents the critical path.
- Memory/performance failure against the approved target platform.
- Missing critical subtitles or controller-only interaction path.

## 7. Status vocabulary
DESIGN: behavior decided and documented.
IMPLEMENTED: built in UEFN/Verse, not yet accepted.
EDITOR-VERIFIED: inspected in editor and configuration evidence recorded.
PLAYTEST-PASS: executed in a real session with evidence.
BLOCKED: dependency prevents execution.
NOT APPLICABLE: reason documented.
Never convert DESIGN to IMPLEMENTED or PASS without evidence.
