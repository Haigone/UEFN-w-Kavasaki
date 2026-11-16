# CLAUDE AUTONOMOUS EXECUTION ADDENDUM R1
Project: THE MOTEL: ROOM 13
Authority: subordinate to CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md and R3_CURRENT_STATUS_AND_REMAINING_WORK.md.
Purpose: remove avoidable decision pauses and make the repository executable as a self-directed production plan.

## 1. Operating mandate

You are the implementation owner for all work that requires the native UEFN project, editor, Verse, asset tools and runtime testing. Do not stop after auditing or proposing a plan. Once the environment gate is satisfied, execute the project in dependency order and continue through the next ready task without waiting for a new user message.

Work in bounded batches. At the end of a batch, commit working changes, update evidence/status and immediately continue to the next dependency-ready batch while time and tools permit. A progress report is not a substitute for implementation.

The repository is the canonical production plan. Read the linked sources and follow their requirements. Do not ask the owner to repeat a decision that is already in this repository.

## 2. Decision hierarchy

When instructions appear incomplete or ambiguous, resolve them in this order:
1. Explicit owner-approved decision record and binding decisions in CLAUDE_CANONICAL_EXECUTION_BRIEF_R3.md.
2. Current R3_CURRENT_STATUS_AND_REMAINING_WORK.md.
3. The controlling system-specific specification named by the relevant register.
4. The canonical CSV/register row for exact IDs, coordinates, counts, settings and ownership.
5. The relevant acceptance tests and compatibility matrix.
6. This addendum's conservative decision rules.

If two current sources conflict:
- Identify the exact conflicting statements and their revision/status.
- Prefer the more specific current controlling source, not whichever file is newer by timestamp alone.
- Check the R3 filename authority rules before comparing case-variant files.
- If the conflict changes approved structural geometry or a binding narrative/ending decision, do not silently rewrite it. Keep the approved baseline and create a clearly labelled issue/proposal.
- For all other implementation details, choose the safest solution that preserves player-facing requirements, session authority, accessibility, performance and recoverability. Record the chosen option and rationale in the decision log; update all affected references consistently.

## 3. Do not ask avoidable questions

Do not ask the owner which technical implementation, Verse architecture, device, UI fallback, asset pipeline, test order or non-structural production method to choose. Investigate the installed UEFN version and official API digest, prototype the smallest proof, compare documented supported options, select the least risky working route and record the decision.

Ask the owner only when an action genuinely requires owner-only access/credentials, incurs an unapproved purchase or external legal commitment, risks irreversible loss of owner data, changes approved structural geometry, changes an approved story/ending decision, or publishes/releases the island. Before asking, complete every independent task that does not depend on that answer.

Never fabricate support for a device/API. If the preferred path is unsupported, use the fallback already specified in UEFN_FEATURE_COMPATIBILITY_MATRIX_R1.md and preserve the gameplay contract.

## 4. Missing THE GUEST model or animation assets

If the native project lacks a usable THE GUEST character model, do not block the project waiting for the owner to supply one.

1. Read GUEST_MODEL_SPEC.md, MONSTER_AI_BEHAVIOUR_SPEC.md, THE_GUEST_NUMERIC_TUNING_R1.md and the AI anchor schedule.
2. Create a production-ready character concept/model sheet with front, side and back views, silhouette, scale reference, material callouts and facial/hand details.
3. Produce or commission/generate an original 3D mesh using the available authorized asset-generation workflow. The design must be original and must not imitate a protected third-party character or use unlicensed source assets.
4. Create a game-ready skeletal rig compatible with the target UEFN import pipeline. Validate bone hierarchy, naming, root orientation, scale, collision capsule, pivots and retargeting.
5. Create the minimum required animation set from the Guest spec: idle/dormant, patrol walk, investigate, alert/search, chase/run, attack/capture, recovery/return and any explicitly required cinematic beat. Prefer one consistent rig and animation source.
6. Generate LODs, collision, material instances and texture budgets suitable for the target platform. Keep a readable silhouette in low light.
7. Import into UEFN and prove the character in the NPC Spawner/behavior pipeline before replacing any placeholder in the full game.
8. If the available tool cannot produce a valid rigged animated asset, create the original model sheet and a complete external production brief, then use the best legally usable temporary in-editor character for the isolated AI proof. Mark final character integration BLOCKED, not complete.

Do not claim a generated image or unrigged mesh is a completed game-ready character. Record source, license, tool, export format, scale, rig, animation coverage, LODs, collision and import test evidence.

## 5. Batch execution loop

For every task:
1. Read all listed prerequisites and current register rows.
2. Verify the working project/revision and create a rollback point.
3. State the exact intended change and acceptance test in the task log.
4. Implement the smallest coherent unit.
5. Compile/build/import immediately where applicable.
6. Run the task's acceptance tests and relevant regression tests.
7. Capture reproducible evidence and observed results.
8. Update status, registers and decision/defect logs.
9. Commit the batch with a meaningful message.
10. Move to the next dependency-ready task. Do not wait for owner feedback unless one of the owner-only conditions in Section 3 is met.

Never bundle unrelated changes into one unreviewable batch. Never hide a failed test by changing the acceptance criterion.

## 6. Repository hygiene

- Keep the current canonical filenames and case exactly as documented.
- Never delete historical decisions or superseded specifications; mark them SUPERSEDED and point to the authority.
- Keep mirrored registers synchronized.
- Use stable IDs and one authoritative writer per progression flag.
- Keep proposed values distinct from measured values.
- Commit source, project settings where appropriate, asset manifests, tests and evidence references together.
- Do not commit secrets, credentials, private keys or personal data.
- Update README and current status whenever a canonical deliverable is added or superseded.

## 7. Progress reporting

At the end of each batch, write a short machine-readable status record with:
- batch ID and date;
- tasks attempted and status;
- exact paths/assets/devices changed;
- tests run and PASS/FAIL/BLOCKED results;
- evidence references;
- decisions made and rationale;
- unresolved blockers and their exact owner action, if any;
- next dependency-ready task.

Continue autonomously after recording the batch. The user should not need to send “continue” after each stage.

## 8. Absolute stop conditions

Stop only the affected task when:
- the native UEFN project/editor or required permission is unavailable;
- an owner-only approval condition in Section 3 is reached;
- a platform limitation has no safe fallback;
- data loss or a destructive irreversible operation is imminent;
- a required asset has unresolved rights and no original/licensed replacement can be produced.

Do not stop unrelated tasks. Record the blocker precisely, complete all independent work, then request only the minimum required owner action.

## 9. Definition of done

The project is complete only when:
- all required content is implemented in the native UEFN project;
- Verse compiles on the recorded target build;
- geometry, interactions, puzzles, AI, UI, narrative and endings pass their acceptance suites;
- solo, 2-player and 4-player complete runs pass, including disconnect/reconnect and recovery cases;
- all required assets are imported with verified rights;
- performance/memory and island validation pass for supported targets;
- the evidence pack is committed and reproducible;
- the owner explicitly authorizes publication.

A repository containing excellent specifications is not itself a completed game.
