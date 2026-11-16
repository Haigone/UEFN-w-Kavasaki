#!/usr/bin/env python3
"""Static R3 repository integrity checks. Uses only Python standard library.

Run from any working directory:
    python tools/validate_r3_repository.py

This validates repository data and references only. It does not validate UEFN,
Verse compilation, editor placement, navigation, replication, gameplay or assets.
"""
from __future__ import annotations

import csv
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ERRORS: list[str] = []
WARNINGS: list[str] = []
COUNTS: dict[str, int] = {}


def fail(message: str) -> None:
    ERRORS.append(message)


def read_csv(relative: str) -> tuple[list[str], list[dict[str, str]]]:
    path = ROOT / relative
    if not path.is_file():
        fail(f"MISSING FILE: {relative}")
        return [], []
    try:
        with path.open("r", encoding="utf-8-sig", newline="") as handle:
            reader = csv.DictReader(handle)
            headers = reader.fieldnames or []
            rows: list[dict[str, str]] = []
            for line_no, row in enumerate(reader, start=2):
                if None in row:
                    fail(f"{relative}:{line_no}: extra CSV columns")
                if any(value is None for key, value in row.items() if key is not None):
                    fail(f"{relative}:{line_no}: missing CSV field")
                rows.append({str(k): (v or "").strip() for k, v in row.items() if k is not None})
        COUNTS[relative] = len(rows)
        return headers, rows
    except (OSError, UnicodeError, csv.Error) as exc:
        fail(f"{relative}: cannot parse CSV: {exc}")
        return [], []


def require_unique(relative: str, rows: list[dict[str, str]], key: str) -> None:
    seen: set[str] = set()
    for index, row in enumerate(rows, start=2):
        value = row.get(key, "")
        if not value:
            fail(f"{relative}:{index}: blank {key}")
        elif value in seen:
            fail(f"{relative}:{index}: duplicate {key}={value}")
        seen.add(value)


def require_count(relative: str, actual: int, expected: int) -> None:
    if actual != expected:
        fail(f"{relative}: expected {expected} data rows, found {actual}")


# Parse every controlled/current CSV in this list. Historical case-variant files
# are deliberately excluded; see README.md and R3_CURRENT_STATUS_AND_REMAINING_WORK.md.
csv_files = [
    "ROOM_COORDINATE_REGISTER.csv",
    "room_furnishing_schedule.csv",
    "DOOR_WINDOW_SCHEDULE.csv",
    "wall_schedule.csv",
    "INTERACTION_MASTER_REGISTER.csv",
    "PUZZLE_MASTER_REGISTER.csv",
    "UEFN_DEVICE_BINDINGS.csv",
    "INTERACTION_ANCHOR_SCHEDULE_R1.csv",
    "AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv",
    "UI_STRING_TABLE.csv",
    "AUDIO_REGISTER.csv",
    "AUDIO_CUE_SHEET.csv",
    "LIGHTING_REGISTER.csv",
    "LIGHTING_CUE_SHEET.csv",
    "asset_manifest.csv",
    "ASSET_MANIFEST_EXECUTIVE.csv",
    "ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv",
    "ASSET_PRODUCTION_BACKLOG_R1.csv",
]
data = {name: read_csv(name) for name in csv_files}

unique_keys = {
    "ROOM_COORDINATE_REGISTER.csv": "ID",
    "wall_schedule.csv": "Wall_ID",
    "INTERACTION_MASTER_REGISTER.csv": "InteractionID",
    "PUZZLE_MASTER_REGISTER.csv": "PuzzleID",
    "UEFN_DEVICE_BINDINGS.csv": "Device_ID",
    "INTERACTION_ANCHOR_SCHEDULE_R1.csv": "Anchor_ID",
    "AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv": "Anchor_ID",
    "UI_STRING_TABLE.csv": "String_ID",
    "AUDIO_REGISTER.csv": "Audio_ID",
    "LIGHTING_REGISTER.csv": "Light_ID",
    "asset_manifest.csv": "Asset_ID",
    "ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv": "Asset_ID",
    "ASSET_PRODUCTION_BACKLOG_R1.csv": "Asset_ID",
}
for name, key in unique_keys.items():
    require_unique(name, data[name][1], key)

expected_counts = {
    "ROOM_COORDINATE_REGISTER.csv": 57,
    "room_furnishing_schedule.csv": 183,
    "DOOR_WINDOW_SCHEDULE.csv": 51,
    "wall_schedule.csv": 72,
    "INTERACTION_MASTER_REGISTER.csv": 32,
    "PUZZLE_MASTER_REGISTER.csv": 5,
    "UEFN_DEVICE_BINDINGS.csv": 50,
    "INTERACTION_ANCHOR_SCHEDULE_R1.csv": 58,
    "AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv": 25,
    "UI_STRING_TABLE.csv": 100,
    "AUDIO_REGISTER.csv": 24,
    "AUDIO_CUE_SHEET.csv": 25,
    "LIGHTING_REGISTER.csv": 10,
    "LIGHTING_CUE_SHEET.csv": 9,
    "asset_manifest.csv": 99,
    "ASSET_MANIFEST_EXECUTIVE.csv": 99,
    "ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv": 99,
    "ASSET_PRODUCTION_BACKLOG_R1.csv": 65,
}
for name, expected in expected_counts.items():
    require_count(name, len(data[name][1]), expected)

