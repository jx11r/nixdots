{ config, pkgs, ... }:

{
  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.jx11r = {
      isNormalUser = true;
      description = "Jair Sánchez";
      home = "/home/jx11r";
      extraGroups = [ "Wheel" ];

      packages = with pkgs; [
        # . . .
      ];
    };
  };
}
