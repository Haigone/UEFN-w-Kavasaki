# CLAUDE ENVIRONMENT BASELINE — GATE A
Project: THE MOTEL: ROOM 13
Recorded: 2026-11-16 (executor: Claude, autonomous R3 run)
Status: **GATE A PASS — native project located, inventoried and backed up before any write.**

## 1. Native project identity

| Item | Value |
|---|---|
| UEFN project name | MotelHorrorFable |
| Project file | `C:\Users\utente\Documents\Fortnite Projects\MotelHorrorFable\MotelHorrorFable.uefnproject` |
| Project / plugin ID | `1b9a97d9-c7de-416c-b046-aeb97e125690` |
| Verse package | `/haigo@fortnite.com/MotelHorrorFable` |
| Map | `/1b9a97d9-c7de-416c-b046-aeb97e125690/MotelHorrorFable` |
| Editor build | `6.0.0-60458657+++Fortnite+Release-43.10` |
| Revision control | Lore, connected (user and team provider) |
| Lore branch at baseline | `e726318bbc3fd75ac8733a7e030cc35b` |
| Lore revision at baseline | `bdadcd894819b6e858c435044e4e89217aeabbe13771071ab2c53b8a3bc98d43` |
| Pending changes at baseline | none to check in, none to sync |

Island code: none. The project has never been published and nothing in this run publishes it.

## 2. State found before edits

- 41 actors: the stock UEFN starter island (asphalt grid at Z 384, backdrops, ocean, IslandSettings, two player spawn pads, a handful of starter props).
- No Verse source files in the project package.
- No custom assets, devices, materials or imported meshes.
- Conclusion: the native project was an empty template. Every gameplay element is new work from this run.

## 3. Backup and restore proof

- Backup folder: `C:\Users\utente\Documents\Fortnite Projects Backups\MotelHorrorFable_2026-11-16_preR3`
- Method: `robocopy /E` of the project folder (excluding `Intermediate`, `Saved`), taken before the first write.
- Verification: 191 files / 467,104 bytes in source and in backup; SHA-256 of `MotelHorrorFable.uefnproject` identical in both.
- Second restore point: Lore revision `bdadcd89…` above (sync to that revision restores the pre-R3 project).
- Restore procedure: close UEFN, replace the project folder with the backup folder contents, reopen; or use Revision Control → sync to the baseline revision.
- A restore was **not** exercised end to end (the project was not deleted and re-imported). Integrity was verified by count, size and hash only.

## 4. Tools available to the executor

- UEFN editor MCP toolsets (level, device, Verse, material, scene capture, session/play-test, Python scripting).
- Windows shell, Python 3, Git 2.56, GitHub CLI 2.104 (installed during this run; **not authenticated**).
- Not available: authenticated GitHub push, DCC/modelling/rigging tools, audio authoring tools, a second/third/fourth Fortnite client for co-op tests.

## 5. Repository checkout note (Windows)

The repository contains six pairs of filenames that differ only by case (for example `UEFN_DEVICE_BINDINGS.csv` and `uefn_device_bindings.csv`). On a default Windows checkout one file of each pair silently overwrites the other, which makes the validator report 53 false errors. All work in this run used a case-sensitive directory (`fsutil file setCaseSensitiveInfo … enable`) so both files of each pair exist. Anyone validating on Windows must do the same or use WSL/Linux.
