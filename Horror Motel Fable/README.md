# THE MOTEL: ROOM 13 — Production Documentation Hub

**Current baseline:** LD-GEO R2.3 design approval recorded 2026-11-16.  
**Repository purpose:** complete, controlled specifications and production instructions for a full Fortnite / UEFN island.  
**Important:** this repository is not proof of a native UEFN build, compiled Verse, imported assets or passed playtests.

## 1. Start here — controlling documents

1. [PRODUCTION_CONTROL_MASTER_SPEC.md](PRODUCTION_CONTROL_MASTER_SPEC.md) — authority hierarchy, canonical rules, ownership, change control and cross-system invariants.
2. [MASTER_TASK_REGISTER.md](MASTER_TASK_REGISTER.md) — production work packages, dependencies and acceptance evidence.
3. [OWNER_DECISION_PACKET_R1.md](OWNER_DECISION_PACKET_R1.md) — consolidated remaining narrative/creative approval request.
4. [OWNER_DECISION_GATE_R2.2.md](OWNER_DECISION_GATE_R2.2.md) — owner approval record for geometry GEO-A01–GEO-A21 and co-op ending rule END-A01; END-A02 remains pending.
5. [CLAUDE_EXECUTION_PROTOCOL.md](CLAUDE_EXECUTION_PROTOCOL.md) — strict division between documentation planning and actual UEFN execution/evidence.
6. [CLAUDE_R2.3_EXECUTION_PACKET.md](CLAUDE_R2.3_EXECUTION_PACKET.md) — current R2.3 audit/build gates and immediate authorization.
7. [PRODUCTION_ROADMAP.md](PRODUCTION_ROADMAP.md) — dependency-ordered production phases.
8. [MISSING_DELIVERABLES_REGISTER.md](MISSING_DELIVERABLES_REGISTER.md) and [CONTRADICTION_AND_RISK_REGISTER.md](CONTRADICTION_AND_RISK_REGISTER.md) — outstanding work and risks.

## 2. Approved geometry authority

- [LD_GEO_R2.3_APPROVAL_RECORD.md](LD_GEO_R2.3_APPROVAL_RECORD.md) — owner-approved design geometry GEO-A01–GEO-A21.
- [LEVEL_DESIGN_R2.3_INDEX.md](LEVEL_DESIGN_R2.3_INDEX.md) — controlling R2.3 geometry source hierarchy.
- [LEVEL_DESIGN_GEOMETRY.md](LEVEL_DESIGN_GEOMETRY.md) — R2.3 geometry definition.
- Controlled schedules: [ROOM_COORDINATE_REGISTER.csv](ROOM_COORDINATE_REGISTER.csv), [DOOR_WINDOW_SCHEDULE.csv](DOOR_WINDOW_SCHEDULE.csv), [SLAB_SCHEDULE.csv](SLAB_SCHEDULE.csv), [coordinate_schedule.csv](coordinate_schedule.csv), [wall_schedule.csv](wall_schedule.csv), [STAIR_PLAN_R2.md](STAIR_PLAN_R2.md), [ROOF_PLAN_R2.md](ROOF_PLAN_R2.md), [LEVEL_SECTIONS.md](LEVEL_SECTIONS.md).
- [GEOMETRY_VALIDATION_REPORT.md](GEOMETRY_VALIDATION_REPORT.md) — document-level validation and remaining editor checks.
- [UEFN_BLOCKOUT_BUILD_GUIDE.md](UEFN_BLOCKOUT_BUILD_GUIDE.md) — construction sequence and evidence requirements.

R2.3 is **approved as design**, not editor-verified. R2.2 and earlier geometry packets are historical. The executive dossier and legacy schedules are not placement authority where they conflict with R2.3.

## 3. Game design, narrative and gameplay

