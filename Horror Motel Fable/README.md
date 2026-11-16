# THE MOTEL: ROOM 13 — Fable production package

Questa cartella contiene il pacchetto di istruzioni per Claude destinato alla realizzazione del gioco completo in **UEFN / Fortnite**.

## Ordine di lettura
1. [MASTER_PROMPT_FOR_CLAUDE.md](MASTER_PROMPT_FOR_CLAUDE.md) — prompt operativo principale: incollare per primo in Claude.
2. [GAME_DESIGN_BIBLE.md](GAME_DESIGN_BIBLE.md) — visione, lore, struttura, personaggi, stanze, enigmi, dialoghi e finali.
3. [UEFN_IMPLEMENTATION_SPEC.md](UEFN_IMPLEMENTATION_SPEC.md) — architettura, Verse, dispositivi, AI, cooperativa, audio, luci, performance e QA.
4. [LEVEL_DESIGN_GEOMETRY.md](LEVEL_DESIGN_GEOMETRY.md) — coordinate preliminari, vincoli geometrici e procedura obbligatoria per produrre la planimetria esecutiva corretta.

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
Il design narrativo e il gameplay sono definiti a livello di concept e specifica. La geometria precedente è solo una bozza: contiene collisioni e va ricostruita/validata prima del blockout definitivo. Le quantità di dispositivi e i parametri AI sono valori iniziali da verificare in UEFN, non garanzie di API o performance.

Repository: [Haigone/UEFN-w-Kavasaki](https://github.com/Haigone/UEFN-w-Kavasaki)
Branch: `main`
