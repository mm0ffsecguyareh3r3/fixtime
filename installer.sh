#!/usr/bin/env bash

# fixtime installer
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/watcher1337/fixture/refs/heads/main/installer.sh | bash
#
# Supported:
#   Linux x86_64
#   Linux ARM64
#   macOS x86_64
#   macOS ARM64

set -euo pipefail

REPO="watcher1337/fixtime"
INSTALL_DIR="/usr/local/bin"
INSTALL_PATH="${INSTALL_DIR}/fixtime"

TEMP_FILE="$(mktemp)"

cleanup() {
    rm -f "$TEMP_FILE"
}

trap cleanup EXIT

# ============================================================
# Output helpers
# ============================================================

info() {
    printf '\033[94m[*]\033[0m %s\n' "$1"
}

success() {
    printf '\033[92m[✓]\033[0m %s\n' "$1"
}

error() {
    printf '\033[91m[-]\033[0m %s\n' "$1" >&2
}

warning() {
    printf '\033[93m[!]\033[0m %s\n' "$1"
}

# ============================================================
# Header
# ============================================================

echo
echo "========================================"
echo "          fixtime installer"
echo "========================================"
echo

# ============================================================
# Check dependencies
# ============================================================

if ! command -v curl >/dev/null 2>&1; then
    error "curl is required."
    echo
    echo "Install curl first:"
    echo
    echo "  Debian / Ubuntu / Kali:"
    echo "    sudo apt install curl"
    echo
    echo "  macOS:"
    echo "    curl is normally pre-installed."
    echo
    exit 1
fi

# ============================================================
# Detect operating system
# ============================================================

OS="$(uname -s)"

case "$OS" in
    Linux)
        OS_NAME="linux"
        ;;

    Darwin)
        OS_NAME="macos"
        ;;

    *)
        error "Unsupported operating system: $OS"
        echo
        echo "Supported operating systems:"
        echo "  Linux"
        echo "  macOS"
        echo
        exit 1
        ;;
esac

# ============================================================
# Detect architecture
# ============================================================

ARCH="$(uname -m)"

case "$ARCH" in
    x86_64|amd64)
        ARCH_NAME="x64"
        ;;

    arm64|aarch64)
        ARCH_NAME="arm64"
        ;;

    *)
        error "Unsupported architecture: $ARCH"
        echo
        echo "Detected architecture: $ARCH"
        echo
        echo "Supported architectures:"
        echo "  x86_64"
        echo "  amd64"
        echo "  arm64"
        echo "  aarch64"
        echo
        exit 1
        ;;
esac

# ============================================================
# Determine release asset
# ============================================================

ASSET="fixtime-${OS_NAME}-${ARCH_NAME}"

# Check if Windows (not supported by installer)
if [ "$OS_NAME" = "windows" ]; then
    error "Windows is not supported by this installer."
    echo
    echo "For Windows, download fixtime-windows-x64.exe from:"
    echo "  https://github.com/${REPO}/releases/latest"
    echo
    exit 1
fi

# Add .exe extension for Windows (though not supported)
if [ "$OS_NAME" = "windows" ]; then
    ASSET="${ASSET}.exe"
fi

DOWNLOAD_URL="https://github.com/${REPO}/releases/latest/download/${ASSET}"

info "Operating system : ${OS_NAME}"
info "Architecture     : ${ARCH_NAME}"
info "Binary           : ${ASSET}"
echo

# ============================================================
# Check sudo
# ============================================================

if [ "$(id -u)" -eq 0 ]; then
    SUDO=""
else
    if ! command -v sudo >/dev/null 2>&1; then
        error "sudo is required to install fixtime."
        echo
        echo "Either run as root, or install sudo."
        exit 1
    fi

    SUDO="sudo"
fi

# ============================================================
# Download latest release
# ============================================================

info "Downloading latest fixtime release..."
echo "    ${DOWNLOAD_URL}"
echo

if ! curl \
    --fail \
    --location \
    --silent \
    --show-error \
    --progress-bar \
    "$DOWNLOAD_URL" \
    --output "$TEMP_FILE"; then

    error "Failed to download ${ASSET}"
    echo
    echo "Make sure the GitHub Release contains:"
    echo
    echo "  ${ASSET}"
    echo
    echo "Check available releases at:"
    echo "  https://github.com/${REPO}/releases/latest"
    echo

    exit 1
fi

# ============================================================
# Validate downloaded file
# ============================================================

if [ ! -s "$TEMP_FILE" ]; then
    error "Downloaded file is empty."
    exit 1
fi

# Basic protection against accidentally installing HTML.
if command -v file >/dev/null 2>&1; then
    FILE_TYPE="$(file -b "$TEMP_FILE" 2>/dev/null || echo "unknown")"

    case "$OS_NAME" in
        linux)
            if [[ "$FILE_TYPE" != *"ELF"* ]]; then
                error "Downloaded file is not a Linux executable."
                error "Detected: ${FILE_TYPE}"
                echo
                echo "This might happen if:"
                echo "  - The release doesn't have ${ASSET}"
                echo "  - GitHub is returning an error page"
                echo
                exit 1
            fi
            ;;

        macos)
            if [[ "$FILE_TYPE" != *"Mach-O"* ]]; then
                error "Downloaded file is not a macOS executable."
                error "Detected: ${FILE_TYPE}"
                echo
                echo "This might happen if:"
                echo "  - The release doesn't have ${ASSET}"
                echo "  - GitHub is returning an error page"
                echo
                exit 1
            fi
            ;;
    esac
fi

success "Download verified."

# ============================================================
# Create installation directory
# ============================================================

info "Preparing ${INSTALL_DIR}..."

$SUDO mkdir -p "$INSTALL_DIR"

# ============================================================
# Install
# ============================================================

info "Installing fixtime..."

$SUDO install \
    -m 0755 \
    "$TEMP_FILE" \
    "$INSTALL_PATH"

# ============================================================
# Verify installation
# ============================================================

if [ ! -x "$INSTALL_PATH" ]; then
    error "Installation failed."
    exit 1
fi

success "fixtime installed successfully."

# ============================================================
# Show installed binary
# ============================================================

echo
echo "========================================"
echo "          Installation complete"
echo "========================================"
echo

echo "Binary:"
echo "  ${INSTALL_PATH}"

echo
echo "Platform:"
echo "  ${OS_NAME}-${ARCH_NAME}"

# Show binary size
if command -v du >/dev/null 2>&1; then
    SIZE="$(du -h "$INSTALL_PATH" | cut -f1)"
    echo "Size:"
    echo "  ${SIZE}"
fi

echo
echo

# ============================================================
# Check PATH
# ============================================================

if command -v fixtime >/dev/null 2>&1; then
    success "fixtime is available in PATH."
    echo
    echo "Version:"
    fixtime -h 2>/dev/null | head -n 3 || echo "  (run fixtime -h for help)"
else
    warning "${INSTALL_DIR} may not be in your PATH."
    echo
    echo "You can run it directly with:"
    echo "  ${INSTALL_PATH}"
    echo
    echo "To add to PATH, add this to your ~/.bashrc or ~/.zshrc:"
    echo "  export PATH=\"\$PATH:${INSTALL_DIR}\""
fi

echo
success "Installation complete! "
