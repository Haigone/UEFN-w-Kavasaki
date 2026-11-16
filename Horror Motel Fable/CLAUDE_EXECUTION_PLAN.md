# CLAUDE EXECUTION PLAN — THE MOTEL: ROOM 13
## Piano operativo, responsabilità, gate e handoff

**Stato:** PIANO DI ESECUZIONE — non è prova di implementazione né di test UEFN.  
**Repository:** `Haigone/UEFN-w-Kavasaki` — branch `main`.  
**Cartella:** `Horror Motel Fable/`.

---

## 0. REGOLA DI COLLABORAZIONE — OBBLIGATORIA

La divisione del lavoro è vincolante:

### Preparazione documentale (ChatGPT / direzione progetto)
- Analizzare il materiale esistente e le sue dipendenze.
- Scrivere e mantenere specifiche, piani operativi, checklist, matrici di accettazione, procedure di test e modelli di report.
- Evidenziare conflitti, informazioni mancanti e decisioni che richiedono approvazione.
- Preparare istruzioni riproducibili per Claude, senza dichiarare di aver operato nell'editor.
- Esaminare i report e le evidenze restituite da Claude e trasformarli in issue e istruzioni correttive.

### Esecuzione tecnica (Claude)
- Ispezionare il progetto UEFN reale e verificare la versione dell'editor.
- Implementare in UEFN e Verse, creare/configurare dispositivi e asset, compilare e correggere.
- Eseguire i test in UEFN/Playtest per 1, 2 e 4 giocatori.
- Raccogliere screenshot, video, log, errori di compilazione, risultati e identificativi della build.
- Aggiornare gli stati di QA esclusivamente sulla base di prove osservate.

### Divieti
- ChatGPT non deve dichiarare di aver modificato, compilato o testato UEFN.
- Claude non deve dichiarare un test PASS senza averlo eseguito e senza registrare evidenza.
- Un documento, pseudocodice o script non compilato non è implementazione verificata.
- Un test progettato non è un test eseguito.
- Una prova solo in solo-player non certifica il multiplayer.
- Nessun test UEFN deve essere simulato o dedotto dalla sola lettura dei file.

Usare sempre questi stati:
- `SPEC READY`: specifica documentale pronta.
- `READY FOR CLAUDE`: istruzioni sufficienti per iniziare l'esecuzione.
- `IN IMPLEMENTATION`: Claude sta implementando.
- `EDITOR VERIFIED`: comportamento verificato nell'editor/Playtest, con evidenza.
- `PASS`: caso di test eseguito e superato.
- `FAIL`: caso eseguito e non superato.
- `BLOCKED`: non eseguibile per dipendenza o problema identificato.
- `NOT RUN`: non ancora eseguito.

Non usare `COMPLETE` come sinonimo di documentato.

---

## 1. ORDINE DI LETTURA E GERARCHIA DELLE FONTI

Claude deve leggere integralmente, nell'ordine:

1. `README.md`
2. `MASTER_PROMPT_FOR_CLAUDE.md`
3. `GAME_DESIGN_BIBLE.md`
4. `NARRATIVE_MASTER_SCRIPT.md`
5. `ACT_AND_OBJECTIVE_MATRIX.md`
6. `ENDING_DESIGN_SPEC.md`
7. `GAMEPLAY_FLOW_AND_TESTS.md`
8. `UEFN_IMPLEMENTATION_SPEC.md`
9. `PRODUCTION_DETAIL_REQUIREMENTS.md`
10. `GEOMETRY_VALIDATION_REPORT.md`
11. Tutti i registri CSV, SVG, specifiche e file Verse presenti.

In caso di conflitto:
1. Non scegliere in silenzio.
2. Registrare il conflitto con file, sezione e conseguenza.
3. Applicare i requisiti esplicitamente marcati FIXED.
4. Se non esiste una regola prevalente, proporre una risoluzione e attendere approvazione prima di cambiare il canon.
5. Aggiornare tutte le fonti dipendenti dopo l'approvazione.

