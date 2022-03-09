<div align="center">
  <h1>Nixdots</h1>
  <a href="https://github.com/nixos/nixpkgs">
    <img src="https://img.shields.io/badge/NixOS-21.11-informational.svg?style=for-the-badge&logo=nixos&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/jx11r/nixdots">
    <img src="https://img.shields.io/github/repo-size/jx11r/nixdots?style=for-the-badge&logo=gitbook&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/jx11r/nixdots/stargazers">
    <img src="https://img.shields.io/github/stars/jx11r/nixdots?style=for-the-badge&logo=starship&color=B5E8E0&logoColor=D9E0EE&labelColor=302D41" />
  </a>
  <a href="https://github.com/jx11r/nixdots">
    <img src="https://badges.pufler.dev/visits/jx11r/nixdots?style=for-the-badge&logo=github&color=DDB6F2&logoColor=D9E0EE&labelColor=302D41" />
  </a>
</div><br>

<a href="https://nixos.org/">
  <img align="left" height="95" alt="NixOS" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg">
</a>

Hi, welcome to my NixOS configuration, you probably don't want something related to Nix,
in this repository I only have my base system and small configurations that I had in my
[Arch Linux](https://github.com/jx11r/archdots) repository, I changed of distro because I wanted
a reproducible system and to forget a lot of configuration files, with NixOS I can have everything
in one place and it's very comfortable.

Finally, if you're looking for a specific config (check the links), here's a list of my full setup:
+ **OS**: NixOS
+ **WM**: [Qtile](https://github.com/jx11r/qtile)
+ **Bar**: Qtile's bar
+ **Shell**: [zsh](https://github.com/jx11r/nixdots/tree/master/home/config/zsh) (with starship)
+ **Terminal**: ST, WezTerm
+ **Editor:** [Neovim](https://github.com/jx11r/nvim), [Doom Emacs](https://github.com/hlissner/doom-emacs/)
+ **File Manager**: Thunar
+ **Launcher**: [Rofi](https://github.com/jx11r/nixdots/tree/master/home/config/rofi), dmenu

## Table of Contents
> - [Nixdots](#nixdots)
>   - [Why NixOS?](#why-nixos)
>   - [Installation](#installation)
>     - [Script](#script)
>     - [Manual](#manual)

## Why NixOS?
- **Reproducible**
  - Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so if a package works on one machine, it will also work on another.
- **Declarative**
  - Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you’re using.
- **Reliable**
  - Nix ensures that installing or upgrading one package cannot break other packages. It allows you to roll back to previous versions, and ensures that no package is in an inconsistent state during an upgrade.

## Installation
1. Get the latest NixOS [ISO](https://nixos.org/download.html#nixos-iso) and boot into the installer/environment.
2. Format and mount your disks (boot partition in /mnt/boot/efi).
3. Follow these commands:

### Script
```shell
# Get into a Nix shell with git
nix-shell -p git

# Clone this repository and access it
git clone https://github.com/jx11r/nixdots.git /mnt/etc/nixos
cd !$

# Run the installer
./install.sh
```

### Manual
```shell
# Get into a Nix shell with git
nix-shell -p git

# Clone this repository and access it
git clone https://github.com/jx11r/nixdots.git /mnt/etc/nixos
cd !$

# Remove old hardware configuration
rm system/hardware-configuration.nix

# Generate a new hardware configuration and move it
nixos-generate-config --root /mnt
mv hardware-configuration.nix system/

# Add unstable channel
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --update

# Finally install the system
nixos-install
```

- Add the root password and reboot the system.
- Log in as your normal user, the initial password is "nix".
