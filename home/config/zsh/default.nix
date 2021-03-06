{ }:

let
  shellAliases = {
    # System
    ppd    = "popd";
    pd     = "pushd";
    "cd.." = "cd ..";
    cl     = "clear";
    tar    = "tar -xf";
    dload  = "curl -O";
    grep   = "grep --color=auto";

    # Files
    ls     = "exa --group-directories-first";
    ll     = "exa -la --group-directories-first";
    tree   = "exa -T ";
    cat    = "bat";
    vim    = "nvim";

    # Development
    gpsh   = "git push";
    gpll   = "git pull";
    gs     = "git status";
    gr     = "git restore";
    gd     = "git diff";
    ga     = "git add";
    gb     = "git branch";
    gco    = "git checkout";
    gsw    = "git switch";
    gcm    = "git commit -m";
    gcma   = "git commit -a -m";

    # Info
    fetch  = "neofetch";
    usage  = "du -h";

    # SSH
    ssh-start = "eval \"\$(ssh-agent -s)\"; ssh-start";
  };
in

{
  enable = true;
  promptInit = ''
    eval "$(starship init zsh)"
  '';

  histSize = 10000;
  histFile = "$HOME/.zsh_history"; 

  shellAliases = shellAliases;
  autosuggestions.enable = true;

  syntaxHighlighting = {
    enable = true;

    styles = {
      "unknown-token"        = "fg=red";
      "reserved-word"        = "fg=magenta";
      "alias"                = "fg=green";
      "suffix-alias"         = "fg=magenta";
      "builtin"              = "fg=green";
      "function"             = "fg=cyan";
      "command"              = "fg=green";
      "precommand"           = "fg=magenta";
      "commandseparator"     = "fg=magenta";
      "redirection"          = "fg=cyan";
      "path"                 = "fg=blue,underline";
      "single-hyphen-option" = "fg=magenta";
      "double-hyphen-option" = "fg=magenta";
    };
  };
}
