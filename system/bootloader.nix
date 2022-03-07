{ pkgs, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    cleanTmpDir = true;
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "loglevel=3"
      # "quiet"
      "acpi_backlight=vendor"
    ];

    loader = {
      timeout = 15;

      grub = {
        enable = true;
        version = 2;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        gfxmodeEfi = "1360x768";
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };
}
