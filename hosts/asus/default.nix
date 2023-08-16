{ config, pkgs, ... }:

{
  imports = [ ./hardware.nix ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ ];

    loader = {
      efi.efiSysMountPoint = "/boot/efi";

      grub = {
        gfxmodeEfi = "1920x1080";
        useOSProber = true;
      };
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
