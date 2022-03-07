{ pkgs, ... }:

{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  users = {
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;

    users.jx11r = {
      home = "/home/jx11r";
      description = "Jair Sánchez";
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      password = "nix";

      packages = with pkgs; [
        # ...
      ];
    };
  };
}