I nomi dei sei atti, il setting 1986/Raven Motel, ROOM 13, THE GUEST e i tre finali sono canonici. Non rinominarli.

---

## 2. FASE 0 — AUDIT DELL'AMBIENTE E BASELINE

**Obiettivo:** stabilire cosa Claude può davvero eseguire e identificare la build/progetto di partenza.

### Attività
1. Confermare accesso al repository e al progetto UEFN effettivo.
2. Registrare branch, commit iniziale, percorso del progetto e versione UEFN/UEFN release.
3. Verificare accesso a Verse, asset, dispositivi, sessione Playtest e strumenti di log.
4. Distinguere file sorgente, documenti, asset importati e asset mancanti.
5. Cercare errori preesistenti, riferimenti mancanti, file duplicati e discrepanze tra documenti.
6. Non iniziare modifiche distruttive prima di avere una baseline e un backup/versionamento.

### Output obbligatori
- `CLAUDE_ENVIRONMENT_BASELINE.md`
- elenco dei file effettivamente presenti e mancanti.
- versione UEFN, stato progetto, commit/branch.
- tabella capacità: AVAILABLE / UNAVAILABLE / NEEDS USER ACTION.
- elenco blocker iniziali.

### Gate 0
Non procedere a implementazioni che dipendono da accessi non verificati. Dichiarare con precisione cosa può fare Claude direttamente e cosa richiede l'utente.

---

## 3. FASE 1 — NARRATIVE LOCK (PRIMA PRIORITÀ DOCUMENTALE)

**Obiettivo:** eliminare i blocker narrativi prima che la logica di progressione venga implementata.

### 1.1 Guest Register Puzzle
Creare `REGISTER_PUZZLE_SPEC.md` contenente:
- trascrizione completa e definitiva degli indizi visibili nel registro;
- codice a tre parti e spiegazione non ambigua della deduzione;
- posizione e ordine di lettura degli indizi;
- input, feedback corretto/errato, retry e reset;
- esito: drawer aperto e Office Key team-owned;
- comportamento solo/co-op, input simultanei, disconnect e checkpoint;
- requisiti di leggibilità in prima persona e localizzazione inglese;
- tabella dei test di accettazione.

Non inventare una soluzione come se fosse canon: presentare una soluzione coerente come PROPOSAL finché non approvata.

### 1.2 Owner's Office Photo Puzzle
Creare `OFFICE_PHOTO_PUZZLE_SPEC.md` contenente:
- numero e contenuto delle fotografie;
- clue leggibile e relazione tra le immagini;
- soluzione univoca e dimostrazione della deduzione;
- interazione prevista e stato di completamento;
- ricompensa: accesso al piano superiore;
- feedback, reset, anti-softlock, solo/co-op;
- separazione esplicita dal puzzle delle quattro foto di ROOM 13.

Non riutilizzare la stessa soluzione del puzzle ROOM 13.

### 1.3 Documenti narrativi obbligatori
Preparare:
- `ROOM_04_PHONE_RECORDING_FINAL.md`
- `ROOM_09_DIARY_FINAL.md`
- `ROOM_11_CHILD_DRAWING_FINAL.md`
- `ROOM_06_MISSING_GUEST_PHOTOS.md`

Per ogni documento indicare:
- testo inglese definitivo o proposta da approvare;
- autore diegetico, data e collocazione;
- informazione narrativa comunicata;
- cosa il giocatore deve inferire;
- eventuali sottotitoli;
- se è obbligatorio o facoltativo;
- nessuna informazione necessaria deve essere esclusivamente audio.

