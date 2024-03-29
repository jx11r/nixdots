{}:

{
  add_newline = false;
  cmd_duration.min_time = 15000;
  line_break.disabled = false;
  package.disabled = true;
  fill.symbol = " ";
  nix_shell.symbol = "❄️ ";

  character = {
    success_symbol = "[λ](bold purple)";
    error_symbol = "[λ](bold red)";
  };

  directory = {
    truncation_length = 2;
    read_only = " (read-only)";
  };

  git_status = {
    ahead = "";
    behind = "";
    deleted = "-";
  };
}
