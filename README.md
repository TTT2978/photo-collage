## 🚀 Installation

Choose the command that matches your operating system to install the tool.

### 📱 Termux
```bash
curl -sL https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer.sh | bash
```

### 🐧 Ubuntu
```bash
curl -sL https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer_ubuntu.sh | bash
```

### 🪟 Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/TTT2978/photo-collage/refs/heads/main/installer.ps1 | iex
```

---

## 🛠️ Usage & Flags

Customize your collage by using the following flags:


| Flag | Description | Default Value |
| :--- | :--- | :--- |
| `-n <name>` | Output file name | `collage_output` |
| `-f <format>` | Output image format (`jpg`, `png`, `webp`) | `png` |
| `-c <color/TB>` | Background color or `TB` (Transparent) | `none` |
| `-d <path>` | Destination directory path for the output | `.` (Current directory) |
| `-s <number>` | Pixel spacing between images | `135` |
| `-dir <v/h>` | Collage layout direction: `v` (vertical) or `h` (horizontal) | `v` |
| `-h`, `--help` | Show the help message | — |

---

## ⚙️ Core Mechanism (Smart Scaling)

Unlike standard tools that compress image data when merging, this tool features an **Automatic Resolution Enhancement** engine. 

* **High-Fidelity Output:** No matter how many images you combine (even up to 100+ images), the tool dynamically scales up the canvas resolution.
* **Crystal-Clear Quality:** While the final file size will increase accordingly, every single component image retains its original sharpness—allowing you to zoom in without any pixelation or loss of detail.
