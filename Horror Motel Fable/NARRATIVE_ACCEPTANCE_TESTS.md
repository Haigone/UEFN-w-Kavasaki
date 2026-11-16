# NARRATIVE ACCEPTANCE TESTS — THE MOTEL: ROOM 13

A test remains NOT RUN until executed in target build with evidence. Design review is not runtime QA.

| ID | Test | Expected result | Status |
|---|---|---|---|
| NAR-001 | Complete run | Six exact act names in correct order | NOT RUN |
| NAR-002 | ACT I comprehension | Player understands breakdown, closed motel, twelve rooms and anomalous key without external context | NOT RUN |
| NAR-003 | Reception phone | Exact approved line with English subtitle | NOT RUN |
| NAR-004 | Register solvability | Three-part code inferable in solo; retry possible | BLOCKED: entries/code absent |
| NAR-005 | Office photo clue | Grants upper access and remains distinct from ROOM 13 puzzle | BLOCKED: solution absent |
| NAR-006 | Rooms 01–06 | All specified anomalies present and mandatory clues readable | NOT RUN |
| NAR-007 | Power/chase order | First full chase follows power restoration in ACT III | NOT RUN |
| NAR-008 | Upper-floor history | Diary, child's room and panel communicate intended roles | BLOCKED: document content absent |
| NAR-009 | Secret passage | Continuous navigable path to ROOM 13 | BLOCKED: geometry validation |
| NAR-010 | Four-photo chronology | Dates/clues infer correct order; wrong input resets safely | BLOCKED: captions/dates absent |
| NAR-011 | Identity reveal | Portrait, records and creature appearance establish owner/GUEST identity | NOT RUN |
| NAR-012 | Self-contained story | Main mystery and choices understandable without external lore | BLOCKED: full script incomplete |
| NAR-013 | Optional lore safety | Ignoring optional props does not block progress | NOT RUN |
| NAR-014 | ESCAPE | Correct chase, exact radio, silhouette and title card; no other ending | NOT RUN |
| NAR-015 | THE TRUTH | Distinct confrontation/reveal and title card | BLOCKED: final scene absent |
| NAR-016 | New Guest consent | Declining invitation prevents New Guest | NOT RUN |
| NAR-017 | New Guest co-op | Shared outcome follows approved team rule; no random player selection | BLOCKED: vote rule absent |
| NAR-018 | Capture is not ending | Capture/team defeat never triggers New Guest | NOT RUN |
| NAR-019 | Solo completion | No clue/puzzle requires another player | NOT RUN |
| NAR-020 | Co-op sync | All players receive consistent reveal/objective/ending state | NOT RUN |
| NAR-021 | Audio-independent clues | Mandatory clues remain visually available or subtitled | NOT RUN |
| NAR-022 | English audit | All shipped UI, documents, subtitles and VO are English | NOT RUN |
| NAR-023 | Duration | Playtests land within 40–50 min or deviations are explained | NOT RUN |
| NAR-024 | Ending exclusivity | Competing inputs resolve to one atomic ending | NOT RUN |

## Blocking dependencies
Exact register and office-photo solutions; truth evidence checklist; diary/record/photo text; THE TRUTH finale; New Guest vote rule; secret passage geometry; actual solo/2/4-player runtime tests.

## Evidence template
Record build/commit ID, UEFN version, date, party size, checkpoint, exact steps, expected/observed result, PASS/FAIL/BLOCKED, screenshot/video/log reference, defect ID and retest.