### 1.4 ROOM 13 Photo Sequence
Creare `ROOM_13_PHOTO_SEQUENCE_SPEC.md` contenente:
- quattro fotografie, date/caption e dettagli visivi;
- ordine cronologico corretto;
- ragionamento che permette di risolvere il puzzle senza guessing;
- modalità di selezione/ordinamento;
- feedback, reset e comportamento multiplayer;
- sequenza del reveal owner/THE GUEST;
- condizione precisa per impostare `Room13RevealComplete`;
- Service Key: quando e come diventa disponibile.

### 1.5 Finali
Creare `THREE_ENDINGS_FINAL_SCRIPT.md` con:
- sequenza completa di ESCAPE, THE TRUTH e THE NEW GUEST;
- dialoghi/VO, sottotitoli, azioni del giocatore, tempi e title card;
- flag richiesti e punto esatto di commit del finale;
- regola di scelta condivisa in co-op;
- conferma esplicita per THE NEW GUEST;
- gestione disconnect durante la scelta;
- esclusione reciproca dei finali.

Le parti mancanti nel canon devono essere marcate PROPOSAL e sottoposte ad approvazione. Non colmare i vuoti fingendo che fossero già approvati.

### 1.6 Matrice di tracciabilità
Aggiornare:
- `NARRATIVE_MASTER_SCRIPT.md`
- `ACT_AND_OBJECTIVE_MATRIX.md`
- `STORY_DOCUMENT_REGISTER.md`
- `ENDING_DESIGN_SPEC.md`
- `NARRATIVE_ACCEPTANCE_TESTS.md`
- `GAME_DESIGN_BIBLE.md`

Ogni clue deve avere ID, stanza, testo/asset, funzione narrativa, requisito di progressione, dipendenza e test collegato.

### Gate 1 — Narrative Lock
La fase è READY FOR IMPLEMENTATION solo se:
- ogni puzzle obbligatorio ha soluzione documentata e univoca;
- tutti i testi obbligatori hanno versione approvata;
- tutti i tre finali hanno trigger e outcome definiti;
- la regola multiplayer dei finali è approvata;
- ogni flag ha un solo proprietario logico e un momento preciso di attivazione;
- non esistono dipendenze obbligatorie da clue opzionali;
- le discrepanze tra master script, matrix, gameplay flow e ending spec sono risolte.

---

## 4. FASE 2 — LEVEL DESIGN E GEOMETRIA ESECUTIVA

**Obiettivo:** risolvere la geometria prima di decorare o costruire il layout definitivo.

### Attività
1. Usare `GEOMETRY_VALIDATION_REPORT.md` come registro dei conflitti aperti.
2. Risolvere poligoni delle stanze, pareti condivise, aperture, scale, balcone, vestibolo e passaggio segreto.
3. Definire un unico datum, unità, convenzione delle coordinate e revisione geometrica.
4. Ricalcolare wall/floor/ceiling schedules e porte/finestre.
5. Verificare che ROOM 12 → secret passage → ROOM 13 sia un percorso continuo con entrata e uscita.
6. Separare correttamente volumi sovrapposti tra piani e verificare quote, headroom e scale.
7. Generare percorso giocatore, percorso THE GUEST, patrol points, hiding points e chase loops.
8. Aggiornare planimetrie, sezioni e tutti i CSV sulla stessa revisione.

### Output
- piante quotate piano terra e primo piano;
- roof plan e sezioni;
- stair plan/section;
- secret passage plan/section;
- chase route diagram;
- coordinate, wall, door/window e furnishing schedules;
- report di validazione con issue ID, severità, risoluzione e prova richiesta.

### Gate 2
Nessuna produzione ambientale definitiva finché i conflitti bloccanti non sono risolti. Le geometrie non verificate restano PROPOSED o EDITOR-TEST REQUIRED.

---

## 5. FASE 3 — ASSET E THE GUEST

