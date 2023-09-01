{ outputs, config, pkgs, ... }:

{
  imports = [
    outputs.nixosModules.picom
  ];

  services = {
    acpid.enable = true;
    gnome.at-spi2-core.enable = true;
    gnome.gnome-keyring.enable = true;
    geoclue2.enable = true;
    gvfs.enable = true;
    logind.killUserProcesses = false;
    ntp.enable = true;
    picom.enable = true;
    thermald.enable = true;
    tumbler.enable = true;
    upower.enable = true;

    dbus = {
      enable = true;
      packages = [ pkgs.gcr ];
    };

    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        X11Forwarding = true;
      };
    };

    pipewire = {
      enable = true;
      jack.enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    xserver = {
      enable = true;

      displayManager = {
        sddm = {
          enable = true;
          autoNumlock = true;
          theme = "chili";
        };

        defaultSession = "none+qtile";
      };

      windowManager = {
        qtile = {
          enable = true;
          backend = "x11";
          extraPackages = pkg: with pkg; [
            iwlib
            qtile-extras
          ];
        };
      };
    };
  };
}
