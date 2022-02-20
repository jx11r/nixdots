{
  imports = [
    ./options/qtile.nix
  ];

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
}
