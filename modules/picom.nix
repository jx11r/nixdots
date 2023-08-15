{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.picom;
in

{
  disabledModules = [ "services/x11/picom.nix" ];

  options.services.picom = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = lib.mdDoc ''
        Whether or not to enable Picom as the X.org composite manager.
      '';
    };
  };

  config = mkIf cfg.enable {
    systemd.user.services.picom = {
      description = "Picom composite manager";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.picom}/bin/picom";
        Restart = "always";
        RestartSec = 3;
      };
    };

    environment.systemPackages = [ pkgs.picom ];
  };
}

