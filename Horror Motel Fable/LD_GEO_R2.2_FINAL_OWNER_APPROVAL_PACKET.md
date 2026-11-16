# LD-GEO R2.2 — PACCHETTO DI REVISIONE E APPROVAZIONE DEL PROPRIETARIO

Data revisione: 2026-11-16  
Branch esaminato: main  
Esito: **PROPOSTA NON APPROVATA — NON PRONTA PER IL FREEZE GEOMETRICO — NON UEFN-VERIFICATA**

## 1. Scopo e perimetro

Questa revisione controlla esclusivamente la coerenza geometrica documentale di LD-GEO R2.2: dimensioni, bounds FIF, wall centre-lines, aperture, percorso ROOM 12 → ROOM 13, scale, balcone, solai, tetto, sezioni e coerenza delle planimetrie.

Non ricostruisce la geometria da zero. Non modifica le decisioni già fissate dal proprietario. Non apre né testa UEFN.

**Nessun registro geometrico, schedule, quota o SVG di R2.2 è stato modificato durante questa revisione.** Questo documento registra i risultati, le decisioni richieste e le correzioni documentali da eseguire.

## 2. Decisioni del proprietario già fissate — non riaprire

| ID | Decisione | Stato |
|---|---|---|
| FIX-01 | Scala principale nel connettore nord / reception | APPROVATA dal proprietario — posizione soltanto |
| FIX-02 | Balcone superiore continuo sul lato cortile, percorso a U | APPROVATA dal proprietario — continuità soltanto |
| FIX-03 | ROOM 13 nel connettore nord al piano superiore | APPROVATA dal proprietario — posizione soltanto |
| FIX-04 | Tetto piatto | APPROVATA dal proprietario — tipologia soltanto |
| FIX-05 | THE GUEST deve poter utilizzare entrambi i piani | APPROVATA dal proprietario — intento di navigazione; non testato |

Le dimensioni delle camere, la forma esatta dei turning pad, le quote verticali, gli spessori, le dimensioni della scala, i parapetti e le aperture non diventano approvati per effetto di queste cinque decisioni.

## 3. Risultati quantitativi della verifica

### 3.1 Verifiche superate

- Le coordinate dei 13 ambienti ROOM 01–13 corrispondono tra il registro e il coordinate schedule.
- I bounds FIF e le wall centre-lines delle pareti principali risultano coerenti con gli spessori dichiarati: 0,15 m o 0,30 m.
- 51 aperture: tutti gli ID hanno un host wall esistente; gli assi e i centri coincidono con il centre-line della parete; larghezze nette e rough openings rientrano nei segmenti ospitanti; le altezze nette e rough rientrano nell'altezza della parete.
- Tutti i riferimenti apertura presenti in wall_schedule.csv risolvono a un Opening_ID esistente.
- 70 Wall_ID univoci; nessun ID parete duplicato.
- coordinate_schedule.csv: 55 righe dati, 14 colonne coerenti. UPPER_ROOM11 è completo.
- DOOR_WINDOW_SCHEDULE.csv: 51 righe dati, 16 colonne coerenti.
- wall_schedule.csv: 70 righe dati, 15 colonne coerenti.
- SLAB_SCHEDULE.csv: 5 righe dati, 11 colonne coerenti.
- Impronta U: area matematica 1.536 m². Cortile escluso: 44 × 30 = 1.320 m². Il poligono U del registro solai è coerente con l'ingombro X=8–76, Y=18–60 meno il cortile X=20–64, Y=18–48.
- Stack verticale: GF slab −0,20/0,00; UF slab 3,35/3,60; roof slab 6,40/6,65; parapetto fino a 7,10. Le differenze di quota e gli spessori sono aritmeticamente coerenti tra i documenti.
- ROOM 12 → ROOM 13: D-13A, vestibolo, D-13C, turning pad est, balcone nord e D-13B formano una sequenza geometrica continua. Le tre porte hanno luce netta 0,90 × 2,10 m.
- Scala: 20 × 0,18 = 3,60 m di dislivello; 9 goings × 0,28 = 2,52 m per rampa; 18 goings totali = 5,04 m; pianerottolo intermedio 2,70 × 1,20 m; inviluppo 2,70 × 3,72 m. Il foro solaio 3,00 × 4,02 m lascia 0,15 m nominali per lato.
- Approccio superiore alla scala: 1,20 m. Se l'accesso inferiore è dal lato sud, la fascia libera tra Y=51,10 e l'inizio scala Y=52,45 misura 1,35 m. Headroom nominale ricavabile dallo stack: 6,40 − 3,60 = 2,80 m, a condizione che non vi siano travi o impianti sospesi più bassi.
- I due SVG di piano usano una trasformazione coerente di 9,2 px/m per i bounds principali. Il tracciato del percorso segreto nel piano superiore corrisponde ai tre centri D-13A, D-13C e D-13B.

