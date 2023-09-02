{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.nm-applet;
in

{
  disabledModules = [ "programs/nm-applet.nix" ];

  options.programs.nm-applet = {
    enable = mkEnableOption (mdDoc "nm-applet");

    indicator = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Whether to use indicator instead of status icon.
        It is needed for Appindicator environments, like Enlightenment.
      '';
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.nm-applet = {
      description = "Network manager applet";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet ${optionalString cfg.indicator "--indicator"}";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };

    services.dbus.packages = [ pkgs.gcr ];
  };
}
