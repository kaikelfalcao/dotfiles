#!/usr/bin/env bash
# Instala Nerd Fonts (ícones usados pelo Starship, eza, lazygit...).
set -euo pipefail

FONTS=(JetBrainsMono FiraCode CascadiaCode)
DEST="$HOME/.local/share/fonts/NerdFonts"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

mkdir -p "$DEST"
for font in "${FONTS[@]}"; do
  if ls "$DEST/$font"/*.ttf >/dev/null 2>&1; then
    echo "==> $font já instalada"
    continue
  fi
  echo "==> Baixando $font Nerd Font"
  curl -fsSL -o "$TMP/$font.zip" \
    "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.zip"
  mkdir -p "$DEST/$font"
  unzip -oq "$TMP/$font.zip" -d "$DEST/$font" '*.ttf'
done

fc-cache -f "$DEST" >/dev/null
echo "==> Fontes instaladas em $DEST"
