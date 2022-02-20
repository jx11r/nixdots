{
  imports = [
    # Hardware Configuration
    ./hardware-configuration.nix
    # ./xorg.gpu/nvidia.nix
    # ./xorg.gpu/amd.nix

    # Modules
    ./bootloader.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
  ];

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
