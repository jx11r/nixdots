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

    bash = {
      enableCompletion = true;
      enableLsColors = true;
      promptInit = ''eval "$(${pkgs.starship}/bin/starship init bash)"'';
    };

    thunar = {
      enable = true;

      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };

  environment.shellAliases = {
    "cd.." = "cd ..";
    cat = "bat";
    cl = "clear";
    dload = "curl -O";
    fetch = "neofetch";
    ls = "exa --group-directories-first";
    ll = "exa -la --group-directories-first";
    tree = "exa -T";
    grep = "grep --color=auto";
    vi = "nvim";
  };
}
