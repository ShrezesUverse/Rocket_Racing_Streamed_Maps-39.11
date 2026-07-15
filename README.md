# Rocket Racing Streamed Maps (Build 39.11)

**Streamed on-demand *Del Mar* (Rocket Racing) track level plugins from Fortnite build `39.11`
![Fortnite build](https://img.shields.io/badge/Fortnite-39.11%20·%20CL--49242330-1f6feb)
![Map plugins](https://img.shields.io/badge/map%20plugins-57-2ea043)
![Total size](https://img.shields.io/badge/total-5.5%20GB-e3651d)
![Delivery](https://img.shields.io/badge/downloads-GitHub%20Releases-8957e5)
![Status](https://img.shields.io/badge/Rocket%20Racing-servers%20off%20Oct%202026-d1242f)

> Rocket Racing (Psyonix's arcade racing game inside Fortnite, Dec 8 2023 → Oct 2026): the main Fortnite build install from Epic Games Launcher shipped with *no* DelMar level content, and each track gets downloaded the first time you played it as a four-file bundle (`.pak` · `.ucas` · `.utoc` · `.sig`) in your AppData folder on your system. Once the Rocket Racing servers sunset, those streamed bundles stop being produced. **This repo is a snapshot of that content before it disappears.**

---

## What's in here

| | |
|---|---|
| **Build** | `++Fortnite+Release-39.11-CL-49242330` (assets dated 2026-01-06) |
| **Plugins** | **57** GameFeaturePlugins — **51** map plugins + **6** optional stream chunks |
| **Total size** | ~**5.5 GB** (uncompressed `.ucas` payloads; per-map 0.2–157 MB) |
| **Format** | Each plugin is a four-file UE IoStore bundle: `.pak` · `.ucas` · `.utoc` · `.sig` |
| **Downloads** | Per-map `.zip` on the [**Releases**](../../releases) page (tag `39.11`) |
| **Source data** | [`data/maps.json`](data/maps.json) — machine-readable catalog |

The codename ↔ track-name mapping is **file-verified** (each plugin's `…_LevelData.json` `DisplayName`) and cross-checked against the [Rocket Racing Global Archive](https://github.com/ShrezesUverse) §8.4. Marked *file-verified* rows resolved codenames that community trackers previously had wrong or unmapped.

- [The catalog](#-the-catalog) — all 57, grouped by mode
- [How the naming works](#how-the-plugin-naming-works)
- [Using the files](#using-the-files)
- [How downloads are published](#how-downloads-are-published)
- [Contributing](#contributing)
- [Disclaimer](#disclaimer)

---

## 🗂️ The catalog

Every row: **map name · codename · plugin · pakchunk ID · size · download link.** `⬇ download` links resolve once the matching `.zip` is uploaded to the [`39.11` release](../../releases/tag/39.11).

### 🏁 Competitive tracks — Racing · Ranked · Speed Run

Plugin = `DelMar` + codename (tagged `DelMar.Mode.Competitive`). `_adv` = the advanced "2" variant; `…Optional` = an on-demand stream chunk that pairs with the base track above it.

| Map | Codename | Plugin | Pakchunk ID | Size | Download | Notes |
|---|---|---|---|---|---|---|
| **Puddle Jumper** | `Bronze01` | `DelMarNUX_Bronze01` | `pakchunk4612` | 117.2 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze01.zip) | Launch track |
| **Curvy Canyon** | `Bronze02` | `DelMarNUX_Bronze02` | `pakchunk4607` | 119.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze02.zip) | Launch track |
| **Lazy Lake** | `Bronze03` | `DelMarNUX_Bronze03` | `pakchunk4608` | 120.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze03.zip) | Launch track |
| **Lazy Lake 2** | `Bronze03_adv` | `Bronze03_adv` | `pakchunk4619` | 118.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze03_adv.zip) | Advanced ("2") variant of Lazy Lake |
| **Cliff Runner** | `Bronze04` | `DelMarNUX_Bronze04` | `pakchunk4611` | 122.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze04.zip) | file-verified (was unmapped) |
| **Dust Up** | `Bronze06` | `DelMarNUX_Bronze06` | `pakchunk4610` | 121.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze06.zip) | — |
| **Python** | `Bronze07` | `DelMarNUX_Bronze07` | `pakchunk4639` | 121.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze07.zip) | — |
| **Obsidian** | `Bronze08` | `DelMarNUX_Bronze08` | `pakchunk4646` | 115.3 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze08.zip) | file-verified (was unmapped) |
| **Obsidian** | `Bronze08` | `DelMarNUX_Bronze08Optional` | `pakchunk4646optional` | 0.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze08Optional.zip) | Optional stream chunk for Obsidian |
| **Airborne** | `Bronze09Flying` | `DelMarNUX_Bronze09` | `pakchunk4604` | 124.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze09.zip) | — |
| **Day Drifting** | `Bronze09Drifting` | `Bronze09_Drifting_adv` | `pakchunk4622` | 122.6 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze09_Drifting_adv.zip) | Bronze09 drifting variant (Day Drifting / Day Drifting 2) |
| **Anarchy Arches** | `Bronze10` | `DelMarNUX_Bronze10` | `pakchunk4609` | 123.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarNUX_Bronze10.zip) | — |
| **Tilted Turnpike** | `Apollo` | `DelMarApollo` | `pakchunk4617` | 118.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarApollo.zip) | — |
| **Azure Grotto** | `Aqueduct` | `DelMarAqueduct` | `pakchunk4647` | 118.5 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarAqueduct.zip) | Inferno Island (S2) |
| **Azure Grotto** | `Aqueduct` | `DelMarAqueductOptional` | `pakchunk4647optional` | 1.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarAqueductOptional.zip) | Optional stream chunk for Azure Grotto |
| **Seaside Farms** | `Cascade` | `DelMarCascade` | `pakchunk4638` | 114.3 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarCascade.zip) | file-verified (was an API-only codename) |
| **Skull Rock Isle** | `Cave` | `DelMarCave` | `pakchunk4645` | 61.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarCave.zip) | file-verified (was an API-only codename) |
| **Seafoam Cove** | `Cruise` | `DelMarCruise` | `pakchunk4649` | 115.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarCruise.zip) | file-verified new codename |
| **Conduit** | `Draino` | `DelMarDraino` | `pakchunk4635` | 114.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarDraino.zip) | Neon Rush |
| **Anaconda** | `Driftmania` | `DelMarDriftmania` | `pakchunk4602` | 121.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarDriftmania.zip) | — |
| **Tri-City** | `Hydra` | `DelMarHydra` | `pakchunk4634` | 95.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarHydra.zip) | file-verified (was unmapped) |
| **Bone Cavern** | `JumperStrafe` | `DelMarJumperStrafe` | `pakchunk4606` | 38.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarJumperStrafe.zip) | file-verified new codename |
| **Bone Cavern** | `JumperStrafe` | `DelMarJumperStrafeOptional` | `pakchunk4606optional` | 0.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarJumperStrafeOptional.zip) | Optional stream chunk for Bone Cavern |
| **Jackrabbit** | `KickFlip` | `DelMarKickFlip` | `pakchunk4633` | 121.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarKickFlip.zip) | file-verified (was unmapped) |
| **Jackrabbit** | `KickFlip` | `DelMarKickFlipOptional` | `pakchunk4633optional` | 12.5 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarKickFlipOptional.zip) | Optional stream chunk for Jackrabbit |
| **Olympus** | `Olympus` | `DelMarOlympus` | `pakchunk4618` | 113.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarOlympus.zip) | — |
| **Festive Falls** | `Ouroboros` | `DelMarOuroboros` | `pakchunk4601` | 157.2 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarOuroboros.zip) | Big Bang event map; launch track |
| **Festive Falls 2** | `Ouroboros_adv` | `Ouroboros_adv` | `pakchunk4621` | 157.5 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Ouroboros_adv.zip) | Advanced ("2") variant of Festive Falls |
| **Delirium** | `Phoenix` | `DelMarPhoenix` | `pakchunk4636` | 130.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarPhoenix.zip) | Neon Rush |
| **Delirium** | `Phoenix` | `DelMarPhoenixOptional` | `pakchunk4636optional` | 0.2 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarPhoenixOptional.zip) | Optional stream chunk for Delirium |
| **Slap Happy** | `Poseidon` | `DelMarPoseidon` | `pakchunk4637` | 125.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarPoseidon.zip) | Neon Rush |
| **K2 Raceway** | `Rally` | `DelMarRally` | `pakchunk4603` | 91.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarRally.zip) | — |
| **K2 Raceway Deux** | `Rally_adv` | `Rally_adv` | `pakchunk4620` | 95.6 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Rally_adv.zip) | Advanced ("2") variant of K2 Raceway |
| **Riviera** | `Riviera` | `DelMarRiviera` | `pakchunk4522` | 103.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarRiviera.zip) | — |
| **Sidewinder** | `Sidewinder` | `DelMarSidewinder` | `pakchunk4616` | 117.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarSidewinder.zip) | — |
| **Pleasant Pitstop** | `Snap` | `DelMarSnap` | `pakchunk4615` | 100.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarSnap.zip) | — |
| **Windy Way** | `SweetJumps` | `DelMarSweetJumps` | `pakchunk4614` | 115.6 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarSweetJumps.zip) | file-verified (was unmapped) |
| **Outpost** | `Turbine` | `DelMarTurbine` | `pakchunk4613` | 126.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DelMarTurbine.zip) | — |
| **Twin Flame Island** | `Twister` | `Twister` | `pakchunk4648` | 121.4 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Twister.zip) | Inferno Island; bare `Twister` plugin (dev naming oversight), still competitive |

