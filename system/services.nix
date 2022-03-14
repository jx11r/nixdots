{ pkgs, ... }:

{
  imports = [
    ./modules/qtile.nix
  ];

  services = {
    printing.enable = false;
    openssh.enable = true;
    gvfs.enable = true;
    # picom.enable = true;

    xserver = {
      enable = true;
      layout = "us";
      libinput.enable = true;

      displayManager = {
        lightdm.enable = false;
        startx.enable = true;
        sddm.enable = false;

        defaultSession = "none+qtile";
      };

      windowManager = {
        qtile = {
          enable = true;
          package = pkgs.unstable.qtile;
          configFile = null;
          backend = "x11";
        };

        awesome = {
          enable = false;
        };
      };
    };
  };
}
