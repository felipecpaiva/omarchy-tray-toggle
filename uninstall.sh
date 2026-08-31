#!/usr/bin/env bash
# Reverses install.sh. Safe to run even if install only partially completed.
set -uo pipefail

PLUGIN_ID="tray-toggle.tray"
PLUGIN_DEST="$HOME/.config/omarchy/plugins/$PLUGIN_ID"

echo "== 1/2: swapping the bar widget back =="
omarchy plugin disable "$PLUGIN_ID" 2>/dev/null || true
omarchy plugin enable omarchy.tray 2>/dev/null || true

echo "== 2/2: removing the plugin =="
rm -rf "$PLUGIN_DEST"

echo
echo "Done. The stock tray widget is back."
echo "If you added the launcher toggle to omarchy-menu.jsonc, remove that entry yourself."