### ⏱️ Speed-Run–exclusive tracks

Plugin = the **bare codename** (no `DelMar` prefix), tagged `DelMar.Mode.Challenge`, reachable only through the Speed Run playlist. These are the internal side of the community "…2" names.

| Map | Codename | Plugin | Pakchunk ID | Size | Download | Notes |
|---|---|---|---|---|---|---|
| **Tilted Turns** | `Apollo` | `Apollo` | `pakchunk4630` | 111.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Apollo.zip) | Speed-Run-only (Ch_Apollo / "Apollo2") |
| **Pleasant Detour** | `Snap` | `Snap` | `pakchunk4627` | 99.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Snap.zip) | Speed-Run-only ("Snap2") |
| **Puddle Skipper** | `Bronze01` | `Bronze01` | `pakchunk4626` | 114.2 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze01.zip) | Speed-Run-only (Bronze01_SpeedRun) |
| **Dusted** | `Bronze06` | `Bronze06` | `pakchunk4625` | 114.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze06.zip) | Speed-Run-only (Bronze06_SpeedRun) |
| **Aero** | `Bronze09Flying` | `Bronze09_Flying` | `pakchunk4623` | 123.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze09_Flying.zip) | Speed-Run-only (Bronze09Flying_SpeedRun) |
| **Inverse Arches** | `Bronze10` | `Bronze10` | `pakchunk4624` | 116.7 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Bronze10.zip) | Speed-Run-only (Bronze10_SpeedRun) |
| **Anaconda Bite** | `Driftmania` | `Driftmania` | `pakchunk4629` | 120.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Driftmania.zip) | Speed-Run-only (Driftmania_SpeedRun) |
| **Olympico** | `Olympus` | `Olympus` | `pakchunk4631` | 111.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Olympus.zip) | Speed-Run-only (Olympus_SpeedRun) |
| **Riviera Rush** | `Riviera` | `Riviera` | `pakchunk4632` | 101.0 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Riviera.zip) | Speed-Run-only (Riviera_SpeedRun) |
| **Sidewinder Sprint** | `Sidewinder` | `Sidewinder` | `pakchunk4628` | 115.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Sidewinder.zip) | Speed-Run-only (Sidewinder_SpeedRun) |

