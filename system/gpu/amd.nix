{ config, pkgs, lib, ... }:

{
  # Xserver Configuration
  services.xserver = {
    videoDrivers = [ "amdgpu" ];

    extraConfig = ''
      Section "Device"
        Identifier "Radeon"
        Driver "radeon"
        Option "TearFree" "on"
      EndSection
      Section "Device"
        Identifier "AMD"
        Driver "amdgpu"
        Option "TearFree" "true"
      EndSection
    '';
  };

  # Hardware Acceleration
  hardware.opengl = {
    enable = true;
    driSupport = true;

    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # For 32 bit applications
  # hardware.opengl.driSupport32Bit = true;
}