### Attività
1. Congelare asset ID e naming convention.
2. Preparare manifest di mesh, materiali, texture, decal, VFX e audio.
3. Definire per ogni asset fonte, formato, scala, collisione, LOD, materiali, destinazione e stato.
4. Produrre il turnaround coerente di THE GUEST: front, side, back, 3/4, close-up, scala umana e posa neutra.
5. Produrre specifica mesh/UV/texture/rig/collision/LOD/animazioni.
6. Verificare import, scala, materiali e collisioni in UEFN.

### Gate 3
Asset design approvato non equivale ad asset importato. Import e comportamento in editor richiedono prova di Claude.

---

## 6. FASE 4 — GREYBOX E VALIDAZIONE SPAZIALE UEFN

### Attività Claude
1. Costruire la geometria greybox con collisioni e aperture reali.
2. Verificare spawn, reception, stanze, scale, balcone, ROOM 12, passaggio segreto, ROOM 13 e uscita.
3. Provare percorsi in prima persona con player capsule reale.
4. Verificare larghezze, porte, headroom, scale, collision seams e accessibilità.
5. Testare percorsi AI solo dopo aver scelto una soluzione NPC effettivamente supportata.
6. Raccogliere screenshot e video dei punti critici.

### Gate 4
Nessuna decorazione estesa finché la progressione spaziale obbligatoria non è percorribile in solo e non è stata verificata la geometria critica.

---

## 7. FASE 5 — SISTEMI GAMEPLAY E VERSE

Implementare nell'ordine:
1. Game/session state e inizializzazione.
2. Team objective state e inventario condiviso.
3. Interaction framework e lock anti-concorrenza.
4. Puzzle register e office.
5. Checkpoint CP01.
6. Fuse pickups, installazione e power restore.
7. THE GUEST: stati, percezione/investigazione, chase, capture.
8. Capture/rescue e solo recovery.
9. Upper floor, diary, drawing e panel.
10. ROOM 13 photo puzzle, reveal e Service Key.
11. Service route, Car Keys, gate/generator.
12. Ending resolver e tre sequenze.
13. HUD, subtitles, feedback e accessibility.

Per ogni sistema Claude deve documentare:
- file Verse/dispositivi coinvolti;
- API e proprietà verificate per la versione corrente;
- stato autorevole e ownership;
- eventi e transizioni;
- replica/sessione;
- gestione errori, reset, checkpoint e disconnect;
- stato compilazione;
- casi di test e relative evidenze.

Non copiare pseudocodice come se fosse Verse compilabile.

---

## 8. FASE 6 — AUDIO, LIGHTING, UI E POLISH

1. Implementare prima segnali funzionali e leggibili.
2. Garantire che gli indizi audio obbligatori abbiano sottotitoli o equivalente visivo.
3. Verificare leggibilità dei documenti da distanza reale.
4. Verificare contrasto e affordance senza dipendere solo dal colore.
5. Aggiungere audio/lighting/VFX decorativi dopo la stabilità di progressione, collisione e AI.
6. Misurare performance e memoria nella versione target.

---

## 9. FASE 7 — PIANO DI TEST UEFN (ESECUZIONE ESCLUSIVA CLAUDE)

Claude esegue i test nell'editor/Playtest e restituisce prove. ChatGPT prepara/analizza i casi, ma non li marca PASS.

### Matrice minima
- Solo: run completo e ciascuno dei tre finali.
- 2 giocatori: progressione, cattura e rescue, scelta finale condivisa.
- 4 giocatori: interazioni simultanee, pickup simultanei, puzzle e stato condiviso.
- Disconnect/rejoin: durante pickup, puzzle, rescue, chase, checkpoint e voto finale.
- Checkpoint: CP01–CP04, ripristino flag, inventario e stato ambientale.
- THE GUEST: patrol, investigate, line of sight, pathing, chase, hiding, capture e recupero.
- Geometria: tutte le porte, scale, balcone, passaggio segreto, collision seams, uscita.
- Narrazione: leggibilità clue, sottotitoli, ordine atti, reveal e finali.
- Robustezza: input errato, trigger duplicati, eventi ripetuti, simultaneità e softlock.
- Performance: memoria, frame stability, caricamento e validazione isola.

