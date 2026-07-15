#!/usr/bin/env bash
# Generator: joins on-disk plugin facts (pakchunk id + size) with the archive's
# file-verified codename->track names, emitting data/maps.json + catalog tables.
set -euo pipefail

ROOT="D:/Projects/GitHub/Public/Rocket_Racing_Streamed_Maps/StreamedMaps39.11"
GFP="$ROOT/GFP"
OUTDIR="$1"      # where to write maps.json + CATALOG_BODY.md
mkdir -p "$OUTDIR/.." 2>/dev/null || true

OWNER="ShrezesUverse"
REPO="Rocket_Racing_Streamed_Maps"
TAG="39.11"
BASEURL="https://github.com/$OWNER/$REPO/releases/download/$TAG"

# Authored metadata (from ROCKET_RACING_ARCHIVE §8.4, file-verified LevelData sweep).
# fields: plugin_folder | codename | map_name | category | note
read -r -d '' META <<'EOF' || true
GFP_DelMarNUX_Bronze01|Bronze01|Puddle Jumper|comp|Launch track
GFP_DelMarNUX_Bronze02|Bronze02|Curvy Canyon|comp|Launch track
GFP_DelMarNUX_Bronze03|Bronze03|Lazy Lake|comp|Launch track
GFP_Bronze03_adv|Bronze03_adv|Lazy Lake 2|comp-adv|Advanced ("2") variant of Lazy Lake
GFP_DelMarNUX_Bronze04|Bronze04|Cliff Runner|comp|file-verified (was unmapped)
GFP_DelMarNUX_Bronze06|Bronze06|Dust Up|comp|
GFP_DelMarNUX_Bronze07|Bronze07|Python|comp|
GFP_DelMarNUX_Bronze08|Bronze08|Obsidian|comp|file-verified (was unmapped)
GFP_DelMarNUX_Bronze08Optional|Bronze08|Obsidian|comp-opt|Optional stream chunk for Obsidian
GFP_DelMarNUX_Bronze09|Bronze09Flying|Airborne|comp|
GFP_Bronze09_Drifting_adv|Bronze09Drifting|Day Drifting|comp-adv|Bronze09 drifting variant (Day Drifting / Day Drifting 2)
GFP_DelMarNUX_Bronze10|Bronze10|Anarchy Arches|comp|
GFP_DelMarApollo|Apollo|Tilted Turnpike|comp|
GFP_DelMarAqueduct|Aqueduct|Azure Grotto|comp|Inferno Island (S2)
GFP_DelMarAqueductOptional|Aqueduct|Azure Grotto|comp-opt|Optional stream chunk for Azure Grotto
GFP_DelMarCascade|Cascade|Seaside Farms|comp|file-verified (was an API-only codename)
GFP_DelMarCave|Cave|Skull Rock Isle|comp|file-verified (was an API-only codename)
GFP_DelMarCruise|Cruise|Seafoam Cove|comp|file-verified new codename
GFP_DelMarDraino|Draino|Conduit|comp|Neon Rush
GFP_DelMarDriftmania|Driftmania|Anaconda|comp|
GFP_DelMarHydra|Hydra|Tri-City|comp|file-verified (was unmapped)
GFP_DelMarJumperStrafe|JumperStrafe|Bone Cavern|comp|file-verified new codename
GFP_DelMarJumperStrafeOptional|JumperStrafe|Bone Cavern|comp-opt|Optional stream chunk for Bone Cavern
GFP_DelMarKickFlip|KickFlip|Jackrabbit|comp|file-verified (was unmapped)
GFP_DelMarKickFlipOptional|KickFlip|Jackrabbit|comp-opt|Optional stream chunk for Jackrabbit
GFP_DelMarOlympus|Olympus|Olympus|comp|
GFP_DelMarOuroboros|Ouroboros|Festive Falls|comp|Big Bang event map; launch track
GFP_Ouroboros_adv|Ouroboros_adv|Festive Falls 2|comp-adv|Advanced ("2") variant of Festive Falls
GFP_DelMarPhoenix|Phoenix|Delirium|comp|Neon Rush
GFP_DelMarPhoenixOptional|Phoenix|Delirium|comp-opt|Optional stream chunk for Delirium
GFP_DelMarPoseidon|Poseidon|Slap Happy|comp|Neon Rush
GFP_DelMarRally|Rally|K2 Raceway|comp|
GFP_Rally_adv|Rally_adv|K2 Raceway Deux|comp-adv|Advanced ("2") variant of K2 Raceway
GFP_DelMarRiviera|Riviera|Riviera|comp|
GFP_DelMarSidewinder|Sidewinder|Sidewinder|comp|
GFP_DelMarSnap|Snap|Pleasant Pitstop|comp|
GFP_DelMarSweetJumps|SweetJumps|Windy Way|comp|file-verified (was unmapped)
GFP_DelMarTurbine|Turbine|Outpost|comp|
GFP_Twister|Twister|Twin Flame Island|comp|Inferno Island; bare Twister plugin (dev naming oversight), still competitive
GFP_Apollo|Apollo|Tilted Turns|sr|Speed-Run-only (Ch_Apollo / "Apollo2")
GFP_Snap|Snap|Pleasant Detour|sr|Speed-Run-only ("Snap2")
GFP_Bronze01|Bronze01|Puddle Skipper|sr|Speed-Run-only (Bronze01_SpeedRun)
GFP_Bronze06|Bronze06|Dusted|sr|Speed-Run-only (Bronze06_SpeedRun)
GFP_Bronze09_Flying|Bronze09Flying|Aero|sr|Speed-Run-only (Bronze09Flying_SpeedRun)
GFP_Bronze10|Bronze10|Inverse Arches|sr|Speed-Run-only (Bronze10_SpeedRun)
GFP_Driftmania|Driftmania|Anaconda Bite|sr|Speed-Run-only (Driftmania_SpeedRun)
GFP_Olympus|Olympus|Olympico|sr|Speed-Run-only (Olympus_SpeedRun)
GFP_Riviera|Riviera|Riviera Rush|sr|Speed-Run-only (Riviera_SpeedRun)
GFP_Sidewinder|Sidewinder|Sidewinder Sprint|sr|Speed-Run-only (Sidewinder_SpeedRun)
GFP_GoldRush|GoldRush|Mine Mayhem|ext|Epic/Psyonix (DelMar_Racing_ProjectA); island code playlist_delmar_goldrush
GFP_CoralCove|CoralCove|Buddy Beach|ext|3D Lab (PA_3DLabTrackB), mid-2024
GFP_PirateAdventure|PirateAdventure|Shipwrecked|ext|3D Lab (PA_3DLabTrackA)
GFP_DM_404_S2_A|DM_404_S2_A|Lavish Lagoon|ext|404 Creative, Season 2 / Inferno Island (RoundTwoEasy)
GFP_DM_404_S2_B|DM_404_S2_B|Basalt Burrow|ext|404 Creative, Season 2 / Inferno Island (difficultTrack)
GFP_DM_404_S2_BOptional|DM_404_S2_B|Basalt Burrow|ext-opt|Optional stream chunk for Basalt Burrow
GFP_Alpine|Alpine|Alpine|ext|Display name = codename
GFP_Borealis|Borealis|Borealis|ext|Epic/Psyonix (DelMar_Racing_ProjectB); display name = codename
EOF

