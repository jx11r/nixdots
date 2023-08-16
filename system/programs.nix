{ outputs, config, pkgs, ... }:

{
  imports = [
    outputs.nixosModules.nm-applet
  ];

  programs = {
    dconf.enable = true;
    gnupg.agent.enable = true;
    htop.enable = true;
    nm-applet.enable = true;
    npm.enable = true;
    seahorse.enable = true;
    ssh.startAgent = true;

    git = import ./config/git.nix { };
    zsh = import ./config/zsh.nix { inherit pkgs; };

    thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
}
