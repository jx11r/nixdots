{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./systemPackages.nix
      ./user.nix
    ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    cleanTmpDir = true;
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      grub = {
        enable = true;
        version = 2;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = false;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  nix = {
    optimise.automatic = true;
    useSandbox = false;

    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  networking = {
    hostName = "nixos";
    # wireless.enable = true;
    # useDHCP = false;

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };

    # interfaces.ens33 = {
    #   useDHCP = true;
    # };
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

  services = {
    printing.enable = false;
    openssh.enable = true;
    gvfs.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;

      displayManager = {
        lightdm.enable = false;
        startx.enable = false;
        sddm.enable = true;

        defaultSession = "none+qtile";
      };

      windowManager = {
        qtile.enable = true;
      };
    };
  };

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;

    daemon.config = {
      flat-volumes = "no";
    };
  };

  system.stateVersion = "21.11";
}