human_size() { # bytes -> "12.3 MB"
  awk -v b="$1" 'BEGIN{ printf "%.1f MB", b/1048576 }'
}

json_esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

JSON="$OUTDIR/maps.json"
BODY="$OUTDIR/CATALOG_BODY.md"
: > "$BODY"

echo "[" > "$JSON"
first=1
total_bytes=0
count=0

# accumulators for the three category tables
tmp_comp=$(mktemp); tmp_sr=$(mktemp); tmp_ext=$(mktemp)

while IFS='|' read -r plugin codename map category note; do
  [ -z "${plugin:-}" ] && continue
  paksdir="$GFP/$plugin/FortniteGame/Content/Paks"
  pakfile=$(ls "$paksdir"/*.pak 2>/dev/null | head -1 || true)
  if [ -z "$pakfile" ]; then
    echo "WARN: no pak for $plugin" >&2
    chunk="<missing>"; bytes=0
  else
    chunk=$(basename "$pakfile" | sed 's/-WindowsClient.pak//')
    ucas=$(ls "$paksdir"/*.ucas 2>/dev/null | head -1 || true)
    bytes=$(stat -c %s "$ucas" 2>/dev/null || echo 0)
  fi
  total_bytes=$((total_bytes + bytes))
  count=$((count+1))
  size=$(human_size "$bytes")
  pluginname="${plugin#GFP_}"   # GFP_ is just the GameFeaturePlugin folder prefix, not the plugin name
  asset="${pluginname}.zip"
  url="$BASEURL/$asset"

  # JSON
  [ $first -eq 0 ] && echo "," >> "$JSON"
  first=0
  cat >> "$JSON" <<J
  {
    "codename": "$(json_esc "$codename")",
    "map": "$(json_esc "$map")",
    "plugin": "$(json_esc "$pluginname")",
    "pakchunk": "$(json_esc "$chunk")",
    "size_bytes": $bytes,
    "size_human": "$(json_esc "$size")",
    "category": "$(json_esc "$category")",
    "note": "$(json_esc "$note")",
    "asset": "$(json_esc "$asset")",
    "download": "$(json_esc "$url")"
  }
J

  # markdown row: | Map | Codename | Plugin | pakchunk | size | download |
  notecell="$note"
  [ -z "$notecell" ] && notecell="—"
  row="| **$map** | \`$codename\` | \`$pluginname\` | \`$chunk\` | $size | [⬇ download]($url) | $notecell |"
  case "$category" in
    comp*) echo "$row" >> "$tmp_comp" ;;
    sr*)   echo "$row" >> "$tmp_sr" ;;
    ext*)  echo "$row" >> "$tmp_ext" ;;
  esac
done <<< "$META"

echo "" >> "$JSON"
echo "]" >> "$JSON"

hdr='| Map | Codename | Plugin | Pakchunk ID | Size | Download | Notes |
|---|---|---|---|---|---|---|'

{
  echo "### 🏁 Competitive tracks — Racing · Ranked · Speed Run"
  echo ""
  echo "Plugin = \`DelMar\` + codename (tagged \`DelMar.Mode.Competitive\`). \`_adv\` = the advanced \"2\" variant; \`…Optional\` = an on-demand stream chunk that pairs with the base track above it."
  echo ""
  echo "$hdr"
  cat "$tmp_comp"
  echo ""
  echo "### ⏱️ Speed-Run–exclusive tracks"
  echo ""
  echo "Plugin = the **bare codename** (no \`DelMar\` prefix), tagged \`DelMar.Mode.Challenge\`, reachable only through the Speed Run playlist."
  echo ""
  echo "$hdr"
  cat "$tmp_sr"
  echo ""
  echo "### 🛠️ Externally-built & studio tracks"
  echo ""
  echo "Studio-authored wave living under \`DelMar/Levels/\` (Epic/Psyonix, 3D Lab, 404 Creative)."
  echo ""
  echo "$hdr"
  cat "$tmp_ext"
} > "$BODY"

rm -f "$tmp_comp" "$tmp_sr" "$tmp_ext"

echo "OK: $count plugins, total $(human_size $total_bytes) ($total_bytes bytes)"
echo "JSON -> $JSON"
echo "BODY -> $BODY"
