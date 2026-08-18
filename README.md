# fixtime

[![Build and Release](https://github.com/watcher1337/fixtime/actions/workflows/release.yml/badge.svg)](https://github.com/watcher1337/fixtime/actions/workflows/release.yml)
[![GitHub release](https://img.shields.io/github/release/watcher1337/fixtime.svg)](https://github.com/watcher1337/fixtime/releases/latest)
[![GitHub downloads](https://img.shields.io/github/downloads/watcher1337/fixtime/total.svg)](https://github.com/watcher1337/fixtime/releases)
[![Python 3.13+](https://img.shields.io/badge/python-3.13+-blue.svg)](https://www.python.org/)
[![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/watcher1337/fixtime/releases)


**Time synchronization tool designed to resolve Kerberos authentication issues by correcting system time offsets during Active Directory penetration testing.**

---

## 📋 Table of Contents

- [Features](#-features)
- [Quick Install](#-quick-install)
- [Usage](#-usage)
- [Supported Platforms](#-supported-platforms)
- [Build From Source](#-build-from-source)
- [Project Structure](#-project-structure)
- [Download Statistics](#-download-statistics)
- [Contributing](#-contributing)
- [License](#-license)
- [Disclaimer](#-disclaimer)

---

## ✨ Features

- 🔒 Corrects system time to match Active Directory servers
- 📡 Uses HTTP/HTTPS/WinRM Date headers for time retrieval
- 🖥️ Cross-platform: Windows, Linux, macOS (x64 & ARM64)
- 🚀 Native ARM64 builds via GitHub Actions
- 🔧 NTP auto-sync with fallback servers
- ⚡ Lightweight and dependency-free binary
- 🎨 Color-coded terminal output
- 🔐 Privilege escalation support (sudo on Unix, admin on Windows)

---

## 🚀 Quick Install

### Linux / macOS

**One-liner installer:**

```bash
curl -fsSL https://raw.githubusercontent.com/watcher1337/fixtime/refs/heads/main/installer.sh | bash
