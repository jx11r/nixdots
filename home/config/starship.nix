{ }:

{
  add_newline = false;
  scan_timeout = 10;
  line_break.disabled = false;

  character = {
    success_symbol = "[λ](bold yellow)";
    error_symbol = "[λ](bold red)";
  };

  cmd_duration = {
    disabled = false;
    min_time = 15000;
  };

  directory = {
    disabled = false;
    truncation_length = 2;
    read_only = "";
  };

  package = {
    disabled = true;
  };
}
