#!/usr/bin/env bash
set -euo pipefail

ANTCONC_BASE_URL="https://www.laurenceanthony.net/software/antconc/releases/AntConc431"
ANTCONC_TARBALL="AntConc.tar.gz"

INSTALL_ROOT="$HOME/Applications"
ANTCONC_DIR="$INSTALL_ROOT/AntConc" 
DESKTOP_LAUNCHER="$HOME/Desktop/AntConc.sh"

echo "[INFO] Preparing install directory: $INSTALL_ROOT"
rm -rf "$INSTALL_ROOT"
mkdir -p "$INSTALL_ROOT"

echo "[INFO] Downloading $ANTCONC_TARBALL..."
TMP_TGZ="/tmp/$ANTCONC_TARBALL"
wget -qO "$TMP_TGZ" "$ANTCONC_BASE_URL/$ANTCONC_TARBALL"

echo "[INFO] Extracting into $INSTALL_ROOT (creates $ANTCONC_DIR)..."
tar -xzf "$TMP_TGZ" -C "$INSTALL_ROOT"

# Ensure executable bit
chmod +x "$ANTCONC_DIR/AntConc.sh" || true

echo "[INFO] Creating Desktop launcher: $DESKTOP_LAUNCHER"
cat > "$DESKTOP_LAUNCHER" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
cd "$HOME/Applications/AntConc"
exec ./AntConc.sh
EOF

chmod ugo+x "$DESKTOP_LAUNCHER"

bold=$(tput bold || true)
normal=$(tput sgr0 || true)
clear || true
echo "----------------------- CHCAA says AntConc gogo -----------------------"
echo "${bold}[INFO] AntConc installed.${normal}"
echo "${bold}[INFO] Start it from Desktop → AntConc.sh${normal}"