### 🛠️ Externally-built & studio tracks

Studio-authored wave living under `DelMar/Levels/` (Epic/Psyonix, 3D Lab, 404 Creative). These keep `LevelData` as raw `.uasset`, so names rest on the internal `.umap` names + shrezee's firsthand knowledge.

| Map | Codename | Plugin | Pakchunk ID | Size | Download | Notes |
|---|---|---|---|---|---|---|
| **Mine Mayhem** | `GoldRush` | `GoldRush` | `pakchunk4644` | 10.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/GoldRush.zip) | Epic/Psyonix (`DelMar_Racing_ProjectA`); island code `playlist_delmar_goldrush` |
| **Buddy Beach** | `CoralCove` | `CoralCove` | `pakchunk4643` | 86.6 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/CoralCove.zip) | 3D Lab (`PA_3DLabTrackB`), mid-2024 |
| **Shipwrecked** | `PirateAdventure` | `PirateAdventure` | `pakchunk4642` | 52.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/PirateAdventure.zip) | 3D Lab (`PA_3DLabTrackA`) |
| **Lavish Lagoon** | `DM_404_S2_A` | `DM_404_S2_A` | `pakchunk4650` | 115.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DM_404_S2_A.zip) | 404 Creative, Season 2 / Inferno Island (`RoundTwoEasy`) |
| **Basalt Burrow** | `DM_404_S2_B` | `DM_404_S2_B` | `pakchunk4651` | 113.9 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DM_404_S2_B.zip) | 404 Creative, Season 2 / Inferno Island (`difficultTrack`) |
| **Basalt Burrow** | `DM_404_S2_B` | `DM_404_S2_BOptional` | `pakchunk4651optional` | 0.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/DM_404_S2_BOptional.zip) | Optional stream chunk for Basalt Burrow |
| **Alpine** | `Alpine` | `Alpine` | `pakchunk4640` | 60.8 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Alpine.zip) | Display name = codename |
| **Borealis** | `Borealis` | `Borealis` | `pakchunk4641` | 100.1 MB | [⬇ download](https://github.com/ShrezesUverse/Rocket_Racing_Streamed_Maps/releases/download/39.11/Borealis.zip) | Epic/Psyonix (`DelMar_Racing_ProjectB`); display name = codename |

> **Not in this build:** the dedicated tutorial plugin (`DelMarSeamless_TutorialRun`) and never-released codenames (`Wedge`/Death Race, `Thunder`/the four Pixar Cars maps, `Habanero`, `Volcanic`). See the Global Archive §16 for cut content.

---

## How the plugin naming works

The plugin name encodes which playlists a track shipped in — a rule verified firsthand against the plugin tree:

- **`DelMar` + Codename** → **Competitive** track. Playable in **Racing, Ranked, and Speed Run**. (e.g. `DelMarApollo` = Tilted Turnpike.)
- **Bare Codename** (no prefix) → **Speed-Run–exclusive** track, tagged `DelMar.Mode.Challenge`. (e.g. `Apollo` = Tilted Turns.)
- **`_adv`** → the advanced "2" variant of a competitive track (e.g. `Ouroboros_adv` = Festive Falls 2).
- **`…Optional`** → an on-demand optional stream chunk that layers onto its base track; small, and not standalone.

So a codename like **Apollo** appears twice — `DelMarApollo` (Tilted Turnpike, competitive) and `Apollo` (Tilted Turns, Speed-Run-only) are two different tracks in two different plugins. The community shorthand "Apollo2 / Snap2" describes real *tracks*, but no `Apollo2` plugin exists — the second track just lives in the bare-codename plugin.

Full engineering detail (the 34-plugin family, level anatomy, on-demand delivery, the AES-encrypted `InstalledBundles` mechanism) is in the archive's **DELMAR_INTERNALS.md**.

## Using the files

Each download is one plugin's four-file IoStore bundle (`.pak` · `.ucas` · `.utoc` · `.sig`).

**Inspect / datamine (recommended):** open the `.utoc` in [**FModel**](https://fmodel.app) or [CUE4Parse](https://github.com/FabianFG/CUE4Parse) with the Fortnite 39.11 AES key to browse the maps, meshes, materials, and the `…_LevelData.json`. Every track is built as three `.umap` files — `TrackName.umap`, `TrackName_CYN_OOB.umap`, `TrackName_SFX.umap` (level streaming + World Partition).

**Engine placement:** these are the exact bundles the game streamed to `%LOCALAPPDATA%/FortniteGame/InstalledBundles/PersistentDownloadDir`. They are **encrypted with the game's main AES key** and were only mounted by the live client.

> ⚠️ **These are preservation artifacts, not a way to "play Rocket Racing again."** The mode's servers shut down in October 2026; nothing here restores online play. The value is documentation, datamining, and keeping the level content from being lost.

## How downloads are published

The 5.5 GB of paks are **not** committed to git — a single `.ucas` is 60–165 MB, past GitHub's 100 MB per-file limit, and the repo would be miserable to clone. Instead each plugin is zipped and attached to the **`39.11` Release**. The `⬇ download` links above are the predictable Release asset URLs.

To (re)build and publish from a local checkout that still has the `GFP/` folder (needs [`gh`](https://cli.github.com/) authenticated):

```powershell
# 1) zip each plugin folder into dist\
pwsh scripts\package_releases.ps1

# 2) create the 39.11 release and upload all zips as assets
pwsh scripts\publish_release.ps1
```

Regenerate the catalog + `data/maps.json` from disk (Git Bash):

```bash
bash scripts/build_catalog.sh ./data   # rescans GFP/, rewrites maps.json + CATALOG_BODY.md
```

## Contributing

Corrections to a codename ↔ track mapping, a wrong size, or a missing plugin are welcome — [open an issue](../../issues/new/choose) with a file citation (`LevelData` `DisplayName`, `.umap` name, or playlist entry). The mapping is deliberately file-verified; please don't submit guesses.

## Disclaimer

This is a **fan-made preservation and research project**, **not affiliated with, endorsed by, or sponsored by Epic Games, Inc. or Psyonix.** "Fortnite," "Rocket Racing," "Rocket League," "Del Mar," and all related names, logos, and game assets are trademarks and copyright of Epic Games, Inc. Datamined and extracted assets are presented for **historical preservation, documentation, and educational purposes**. If you are a rights holder with a concern, see [**For Epic Games**](#️-for-epic-games) above — it will be resolved immediately.

---

*Compiled by **shrezee** · companion to the [Rocket Racing Global Archive](https://github.com/ShrezesUverse) · build `39.11-CL-49242330`.*

---

## For Epic Games

This is a **non commercial, fan made archive**. It is **not affiliated with, endorsed by, or sponsored by Epic Games, Inc. or Psyonix.** "Fortnite," "Rocket Racing," "Rocket League," "Del Mar," and all related names, logos, and game assets are the property of Epic Games, Inc.

**If you are Epic Games (or an authorized rights holder) and want this to take down, I will remove it.** Just reach out via:

**shrezeleiprech@gmail.com**

You can also [open a takedown issue](../../issues/new?template=takedown.md) and it will be actioned immediately. See [`NOTICE.md`](NOTICE.md) for the full statement