### 3.2 Limiti della verifica

- Le verifiche sono matematiche e documentali. Non verificano collisioni reali, navmesh, capsule del giocatore, supporti strutturali, mesh, comportamento del Guest o attraversamento della scala in UEFN.
- SECTIONS_R2.2.svg dichiara correttamente di essere schematico e non in scala. Per le quote fa fede LEVEL_SECTIONS.md e lo schedule; il disegno non può essere usato come sezione CAD dimensionale.
- I due SVG di piano sono elaborati di zoning e percorso; non rappresentano ogni giunto, spessore e apertura come un disegno costruttivo completo. Per aperture e pareti fanno fede i CSV.
- Le suddivisioni interne dei bagni e il fit-out interno delle camere non sono definiti in R2.2. Le camere sono verificate come envelope FIF, non come layout interno completo.

## 4. Anomalie da correggere prima del freeze

### A-01 — COURTYARD: riga CSV malformata
**Priorità: ALTA — correzione documentale oggettiva.**

ROOM_COORDINATE_REGISTER.csv ha 52 righe dati, ma la riga COURTYARD contiene 15 campi contro i 16 dell'header. Manca il placeholder Material_Asset_ID; i campi successivi risultano quindi disallineati e Verification_Status è assente.

Correzione proposta: inserire il valore NA dopo Rotation_deg=0, mantenendo No_Floor_Slab nel campo Collision, la descrizione open-to-sky in Gameplay_Function e FIXED REQUIREMENT in Verification_Status.

Il precedente GEOMETRY_VALIDATION_REPORT.md afferma che tutte le righe hanno 16 colonne: questa affermazione è falsa e deve essere aggiornata.

### A-02 — VEST-13: profondità errata nel registro
**Priorità: ALTA — correzione documentale derivata.**

Bounds FIF: X=67,00–72,90 e Y=47,55–49,20. Dimensioni matematiche: 5,90 × 1,65 m. ROOM_COORDINATE_REGISTER.csv riporta Length_m=1,50. LEVEL_DESIGN_GEOMETRY.md, LEVEL_SECTIONS.md e FINAL_UPPER_FLOOR_PLAN.md riportano invece 1,65 m.

Correzione proposta: portare VEST-13 Length_m a 1,65. Non cambia la geometria; allinea il registro agli stessi bounds già presenti negli altri documenti.

### A-03 — Due tasche chiuse e non registrate al piano terra
**Priorità: BLOCCANTE — richiede scelta del proprietario.**

A nord di ROOM 03 e ROOM 06 risultano due aree fisiche non assegnate:
- Ovest: X=11,10–19,70; Y=45,15–48,00; 8,60 × 2,85 m = 24,51 m².
- Est: X=64,30–72,90; Y=45,15–48,00; 8,60 × 2,85 m = 24,51 m².

Sono chiuse da pareti: parete nord camera a Y=45,075; parete corridoio/camera a X=10,95 o 73,05; facciata cortile a X=19,85 o 64,15; facciata sud del connettore nord a Y=48,15. Non risultano aperture che le colleghino a corridoio, cortile o connettore. Non hanno ID nel ROOM_COORDINATE_REGISTER.csv.

Scelta necessaria:
- A: mantenerle come volumi tecnici sigillati, registrarli come No_Access/No_Collision e non considerarli spazi di gioco;
- B: renderli accessibili dal corridoio con aperture dimensionate e registrarli come nicchie/ambienti;
- C: collegarli al connettore nord o al cortile con nuove aperture, modificando pareti e flusso.

Raccomandazione: non lasciarli come volumi anonimi. Se non servono al gameplay, scegliere A; altrimenti definire esplicitamente aperture e funzione prima del freeze.

### A-04 — Tasche superiori non assegnate ai lati del connettore nord
**Priorità: ALTA — richiede scelta del proprietario.**

