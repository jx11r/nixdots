{ pkgs }:

with pkgs;

[
  brave
  brightnessctl
  discord
  evince
  gh
  gimp
  gnome.gnome-screenshot
  gparted
  gpicview
  lxappearance
  keepassxc
  nerdfix
  nil
  nixpkgs-fmt
  obs-studio
  onedrive
  pamixer
  pavucontrol
  playerctl
  rofi
  stylua
  telegram-desktop
  vlc
  vscode
  wezterm
  whatsapp-for-linux
  xcolor

  # global python packages
  (python3.withPackages (pkg: with pkg; [
    black
    mypy
    pip
    virtualenv
  ]))
]