### Procedura obbligatoria per ogni test
1. Assegnare ID univoco.
2. Registrare build/commit e versione UEFN.
3. Definire prerequisiti, party size, ruolo/posizione dei giocatori e checkpoint.
4. Eseguire passi numerati esatti.
5. Registrare risultato atteso e risultato osservato.
6. Allegare screenshot/video/log con riferimento univoco.
7. Marcare PASS / FAIL / BLOCKED / NOT RUN.
8. Se FAIL, aprire defect con severità, riproduzione, impatto, owner e retest.
9. Dopo fix, ripetere il test e i regression test collegati.
10. Non cancellare la storia dei risultati precedenti.

### Campi obbligatori del report
`Test_ID, Build_ID, Commit, UEFN_Version, Date, Party_Size, Setup, Steps, Expected, Observed, Result, Evidence_Ref, Defect_ID, Retest_Result, Tester`.

### Regola di prova
PASS richiede esecuzione reale e prova consultabile. Screenshot statico può dimostrare una configurazione, ma non prova da solo una sequenza multiplayer o un comportamento dinamico. Per questi casi allegare video/log e setup riproducibile.

---

## 10. FASE 8 — OTTIMIZZAZIONE E RELEASE READINESS

Claude deve:
1. risolvere blocker critici/alti;
2. ripetere regressione su tutti gli atti;
3. misurare performance/memoria e documentare il target;
4. eseguire validazione isola;
5. verificare lingua inglese, UI, sottotitoli e accessibilità;
6. preparare release checklist;
7. non pubblicare senza autorizzazione esplicita dell'utente.

### Gate finale
Il progetto è `READY FOR USER REVIEW` solo quando:
- tutte le feature obbligatorie sono implementate;
- build/compilazione e test sono documentati;
- i test critici solo/2/4-player sono PASS;
- tutti i tre finali sono verificati;
- nessun blocker critico o alto rimane aperto;
- performance/memoria e validazione isola hanno evidenza;
- ogni limite residuo è dichiarato.

Non usare `READY TO PUBLISH` se mancano controlli, approvazioni o passaggi di pubblicazione.

---

## 11. HANDOFF DI FINE SESSIONE CLAUDE

Ogni sessione deve terminare con:

1. **Baseline:** branch, commit, versione UEFN e build.
2. **Lavoro eseguito:** elenco preciso di file, asset, dispositivi e sistemi toccati.
3. **Stato:** SPEC READY / IN IMPLEMENTATION / EDITOR VERIFIED / PASS / FAIL / BLOCKED.
4. **Evidenze:** link o percorso file, screenshot, video, log, output compilazione.
5. **Test:** ID eseguiti, party size, risultato e difetti aperti.
6. **Non verificato:** tutto ciò che è stato soltanto progettato o scritto.
7. **Decisioni richieste:** proposte che richiedono approvazione.
8. **Prossimo task:** un solo task prioritario con prerequisiti e criterio di completamento.

### Prossimo task assegnato a Claude
Eseguire FASE 0 (audit ambiente e baseline), quindi iniziare FASE 1 soltanto dopo aver confermato di aver letto tutte le fonti. Non modificare canon narrativo senza marcare le nuove parti PROPOSAL e sottoporle ad approvazione.

## 19. CURRENT BASELINE OVERRIDE — R2.2 AND CRITICAL PATH (2026-11-16)

This addendum supersedes any earlier phase ordering or geometry references in this plan where they conflict.