- [GAME_DESIGN_BIBLE.md](GAME_DESIGN_BIBLE.md) — product vision, setting, pillars and canon.
- [NARRATIVE_MASTER_SCRIPT.md](NARRATIVE_MASTER_SCRIPT.md) — six-act beat script.
- [NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md](NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md) — complete proposed player-facing clue/puzzle/ending copy; pending owner approval.
- [STORY_DOCUMENT_REGISTER.md](STORY_DOCUMENT_REGISTER.md) and [NARRATIVE_ACCEPTANCE_TESTS.md](NARRATIVE_ACCEPTANCE_TESTS.md).
- [OWNER_DECISION_PACKET_R1.md](OWNER_DECISION_PACKET_R1.md) — one consolidated approval request for NCP-A01–A09 and END-A02.
- [GAMEPLAY_SYSTEMS_SPEC.md](GAMEPLAY_SYSTEMS_SPEC.md), [GAMEPLAY_FLOW_AND_TESTS.md](GAMEPLAY_FLOW_AND_TESTS.md), [ACT_AND_OBJECTIVE_MATRIX.md](ACT_AND_OBJECTIVE_MATRIX.md), [OBJECTIVE_AND_EVENT_CATALOG.md](OBJECTIVE_AND_EVENT_CATALOG.md).
- [ITEM_AND_INVENTORY_SPEC.md](ITEM_AND_INVENTORY_SPEC.md), [PUZZLE_IMPLEMENTATION_SHEETS.md](PUZZLE_IMPLEMENTATION_SHEETS.md), [PUZZLE_MASTER_REGISTER.csv](PUZZLE_MASTER_REGISTER.csv), [INTERACTION_MASTER_REGISTER.csv](INTERACTION_MASTER_REGISTER.csv).
- [PLAYER_STATE_MACHINE.md](PLAYER_STATE_MACHINE.md), [CAPTURE_AND_RESCUE_SPEC.md](CAPTURE_AND_RESCUE_SPEC.md), [CHECKPOINT_AND_RECOVERY_SPEC.md](CHECKPOINT_AND_RECOVERY_SPEC.md), [GAMEPLAY_UI_UX_SPEC.md](GAMEPLAY_UI_UX_SPEC.md), [GAME_BALANCING_SPEC.md](GAME_BALANCING_SPEC.md).
- [ENDING_DESIGN_SPEC.md](ENDING_DESIGN_SPEC.md), [ENDING_IMPLEMENTATION_SPEC.md](ENDING_IMPLEMENTATION_SPEC.md), [END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md](END_A02_TRUTH_EVIDENCE_DECISION_PROPOSAL.md).

## 4. Antagonist, art and audio

- [MONSTER_AI_BEHAVIOUR_SPEC.md](MONSTER_AI_BEHAVIOUR_SPEC.md) — dedicated state machine, perception, stimuli, targeting, navigation, capture handoff, fairness, tuning and AI tests.
- [GUEST_MODEL_SPEC.md](GUEST_MODEL_SPEC.md) — THE GUEST character production requirements.
- [ASSET_AND_CONTENT_REGISTER.md](ASSET_AND_CONTENT_REGISTER.md), [asset_manifest.csv](asset_manifest.csv), [ASSET_MANIFEST_EXECUTIVE.csv](ASSET_MANIFEST_EXECUTIVE.csv).
- [AUDIO_REGISTER.csv](AUDIO_REGISTER.csv) and [LIGHTING_REGISTER.csv](LIGHTING_REGISTER.csv) are the current separate registers; [AUDIO_CUE_SHEET.csv](AUDIO_CUE_SHEET.csv) and [LIGHTING_CUE_SHEET.csv](LIGHTING_CUE_SHEET.csv) define event triggers and behaviour; the old combined lighting/audio schedule is historical.
- [UI_STRING_TABLE.csv](UI_STRING_TABLE.csv) is the current stable English copy baseline for objectives, prompts, feedback and subtitles.
- Environment Art PR #1 is not a build authority and must not be merged as-is; all placements require R2.3 reconciliation.

## 5. UEFN, Verse and technical production

- [UEFN_IMPLEMENTATION_SPEC.md](UEFN_IMPLEMENTATION_SPEC.md) — system architecture and device families.
- [VERSE_SYSTEM_DESIGN.md](VERSE_SYSTEM_DESIGN.md) — API-neutral logical contracts/pseudocode, not compiled Verse.
- [UEFN_DEVICE_BINDINGS.csv](UEFN_DEVICE_BINDINGS.csv) — intended device/event bindings; editor verification required.
- [CLAUDE_EXECUTION_PLAN.md](CLAUDE_EXECUTION_PLAN.md), [CLAUDE_UEFN_EXECUTION_PLAN.md](CLAUDE_UEFN_EXECUTION_PLAN.md), [PRODUCTION_DETAIL_REQUIREMENTS.md](PRODUCTION_DETAIL_REQUIREMENTS.md).

## 6. Non-negotiable production rules

- Final target is a complete Fortnite island built in UEFN; do not substitute another engine.
- Solo and 1–4 player co-op must be supported by design; all mandatory progression must be solo-completable.
- Shipped player-facing content is English.
- No mandatory clue is audio-only; readable/journal fallback is required.
- Team quest state and ending selection are session-authoritative; personal flashlight charge is per player.
- Every pickup, puzzle, checkpoint and ending transaction must be idempotent and recoverable.
- Never invent or assume UEFN APIs, NPC navigation, animation or device properties. Verify them against the target editor release.
- Never report an editor build, import, Verse compile, playtest, multiplayer test, performance profile or island validation without actual reproducible evidence.
- Do not publish without all release gates and explicit owner authorization.

## 7. Status vocabulary

Use OWNER-APPROVED DESIGN, CANONICAL DOCUMENT, PROPOSED, ENGINE-VERIFIED, EDITOR-VERIFIED, TEST-PASS, BLOCKED and NOT RUN precisely. A document being authored does not mean its feature is implemented or tested.
