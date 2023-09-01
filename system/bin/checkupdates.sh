#!/usr/bin/env bash

set -euo pipefail

reset="\033[0m"
red="\033[1;31m"
blue="\033[1;34m"

check_updates() {
  tempdir=$(mktemp -d /tmp/tmp.updateinfo.XXX)

  git clone --reference /etc/nixos /etc/nixos $tempdir &>/dev/null
  cd $tempdir

  nix flake lock --update-input nixpkgs &>/dev/null
  nix build ".#nixosConfigurations.$(hostname).config.system.build.toplevel" &>/dev/null
  nix store diff-closures /run/current-system ./result | awk '/[0-9] →|→ [0-9]/ && !/nixos/' || echo

  cd ~-
  rm -rf "$tempdir"

  exit 0
}

[[ -e /etc/nixos/flake.lock ]] && check_updates

echo -e "${red}error:${reset} unable to locate ${blue}flake.lock${reset} in ${blue}/etc/nixos${reset}"
exit 1
