{ inputs, config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./programs.nix

    ./services.nix
    ./systemd.nix
  ];

  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  sound.enable = true;

  boot.loader = {
    timeout = 15;
    systemd-boot.enable = false;

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
    };

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  environment = {
    binsh = "${pkgs.bash}/bin/bash";
    localBinInPath = true;

    variables = {
      EDITOR = "${pkgs.neovim}/bin/nvim";
      "_JAVA_OPTIONS" = "-Dawt.useSystemAAFontSettings=lcd";
      "_JAVA_AWT_WM_NONREPARENTING" = "1";
    };
  };

  networking = {
    hostName = "nixos";
    useDHCP = false;
    wireless.enable = false;

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };

  security = {
    pam.services.lightdm.enableGnomeKeyring = true;
    polkit.enable = true;
    rtkit.enable = true;

    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = "America/Mexico_City";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.jx11r = {
      description = "Jair Sanchez";
      extraGroups = [ "wheel" "video" ];
      home = "/home/jx11r";
      isNormalUser = true;
      password = "nixos";
      # openssh.authorizedKeys.keys = [ ];
    };
  };

  system.stateVersion = "23.05";
}
