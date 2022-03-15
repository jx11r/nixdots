#!/bin/sh

reset="\033[0m"
black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
magenta="\033[1;35m"
cyan="\033[1;36m"
white="\033[1;37m"

cl=${reset}
cl0=${black}
cl1=${red}
cl2=${green}
cl3=${yellow}
cl4=${blue}
cl5=${magenta}
cl6=${cyan}
cl7=${white}

# Installation
rm hardware-configuration.nix

nixos-generate-config --root /mnt

nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
nix-channel --update

nixos-install

printf "\n"
echo -e "${cl1}Don't forget to run ${cl2}nixos ${cl5}--post-install ${cl1}after reboot to finish the system setup.${cl}"
echo -e "${cl1}The initial user password is: ${cl7}nix${cl}"
