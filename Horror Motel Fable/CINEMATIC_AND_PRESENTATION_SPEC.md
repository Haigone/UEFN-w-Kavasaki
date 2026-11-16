# CINEMATIC & PRESENTATION SPECIFICATION
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **PRESENTATION DESIGN BASELINE; NARRATIVE CANON APPROVED; UEFN CAPABILITY VERIFICATION REQUIRED**

## 1. Purpose and constraints

This document defines how authored scares, reveal beats, capture presentation and endings are staged. It does not assume a specific camera, animation, sequencer or NPC API exists in the target UEFN release.

Rules:
- Gameplay state is authoritative; cinematic presentation never grants items, solves puzzles or selects an ending.
- Every sequence has a unique SequenceId, start condition, end condition, one-shot flag, cleanup and fallback.
- A cinematic cannot permanently immobilize a player. Capture and mandatory clue presentation have bounded durations.
- In co-op, all connected players receive the same logical sequence result. Local camera failure must not block session progression.
- All mandatory spoken information has subtitles and a readable transcript/journal fallback.
- Do not rely on camera cuts or audio alone to convey a puzzle answer.
- If a sequence cannot be implemented with verified UEFN capabilities, use the documented in-world fallback; do not invent APIs.

## 2. Sequence lifecycle contract

Sequence states: IDLE → PREPARING → PLAYING → COMPLETED; any runtime error enters FALLBACK → COMPLETED.

At start:
1. Validate sequence not already completed and all prerequisites are true.
2. Acquire a session sequence lock and mark protected player states.
3. Pause MonsterController capture requests and clamp tension.
4. Present sequence to all connected eligible players.
5. Commit only the sequence completion flag after all required presentation events have either played or used fallback.
6. Release locks, restore control and resume AI according to current act/state.

On cancel/error:
- Clear camera/input/AI locks.
- Preserve committed gameplay flags.
- Use fallback presentation and complete the logical sequence if the narrative event is still required.
- Never re-grant items or replay a one-shot ending.
- Disconnecting a player releases only their local presentation lock; the shared sequence state remains authoritative.

Target maximums:
- Short scare beat: 1–4 seconds.
- Discovery/reveal beat: 4–10 seconds.
- Mandatory story presentation: target 12 seconds maximum before control is returned or a clear skip/continue option appears.
- Capture presentation: 2 seconds target, then self-rescue/rescue state rules apply.
These are pacing targets, not engine guarantees.

## 3. Sequence register

| SequenceId | Trigger | Beat / presentation | Target duration | Gameplay lock | Completion / fallback |
|---|---|---|---:|---|---|
| CINE-001 Arrival balcony silhouette | ACT I start after exterior entry | THE GUEST stands motionless on upper balcony; player can look freely; silhouette disappears only after a clear visual beat | 4–6 s | No movement lock; AI remains DORMANT | ArrivalSilhouetteSeen; if actor/camera fails, use distant static silhouette and ambient cue |
| CINE-002 Reception phone | IN-002 | Phone rings; player answers; approved line “Welcome. We've been expecting you.” appears as subtitles; readable transcript available | 4–7 s | Local interaction focus only | PhoneMessageHeard; if VO fails, subtitle and transcript still commit |
| CINE-003 ROOM 01 CRT anomaly | IN-030 | CRT shows impossible corridor/ROOM 13 feed; no creature chase | 3–5 s | No global lock | CRTFeedSeen; static visual fallback |
| CINE-004 ROOM 03 mirror reflection | Room 03 inspection event | Reflection shows THE GUEST briefly behind player; reflection returns to normal | 1–3 s | No movement lock | MirrorScareSeen; fallback uses staged silhouette/lighting if reflection method unsupported |
| CINE-005 ROOM 05 ceiling footsteps | Room 05 entry or inspection | Footsteps move overhead; ceiling remains visually unchanged | 4–8 s | No movement lock | CeilingFootstepsHeard; optional cue, no progression flag required |
| CINE-006 Power restoration / first hunt | IN-012 commits PowerRestored | Lights transition; breaker sound; threat cue; THE GUEST investigates breaker source then chase begins only after valid target/path | 4–8 s transition, then systemic AI | Brief interaction recovery; AI protection released after cue | PowerRestored already authoritative; chase event one-shot per authored encounter; if NPC path fails, investigation/retreat fallback |
| CINE-007 ROOM 13 identity reveal | PZ-04 solved | Photo alignment reveals owner/Guest identity; show readable text/portrait alignment; hidden compartment opens | 6–10 s | Protect all players from capture; puzzle lock released after reveal | Room13RevealComplete only after reveal and readable version available; if camera/animation fails, use in-world portrait/lighting and journal reveal |
| CINE-008 Capture presentation | PlayerManager accepts CaptureRequest | Brief capture pose/stinger; transfer player to CAPTURED; no death imagery or loss of quest inventory | 2 s | Target only | Capture state commits in PlayerManager; fallback is immediate HUD/status transition |
| CINE-009 ESCAPE ending | EndingSelected=ESCAPE | Reach vehicle; gate route; final chase; exact radio line; rear-seat/rear-view silhouette; cut to black; title card | 12–20 s target | Ending lock; all players share result | Ending remains committed if sequence fails; fallback title card and complete state |
| CINE-010 THE TRUTH ending | EndingSelected=THE_TRUTH | Service route confrontation; recorder plays diary entry; owner portrait and THE GUEST align in reflection; IN-032 NIGHT AUDIT breaker; room-by-room blackout; 02:13 neon hold; register prints “NO VACANCY. NO OWNER. NO GUEST.”; THE TRUTH title card | 15–25 s target | Ending lock; AI capture disabled | Ending remains committed; service-control proxy and fallback title card; approved narrative beats preserved |
| CINE-011 THE NEW GUEST ending | EndingSelected=THE_NEW_GUEST | Shared invitation accepted; motel resets; twelve public lights illuminate; Room 13 key returns to rack; register shows blank NEXT GUEST line; neon pulses at 02:13; THE NEW GUEST title card | 12–20 s target | Ending lock; AI capture disabled | Ending remains committed; fallback world-state reset and title card; approved text/copy preserved |

