# Robotech Battlecry Recomp

A community testing and build project for **Robotech: Battlecry (PlayStation 2, European release)** using [ps2-native-recomp](https://github.com/exoteric33/ps2-native-recomp).

## Status

**Steam Deck: gameplay verified (October 29, 2026).** Tested on SteamOS with a native Linux executable and a launcher-style AppImage.

| Feature | Test result |
| --- | --- |
| Launch and gameplay | Working |
| Graphics | Working |
| Steam Deck controller | Working |
| Audio | Working; sound-voice exhaustion warning observed in one log |
| PS2 memory card | Existing save recognized and loaded |
| AppImage | Launched and ran gameplay |
| Long-term compatibility | Not fully tested |

These are user-reported results from one setup, not a guarantee of complete game compatibility.

## Requirements and build

The recompilation tool and build process live in the upstream [ps2-native-recomp](https://github.com/exoteric33/ps2-native-recomp) project. Follow its current instructions to generate and compile a native executable using your own legally obtained game copy.

Tested game executable identifier: `SLES_513.22` (Europe).

The tested Steam Deck setup used an Ubuntu 24.04 Distrobox environment, Clang 18, CMake and Ninja. The executable was built using generated code in `generated/robotech-battlecry`, then launched on SteamOS.

See [docs/STEAM-DECK-TESTING.md](docs/STEAM-DECK-TESTING.md) for the verified local commands and [scripts/launch-robotech.sh](scripts/launch-robotech.sh) for a configurable local launcher.

## Legal and distribution notes

**No game ISO, copyrighted PS2 executable, game assets, BIOS, or memory card saves are provided.** This repository is not affiliated with or endorsed by the game's rights holders. Robotech and related marks belong to their respective owners.

Original material in this repository is offered under the [PolyForm Noncommercial License 1.0.0](LICENSE), with a copyright notice for omegakatana92. This license permits use, modification and distribution for noncommercial purposes only. It does **not** relicense upstream tools, third-party components, game content, or generated outputs that may carry separate rights or restrictions. Check all applicable licenses before distributing compiled code or binaries. No compiled game binary is published here.

## Credits

- [exoteric33/ps2-native-recomp](https://github.com/exoteric33/ps2-native-recomp): upstream recompilation tooling
- [omegakatana92](https://github.com/omegakatana92): Robotech Battlecry Steam Deck build and testing
