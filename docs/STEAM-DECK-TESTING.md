# Steam Deck test notes

Tested October 29, 2026 on SteamOS, with an Ubuntu 24.04 Distrobox build environment.

## Local paths used in the successful test

- Recompilation tool: `/home/deck/ps2-native-recomp`
- Game identifier: `SLES_513.22` (European release)
- Generated code: `generated/robotech-battlecry`
- Native runner: `build/native-robotech-battlecry-ubuntu/ps2run`
- Local game disc: `games/robotech-battlecry/disc.iso`
- Memory card: `/home/deck/PS2-Saves/Robotech-Battlecry/Mcd001.ps2`
- Tested AppImage: `/home/deck/Downloads/Robotech-Battlecry-SteamDeck-x86_64.AppImage`

These are **local paths only**, not files distributed by this repository.

## Native build command

From an environment with Clang, CMake and Ninja installed:

```bash
cd /home/deck/ps2-native-recomp
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
cmake -S . -B build/native-robotech-battlecry-ubuntu -G Ninja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
  -DCMAKE_CXX_FLAGS="-mavx2 -ffp-contract=off" \
  -DPS2_GENERATED="$PWD/generated/robotech-battlecry" \
  -DPS2_RUNTIME_LIB=""
cmake --build build/native-robotech-battlecry-ubuntu --target ps2run --parallel 4
```

This assumes the upstream tool has already generated the game-specific source. Consult upstream documentation for generation prerequisites.

## Launch

```bash
bash scripts/launch-robotech.sh
```

Or use the script directly from this repository after adjusting environment variables for your installation.

## Observations

- The game reached gameplay with graphics, controller input and audio functioning.
- An existing save was loaded from a standard PS2 memory card image.
- An AppImage packaging the native runner launched successfully. This was a **launcher-style package** dependent on external game files and host libraries, not a portable or redistributable game.
- One runtime log contained `vcIOPSound WARNING could not find any available voices`; further audio compatibility testing is advisable.
- Closing the game window terminated the test normally.

Do not upload game images, extracted executables, memory cards, generated copyrighted code, or local logs containing private information.
