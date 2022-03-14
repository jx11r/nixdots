{ pkgs, ... }:

{
  imports = [
    # Hardware Configuration
    ./hardware-configuration.nix
    # ./gpu/intel.nix
    # ./gpu/nvidia.nix
    # ./gpu/amd.nix

    # Modules
    ./bootloader.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  environment.binsh = "${pkgs.bash}/bin/bash";

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
