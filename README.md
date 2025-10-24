# Void Postinstall Dotfiles & Ricings

Post-installation script and dotfiles for setting up a Wayland environment with River window manager, Yambar status bar, and various utilities on Void Linux.

## 🚀 Overview

This repository contains my personal post-installation setup for Void Linux, featuring:
- **River** - A dynamic tiling Wayland compositor
- **Yambar** - Lightweight status bar for Wayland
- **Foot** - Fast, lightweight terminal emulator
- **Neovim** - Modern Vim-based text editor
- **MPD** - Music Player Daemon with ALSA backend

## 📁 Structure

```
.
├── .config/
│   ├── foot/           # Terminal configuration
│   ├── mpd/           # Music player daemon config
│   ├── nvim/          # Neovim configuration
│   ├── river/         # River window manager
│   └── yambar/        # Status bar configuration
├── .local/bin/        # Local scripts
├── postinstall.sh     # Main installation script
├── postinstall-neovim.sh  # Neovim-specific setup
└── LICENSE           # MIT License
```

## 🛠️ Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/void_postinstall_dotfiles_ricing
   cd void_postinstall_dotfiles_ricing
   ```

2. **Run the installation script:**
   ```bash
   ./postinstall.sh
   ```

3. **Set up Neovim (optional):**
   ```bash
   ./postinstall-neovim.sh
   ```

## ⚙️ Components

### River Window Manager
- Dynamic tiling Wayland compositor
- Custom keybindings and window management
- Startup applications and workspace management

### Yambar Status Bar
- Minimal, modular status bar
- MPD integration for music display
- System monitoring (CPU, memory, battery)

### Foot Terminal
- Fast, lightweight terminal emulator
- Custom color scheme and font settings

### Neovim
- Modern Vim configuration
- Plugin management with vim-plug
- Development-oriented setup

### MPD (Music Player Daemon)
- ALSA audio backend
- Unix socket configuration
- Local music library management

## 🎨 Ricings

The setup includes a cohesive color scheme and aesthetic across all components, with focus on:
- Minimalist design
- Efficient workflow
- Consistent visual language

## 📝 Scripts

- **`rdesk`** - Custom RDP connection script
- **`postinstall.sh`** - Main system setup and package installation
- **`postinstall-neovim.sh`** - Neovim and development tools setup

## 🤝 Inspiration

This setup is inspired by the many excellent River and Wayland dotfiles repositories in the community, most recently:
- [JustineSmithies/river-dotfiles](https://codeberg.org/JustineSmithies/river-dotfiles)

## 📄 License

BSD 2-Clause License - see [LICENSE](LICENSE) file for details.

## 💡 Tips

- Review the scripts before running them
- Adjust package lists in `postinstall.sh` to match your needs
- Customize keybindings in River config for your workflow
- The MPD setup uses ALSA - adjust if you prefer PipeWire or PulseAudio

---

*Note: This is my personal setup - adjust to fit your preferences and system requirements.*
