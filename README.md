# fixtime

[![GitHub release](https://img.shields.io/github/release/watcher1337/fixtime.svg)](https://github.com/watcher1337/fixtime/releases/latest)
[![Python 3.13+](https://img.shields.io/badge/python-3.13+-blue.svg)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/watcher1337/fixtime/releases)


**Time synchronization tool designed to resolve Kerberos authentication issues by correcting system time offsets during Active Directory penetration testing.**

---

## 📋 Table of Contents

- [Features](#-features)
- [Quick Install](#-quick-install)
- [Usage](#-usage)

---

## ✨ Features

- 🔒 Time sync – Corrects system time to match AD servers via NTP with fallback support
- 🖥️ Cross-platform – Windows, Linux, macOS (x64 & ARM64)
- 🎯 Kerberos-aware – Tolerance check with --force to bypass 5-min limit
- 🔄 Clean restore – One-command to re-enable NTP after engagement
- 💪 Fixes KDC_ERR_CLOCK_SKEW before running Impacket, BloodHound, or any AD tool


---

## 🚀 Quick Install

### Linux 

### uv / pipx
```bash
uv tool install fixtime
```
```bash
pipx install fixtime
```
```bash
fixtime -h
```

###  macOS with pipx

```bash
brew install pipx
```
```bash
pipx ensurepath
```
```bash
pipx install fixtime
```
```bash
fixtime -h
```


### Windows

Download `fixtime.exe` from [releases](https://github.com/watcher1337/fixtime/releases/latest)

---

## 📖 Usage

```bash
fixtime -i <dc-ip>          # Sync time with AD server
fixtime -i <dc-ip> --force  # Force sync (bypass tolerance)
fixtime --restore               # Restore NTP service
fixtime -h                      # Show help
```

**Options:**
- `-i IP` - Domain controller IP
- `--force` - Force sync even if already within Kerberos tolerance
- `--restore` - Re-enable NTP service
- `-h` - Show help













