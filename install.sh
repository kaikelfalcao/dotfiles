#!/usr/bin/env bash
# Bootstrap: instala o chezmoi e aplica os dotfiles deste diretório.
# Numa máquina nova, sem clonar nada:
#   sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply kaikelfalcao
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="$HOME/.local/bin"
mkdir -p "$BIN"

if ! command -v curl >/dev/null; then
  sudo apt-get update -y && sudo apt-get install -y curl
fi

if ! command -v chezmoi >/dev/null && [ ! -x "$BIN/chezmoi" ]; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$BIN"
fi

CHEZMOI="$(command -v chezmoi || echo "$BIN/chezmoi")"
"$CHEZMOI" init --apply --source "$SRC"

echo
echo "Pronto! Abra um novo terminal (ou faça logout/login) e rode 'gh auth login'."
