{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.xserver.windowManager.qtile;
in

{
  disabledModules = [ "services/x11/window-managers/qtile.nix" ];

  options = {
    services.xserver.windowManager.qtile.enable = mkEnableOption "qtile";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.session = [{
      name = "qtile";
      start = ''
        ${pkgs.unstable.qtile}/bin/qtile start &
        waitPID=$!
      '';
    }];

    environment.systemPackages = [ pkgs.unstable.qtile ];
  };
}
