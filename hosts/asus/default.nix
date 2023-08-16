{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ ];

    loader = {
      efi.efiSysMountPoint = "/boot/efi";
      grub.useOSProber = true;
      grub2-theme.screen = "1080p";
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

  networking = {
    useDHCP = false;
    wireless.enable = false;
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
