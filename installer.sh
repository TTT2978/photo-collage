#!/bin/bash
# Stop script on any error
set -e

echo "[*] Initializing environment update & upgrade..."
pkg update -y && pkg upgrade -y

echo "[*] Checking and installing required dependencies..."
pkg install -y imagemagick clang unzip wget

# Define installation workspace
INSTALL_DIR="$HOME/.smart_collage"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

echo "[*] Downloading source package..."
DOWNLOAD_URL="https://github.com/TTT2978/photo-collage/raw/refs/heads/main/smart_collage.zip"
wget -O package.zip "$DOWNLOAD_URL"

echo "[*] Extracting source files..."
unzip -o package.zip
# Move files up if zipped with root folder
if [ -d "smart_collage" ]; then
    mv smart_collage/* .
    rm -rf smart_collage
fi
rm -f package.zip

echo "[*] Compiling source code on-device for maximum optimization..."
g++ -I include src/logic.cpp src/flags.cpp src/stitcher.cpp src/error_handler.cpp src/validator.cpp -o logic_bin

echo "[*] Configuring shell environment and alias..."
SHELL_RC="$HOME/.bashrc"
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
fi

if ! grep -q "alias img=" "$SHELL_RC"; then
    echo "alias img=\"$INSTALL_DIR/logic_bin\"" >> "$SHELL_RC"
    echo "[+] Alias 'img' added to $SHELL_RC"
else
    echo "[!] Alias 'img' already configured."
fi

echo "[+] Deployment completed successfully."
echo "[*] Please reload your shell using: source $SHELL_RC"
echo "[*] Run 'img -h' to get started."
