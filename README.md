# fixtime

[![Build and Release](https://github.com/watcher1337/fixtime/actions/workflows/release.yml/badge.svg)](https://github.com/watcher1337/fixtime/actions/workflows/release.yml)
[![Latest Release](https://img.shields.io/github/v/release/watcher1337/fixtime)](https://github.com/watcher1337/fixtime/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/watcher1337/fixtime/total)](https://github.com/watcher1337/fixtime/releases)
[![License](https://img.shields.io/github/license/watcher1337/fixtime)](LICENSE)

 Time synchronization tool designed to resolve Kerberos authentication issues by correcting system time offsets during Active Directory penetration testing.



## Installation

### Linux / macOS

```bash
wget https://github.com/watcher1337/fixtime/raw/refs/heads/main/installer.sh \
  && chmod +x installer.sh \
  && sudo ./installer.sh \
  && sudo rm -f installer.sh
```

### Windows

Download the latest Windows executable from the GitHub Releases page:

https://github.com/watcher1337/fixtime/releases/latest

---

## Usage

Show help:

```bash
fixtime -h
```

Set IP:

```bash
fixtime -i 10.10.10.10
```

Force:

```bash
fixtime -i 10.10.10.10 --force
```

Restore:

```bash
fixtime --restore
```

---

## Download

### Latest Release

| Platform | File |
|---|---|
| Windows | `fixtime-windows.exe` |
| Linux | `fixtime-linux` |
| macOS | `fixtime-macos` |

[Download Latest Release](https://github.com/watcher1337/fixtime/releases/latest)

### Source Code

Clone the repository:

```bash
git clone https://github.com/watcher1337/fixtime.git
cd fixtime
```

Install dependencies:

```bash
python -m pip install -r requirements.txt
```

Run directly:

```bash
python fixtime.py -h
```

---

## Build From Source

### Requirements

- Python 3.13+
- PyInstaller
- Dependencies listed in `requirements.txt`

Install PyInstaller:

```bash
python -m pip install --upgrade pip
python -m pip install pyinstaller
```

Install project dependencies:

```bash
python -m pip install -r requirements.txt
```

Build the executable:

```bash
python -m PyInstaller \
  --onefile \
  --clean \
  --name fixtime \
  fixtime.py
```

The executable will be generated in:

```text
dist/
└── fixtime
```

On Windows:

```text
dist/
└── fixtime.exe
```

---


## Download Statistics

### Total Downloads

[![Downloads](https://img.shields.io/github/downloads/watcher1337/fixtime/total)](https://github.com/watcher1337/fixtime/releases)

This count is based on GitHub Release assets.

### Latest Release Downloads

[![Latest Release Downloads](https://img.shields.io/github/downloads/watcher1337/fixtime/latest/total)](https://github.com/watcher1337/fixtime/releases/latest)

GitHub tracks download counts separately for each uploaded release asset.

---

## Supported Platforms

| Platform | Build | Status |
|---|---|---|
| Windows | `fixtime-windows.exe` | ✅ |
| Linux | `fixtime-linux` | ✅ |
| macOS | `fixtime-macos` | ✅ |

---

## Project Structure

```text
fixtime/
├── fixtime.py
├── installer.sh
├── requirements.txt
├── README.md
├── LICENSE
└── .github/
    └── workflows/
        └── release.yml
```

---

## Development

Run the application directly from source:

```bash
python fixtime.py -h
```

Run with an IP:

```bash
python fixtime.py -i 10.10.10.10
```

Force execution:

```bash
python fixtime.py -i 10.10.10.10 --force
```

Restore previous configuration:

```bash
python fixtime.py --restore
```

---

## Releases

View all releases:

https://github.com/watcher1337/fixtime/releases

View the latest release:

https://github.com/watcher1337/fixtime/releases/latest

---

## License

See the [LICENSE](LICENSE) file for license information.
