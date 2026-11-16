# NARRATIVE ACCEPTANCE TESTS — THE MOTEL: ROOM 13

A test remains NOT RUN until executed in target build with evidence. Design review is not runtime QA.

| ID | Test | Expected result | Status |
|---|---|---|---|
| NAR-001 | Complete run | Six exact act names in correct order | NOT RUN |
| NAR-002 | ACT I comprehension | Player understands breakdown, closed motel, twelve rooms and anomalous key without external context | NOT RUN |
| NAR-003 | Reception phone | Exact approved line with English subtitle | NOT RUN |
| NAR-004 | Register solvability | Three-part code 02-13-86 inferable in solo; retry possible | CONTENT SPEC READY; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-005 | Office photo clue | Grants upper access; order 1974 → 1978 → 1982 → 1986; distinct from ROOM 13 puzzle | CONTENT SPEC READY; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-006 | Rooms 01–06 | All specified anomalies present and mandatory clues readable | NOT RUN |
| NAR-007 | Power/chase order | First full chase follows power restoration in ACT III | NOT RUN |
| NAR-008 | Upper-floor history | ROOM 09 diary, ROOM 11 drawing and ROOM 12 panel communicate intended roles | CONTENT SPEC READY; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-009 | Secret passage | Continuous navigable path to ROOM 13 | R2.3 DESIGN APPROVED; EDITOR TRAVERSAL NOT RUN |
| NAR-010 | Four-photo chronology | Dates/clues infer 1968 → 1974 → 1981 → 1986; wrong input resets safely | CONTENT SPEC READY; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-011 | Identity reveal | Portrait, records and creature appearance establish owner/GUEST identity | NOT RUN |
| NAR-012 | Self-contained story | Main mystery and choices understandable without external lore | DRAFT SCRIPT COMPLETE; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-013 | Optional lore safety | Ignoring optional props does not block progress | NOT RUN |
| NAR-014 | ESCAPE | Correct chase, exact radio, silhouette and title card; no other ending | NOT RUN |
| NAR-015 | THE TRUTH | Distinct confrontation/reveal and title card | DRAFT SEQUENCE AVAILABLE; OWNER APPROVAL PENDING; RUNTIME NOT RUN |
| NAR-016 | New Guest consent | Declining invitation prevents New Guest | NOT RUN |
| NAR-017 | New Guest co-op | Shared outcome follows END-A01 unanimous explicit consent; no random player selection | DESIGN RULE OWNER-APPROVED; RUNTIME NOT RUN |
| NAR-018 | Capture is not ending | Capture/team defeat never triggers New Guest | NOT RUN |
| NAR-019 | Solo completion | No clue/puzzle requires another player | NOT RUN |
| NAR-020 | Co-op sync | All players receive consistent reveal/objective/ending state | NOT RUN |
| NAR-021 | Audio-independent clues | Mandatory clues remain visually available or subtitled | NOT RUN |
| NAR-022 | English audit | All shipped UI, documents, subtitles and VO are English | NOT RUN |
| NAR-023 | Duration | Playtests land within 40–50 min or deviations are explained | NOT RUN |
| NAR-024 | Ending exclusivity | Competing inputs resolve to one atomic ending | NOT RUN |

## Remaining dependencies

- Owner approval of narrative proposal pack NCP-A01–A09 and END-A02, consolidated in OWNER_DECISION_PACKET_R1.md.
- R2.3 secret-passage traversal and all other geometry/editor checks.
- Actual solo/2-player/4-player narrative runtime tests, readability/subtitle checks and ending tests.

The register solution, office-photo solution, diary/record/photo draft text, THE TRUTH draft finale and END-A01 co-op quorum now exist in the documentation package. Their draft/approval status is shown per test above; no runtime test is implied.

## Evidence template
Record build/commit ID, UEFN version, date, party size, checkpoint, exact steps, expected/observed result, PASS/FAIL/BLOCKED, screenshot/video/log reference, defect ID and retest.
