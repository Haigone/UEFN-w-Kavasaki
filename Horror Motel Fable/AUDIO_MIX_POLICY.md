# AUDIO MIX & SPATIAL POLICY
## THE MOTEL: ROOM 13
Revision: 1.0 — 2026-11-16
Status: **MIX DESIGN TARGETS — ACTUAL UEFN LEVELS REQUIRE LISTENING AND PERFORMANCE VALIDATION**

## 1. Reference and priority

Use dialogue/mandatory voice as the 0 dB relative reference (not an absolute platform loudness standard). These are relative mix targets for authoring and playtest.

| Class | Relative target | Priority | Ducking / rule |
|---|---:|---|---|
| Mandatory VO / phone / recorder / ending radio | 0 dB reference | P0 | Duck ambience and noncritical SFX while active |
| Critical gameplay stinger (capture, chase, breaker) | -3 to -6 dB | P0 | Temporarily duck ambience; never overlap mandatory VO |
| Puzzle/interact SFX (fuse, breaker, door, gate) | -8 to -12 dB | P1/P2 | One-shots; never mask clue text or VO |
| THE GUEST breath/footsteps | -6 to -12 dB | P1 | Spatial threat cue; do not reveal exact location through walls unless designed |
| Player footsteps | -14 to -20 dB | P3 | Per-player, locally mixed where supported |
| Exterior rain/wind | -22 to -26 dB | P2 | Continuous low bed; duck during VO |
| Interior electrical/fluorescent hum | -26 to -30 dB | P2 | Zone bed; stop/transition with power state |
| ROOM 13 drone | -20 to -24 dB | P1 | Zone bed; duck under reveal/VO |
| Optional prop sounds (desk bell) | -10 to -14 dB | P3 | Never compete with mandatory cues |

These targets are relative only. Do not enter them as engine gain values until the target audio mixer/import workflow is verified.

## 2. Ducking rules

- Mandatory VO starts: reduce rain/wind/room-tone beds by at least 12 dB; reduce noncritical spatial SFX by 6 dB.
- Critical gameplay stinger starts: reduce ambience by 6 dB for the stinger duration plus a 1-second release.
- VO and chase stinger are mutually exclusive where they overlap; defer the stinger if it would mask a required line.
- Restore the previous mix over 0.5–1.0 seconds; no hard gain jumps.
- Do not duck the player's own UI accessibility feedback below intelligibility.
- Two simultaneous mandatory VO sequences are prohibited; one session-wide narrative voice lock serializes them.
- Co-op voice playback is synchronized logically; local playback may be delayed but the subtitle remains available immediately.

## 3. Concurrency limits

| Group | Max simultaneous logical instances | Rule |
|---|---:|---|
| AMBIENCE_EXTERIOR | 2 | Rain + wind; no duplicate loops |
| AMBIENCE_INTERIOR | 1 per zone | One electrical/room-tone bed per zone |
| GUEST_FOLEY | 2 | Footsteps + cloth; breath may replace cloth |
| PLAYER_FOLEY | 1 per player | Walk/run mutually exclusive |
| INTERACTION_FOLEY | 2 | Do not stack identical one-shots on one actor |
| NARRATIVE_VOICE | 1 per session | Serialize mandatory VO |
| STINGER | 1 per session | Capture/chase/breaker stingers cannot stack |
| ENDING_VOICE | 1 per session | Ending branch owns voice channel |

## 4. Spatial policy

- Fixed ambience emitters belong to named zones and must not duplicate at adjacent room boundaries.
- Player/Guest footsteps and breath are actor-attached only if the target UEFN workflow supports reliable actor attachment and replication.
- Door/fuse/breaker/gate one-shots are attached to the interactable actor or a validated fixed emitter.
- Exterior rain/wind should be broad and low-frequency; avoid hard room-to-room volume discontinuities.
- Do not allow THE GUEST breath to be heard through sealed structural walls unless a specific supernatural cue is authored.
- Use a separate 2D accessibility/UI cue only when a critical event cannot be located reliably in 3D.

## 5. Loop and transition QA

- Loop start/end points must be click-free; verify on headphones and speakers.
- Fade ambience over 0.5–1.5 seconds when changing zone/power state.
- Do not abruptly stop the ambience bed on a player disconnect.
- Ensure no loop continues after session ending unless intentionally part of the ending.
- Test rain/wind + phone VO + guest breath + chase stinger together.
- Test ROOM 13 drone + recorder VO + ending stinger.
- Test 1-, 2- and 4-player sessions for duplicated/overlapping emitter instances.

## 6. Acceptance

A cue is not accepted until its Audio_ID exists in AUDIO_REGISTER.csv, its trigger and priority exist in AUDIO_CUE_SHEET.csv, any VO has a String_ID in UI_STRING_TABLE.csv, rights/source are verified in the asset manifest, and actual playback/ducking/spatialization is tested in the target UEFN project.
