#!/bin/sh

# Shell Colors
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

# NixOS Script
if [ "$(id -u)" != "0" ]; then
    out="This script must be run as root."

    echo -e "${cl1}WARNING: ${out}${cl}" 1>&2
    exit 1
fi

initial_help() {
  local options="${cl5}[-h] [--help]${cl}"

  echo -e "${cl1}Usage:${cl} ${cl2}nixos${cl} ${options}"
}

help() {
  local tabs="             "

  local options="[--install <arg>] [-r | --rebuild] [--update] [--upgrade]"
  options+="\n${tabs}[-c <path> | --config <path>] [--clean] [--skip <arg>]"
  options+="\n${tabs}[--generate-config] [--clone <arg> | --remove <arg>]"
  options+="\n${tabs}[--all] [--ssh] [--pull] [-u] [-v | --version]"

  initial_help
  echo -e "${tabs}${cl5}${options}${cl}"  

  printf "\n"

  echo -e "${cl7}Do --help to see more information.${cl}"
}

full_help() {
  help
  printf "\n"

  echo -e "${cl7}Hi, welcome to my ${cl4}NixOS${cl7} system!${cl6}  ${cl}"
  echo -e "${cl7}This is a little guide about my installer/manager script.${cl}"

  echo -e "
${cl3}Options:${cl}
    ${cl5}--install ${cl7}<arg>${cl}
        # ...

    ${cl5}-r, --rebuild${cl}
        # ...

    ${cl5}--update${cl}
        # ...

    ${cl5}--upgrade${cl}
        # ...

    ${cl5}-c, --config ${cl7}<path>${cl}
        # ...

    ${cl5}--clean${cl}
        # ...

    ${cl5}--skip ${cl7}<arg>${cl}
        # ...

    ${cl5}--generate-config${cl}
        # ...

    ${cl5}--clone, --remove ${cl7}<arg>${cl}
        # ...

    ${cl5}--all${cl}
        # ...

    ${cl5}--ssh${cl}
        # ...

    ${cl5}--pull${cl}
        # ...

    ${cl5}-u${cl}
        # ...

    ${cl5}-v, --version${cl}
        # ...
"
}

options=$(getopt -o "hruvc:" -l "install:,rebuild,update,upgrade \
  ,config:,clean,skip,generate-config,clone,remove \
  ,all,ssh,pull,version,help" \
  --name "NixOS" -- "$@")

eval set -- "$options"

[ $? -eq 0 ] || {
  initial_help
  exit 1
}

# Temp output
temp="${cl1}Coming soon...${cl}"

while true; do
  case "$1" in
    -h                ) ACTION="help" ;;
    --help            ) ACTION="fullhelp" ;;
    --install         ) echo -e $temp ;;
    -r | --rebuild    ) ACTION="rebuild" ;;
    --update          ) ACTION="update" ;;
    --upgrade         ) ACTION="upgrade" ;;
    -c | --config     ) shift; CONFIG="$1" ;;
    --clean           ) ACTION="clean" ;;
    --skip            ) shift; SKIP="$1" ;;
    --generate-config ) echo -e $temp ;;
    --clone           ) echo -e $temp ;;
    --remove          ) echo -e $temp ;;
    --all             ) ALL=true ;;
    --ssh             ) SSH=true ;;
    --pull            ) PULL=true ;;
    -u                ) UPDATE=true ;;
    -v | --version    ) ACTION="version" ;;

    --) shift; break ;;
    *) break ;;
  esac
  shift
done

# Actions
rebuild() {
  [ $PULL ] && {
    pushd /etc/nixos
    git pull origin master
  }

  if [ $UPDATE ]; then
    if [ $CONFIG ]; then
      nixos-rebuild switch --upgrade \
      -I nixos-config=$CONFIG
    else
      nixos-rebuild switch --upgrade
    fi
  else
    if [ $CONFIG ]; then
      nixos-rebuild switch \
      -I nixos-config=$CONFIG
    else
      nixos-rebuild switch
    fi
  fi
}

update() {
  pushd /etc/nixos
  git fetch origin master
  nix-channel --update
}

upgrade() {
  pushd /etc/nixos
  git merge origin master
  nixos-rebuild switch
}

clean() {
  if [ $ALL ]; then
    nix-collect-garbage -d
    nix optimise-store
  else
    nix-collect-garbage
  fi
}

version() {
  echo -e "${cl4}NixOS version:${cl}"
  nixos-version

  printf "\n"

  echo -e "${cl6}Nix version:${cl}"
  nix --version
}

if [[ -n $ACTION ]]; then
  case $ACTION in
    help     ) help ;;
    fullhelp ) full_help ;;
    rebuild  ) rebuild ;;
    update   ) update ;;
    upgrade  ) upgrade ;;
    clean    ) clean ;;
    version  ) version ;;
  esac
else
  initial_help
fi

exit 0;
