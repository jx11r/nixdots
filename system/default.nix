{ config, pkgs, ... }:

{
  imports = [
    # Hardware configuration
    ./hardware.nix
    # ./gpu/nvidia.nix
    # ./gpu/amd.nix

    # Modules
    ./boot.nix
    ./network.nix
    ./packages.nix
    ./services.nix
  ];

  nix = {
    optimise.automatic = true;
    useSandbox = false;

    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 1d";
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  programs.zsh.enable = true;

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time = {
    timeZone = "America/Mexico_City";
    hardwareClockInLocalTime = true;
  };

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;

    daemon.config = {
      flat-volumes = "no";
    };
  };
}
