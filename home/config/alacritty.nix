{ }:

let
  font = "Mononoki Nerd Font";

  material-ocean = {
    primary = {
      background = "#0f101a";
      foreground = "#c5c9de";
    };

    normal = {
      black   = "#181a29";
      red     = "#f07178";
      green   = "#cdea9f";
      yellow  = "#ffd47e";
      blue    = "#93bbff";
      magenta = "#d3a7ee";
      cyan    = "#98e4ff";
      white   = "#bfd5de";
    };

    bright = {
      black   = "#282a40";
      red     = "#eb7f84";
      green   = "#e0ffad";
      yellow  = "#ffee7e";
      blue    = "#a3c5ff";
      magenta = "#d6afed";
      cyan    = "#98fffd";
      white   = "#d1e5ed";
    };
  };
  
in

{
  colors = material-ocean;

  font = {
    normal = {
      family = font;
      style = "Regular";
    };

    bold = {
      family = font;
    };

    italic = {
      family = font;
    };

    size = 10.5;
  };

  window = {
    padding = {
      x = 12;
      y = 10;
    };

    opacity = 1.0;
  };

  scrolling = {
    multiplier = 3;
  };

  cursor = {
    style = {
      shape = "Block";
    };
  };

  mouse = {
    hide_when_typing = true;
  };
}
