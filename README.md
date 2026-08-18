# fixtime

[![GitHub release](https://img.shields.io/github/release/watcher1337/fixtime.svg)](https://github.com/watcher1337/fixtime/releases/latest)
[![GitHub downloads](https://img.shields.io/github/downloads/watcher1337/fixtime/total.svg)](https://github.com/watcher1337/fixtime/releases)
[![Python 3.13+](https://img.shields.io/badge/python-3.13+-blue.svg)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/watcher1337/fixtime/releases)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**Time synchronization tool designed to resolve Kerberos authentication issues by correcting system time offsets during Active Directory penetration testing.**

---

## 📋 Table of Contents

- [Features](#-features)
- [Quick Install](#-quick-install)
- [Usage](#-usage)
- [Examples](#-examples)
- [Common Use Cases](#-common-use-cases)
- [Important Notes](#-important-notes)
- [Building from Source](#-building-from-source)
- [Contributing](#-contributing)
- [License](#-license)

---

## ✨ Features

- 🔒 Corrects system time to match Active Directory servers
- 🖥️ Cross-platform: Windows, Linux, macOS (x64 & ARM64)
- 🔧 NTP auto-sync with fallback servers
- ⚡ Lightweight and dependency-free binary
- 🎯 Kerberos tolerance-aware with force option
- 🔄 One-command restore functionality
- 📦 No external dependencies required

---

## 🚀 Quick Install

### Linux / macOS

**One-liner installer:**

```bash
curl -fsSL https://raw.githubusercontent.com/watcher1337/fixtime/refs/heads/main/installer.sh | bash
```

### Windows

Download `fixtime.exe` from [releases](https://github.com/watcher1337/fixtime/releases/latest)

---

## 📖 Usage

```bash
fixtime -i <target-ip>      # Sync time with AD server
fixtime -i <target-ip> --force  # Force sync (bypass 5-min tolerance)
fixtime --restore           # Restore NTP service
fixtime -h                  # Show help
```

**Options:**
- `-i IP` - Target Active Directory server IP
- `--force` - Force sync even if within Kerberos tolerance
- `--restore` - Re-enable NTP service
- `-h` - Display help


---

## 🎯 Common Use Cases

- **Fix Kerberos errors:** `KDC_ERR_CLOCK_SKEW`, "Clock skew too great"
- **Before AD penetration testing:** Sync time with DC before using Impacket, BloodHound, etc.
- **Force sync:** When offset exceeds 5 minutes
- **Cleanup:** Restore NTP after engagement

---









