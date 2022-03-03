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
    $directory$git_branch$git_status$nix_shell$cmd_duration
    $character
  '';

  right_format = "$all";

  git_branch.format = "at [$symbol$branch]($style) ";

  git_status = {
    ahead   = "";
    behind  = "";
    deleted = "-";
  };

  java.format   = "[\${symbol}(\${version})]($style)";
  nodejs.format = "[$symbol($version)]($style)";
  lua.format    = "[$symbol($version)]($style)";
  php.format    = "[$symbol($version)]($style)";
  python.format = "[\${symbol}\${pyenv_prefix}(\${version})( \($virtualenv\))]($style)";
  rust.format   = "[$symbol($version)]($style)";
}