# Master and executive asset mirrors must have identical content.
master_path = ROOT / "asset_manifest.csv"
exec_path = ROOT / "ASSET_MANIFEST_EXECUTIVE.csv"
if master_path.is_file() and exec_path.is_file():
    if master_path.read_bytes() != exec_path.read_bytes():
        fail("asset_manifest.csv and ASSET_MANIFEST_EXECUTIVE.csv are not byte-identical")

# Rights register must contain one row for every master asset and no extras.
master_assets = {r.get("Asset_ID", "") for r in data["asset_manifest.csv"][1]}
rights_assets = {r.get("Asset_ID", "") for r in data["ASSET_SOURCE_AND_RIGHTS_REGISTER_R1.csv"][1]}
if master_assets != rights_assets:
    fail(f"asset rights coverage mismatch: missing={sorted(master_assets-rights_assets)}, extra={sorted(rights_assets-master_assets)}")

# Interaction anchor coverage: every registered interaction has at least one anchor row.
interaction_ids = {r.get("InteractionID", "") for r in data["INTERACTION_MASTER_REGISTER.csv"][1]}
anchor_interactions = {r.get("Interaction_ID", "") for r in data["INTERACTION_ANCHOR_SCHEDULE_R1.csv"][1] if r.get("Interaction_ID")}
missing_interactions = interaction_ids - anchor_interactions
if missing_interactions:
    fail(f"interactions without anchor schedule rows: {sorted(missing_interactions)}")

# Device anchor references must resolve to authored anchor IDs or documented logical aliases.
all_anchor_ids = {r.get("Anchor_ID", "") for r in data["INTERACTION_ANCHOR_SCHEDULE_R1.csv"][1]}
all_anchor_ids |= {r.get("Anchor_ID", "") for r in data["AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv"][1]}
logical_aliases = {
    "AUDIO_GLOBAL_EXT", "IA-002", "DYNAMIC_PLAYER_LOCATION", "DYNAMIC_RECOVERY_ACTORS", "NONE",
    "SVC-DOOR-READER", "UI_OBJECTIVE_TRACKER", "UI_HUD_OBJECTIVE",
    "UI_JOURNAL", "UI_EVIDENCE", "UI_ENDING_SELECTOR", "UI_INTERACTION_PROMPT",
}
for row_no, row in enumerate(data["UEFN_DEVICE_BINDINGS.csv"][1], start=2):
    raw = row.get("Anchor_IDs", "")
    for anchor in filter(None, (part.strip() for part in raw.split(";"))):
        if anchor not in all_anchor_ids and anchor not in logical_aliases:
            fail(f"UEFN_DEVICE_BINDINGS.csv:{row_no}: unresolved Anchor_ID {anchor}")

# Static area-bound check for numeric interaction and AI coordinates.
room_rows = data["ROOM_COORDINATE_REGISTER.csv"][1]
rooms = {r.get("ID", ""): r for r in room_rows}
for filename in ("INTERACTION_ANCHOR_SCHEDULE_R1.csv", "AI_PATROL_AND_SPAWN_ANCHOR_SCHEDULE_R1.csv"):
    for row_no, row in enumerate(data[filename][1], start=2):
        area = row.get("Area_or_Room", "")
        if area not in rooms:
            continue  # e.g. UI/dynamic or stair logical anchor; reported separately by audit
        try:
            x, y = float(row["X_m"]), float(row["Y_m"])
            room = rooms[area]
            bounds = (float(room["X_Min_m"]), float(room["X_Max_m"]), float(room["Y_Min_m"]), float(room["Y_Max_m"]))
        except (KeyError, ValueError):
            fail(f"{filename}:{row_no}: invalid numeric coordinate or room bounds")
            continue
        if not (bounds[0] <= x <= bounds[1] and bounds[2] <= y <= bounds[3]):
            fail(f"{filename}:{row_no}: {row.get('Anchor_ID')} outside {area} bounds")

# Confirm the PZ-05 prerequisite does not contain the derived FinaleReady flag.
puzzle05 = next((r for r in data["PUZZLE_MASTER_REGISTER.csv"][1] if r.get("PuzzleID") == "PZ-05"), None)
if puzzle05 and "FinaleReady" in puzzle05.get("Prerequisites", ""):
    fail("PZ-05 has circular prerequisite FinaleReady; it must be derived after service route activation")

# Check all CSV rows have the same number of columns through DictReader extras.
# The markdown event crosswalk and official engine behavior require semantic/editor proof.
print("R3 STATIC REPOSITORY VALIDATION")
for name in csv_files:
    print(f"  {name}: {COUNTS.get(name, 0)} data rows")
print(f"Errors: {len(ERRORS)}")
for error in ERRORS:
    print(f"ERROR: {error}")
for warning in WARNINGS:
    print(f"WARNING: {warning}")
print("SCOPE: CSV/data/reference checks only; no UEFN, Verse, editor, runtime or gameplay validation.")
sys.exit(1 if ERRORS else 0)
