{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  enableGlobalCompInit = true;
  enableLsColors = true;
  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;
  histSize = 10000;
  promptInit = ''eval "$(${pkgs.starship}/bin/starship init zsh)"'';
  interactiveShellInit = "ZLE_RPROMPT_INDENT=0";

  setOptions = [
    "EXTENDED_HISTORY"
    "HIST_EXPIRE_DUPS_FIRST"
    "HIST_IGNORE_ALL_DUPS"
    "HIST_IGNORE_DUPS"
    "HIST_IGNORE_SPACE"
    "HIST_REDUCE_BLANKS"
    "HIST_SAVE_NO_DUPS"
    "HIST_VERIFY"
    "INC_APPEND_HISTORY"
    "INTERACTIVE_COMMENTS"
    "SHARE_HISTORY"
  ];

  syntaxHighlighting = {
    highlighters = [ "main" "brackets" ];

    styles = {
      "unknown-token" = "fg=red";
      "reserved-word" = "fg=cyan";
      "alias" = "fg=green";
      "suffix-alias" = "fg=green";
      "global-alias" = "fg=green";
      "builtin" = "fg=cyan";
      "function" = "fg=cyan";
      "command" = "fg=green";
      "precommand" = "fg=magenta";
      "commandseparator" = "fg=red";
      "hashed-command" = "fg=cyan";
      "autodirectory" = "fg=white";
      "path" = "fg=blue";
      "globbing" = "fg=magenta";
      "history-expansion" = "fg=magenta";
      "command-substitution-unquoted" = "fg=white";
      "command-substitution-quoted" = "fg=white";
      "command-substitution-delimiter" = "fg=magenta";
      "command-substitution-delimiter-unquoted" = "fg=magenta";
      "command-substitution-delimiter-quoted" = "fg=magenta";
      "process-substitution" = "fg=white";
      "process-substitution-delimiter" = "fg=magenta";
      "arithmetic-expansion" = "fg=magenta";
      "single-hyphen-option" = "fg=magenta";
      "double-hyphen-option" = "fg=magenta";
      "back-quoted-argument" = "fg=white";
      "back-quoted-argument-unclosed" = "fg=white";
      "back-quoted-argument-delimiter" = "fg=magenta";
      "single-quoted-argument" = "fg=yellow";
      "single-quoted-argument-unclosed" = "fg=yellow";
      "double-quoted-argument" = "fg=yellow";
      "double-quoted-argument-unclosed" = "fg=yellow";
      "dollar-quoted-argument" = "fg=magenta";
      "dollar-quoted-argument-unclosed" = "fg=magenta";
      "dollar-double-quoted-argument" = "fg=magenta";
      "back-double-quoted-argument" = "fg=magenra";
      "back-dollar-quoted-argument" = "fg=red";
      "assign" = "fg=magenta";
      "redirection" = "fg=magenta";
      "named-fd" = "fg=magenta";
      "numeric-fd" = "fg=cyan";
    };
  };
}