- Tasca ovest: X=8,30–17,00; Y=47,55–50,80; circa 8,70 × 3,25 m = 28,28 m². La parete UF-W-ROOM-BALCONY termina a Y=47,475; a nord di tale quota l'area è aperta verso il turning pad ma non è registrata come balcone, landing o altro spazio.
- Lato est: rimane un'area a L intorno al lato nord del VEST-13, circa 17,60 m², collegata al turning pad est ma non assegnata a una zona. Il vestibolo è registrato, questa fascia residua no.

Le superfici sono comprese nel solaio UF, ma non hanno un'identità funzionale/collisione univoca nel registro.

Scelta necessaria:
- A: incorporarle esplicitamente nei turning pad/landing, aggiornando i bounds e la superficie walkable;
- B: chiuderle con pareti e renderle riserve non accessibili;
- C: assegnarle a spazi di servizio o gameplay, con porte e pareti coerenti.

Raccomandazione: A solo se devono essere realmente parte del percorso superiore; altrimenti B. Non lasciarle come superfici walkable implicite.

### A-05 — U-SERVICE è un ambiente chiuso ma marcato walkable
**Priorità: BLOCCANTE — richiede scelta del proprietario.**

U-SERVICE misura 19,70 × 8,60 m = 169,42 m². È delimitato da UF-NORTH-HALL-ROOMS, UF-STAIR-SERVICE, UF-SERVICE-ROOM13 e UF-EXT-NORTH. Nessuna di queste pareti contiene una porta verso U-SERVICE. ROOM_COORDINATE_REGISTER.csv lo marca Walkable e coordinate_schedule.csv lo marca Collision=Yes.

Scelta necessaria:
- A: ambiente tecnico accessibile, aggiungendo una porta da landing o north hall e aggiornando opening/wall schedules;
- B: volume tecnico sigillato, marcato No_Access/No_Collision;
- C: suddivisione in più locali, da dimensionare.

Raccomandazione: B se non ha una funzione di gameplay o manutenzione; A solo se è davvero necessario entrarvi. La situazione attuale (chiuso ma walkable) è ambigua.

### A-06 — Turning pad del balcone oltrepassano il poligono del solaio/cortile
**Priorità: ALTA — correzione geometrica proposta, da confermare.**

- U-WEST-TURN: X=17,15–20,15; Y=47,00–50,80.
- U-EAST-TURN: X=63,85–66,85; Y=47,00–50,80.
- Il poligono UF-SLAB termina a X=20,00 sul lato ovest del cortile e inizia a X=64,00 sul lato est. Il courtyard void è escluso dal solaio.

Ogni pad estende quindi una porzione di 0,15 × 1,00 m = 0,15 m² nel courtyard void. I guardrail courtyard-side sono invece sui centre-lines X=19,85 e X=64,15. Il registro richiede l'unione dei componenti ma non prescrive il clipping del pad al poligono del solaio.

Raccomandazione: ritagliare i turning pad sul limite del poligono UF-SLAB e ridefinire insieme il bordo walkable e la linea del parapetto, mantenendo una larghezza libera continua minima di 2,50 m. Non creare collisione pavimento sopra il courtyard void senza una scelta strutturale esplicita.

### A-07 — Cross-bay: 2,00 m lordi, 1,70 m netti
**Priorità: MEDIA — chiarimento documentale.**

Le fasce nominali Y=27–29 e Y=36–38 misurano 2,00 m tra i bounds FIF delle camere. Le pareti di confine sono spesse 0,15 m e avanzano di 0,075 m per lato rispetto al centre-line; la distanza libera tra le facce finite delle due pareti è quindi 1,70 m.

Le aperture da 1,50 m nei muri di collegamento sono coerenti. I documenti devono però distinguere la fascia lorda da 2,00 m dalla profondità netta da 1,70 m. Se il requisito desiderato fosse 2,00 m netti, le pareti e i bounds andrebbero spostati.

Raccomandazione: mantenere le coordinate attuali e descrivere i cross-bay come 2,00 m nominali / 1,70 m netti.

### A-08 — Scala: approcci e configurazione non completamente definiti
**Priorità: ALTA — approvazione del layout e verifica successiva.**

La matematica delle alzate e pedate è corretta. Il piano non definisce però la handedness, l'offset esatto delle rampe, il lato preciso del pianerottolo e il poligono di approccio inferiore. Se l'accesso inferiore è da sud, la fascia disponibile è 1,35 m; l'approccio superiore da sud è 1,20 m. Il headroom nominale è 2,80 m rispetto al roof underside Z=6,40, ma travi e impianti non sono registrati.

