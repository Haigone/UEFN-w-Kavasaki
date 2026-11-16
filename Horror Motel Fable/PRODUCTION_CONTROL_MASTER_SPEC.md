# PRODUCTION CONTROL MASTER SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **CURRENT DOCUMENTATION AUTHORITY / IMPLEMENTATION NOT CERTIFIED**
Repository: Haigone/UEFN-w-Kavasaki, branch main

## 1. Purpose

This document is the navigation and conflict-control layer for the complete production package. It prevents the executor from having to infer which document is current, which values are approved, what can be implemented, or who can approve a change.

It does not replace discipline-specific specifications. It identifies the controlling source for each domain and defines how conflicts are handled.

## 2. Project invariants

- Product: THE MOTEL: ROOM 13, Raven Motel, United States, 1986.
- Platform: Fortnite / UEFN. No Unity, standalone Unreal, browser or substitute engine.
- Experience: first-person survival horror, solo and 1–4 player co-op.
- Target first-playthrough duration: 40–50 minutes; pacing target, not a timer.
- Shipped player-facing language: English.
- Antagonist: THE GUEST; owner identity is the same person/manifestation.
- Exactly three endings: ESCAPE, THE TRUTH, THE NEW GUEST.
- Atmosphere and survival over combat.
- All required progress is solo-completable; team quest state is session-authoritative.
- No editor, compile, import, playtest, performance or publication claim without real evidence.

## 3. Responsibility boundary

**ChatGPT / documentation production**
- Maintain source hierarchy, specs, registers, exact values, decision packets, dependency maps, execution plans, acceptance tests and cross-document consistency.
- Identify unknowns and mark them as verified, fixed, proposed or editor-test required.
- Never claim to have operated UEFN or validated an engine-dependent behaviour.

**Claude / implementation and evidence**
- Operate the actual UEFN project; author geometry, Verse, device configuration, asset imports, AI, cinematics and all editor/playtest/compile/performance/validation tests.
- Return reproducible evidence using the required task handoff format.

**Project owner**
- Approve creative canon, material scope changes, deviations from approved geometry and publication.
- A general “proceed” instruction applies only to the clearly identified scope in the decision record; it does not silently approve unrelated narrative proposals.

## 4. Document authority map