### 19.1 Current geometry authority
- Read LEVEL_DESIGN_R2.2_INDEX.md first.
- LEVEL_DESIGN_GEOMETRY.md LD-GEO R2.2 is the single candidate geometry proposal.
- Controlled data: ROOM_COORDINATE_REGISTER.csv, DOOR_WINDOW_SCHEDULE.csv, wall_schedule.csv, SLAB_SCHEDULE.csv, LEVEL_SECTIONS.md, STAIR_PLAN_R2.md, ROOF_PLAN_R2.md, GROUND_FLOOR_PLAN_R2.svg, UPPER_FLOOR_PLAN_R2.svg, SECTIONS_R2.2.svg.
- R2.2 is not owner-approved and not UEFN-verified. The owner approval checklist in LEVEL_DESIGN_GEOMETRY.md is a hard stop. Claude may audit arithmetic, IDs, topology and implementation feasibility, but must not silently approve or alter owner-level layout decisions.
- CLAUDE_GEOMETRY_EXECUTION_BRIEF_R2.1.md is superseded. Do not use it as a build authority.

### 19.2 Correct production order
Geometry is the physical critical path. Narrative documentation may be completed in parallel, but must not delay or replace the geometry approval/build gate:
1. Preflight the real project and editor version; create a baseline/backup.
2. Obtain owner approval of R2.2 proposal or a revised owner-selected geometry.
3. Close document-level geometry issues: stair coordinates, shared wall/opening joins, slab/void polygons, balcony union, secret route and complete structural schedules.
4. Claude builds a greybox only from the approved revision and tests traversal/collision/nav constraints.
5. Freeze geometry only after owner review of Claude's evidence.
6. Reconcile Environment Art registers and placements against that exact frozen revision.
7. Acquire/produce/import assets and verify licensing, scale, pivots, materials, LOD and collision.
8. Verify UEFN device/API/NPC feasibility against the installed release; implement and compile Verse.
9. Integrate gameplay, narrative, audio, lighting, UI and final art in dependency order.
10. Run solo, 2-player and 4-player tests, disconnect/rejoin, checkpoint, capture/rescue, all endings, performance and island validation.
11. Release gate and publication only after owner approval.

### 19.3 Required cross-register corrections
- Use INTERACTION_MASTER_REGISTER.csv IN-006 as the only OfficeKey grant after PZ-01 opens the drawer.
- Use IN-017 as the only ServiceKey grant after PZ-04 opens the compartment.
- IN-024–IN-026 are the team pickup transactions for FuseA/B/C.
- IN-027 is the reusable Screwdriver pickup; it serves the electrical cover and ROOM 12 panel.
- IN-028 is the Act VI CarKeys pickup.
- IN-029 records Room 06 missing-guest evidence as MissingGuestEvidenceFound.
- Room13Key is the team item; Room13KeyKnown is its narrative discovery flag.
- Treat GAT-048–GAT-052 as required regression tests.
- The exact truth-evidence gate and the THE_NEW_GUEST co-op quorum remain design approvals where the narrative/ending documents mark them PROPOSAL; do not infer approval from the existence of a table.

### 19.4 Environment Art branch restriction
PR #1 / environment-art/room13-v1 is OPEN/DRAFT and currently diverged from main (61 commits ahead, 226 behind at the 2026-11-16 audit). It is based on older geometry and is not ready to merge. Do not merge, rebase, force-push or synchronize it as a substitute for reauthoring. Reauthor the art package against owner-approved and Claude-verified geometry, then submit a fresh review.

### 19.5 Stop conditions
Stop and report BLOCKED if:
- owner has not approved the R2.2 geometry decisions required for the next construction step;
- any opening has no unique host wall or any wall/opening ID fails to resolve;
- the ROOM 12 → ROOM 13 route is not physically continuous and two-way;
- stair, balcony, slab opening or roof polygons conflict;
- an asset source/license or UEFN import right is unclear;
- required NPC/Verse/device API support is not verified in the target release;
- a mandatory clue, key or puzzle reward has no unique state owner;
- the actual project/editor access is unavailable.

Every stop report must identify the task ID, exact source lines/IDs, consequence, required owner action, and evidence needed to resume.