Raccomandazione: approvare la configurazione a due rampe da 1,20 m, 20 alzate da 0,18 m, 9 pedate da 0,28 m per rampa, pianerottolo 2,70 × 1,20 m; aggiungere una pianta con handedness, direzione salita, approcci e sezione headroom. La posizione nord resta fissa. Claude dovrà verificare collisioni e traversabilità in UEFN, senza che questa revisione anticipi l'esito.

### A-09 — Tetto piatto: drenaggio e accessibilità non decisi
**Priorità: MEDIA — decisione del proprietario.**

Il tetto piatto e il courtyard void sono coerenti. Parapetto proposto: spessore 0,20 m, Z=6,65–7,10, altezza 0,45 m. Non sono definite pendenze, scarichi o scupper. La regola "roof non-playable / no player access" compare nei documenti ma non è una delle cinque decisioni già fissate dal proprietario.

Raccomandazione: mantenere l'aspetto flat con pendenze tecniche nascoste e drenaggio dimensionato prima del freeze; approvare separatamente il divieto di accesso al tetto. Non inventare coordinate di scarico.

### A-10 — Report di validazione non aggiornato rispetto al controllo finale
**Priorità: ALTA — correzione documentale.**

GEOMETRY_VALIDATION_REPORT.md elenca un set di file esaminati precedente all'indice R2.2, non include tutti i documenti ora controllati e afferma erroneamente che tutte le righe del ROOM_COORDINATE_REGISTER.csv rispettano l'header. Deve essere aggiornato per riflettere A-01 e A-02 e per includere le anomalie A-03–A-09.

### A-11 — Fit-out interno camere escluso
**Priorità: NON BLOCCANTE per l'envelope; BLOCCANTE per un freeze completo degli interni.**

R2.2 definisce gli envelope delle camere ma non le partizioni/porte dei bagni. Il riferimento nominale EBD 2,20 × 2,40 m non definisce una collocazione verificabile. Non inventare bagni o aperture: richiedono una specifica interna separata.

## 5. Decisioni numerate per il proprietario

Le decisioni qui sotto riguardano solo le quote non ancora fissate. Le cinque decisioni FIX-01…FIX-05 non devono essere rivotate.

