#!/usr/bin/env bash
# PortWatch installer — makes 'portwatch' runnable from anywhere

set -e  # stop if any command fails

# find the folder this installer lives in (so it works wherever it's cloned)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# make sure the user's local bin exists
mkdir -p "$HOME/.local/bin"

# make the script executable
chmod +x "$SCRIPT_DIR/portwatch"

# link it onto the PATH
ln -sf "$SCRIPT_DIR/portwatch" "$HOME/.local/bin/portwatch"

echo "PortWatch installed. Run 'portwatch -h' to get started."

# warn if ~/.local/bin isn't on PATH
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo "Note: add ~/.local/bin to your PATH to run 'portwatch' from anywhere." ;;
esac
