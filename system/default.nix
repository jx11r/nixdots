{ pkgs, ... }:

{
  imports = [
    ../hardware-configuration.nix
    # ./gpu/nvidia.nix
    # ./gpu/amd.nix
    ./gpu/intel.nix

    ./bootloader.nix
    ./packages.nix
    ./services.nix
  ];

  networking = {
    hostName = "nixos";
    useDHCP = false;

    # interfaces.ens33 = {
    #   useDHCP = true;
    # };

    wireless = {
      enable = false;
      iwd.enable = true;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

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
