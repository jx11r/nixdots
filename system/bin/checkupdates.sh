#!/usr/bin/env bash

set -euo pipefail

reset="\033[0m"
red="\033[1;31m"
blue="\033[1;34m"

# https://blog.tjll.net/previewing-nixos-system-updates/
check_updates() {
  local tempdir
  tempdir=$(mktemp -d /tmp/tmp.updateinfo.XXX)

  git clone --reference /etc/nixos /etc/nixos "$tempdir" &>/dev/null
  cd "$tempdir"

  nix flake lock --update-input nixpkgs &>/dev/null
  nix build ".#nixosConfigurations.$(hostname).config.system.build.toplevel" &>/dev/null
  nix store diff-closures /run/current-system ./result | awk '/[0-9] →|→ [0-9]/ && !/nixos/' || true

  cd ~-
  rm -rf "$tempdir"

  exit 0
}

if ! ping -c 1 "8.8.8.8" &> /dev/null; then
  echo -e "${red}error:${reset} no internet connection detected"
  exit 1
fi

if [[ ! -e /etc/nixos/flake.lock ]]; then
  echo -e "${red}error:${reset} unable to locate ${blue}flake.lock${reset} in ${blue}/etc/nixos${reset}"
  exit 1
fi

check_updates
