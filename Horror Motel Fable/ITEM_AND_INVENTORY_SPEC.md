# ITEM AND INVENTORY SPECIFICATION
## THE MOTEL: ROOM 13

## 1. Ownership
The authoritative quest inventory is a session-level set of ItemId values. No quest item is owned exclusively by an individual player. Physical pickups are presentation proxies. Team HUD/journal displays ownership. Personal flashlight charge is tracked per player.

## 2. Required quest items
| ItemId | First location / source | Use | Consume? | Recovery |
|---|---|---|---|---|
| Room13Key | Reception key rack | Narrative proof / Room 13 access progression | No | Reception proxy |
| OfficeKey | Reception drawer after PZ-01 | Owner office | No | Drawer proxy after RegisterSolved |
| FuseA | Room 02 suitcase | Electrical socket A | Becomes INSTALLED | Utility recovery drawer |
| FuseB | Storage shelving / wet-floor sign | Socket B | Becomes INSTALLED | Utility recovery drawer |
| FuseC | Room 06 maintenance cabinet | Socket C | Becomes INSTALLED | Utility recovery drawer |
| Screwdriver | Utility/storage tool board | Open electrical cover and Room 12 concealed panel | No; reusable | Tool board proxy |
| CarKeys | Broken group vehicle / authored return location | Vehicle ignition | No | Vehicle key hook / recovery proxy |
| ServiceKey | ROOM 13 compartment after PZ-04 | Service gate control | No | Compartment proxy after solved flag |

Room02 battery is a personal flashlight recharge pickup and is not FuseA; keep their pickup IDs and props distinct. The Room 13 key is introduced in Act I but access to ROOM 13 is gated by story progression, not by consuming the key.

## 3. State model
QuestItemState: NOT_FOUND, TEAM_AVAILABLE, INSTALLED (fuses only), USED (optional terminal use flag). AddItem(ItemId) succeeds once. InstallFuse validates item exists, slot is empty and item matches slot; atomically marks INSTALLED and slot filled. No operation deletes the only copy of a required item.

## 4. Pickup transaction
1. Validate active player and pickup enabled.
2. Validate ItemId not already TEAM_AVAILABLE/INSTALLED.
3. Acquire pickup lock.
4. Commit team flag.
5. Hide/disable physical actor.
6. Update team HUD.
7. Release lock.
On disconnect before commit, lock expires and actor remains. On disconnect after commit, team flag remains and actor remains disabled.

## 5. Duplicate and race handling
- Two players picking up same fuse simultaneously: first authoritative commit wins; second receives “Already secured” feedback.
- Multiple physical copies with same ItemId are prohibited except explicitly marked visual-only duplicates.
- Puzzle success cannot grant the same key twice.
- Checkpoint restore uses set/flag reconciliation, never additive grants.
- All state-changing operations are idempotent.

## 6. Personal flashlight resources
Flashlight charge is per player; target full charge 180 seconds. Battery pickup restores a defined charge amount (default one full charge, subject to playtest). If batteries are intended as shared stock instead, change both UI and this specification before implementation. Replacement action lasts about 2 seconds; cancel/interruption does not consume a battery or reset current charge. Below 15% flicker; 0% off. Provide minimum environmental readability in mandatory puzzle zones.

## 7. Optional items and lore
Optional pickups may include personal notes, cosmetic tokens, nonessential batteries and environmental evidence. Each receives an OptionalItemId and never gates the six-act progression or any required ending except THE_TRUTH only where the item is explicitly included in the truth evidence register. Do not silently promote optional content to mandatory.

## 8. Disconnect/rejoin
On PlayerLeft: remove player from ConnectedPlayers; clear personal interaction/capture/rescue locks; preserve SharedInventory, objective flags, solved puzzle flags and checkpoint. On PlayerJoined during the same live session: register player and rehydrate UI/player state from current session data. No promise of persistence after the entire session ends unless a separate verified persistence design is implemented.

## 9. Acceptance
- Every required item recoverable through its specified proxy.
- Picker disconnect before/after pickup does not lose progress.
- Simultaneous pickup grants exactly once.
- Installed fuses remain installed after checkpoint restore.
- No required item is consumed irreversibly.
- Personal flashlight state does not affect team quest progression.
