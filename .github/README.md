<div align="center">
  <h1>Nixdots</h1>
  <a href="https://github.com/nixos/nixpkgs">
    <img src="https://img.shields.io/badge/NixOS-21.11-informational.svg?style=for-the-badge&logo=nixos&color=b4befe&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
  <a href="https://github.com/jx11r/nixdots">
    <img src="https://img.shields.io/github/repo-size/jx11r/nixdots?style=for-the-badge&logo=gitbook&color=f2cdcd&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
  <a href="https://github.com/jx11r/nixdots/stargazers">
    <img src="https://img.shields.io/github/stars/jx11r/nixdots?style=for-the-badge&logo=starship&color=94e2d5&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
  <a href="https://github.com/jx11r/nixdots">
    <img src="https://badges.pufler.dev/visits/jx11r/nixdots?style=for-the-badge&logo=github&color=cba6f7&logoColor=cdd6f4&labelColor=1e1e2e" />
  </a>
</div><br>

<a href="https://nixos.org">
  <img align="right" height="125" alt="NixOS" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg" />
</a>

+ **WM**: [Qtile](https://github.com/jx11r/qtile)
+ **Bar**: Qtile's Bar
+ **Shell**: [zsh](https://github.com/jx11r/nixdots/tree/main/home/config/zsh) (with [starship](/home/config/starship.nix))
+ **Terminal**: WezTerm
+ **Editor:** [Neovim](https://github.com/jx11r/nvim), [Doom Emacs](https://github.com/hlissner/doom-emacs)
+ **File Manager**: Thunar
+ **Launcher**: [Rofi](https://github.com/jx11r/nixdots/tree/main/home/config/rofi)

## Table of Contents
> - [Nixdots](#nixdots)
>   - [Why Nix?](#why-nix)
>   - [Installation](#installation)
>     - [Script](#script)
>     - [Manual](#manual)
>   - [Roadmap](#roadmap)
>   - [Special Thanks](#special-thanks)

## Why Nix?
- **Reproducible**
  - Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so if a package works on one machine, it will also work on another.
- **Declarative**
  - Nix makes it trivial to share development and build environments for your projects, regardless of what programming languages and tools you’re using.
- **Reliable**
  - Nix ensures that installing or upgrading one package cannot break other packages. It allows you to roll back to previous versions, and ensures that no package is in an inconsistent state during an upgrade.

## Installation
1. Get the [NixOS ISO](https://nixos.org/download.html#nixos-iso) and boot into the installer.
2. Format and mount your disks (boot partition in /mnt/boot/efi).
3. Follow these commands:

### Script
```shell
# Get git with Nix Shell
nix-shell -p git

# Clone this repository and access it
git clone https://github.com/jx11r/nixdots.git /mnt/etc/nixos
cd !$

# Run the installer script
./install.sh
```

### Manual
```shell
# Get git with Nix Shell
nix-shell -p git

# Clone this repository and access it
git clone https://github.com/jx11r/nixdots.git /mnt/etc/nixos
cd !$

# Remove old hardware configuration
rm hardware-configuration.nix

# Generate a new hardware configuration
nixos-generate-config --root /mnt

# Add unstable channel
nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --update

# Finally install the system
nixos-install
```

- Add the root password and reboot the system.
- Log in with your user, the initial password is *nix*.
- Once inside, run `nixos --post-install` to finish the system setup.

## Roadmap
- [x] ~~Finish my NixOS setup~~
- [x] ~~Finish my custom script~~
- [x] ~~Add an installer script~~
- [ ] Add gallery section (screenshots)
- [ ] Implement Nix Flakes (maybe)

## Special Thanks
- [nixdots](https://github.com/HBlanqueto/nixdots) by **HBlanqueto**
- [dotfiles](https://github.com/adrianrl99/dotfiles) by **adrianrl99**

<p align="center">
  <a href="https://github.com/jx11r/nixdots/blob/main/LICENSE">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=GPL-3.0&colorA=1e1e2e&colorB=b4befe"/>
  </a>
</p>

