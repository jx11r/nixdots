{ config, pkgs, ... }:

{
  imports = [
    ../configuration.nix

    # generated by nixos-generate-config
    ./hardware.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelParams = [ "quiet" ];

    loader.grub = {
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
    };
  };

  console = {
    keyMap = "us";
    useXkbConfig = false;
  };

  hardware = {
    bluetooth.enable = false;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;

      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
        libvdpau-va-gl
        vaapiIntel
        vaapiVdpau
      ];
    };
  };

  services = {
    blueman.enable = false;
    printing.enable = false;

    xserver = {
      layout = "us";
      libinput.enable = false;
      videoDrivers = [ "intel" ];
    };
  };
}
