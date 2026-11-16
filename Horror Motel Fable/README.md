# THE MOTEL: ROOM 13 — Fable production package

Questa cartella contiene il pacchetto di istruzioni per Claude destinato alla realizzazione del gioco completo in **UEFN / Fortnite**.

## Ordine di lettura
1. [MASTER_PROMPT_FOR_CLAUDE.md](MASTER_PROMPT_FOR_CLAUDE.md) — prompt operativo principale, aggiornato per richiedere un handoff di produzione misurabile.
2. [GAME_DESIGN_BIBLE.md](GAME_DESIGN_BIBLE.md) — visione, lore, struttura, personaggi, stanze, enigmi, dialoghi e finali.
3. [GAMEPLAY_FLOW_AND_TESTS.md](GAMEPLAY_FLOW_AND_TESTS.md) — flusso dei sei atti, stati giocatore, cattura/salvataggio, inventario, finali e QA.
4. [UEFN_IMPLEMENTATION_SPEC.md](UEFN_IMPLEMENTATION_SPEC.md) — architettura, Verse, dispositivi, AI, cooperativa, audio, luci, performance e QA tecnico.
5. [LEVEL_DESIGN_GEOMETRY.md](LEVEL_DESIGN_GEOMETRY.md) — coordinate preliminari, vincoli geometrici e procedura per la planimetria esecutiva corretta.
6. [ASSET_AND_CONTENT_REGISTER.md](ASSET_AND_CONTENT_REGISTER.md) — inventario iniziale di modelli 3D, props, materiali, luci, audio e priorità.
7. [EXECUTIVE_BUILD_DOSSIER.md](EXECUTIVE_BUILD_DOSSIER.md) — specifiche dimensionali proposte per sito, stanze, arredi, sezioni e THE GUEST.
8. [PRODUCTION_DETAIL_REQUIREMENTS.md](PRODUCTION_DETAIL_REQUIREMENTS.md) — requisiti obbligatori per piante quotate, coordinate di ogni arredo, CSV completi, scheda 3D/rig/LOD/animazioni del mostro, validazione geometrica e QA.

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

## File di produzione che Claude deve generare
- `coordinate_schedule.csv`
- `room_furnishing_schedule.csv`
- `door_window_schedule.csv`
- `asset_manifest.csv`
- `guest_model_spec.md`
- `geometry_validation_report.md`
- `uefn_device_bindings.csv`
- `qa_acceptance_matrix.md`

Repository: [Haigone/UEFN-w-Kavasaki](https://github.com/Haigone/UEFN-w-Kavasaki)
Branch: `main`
