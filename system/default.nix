{ pkgs, ... }:

{
  imports = [
    # Hardware Configuration
    ./hardware-configuration.nix
    # ./x.gpu/nvidia.nix
    # ./x.gpu/amd.nix

    # Modules
    ./bootloader.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  environment.binsh = "${pkgs.dash}/bin/dash";

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
