#!/usr/bin/env bash
# Installs the patched tray widget as a replacement for Omarchy's stock
# omarchy.tray. See README.md for what this fixes and adds.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ID="tray-toggle.tray"
PLUGIN_DEST="$HOME/.config/omarchy/plugins/$PLUGIN_ID"

echo "== 1/2: installing the plugin =="
rm -rf "$PLUGIN_DEST"
mkdir -p "$PLUGIN_DEST"
cp -f "$REPO_DIR"/*.qml "$REPO_DIR"/*.js "$REPO_DIR/manifest.json" "$PLUGIN_DEST/"
omarchy plugin validate "$PLUGIN_DEST"

echo
echo "== 2/2: swapping the bar widget =="
omarchy plugin disable omarchy.tray 2>/dev/null || true
omarchy plugin enable "$PLUGIN_ID"

echo
echo "Done. Your bar now uses the patched tray widget."
echo "Optional: add the Super+Space menu toggle — see README.md 'Add the launcher toggle'."
echo "Uninstall with: $REPO_DIR/uninstall.sh"
