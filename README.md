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
- [Common Use Cases](#-common-use-cases)

---

## ✨ Features

- 🔒 Time sync – Corrects system time to match AD servers via NTP with fallback support

- 🖥️ Cross-platform – Windows, Linux, macOS (x64 & ARM64)

- 🎯 Kerberos-aware – Tolerance check with --force to bypass 5-min limit

- 🔄 Clean restore – One-command to re-enable NTP after engagement


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
fixtime -i <target-ip>          # Sync time with AD server
fixtime -i <target-ip> --force  # Force sync (bypass tolerance)
fixtime --restore               # Restore NTP service
fixtime -h                      # Show help
```

**Options:**
- `-i IP` - Target Active Directory server IP
- `--force` - Force sync even if already within Kerberos tolerance
- `--restore` - Re-enable NTP service
- `-h` - Display help


---

## 🎯 Common Use Cases

- **Fix Kerberos errors:** `KDC_ERR_CLOCK_SKEW`, "Clock skew too great"
- **Before AD penetration testing:** Sync time with DC before using Impacket, BloodHound, etc.
- **Cleanup:** Restore NTP after engagement

---