| N. | Decisione richiesta | Valore proposto R2.2 | Alternative e conseguenze | Raccomandazione |
|---:|---|---|---|---|
| 1 | Orientamento camere GF | Camere sul lato cortile; corridoi sul lato esterno | Layout speculare EBD: inverte porte, finestre e corridoi e richiede riscrittura dei wall/opening schedules | Mantenere R2.2 |
| 2 | Fasce Y e cross-bay GF | Camere Y20–27, 29–36, 38–45; cross-bay nominali 2,00 m, netti 1,70 m; aperture 1,50 m | Chiudere i cross-bay aumenta la separazione; allargarli riduce le fasce camere o sposta le pareti | Mantenere, chiarendo lordo/netto |
| 3 | Tasche nord GF | Due aree da 8,60 × 2,85 m, attualmente chiuse e non registrate | Sigillate: nessun gameplay ma vanno marcate no-access; accessibili: richiedono porte/aperture e funzione | Scegliere A-03 prima del freeze |
| 4 | Camere UF e cross-bay | ROOM 07–12 larghezza 8,70 m; fasce Y come GF; cross-bay netti 1,70 m | Ripristinare larghezza R2.1 da 5,90 m riduce le camere e crea una fascia residua esterna da assegnare | Mantenere 8,70 m |
| 5 | Tasche nord UF | Ovest circa 28,28 m²; est circa 17,60 m² attorno al vestibolo | Incorporarle nei turning pad/landing oppure chiuderle; lasciarle implicite produce superfici walkable non assegnate | Assegnarle esplicitamente o chiuderle |
| 6 | U-SERVICE | 19,70 × 8,60 m, nord, attualmente senza porte | Aggiungere accesso: ambiente tecnico utilizzabile; nessun accesso: volume sigillato e non walkable; suddivisione: più pareti e porte | Non walkable se non serve al gameplay |
| 7 | ROOM 13 | X49,00–63,70; Y51,10–59,70; 14,70 × 8,60 m | Ridurre o ampliare la stanza cambia U-service e riserve; spostarla contraddice la posizione nord già approvata | Mantenere posizione e dimensione proposta |
| 8 | Percorso segreto | D-13A (69,95;47,475), vestibolo 5,90 × 1,65 m, D-13C (66,925;48,45), D-13B (56,35;50,95); porte 0,90 × 2,10 m | Vestibolo più profondo o porte più larghe riducono le aree adiacenti e richiedono aggiornamento pareti/aperture | Mantenere, correggendo VEST-13 a 1,65 m |
| 9 | Scala | 20 alzate ×0,18 m; 9 pedate ×0,28 m per rampa; larghezza libera 1,20 m per rampa; pianerottolo 2,70×1,20 m; foro 3,00×4,02 m | Cambiare larghezza, verso o pianerottolo modifica foro, riserve e circolazione reception | Mantenere dimensioni e approvare handedness/approcci |
| 10 | Spessori pareti | Esterne 0,30 m; partizioni standard 0,15 m; selezionate nel connettore 0,30 m | Uniformare gli spessori semplifica la costruzione ma cambia bounds FIF e aperture | Mantenere, con dettagli di giunzione |
| 11 | Stack verticale | GF FFL0,00; ceiling3,00; UF slab3,35–3,60; UF clear2,80; roof slab6,40–6,65; parapetto top7,10; GF slab0,20 m | Modificare le quote influenza altezze libere, headroom scala, parapetto e volume interno | Mantenere, subordinato a verifica travi/impianti |
| 12 | Balcone e parapetti | Gambe 2,55 m; barra nord 2,50 m; turning pad 3,00×3,80 m; parapetto 1,10 m | Ridurre pad semplifica la collisione ma riduce la superficie di svolta; allargare richiede supporto solaio e parapetto coerenti | Mantenere percorso a U, correggere clipping dei pad e preservare 2,50 m netti |
| 13 | Tetto | Flat; parapetto 0,20 m; altezza 0,45 m; top Z7,10 | Drenaggio a vista altera silhouette; pendenze nascoste preservano l'aspetto flat; accesso al tetto cambia gameplay e collisioni | Flat con drenaggio nascosto; approvare no-access separatamente |
| 14 | Finestre | GF verso cortile, 1,60×1,20 m, sill Z0,90; UF verso esterno, 1,60×1,20 m, sill Z4,50 | Spostarle o invertirle cambia privacy, facciate e apertura host | Mantenere posizione proposta |
| 15 | Bagni e partizioni interne | Non definiti nel pacchetto R2.2 | Inserirli ora richiede un layout interno completo, con porte e clearance; rinviarli lascia approvati solo gli envelope | Trattarli in una revisione interna separata |

## 6. Raccomandazione finale

**Non congelare R2.2 nello stato attuale.** La struttura matematica principale è coerente, e il percorso ROOM 12 → ROOM 13, le aperture, le quote verticali e i calcoli della scala sono sostanzialmente allineati. Restano però aree fisiche non assegnate, un ambiente U-SERVICE senza accesso ma marcato walkable, due errori nel registro coordinate e il clipping dei turning pad.

Ordine raccomandato:
1. Correggere A-01 e A-02 senza cambiare la geometria.
2. Ottenere le scelte del proprietario per A-03, A-04 e A-05.
3. Correggere A-06 e chiarire A-07.
4. Approvare la configurazione dettagliata della scala e le quote di stack.
5. Approvare parapetti, drenaggio, accesso tetto e finestre.
6. Solo dopo, aggiornare registri e planimetrie con le decisioni effettive e produrre un nuovo report di validazione.

## 7. Stato di approvazione

- Cinque decisioni di layout già date dal proprietario: **fisse e preservate**.
- Dimensioni numeriche R2.2: **proposte, non approvate**.
- Aperture/host wall: **coerenti documentalmente**.
- Percorso ROOM 12 → ROOM 13: **continuo sulla carta**.
- Scala/headroom: **aritmetica coerente; dettagli e attraversamento non verificati**.
- Balcone: **unione continua; clipping e aree residue da correggere**.
- Solai/tetto: **poligoni coerenti; drenaggio e dettagli da approvare**.
- UEFN: **nessun test eseguito**.
- Stato complessivo: **NON APPROVATO — NON FREEZABLE fino alla risoluzione delle anomalie bloccanti e all'approvazione esplicita del proprietario**.
