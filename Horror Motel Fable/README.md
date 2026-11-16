# THE MOTEL: ROOM 13 — Fable production package

## Current production authority — 2026-11-16
- [PRODUCTION_COMPLETION_HANDOFF.md](PRODUCTION_COMPLETION_HANDOFF.md) — latest consolidated audit, remaining blockers, owner decisions and Claude handoff.
- [LEVEL_DESIGN_R2.2_INDEX.md](LEVEL_DESIGN_R2.2_INDEX.md) — current geometry document hierarchy.
- [LEVEL_DESIGN_GEOMETRY.md](LEVEL_DESIGN_GEOMETRY.md) LD-GEO R2.2 — single candidate geometry proposal; **not owner-approved and not UEFN-verified**.
- [CLAUDE_EXECUTION_PROTOCOL.md](CLAUDE_EXECUTION_PROTOCOL.md) — binding responsibility and evidence rules.
- [CLAUDE_EXECUTION_PLAN.md](CLAUDE_EXECUTION_PLAN.md) — current executable order; section 19 supersedes earlier phase ordering where it conflicts.
- [GAMEPLAY_ACCEPTANCE_TESTS.md](GAMEPLAY_ACCEPTANCE_TESTS.md) — test definitions GAT-001–GAT-052; all remain NOT RUN until Claude supplies evidence.

Do not use CLAUDE_GEOMETRY_EXECUTION_BRIEF_R2.1.md as a build authority; it is superseded by R2.2. Do not merge Environment Art PR #1 until it is reauthored against approved and editor-verified geometry.


Questa cartella contiene il pacchetto di istruzioni per Claude destinato alla realizzazione del gioco completo in **UEFN / Fortnite**.

## Collaborazione e responsabilità
- ChatGPT prepara specifiche, piani di esecuzione, checklist, criteri di accettazione e analisi delle evidenze.
- Claude esegue implementazione, compilazione e test reali in UEFN/Playtest.
- Nessun test è PASS senza esecuzione effettiva e prove registrate.
- Consultare [CLAUDE_EXECUTION_PLAN.md](CLAUDE_EXECUTION_PLAN.md) per fasi, gate, deliverable e procedura di handoff.

## Ordine di lettura
1. [MASTER_PROMPT_FOR_CLAUDE.md](MASTER_PROMPT_FOR_CLAUDE.md) — prompt operativo principale e confine delle responsabilità.
2. [CLAUDE_EXECUTION_PLAN.md](CLAUDE_EXECUTION_PLAN.md) — piano operativo dettagliato, priorità e criteri di avanzamento.
3. [GAME_DESIGN_BIBLE.md](GAME_DESIGN_BIBLE.md) — visione, lore, struttura, personaggi, stanze, enigmi, dialoghi e finali.
4. [GAMEPLAY_FLOW_AND_TESTS.md](GAMEPLAY_FLOW_AND_TESTS.md) — flusso dei sei atti, stati giocatore, cattura/salvataggio, inventario, finali e QA.
5. [UEFN_IMPLEMENTATION_SPEC.md](UEFN_IMPLEMENTATION_SPEC.md) — architettura, Verse, dispositivi, AI, cooperativa, audio, luci, performance e QA tecnico.
6. [LEVEL_DESIGN_GEOMETRY.md](LEVEL_DESIGN_GEOMETRY.md) — coordinate preliminari, vincoli geometrici e procedura per la planimetria esecutiva corretta.
7. [ASSET_AND_CONTENT_REGISTER.md](ASSET_AND_CONTENT_REGISTER.md) — inventario iniziale di modelli 3D, props, materiali, luci, audio e priorità.
8. [EXECUTIVE_BUILD_DOSSIER.md](EXECUTIVE_BUILD_DOSSIER.md) — specifiche dimensionali proposte per sito, stanze, arredi, sezioni e THE GUEST.
9. [PRODUCTION_DETAIL_REQUIREMENTS.md](PRODUCTION_DETAIL_REQUIREMENTS.md) — requisiti obbligatori per piante quotate, coordinate di ogni arredo, CSV completi, scheda 3D/rig/LOD/animazioni del mostro, validazione geometrica e QA.

## Vincoli non negoziabili
- Prodotto finale: isola Fortnite reale, costruita in Unreal Editor for Fortnite (UEFN).
- 1–4 giocatori, prima persona, 40–50 minuti, survival horror cooperativo.
- Ambientazione Raven Motel, USA, 1986; gioco interamente in inglese.
- **Nessuna demo, nessun prototipo dimostrativo**: obiettivo gioco completo, pronto per test, revisione e pubblicazione.
- Non sostituire UEFN con Unity, Unreal standalone, browser, HTML o Three.js.
- Non dichiarare mai di aver modificato UEFN, compilato, testato o pubblicato se non è realmente avvenuto.
- Verificare la compatibilità di ogni API, dispositivo, proprietà Verse e workflow con la versione UEFN disponibile.
- La stima di circa due ore è un obiettivo aspirazionale, non una garanzia. Se non è fattibile, dichiarare limiti e priorità senza spacciare un risultato incompleto per gioco finito.