## 4. Co-op presentation and voting

- Ending selector is session-wide and opens only after FinaleReady.
- One choice transaction is active at a time.
- ESCAPE/THE_TRUTH: strict majority of currently connected eligible players.
- THE_NEW_GUEST: unanimous explicit affirmative confirmation.
- Use a maximum 20-second vote window as the proposed UX default; quorum resolves early when satisfied.
- Tie/timeout chooses ESCAPE only if eligible; otherwise reopen the selector. Never infer THE_TRUTH.
- Disconnect removes the player and recalculates/reconfirms; disconnect never counts as consent.
- When the ending commits, every connected player receives the same Ending value and SequenceId. No player is selected individually as keeper.

## 5. Camera, subtitle and accessibility

- Prefer in-world staging and player-controlled first-person view for short scares.
- Use a scripted camera only if the target UEFN release supports the required device/API and multiplayer ownership has been verified.
- Keep subtitles inside safe-area margins; speaker labels are used only when identity is known.
- Subtitle timing must remain long enough to read; never hide required text behind a camera transition.
- Provide journal/transcript copies for mandatory voice content.
- Avoid rapid full-screen flashes, high-frequency strobing and motion that prevents route comprehension.
- For an unskippable mandatory reveal, cap the duration and provide a skip/continue action after the essential information is presented.
- Cinematic audio uses AUDIO_CUE_SHEET.csv and AUDIO_MIX_POLICY.md; visual lighting uses LIGHTING_CUE_SHEET.csv and LIGHTING_STATE_SPEC.md.

## 6. Asset and technical dependencies

Each sequence references existing stable Asset_ID/Audio_ID/Light_ID/Interaction_ID values. A missing asset is not silently replaced with an unrelated asset. Use the explicit fallback and log the missing source.

Required presentation assets include:
- THE GUEST idle/observe/retreat/chase/capture/reveal poses from GUEST_MODEL_SPEC.md.
- CRT content, photo boards, readable journal panels, phone transcript, gate/vehicle props and ending title cards.
- Rain, phone, CRT, guest footstep/breath, fuse/breaker, capture, gate and radio audio from AUDIO_REGISTER.csv.
- Neon, reception, corridor, ROOM 13 and final chase lighting from LIGHTING_REGISTER.csv.

No asset is considered produced/imported/working until it is present in the actual UEFN project and validated.

## 7. Acceptance tests

| ID | Scenario | Expected |
|---|---|---|
| CINE-AT-001 | Arrival silhouette actor missing | In-world silhouette fallback; Act I continues |
| CINE-AT-002 | Phone VO asset missing | Subtitle/transcript shown; PhoneMessageHeard commits |
| CINE-AT-003 | CRT audio missing | Visual CRT clue remains |
| CINE-AT-004 | Mirror reflection method unsupported | Staged silhouette/lighting fallback; no broken mirror requirement |
| CINE-AT-005 | Power cue fires twice | One transition and one chase encounter event |
| CINE-AT-006 | Player captured during mandatory reveal | Capture blocked until reveal lock clears |
| CINE-AT-007 | Reveal camera/device fails | Readable/in-world reveal fallback; Room13RevealComplete can complete safely |
| CINE-AT-008 | One co-op client disconnects during reveal | Remaining clients complete; session flag commits once |
| CINE-AT-009 | Ending cinematic fails after commit | Ending value preserved; fallback title card; no alternate ending |
| CINE-AT-010 | Two ending triggers fire concurrently | Only quorum-valid atomic commit wins; one sequence plays |
| CINE-AT-011 | Subtitle/audio mismatch | Subtitle remains authoritative for mandatory information |
| CINE-AT-012 | Reconnect after ending commit | Reconnected/remaining players see committed session result; no replayed branch mutation |

## 8. Approval and implementation boundary

Sequence mechanics and fallback rules are production design guidance. Narrative text, THE TRUTH consequence and THE NEW GUEST wording are approved canon in NARRATIVE_CONTENT_PROPOSAL_PACK_R1.md and OWNER_DECISION_PACKET_R1.md. END-A01 quorum is separately owner-approved; END-A02 is approved under express owner delegation. All camera, NPC animation, audio playback, replication and cinematic-device capabilities must be verified in the target UEFN release.


## Approved THE_TRUTH sequence binding
Use the approved canonical sequence: service control room entry; four ROOM 13 photos displayed on the rail in solved order (no second puzzle or inventory transfer); night manager 02:13 recorder playback with subtitles; THE GUEST appears opposite the players; owner portrait aligns with THE GUEST in reflection; IN-032 activates NIGHT AUDIT — END CYCLE; rooms black out sequentially while neon holds at 02:13; register prints “NO VACANCY. NO OWNER. NO GUEST.”; cut to THE TRUTH title card. The branch is committed before the sequence begins. If the breaker actor or cinematic camera fails, preserve NightAuditActivated/Ending state and complete via the authored proxy and fallback title card; never change the ending or invent a different consequence.