| Domain | Controlling document(s) | Supporting documents | Not authoritative |
|---|---|---|---|
| Production governance | This file; MASTER_TASK_REGISTER.md; CLAUDE_EXECUTION_PROTOCOL.md | PRODUCTION_ROADMAP.md; PRODUCTION_COMPLETION_HANDOFF.md | Historical audit snapshots |
| Geometry | LD_GEO_R2.3_APPROVAL_RECORD.md; LEVEL_DESIGN_R2.3_INDEX.md; LEVEL_DESIGN_GEOMETRY.md R2.3 | ROOM_COORDINATE_REGISTER.csv; DOOR_WINDOW_SCHEDULE.csv; SLAB_SCHEDULE.csv; LEVEL_SECTIONS.md; STAIR_PLAN_R2.md; ROOF_PLAN_R2.md; UEFN_BLOCKOUT_BUILD_GUIDE.md | R2.2 and earlier packets; EXECUTIVE_BUILD_DOSSIER.md; legacy lower-case duplicates unless explicitly reconciled |
| Narrative | GAME_DESIGN_BIBLE.md; NARRATIVE_MASTER_SCRIPT.md; approved owner decision record | NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md; STORY_DOCUMENT_REGISTER.md; NARRATIVE_ACCEPTANCE_TESTS.md | Any proposal text until owner approval |
| Gameplay | GAMEPLAY_SYSTEMS_SPEC.md; GAMEPLAY_FLOW_AND_TESTS.md; ACT_AND_OBJECTIVE_MATRIX.md | PLAYER_STATE_MACHINE.md; ITEM_AND_INVENTORY_SPEC.md; CAPTURE_AND_RESCUE_SPEC.md; CHECKPOINT_AND_RECOVERY_SPEC.md; GAMEPLAY_UI_UX_SPEC.md |
| Puzzles/interactions | PUZZLE_IMPLEMENTATION_SHEETS.md; PUZZLE_MASTER_REGISTER.csv; INTERACTION_MASTER_REGISTER.csv | GAMEPLAY_ACCEPTANCE_TESTS.md; UI/UX spec | Narrative draft where its item grants conflict with authoritative interaction IDs |
| Monster AI | MONSTER_AI_BEHAVIOUR_SPEC.md | GUEST_MODEL_SPEC.md; NAVIGATION_AND_PLAYER_FLOW.md; GAME_BALANCING_SPEC.md; capture spec |
| Verse/UEFN | UEFN_IMPLEMENTATION_SPEC.md; VERSE_SYSTEM_DESIGN.md; UEFN_DEVICE_BINDINGS.csv | target editor's Verse digest and official UEFN docs | API-neutral pseudocode as proof of compilation |
| Character | GUEST_MODEL_SPEC.md; asset register/manifest | model sheet, rig/animation briefs | Concept image as proof of imported asset |
| Assets/audio/lighting | ASSET_AND_CONTENT_REGISTER.md; ASSET_PRODUCTION_PIPELINE_SPEC.md; canonical asset manifest; AUDIO_REGISTER.csv; LIGHTING_REGISTER.csv; AUDIO_CUE_SHEET.csv; AUDIO_MIX_POLICY.md; LIGHTING_CUE_SHEET.csv; LIGHTING_STATE_SPEC.md | environment art intake after revalidation | PR #1 placements before reconciliation |
| Cinematic/presentation | CINEMATIC_AND_PRESENTATION_SPEC.md; ENDING_DESIGN_SPEC.md; ENDING_IMPLEMENTATION_SPEC.md | UI_STRING_TABLE.csv; audio/lighting cue sheets | camera/animation capability assumptions without target-editor proof |
| UI/presentation | GAMEPLAY_UI_UX_SPEC.md; UI_STRING_TABLE.csv; OBJECTIVE_AND_EVENT_CATALOG.md | audio/lighting cue sheets; interaction register | ad hoc strings without stable IDs |
| QA/release | QA_ACCEPTANCE_MATRIX.md; GAMEPLAY_ACCEPTANCE_TESTS.md; NARRATIVE_ACCEPTANCE_TESTS.md | performance/validation report; release checklist | Documentation-only PASS claims |

If two documents in the same row disagree, record the conflict and use the higher-ranked source only for the narrow domain it governs. Never copy a value from a stale document merely because it is more detailed.

## 5. Geometry approval boundary

LD-GEO R2.3 is approved by the owner for design on 2026-11-16, covering GEO-A01–GEO-A21. This approval does not mean:
- geometry has been built in UEFN;
- collisions/navmesh/player traversal have passed;
- the structure is certified or editor-verified;
- room interior/bathroom fit-out is approved;
- editor-driven deviations are authorized.

R2.3 dimensions and constraints are controlled by the R2.3 approval record and index. Any required geometric deviation must be submitted as a revision proposal with source IDs, exact coordinates, plan/section impact and gameplay impact. Do not silently edit canonical geometry.

## 6. Owner-approved gameplay decision

END-A01 co-op ending resolver is approved:
- ESCAPE and THE TRUTH: strict majority of currently connected eligible players.
- THE NEW GUEST: explicit unanimous affirmative confirmation of all currently connected eligible players.
- Tie/timeout for ESCAPE/THE TRUTH: choose ESCAPE only if eligible; otherwise keep choice active for another vote; never silently choose THE TRUTH.
- Disconnect removes player from active electorate and recalculates/reconfirms; disconnect is never consent.
- Solo: direct choice.
- Ending is session-wide and committed atomically once.

This decision is controlling even if older documents state different vote rules.

## 7. END-A02 and narrative decision boundary

END-A02 is not approved. A detailed recommended three-clue evidence gate is in END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md:
- ROOM 09 diary;
- ROOM 11 child's drawing;
- ROOM 06 missing-guest photo archive.

If approved, these three alone set TruthChainComplete. SecretPanelOpened, PhotoSequenceSolved and OwnerIdentityRevealed/Room13RevealComplete remain separate progression/reveal gates, not duplicate evidence pickups.

NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md is complete draft content but remains proposal-only. The consolidated owner decision packet is OWNER_DECISION_PACKET_R1.md. No proposal becomes canon until the owner explicitly approves its listed scope.

## 8. State ownership and transaction invariants

