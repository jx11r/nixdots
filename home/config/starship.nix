{ }:

{
  add_newline = false;
  cmd_duration.min_time = 15000;
  line_break.disabled = false;
  package.disabled = true;
  scan_timeout = 10;

  character = {
    success_symbol = "[λ](bold yellow)";
    error_symbol = "[λ](bold red)";
  };

  directory = {
    truncation_length = 2;
    read_only = "";
  };

  fill.symbol = " ";

  format = ''
    $directory$git_branch$git_status$cmd_duration$fill$all$character
  '';

  git_branch.format = "[$symbol$branch]($style) ";

  git_status = {
    ahead   = "";
    behind  = "";
    deleted = "-";
  };
}