## Stato del materiale
Il concept narrativo e il gameplay sono definiti a livello di specifica. Le coordinate presenti nel dossier sono **proposte dimensionali**, non una planimetria esecutiva approvata: Claude deve risolvere ogni conflitto, produrre planimetrie e sezioni coerenti, generare coordinate puntuali per ogni arredo/asset e verificare percorsi e collisioni prima del blockout definitivo. Le quantità di dispositivi e i parametri AI sono valori iniziali da verificare in UEFN, non garanzie di API o performance.

## Elaborati esecutivi aggiunti
- [EXECUTIVE_FLOORPLANS.md](EXECUTIVE_FLOORPLANS.md) — piante quotate preliminari e sezioni richieste.
- [coordinate_schedule.csv](coordinate_schedule.csv) — coordinate di footprint e spazi.
- [wall_schedule.csv](wall_schedule.csv) — prime linee guida di pareti e partizioni.
- [door_window_schedule.csv](door_window_schedule.csv) — aperture, porte e finestre.
- [room_furnishing_schedule.csv](room_furnishing_schedule.csv) — posizionamento proposto degli arredi per stanza.
- [ASSET_MANIFEST_EXECUTIVE.csv](ASSET_MANIFEST_EXECUTIVE.csv) — inventario asset e priorità.
- [GUEST_MODEL_SPEC.md](GUEST_MODEL_SPEC.md) — scheda di produzione 3D di THE GUEST.
- [UEFN_DEVICE_BINDINGS.csv](UEFN_DEVICE_BINDINGS.csv) — matrice iniziale dispositivi/Verse.
- [GEOMETRY_VALIDATION_REPORT.md](GEOMETRY_VALIDATION_REPORT.md) — controlli geometrici ancora aperti.
- [QA_ACCEPTANCE_MATRIX.md](QA_ACCEPTANCE_MATRIX.md) — matrice di collaudo.
- [exterior_prop_schedule.csv](exterior_prop_schedule.csv) — coordinate di auto, insegna, cancello, generatore e props esterni.
- [LIGHTING_REGISTER.csv](LIGHTING_REGISTER.csv) — registro normalizzato delle luci (10 righe dati).
- [AUDIO_REGISTER.csv](AUDIO_REGISTER.csv) — registro normalizzato delle sorgenti audio (9 righe dati).
- `lighting_audio_schedule.csv` — file storico combinato mantenuto per tracciabilità; usare i due registri separati per le modifiche future.

## File di produzione che Claude deve generare
- `coordinate_schedule.csv`
- `room_furnishing_schedule.csv`
- `door_window_schedule.csv`
- `asset_manifest.csv`
- `guest_model_spec.md`
- `geometry_validation_report.md`
- `uefn_device_bindings.csv`
- `qa_acceptance_matrix.md`

## Disegni e logica di implementazione aggiunti
- [floorplan_ground.svg](floorplan_ground.svg) — disegno vettoriale del piano terra.
- [floorplan_upper.svg](floorplan_upper.svg) — disegno vettoriale del piano superiore.
- [sections_AA_CC_DD.svg](sections_AA_CC_DD.svg) — sezioni verticali schematiche.
- [VERSE_SYSTEM_DESIGN.md](VERSE_SYSTEM_DESIGN.md) — contratti logici per stati, eventi, enigmi, cattura, checkpoint e finali; pseudocodice non compilato.
- [asset_manifest.csv](asset_manifest.csv) — manifest con nome canonico richiesto.

## Chat 01 — Game Design & Narrative deliverables
- [GAME_DESIGN_BIBLE.md](GAME_DESIGN_BIBLE.md) — consolidated canon and progression flags.
- [NARRATIVE_MASTER_SCRIPT.md](NARRATIVE_MASTER_SCRIPT.md) — six-act beat script and narrative gaps.
- [ACT_AND_OBJECTIVE_MATRIX.md](ACT_AND_OBJECTIVE_MATRIX.md) — act objectives, durations, events, checkpoints and dependencies.
- [ENDING_DESIGN_SPEC.md](ENDING_DESIGN_SPEC.md) — ending gates, flags, resolver and multiplayer choice contract.
- [GAME_BALANCING_SPEC.md](GAME_BALANCING_SPEC.md) — pacing, interaction/tension targets and playtest plan.
- [STORY_DOCUMENT_REGISTER.md](STORY_DOCUMENT_REGISTER.md) — narrative document and clue inventory.
- [NARRATIVE_ACCEPTANCE_TESTS.md](NARRATIVE_ACCEPTANCE_TESTS.md) — narrative QA and blocking dependencies.
