#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -gt 1 ]]; then
  printf 'Usage: %s [plugin-directory]\n' "$0" >&2
  exit 2
fi

# Neovim's stdpath("data") follows XDG_DATA_HOME and appends "nvim".
NVIM_DATA_DIR="${XDG_DATA_HOME:-${HOME:?HOME must be set}/.local/share}/nvim"
DEST_DIR="${1:-$NVIM_DATA_DIR/site/pack/core/opt/pack_handle}"

if ! command -v rsync >/dev/null 2>&1; then
  printf 'Error: rsync is required to update the plugin copy.\n' >&2
  exit 1
fi

mkdir -p -- "$DEST_DIR"
rsync -a --delete \
  --exclude='/.git/' \
  --exclude='/.codex/' \
  --exclude='/.agents/' \
  --exclude='/.aws/' \
  "$SCRIPT_DIR/" "$DEST_DIR/"

printf 'Updated pack_handle.nvim at %s\n' "$DEST_DIR"
printf 'Restart Neovim to load the updated plugin.\n'
