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
initial_help() {
  local options="${cl5}[-h | --help] [-v | --version] [--post-install]${cl}"

  echo -e "${cl1}Usage:${cl} ${cl2}nixos${cl} ${options}"
}

help() {
  local tabs="             "

  local options="[-r | --rebuild] [-u | --update] [--pull] [--generate]"
  options+="\n${tabs}[-c <path> | --config <path>] [--clean] [--all]"
  options+="\n${tabs}[--clone <arg> | --remove <arg>] [--fetch] [--ssh]"

  initial_help
  echo -e "${tabs}${cl5}${options}${cl}"  

  # printf "\n"
  # echo -e "${cl7}Do --help to see more information.${cl}"
}

full_help() {
  help
  printf "\n"

  echo -e "${cl7}Hi, welcome to my ${cl4}NixOS${cl7} system!${cl6}  ${cl}"
  echo -e "${cl7}This is a little guide about my installer/manager script.${cl}"

  echo -e "
${cl3}Options:${cl}
    ${cl5}-r, --rebuild${cl}
        # ...

    ${cl5}-u, --update${cl}
        # ...

    ${cl5}--pull${cl}
        # ...

    ${cl5}--generate${cl}
        # ...

    ${cl5}-c, --config ${cl7}<path>${cl}
        # ...

    ${cl5}--clean${cl}
        # ...

    ${cl5}--all${cl}
        # ...

    ${cl5}--clone, --remove ${cl7}<arg>${cl}
        # ...

    ${cl5}--fetch${cl}
        # ...

    ${cl5}--ssh${cl}
        # ...

    ${cl5}-v, --version${cl}
        # ...
"
}

options=$(getopt -o "hvruc:" -l "help,version,post-install, \
  rebuild,update,pull,generate,config:,clean,all, \
  clone:,remove:,fetch,ssh" \
  --name "NixOS" -- "$@")

eval set -- "$options"

[ $? -eq 0 ] || {
  help
  exit 1
}

# Temp output
temp="${cl1}Coming soon...${cl}"

while true; do
  case "$1" in
    -h | --help       ) ACTION="help" ;;
    -v | --version    ) ACTION="version" ;;
    --post-install    ) ACTION="post" ;;
    -r | --rebuild    ) ACTION="rebuild" ;;
    -u | --update     ) UPDATE=true ;;
    --pull            ) PULL=true ;;
    --generate        ) ACTION="generate" ;;
    -c | --config     ) shift; CONFIG="$1" ;;
    --clean           ) ACTION="clean" ;;
    --all             ) ALL=true ;;
    --clone           ) echo -e $temp ;;
    --remove          ) echo -e $temp ;;
    --fetch           ) ACTION="fetch" ;;
    --ssh             ) SSH=true ;;

    --) shift; break ;;
    *) break ;;
  esac
  shift
done

# Actions
version() {
  echo -e "${cl4}NixOS version:${cl}"
  nixos-version

  printf "\n"

  echo -e "${cl6}Nix version:${cl}"
  nix --version
}

post() {
  sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
  sudo nix-channel --update

  rm -rf ~/.config/qtile

  if [ $SSH ]; then
    git clone --depth 1 git@github.com:jx11r/qtile.git ~/.config/qtile
  else
    git clone --depth 1 https://github.com/jx11r/qtile.git ~/.config/qtile
  fi
}

rebuild() {
  [ $PULL ] && {
    pushd /etc/nixos
    sudo git pull origin master
  }

  if [ $UPDATE ]; then
    if [ $CONFIG ]; then
      sudo nixos-rebuild switch --upgrade \
      -I nixos-config=$CONFIG
    else
      sudo nixos-rebuild switch --upgrade
    fi
  else
    if [ $CONFIG ]; then
      sudo nixos-rebuild switch \
      -I nixos-config=$CONFIG
    else
      sudo nixos-rebuild switch
    fi
  fi
}

generate() {
  local dir="nixdots"

  if [[ $(pwd | grep -o "$dir$") == $dir ]]; then
    rm system/hardware-configuration.nix
    nixos-generate-config --dir .
    mv hardware-configuration.nix system/
  else
    echo -e "${cl1}You're not in the correct directory: ${cl6}nixdots${cl}"
  fi
}

clean() {
  if [ $ALL ]; then
    sudo nix-collect-garbage -d
    sudo nix optimise-store
  else
    sudo nix-collect-garbage
  fi
}

fetch() {
  pushd /etc/nixos
  sudo git pull origin master

  [ $ALL ] && {
    pushd ~/.config/qtile
    git pull origin master
  }
}

if [[ -n $ACTION ]]; then
  case $ACTION in
    help     ) help ;;
    version  ) version ;;
    post     ) post ;;
    rebuild  ) rebuild ;;
    generate ) generate ;;
    clean    ) clean ;;
    fetch    ) fetch ;;
  esac
else
  help
fi

exit 0;
