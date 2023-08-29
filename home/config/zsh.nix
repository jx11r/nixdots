{ pkgs }:

{
  enable = true;
  autocd = true;
  enableCompletion = false;

  history = {
    expireDuplicatesFirst = true;
    extended = true;
    ignoreAllDups = true;
    ignoreDups = true;
    ignoreSpace = true;
    save = 10000;
    share = true;
    size = 10000;
  };

  plugins = [
    {
      name = "zsh-nix-shell";
      file = "nix-shell.plugin.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "chisui";
        repo = "zsh-nix-shell";
        rev = "v0.7.0";
        sha256 = "sha256-oQpYKBt0gmOSBgay2HgbXiDoZo5FoUKwyHSlUrOAP5E=";
      };
    }
  ];

  initExtraFirst = ''
    globalias() {
      local word=''${''${(Az)LBUFFER}[-1]}

      [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]] && {
        zle _expand_alias
        zle expand-word
      }

      zle self-insert
    }

    zle -N globalias
    bindkey " " globalias
    bindkey "^[ " magic-space
    bindkey -M isearch " " magic-space
  '';

  initExtraBeforeCompInit = ''
    GLOBALIAS_FILTER_VALUES=(
      cd.. cat cl dload ls ll tree grep vi
    )
  '';

  initExtra = ''
    bindkey '^ ' autosuggest-accept                    # ctrl + space
    bindkey '^[[7~' beginning-of-line                  # ctrl + a
    bindkey '^[[8~' end-of-line                        # ctrl + e
    bindkey '^[[2~' overwrite-mode                     # insert
    bindkey '^[[3~' delete-char                        # delete
    bindkey '^[[C'  forward-char                       # right
    bindkey '^[[D'  backward-char                      # left
    bindkey '^[[5~' history-beginning-search-backward  # page up
    bindkey '^[[6~' history-beginning-search-forward   # page down
    bindkey '^[[1;5D' backward-word                    # ctrl + right
    bindkey '^[[1;5C' forward-word                     # ctrl + left
    bindkey '^H' backward-kill-word                    # ctrl + backspace
    bindkey '^K' backward-kill-line                    # ctrl + k
    bindkey '^[[Z' undo                                # shift + tab
    bindkey '^L' clear-screen                          # ctrl + l
  '';

  shellAliases = {
    mktar = "tar cfvz";
    untar = "tar xvf";
    vs = "code --profile";
    pf = "nix-prefetch-url";
    pfg = "nix-prefetch-git";

    Xp = "Xephyr -screen 1920x1080 :1 &";
    Xp1 = "Xephyr -screen 912x598 :1 &";
    Xp2 = "Xephyr -screen 912x498 -screen 912x498 +xinerama :1 &";
    DS = "DISPLAY=:1.0 QTILE_XEPHYR=1 qtile start -l INFO";

    ga = "git add";
    gb = "git branch";
    gc = "git clone";
    gd = "git diff";
    gf = "git fetch";
    gl = "git log --oneline";
    gm = "git merge";
    gr = "git restore";
    gs = "git status";
    gco = "git checkout";
    grb = "git rebase";
    grm = "git remote";
    grs = "git reset";
    gst = "git stash";
    gsw = "git switch";
    gcm = "git commit -m";
    gcma = "git commit -a -m";
    gpll = "git pull";
    gpsh = "git push";
  };

  shellGlobalAliases = {
    D = "2>/dev/null";
    G = "| grep";
    L = "| less";
  };
}
