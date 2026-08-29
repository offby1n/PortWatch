#!/usr/bin/env bash
# PortWatch installer — works both locally and via curl-pipe

set -e  # stop on any error

INSTALL_DIR="$HOME/.local/bin"
RAW_URL="https://raw.githubusercontent.com/offby1n/PortWatch/main/portwatch"

mkdir -p "$INSTALL_DIR"

# if portwatch is sitting next to this script (local clone), use it;
# otherwise download it from GitHub (curl-pipe install)
SCRIPT_DIR="$(cd "$(dirname "$0")" 2>/dev/null && pwd)"
if [ -f "$SCRIPT_DIR/portwatch" ]; then
    cp "$SCRIPT_DIR/portwatch" "$INSTALL_DIR/portwatch"
else
    echo "Downloading portwatch..."
    curl -sSL "$RAW_URL" -o "$INSTALL_DIR/portwatch"
fi

chmod +x "$INSTALL_DIR/portwatch"

echo "PortWatch installed to $INSTALL_DIR/portwatch"
echo "Run 'portwatch -h' to get started."

# warn if ~/.local/bin isn't on PATH
case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *) echo "Note: add $INSTALL_DIR to your PATH to run 'portwatch' from anywhere." ;;
esac
