#!/bin/bash

# Installer script for fixtime
# Detects OS architecture and installs the appropriate binary

set -e

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then 
    echo "Please run with sudo or as root"
    exit 1
fi

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Cannot detect OS"
    exit 1
fi

# Detect architecture
ARCH=$(uname -m)

# Determine which binary to download
case $ARCH in
    x86_64|amd64)
        URL="https://github.com/watcher1337/fixtime/raw/refs/heads/main/fixtime_amd"
        ;;
    aarch64|arm64|armv8l|armv7l|armv6l)
        URL="https://github.com/watcher1337/fixtime/raw/refs/heads/main/fixtime_arm"
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# Download the binary
TEMP_FILE="/tmp/fixtime_temp"
wget -q -O "$TEMP_FILE" "$URL"

# Move to /usr/local/bin
mv "$TEMP_FILE" /usr/local/bin/fixtime

# Make executable
chmod +x /usr/local/bin/fixtime

# Show success message
echo "========================================"
echo "✓ Installation complete!"
echo "========================================"