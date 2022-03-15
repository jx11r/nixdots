{ pkgs, ... }:

{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    cleanTmpDir = true;
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "loglevel=3"
      # "quiet"
      # "acpi_backlight=vendor"
    ];

    loader = {
      timeout = 15;

      systemd-boot = {
        enable = false;
        configurationLimit = 2;
        consoleMode = "max";
      };

      grub = {
        enable = true;
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
