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
      isNormalUser = true;
      description = "Jair Sánchez";
      home = "/home/jx11r";
      extraGroups = [ "wheel" ];
      password = " ";

      packages = with pkgs; [
        # ...
      ];
    };
  };
}
