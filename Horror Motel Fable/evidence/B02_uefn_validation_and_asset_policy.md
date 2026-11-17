# B02 — UEFN validation and asset reference policy evidence

Date: 2026-11-17. Source: `%LOCALAPPDATA%/UnrealEditorFortnite/Saved/Logs/UnrealEditorFortnite.log` and SessionToolset results.

## Push 1 — 17:28 UTC — REFUSED ("Convalida non riuscita")
`UEFNValidation: Error: Disallowed reference to …` for:
- /Game/Athena/Apollo/Environments/BuildingActors/Industrial/Props/Apollo_Industrial_ElectricalBox_01
- /Game/Environments/Asteria/Props/Commerce/Commerce_LobbyChair_A/…/BP_Commerce_LobbyChair_A_A
- /WildEstate/…/BP_CarpetStain_WallClock_A, BP_Commerce_CorkBoard_A, BP_Office_CorkBoard_A, BP_PalletJack_BoardPortraits_A, BP_Street_CautionSign_A, BP_TightSweater_BedroomPortrait_A, BP_TrendyBully_ToyBox_A

## Push 2 — 17:32 UTC — REFUSED
Only `/Game/Athena/Apollo/Environments/BuildingActors/Agency/Props/Apollo_Agency_Picture_Frame_03` (AssetValidator_AssetReferenceRestrictions).

## Push 3 — 17:33 UTC — VALIDATED, session started, match Running
All placed prop classes are listed in [../EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv](../EPIC_FIRST_PARTY_ASSET_REGISTER_R3.csv).

## Audio reference policy (editor-side, `ObjectToolset.SetProperties` on an Audio Player `audio` property)
Refused with "not allowed to be referenced by property 'Audio': refused by the project's asset reference policy": every tested cue under `/AmbientAudioContent`, `/Game/Sounds/Artemis`, `/Game/Sounds/Asteria`, `/Game/Sounds/Helios`, `/Game/Athena/Sounds`, `/CRD_Switch`.
Accepted: `/Game/Sounds/Creative/…` (Creative radio/speaker/toy library). All batch 02 audio uses that library.

## Rights position
Every asset placed by batches 01–02 is either first-party content shipped with UEFN (props, Creative sounds, devices, the Creative mannequin mesh) or project-original (R3 flat materials, `M_R3_GuestSkin`). No third-party or downloaded asset is used. First-party content is used only inside the Fortnite island, unmodified except placement, scale and material override.
