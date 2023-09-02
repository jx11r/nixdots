{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.grub2-themes.nixosModules.default

    ./nix.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./systemd.nix
  ];

  nixpkgs = {
    config.allowUnfree = true;
    overlays = import ../overlays { inherit inputs; };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  sound.enable = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = false;
    timeout = 60;

    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
    };

    grub2-theme = {
      enable = true;
      footer = true;
      icon = "color";
      theme = "stylish";
    };
  };

  environment = {
    binsh = "${pkgs.bash}/bin/bash";
    localBinInPath = true;
    pathsToLink = [ "/share/zsh" ];

    variables = {
      EDITOR = "${pkgs.nano}/bin/nano";
      "_JAVA_OPTIONS" = "-Dawt.useSystemAAFontSettings=lcd";
      "_JAVA_AWT_WM_NONREPARENTING" = "1";
    };
  };

  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };

  security = {
    pam.services.sddm.enableGnomeKeyring = true;
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

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = true;

    users.jx11r = {
      description = "jx11r";
      extraGroups = [ "wheel" "video" ];
      home = "/home/jx11r";
      isNormalUser = true;
      password = "nixos";
      packages = import ../home/packages.nix pkgs;

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHNzdmYSFq5Bveey8CVo4+QCPAIDV4Cx0BF1Tjk1ngst jx11r@hotmail.com"
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  system = {
    activationScripts = {
      postInstallSddm = lib.stringAfter [ "users" ] ''
        ${pkgs.acl}/bin/setfacl -m u:sddm:x /home/jx11r
        ${pkgs.acl}/bin/setfacl -m u:sddm:r /home/jx11r/.face.icon || true
      '';
    };

    stateVersion = "23.05";
  };
}