| Data | Sole logical owner | Invariant |
|---|---|---|
| Act/objective/checkpoint/ending | GameManager | One authoritative session state; ending commits once |
| Player state/capture/rescue | PlayerManager | Guarded transitions; no duplicate capture/rescue |
| Puzzle state | PuzzleManager | Atomic, idempotent, retryable transaction |
| Shared quest inventory | InventoryManager / GameManager contract | Session set; no individual ownership dependency |
| Monster state/target/stimuli | MonsterController | No omniscient tracking; valid navigation required |
| Tension | DifficultyManager | Bounded 0–100; cannot bypass fairness |
| HUD/journal/audio/cinematic | Presentation managers | Read-only presentation; cannot own progression |

All event handlers must validate state, prerequisites, range, actor availability, connection status and lock ownership before commit. Failed transactions release locks and do not consume irreplaceable items.

## 9. Cross-system canonical rules

1. Quest items are team/session-owned; flashlight charge is per player.
2. Room02 battery is not FuseA.
3. Screwdriver is reusable; never consumed by electrical cover or Room12 panel.
4. Fuses become INSTALLED in their matching slots; they are not lost.
5. OfficeKey is granted only by IN-006 after PZ-01; ServiceKey only by IN-017 after PZ-04.
6. Room13Key is narrative/access proof and is never consumed as a key.
7. Car ignition requires both CarKeysObtained and GatePowered.
8. Puzzle success, pickups, clues, reveal and ending commits are idempotent.
9. Mandatory information has readable text/journal fallback; audio alone never gates progress.
10. Optional lore never blocks ESCAPE. THE TRUTH evidence is only what END-A02 explicitly approves.
11. Capture never removes quest items, ends the run or selects an ending.
12. Checkpoint restore reconstructs actors from flags; it never blindly adds duplicate items or replays one-shot events.
13. A disconnected player is removed from current voting/capture/rescue locks; committed team progress remains.
14. UI never owns or infers progression.
15. No AI chase/capture without valid target, route, warning and unprotected state.

## 10. Status vocabulary

- OWNER-APPROVED DESIGN: owner explicitly approved the design choice; not editor-verified.
- CANONICAL DOCUMENT: controlling authored specification; not proof of implementation.
- PROPOSED: recommendation/draft awaiting owner approval.
- ENGINE-VERIFIED: verified against target UEFN release/API.
- EDITOR-VERIFIED: built/configured in actual project and inspected.
- TEST-PASS: test actually executed in target build with evidence.
- BLOCKED: dependency prevents safe progress.
- NOT RUN: no execution evidence exists.

Never use “complete” without stating whether it means document authored, editor built or test passed.

## 11. Universal production packet requirement

Every task packet prepared for implementation must include:
- Task ID, objective and exact scope.
- Source-of-truth references and revision.
- Preconditions and dependencies.
- Exact object/actor/device IDs and field names.
- Exact values and units, with status labels.
- Ordered implementation steps.
- Event/state contracts and transaction guards.
- Success, failure, cancellation, timeout, disconnect, reset and checkpoint behaviour.
- Solo, 2-player and 4-player acceptance scenarios where relevant.
- Recovery path and known limitations.
- Acceptance criteria and required evidence.
- Explicit out-of-scope items and owner decision gates.

## 12. Universal change control

Any proposed change to an approved value must include:
1. Source ID and current approved value.
2. Proposed new value and exact units.
3. Reason and evidence.
4. All dependent files/registers/systems.
5. Geometry, narrative, gameplay, AI, Verse, UI, performance and QA impacts.
6. Migration/backward compatibility and test updates.
7. Owner approval before changing canon.

## 13. Current documentation-level conclusion

The specification package is substantially developed but not fully decision-locked. The immediate documentation priorities are:
1. Consolidate owner approvals for narrative proposal pack and END-A02.
2. Reconcile stale legacy documents and registers to R2.3 authority.
3. Complete dedicated AI, interaction, audio/lighting cue and asset-production specifications where only partial contracts exist.
4. Keep UEFN/editor/API facts explicitly marked as requiring target-version verification.
5. Maintain one actionable master task register and no contradictory current-status claims.

This master specification is a control index. Discipline files remain the detailed technical authority within their domains.
