#!/usr/bin/env bash
# Local Steam Deck launcher. Requires a separately built ps2-native-recomp.
set -euo pipefail
ROOT="${PS2_RECOMP_ROOT:-$HOME/ps2-native-recomp}"
GAME="${ROBOTECH_GAME_DIR:-$ROOT/games/robotech-battlecry}"
RUNNER="${ROBOTECH_RUNNER:-$ROOT/build/native-robotech-battlecry-ubuntu/ps2run}"
SAVE_DIR="${ROBOTECH_SAVE_DIR:-$HOME/PS2-Saves/Robotech-Battlecry}"
CARD="$SAVE_DIR/Mcd001.ps2"

for required in "$RUNNER" "$GAME/disc/SLES_513.22" "$GAME/disc.iso"; do
  if [[ ! -e "$required" ]]; then
    printf 'Missing required local file: %s\n' "$required" >&2
    exit 1
  fi
done

mkdir -p "$SAVE_DIR"
cd "$ROOT"
export SDL_AUDIODRIVER="${SDL_AUDIODRIVER:-pulseaudio}"
exec "$RUNNER" "$GAME/disc/SLES_513.22" \
  --disc "$GAME/disc.iso" \
  --memcard "$CARD" --window "$@"
