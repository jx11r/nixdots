{ }:

let
  font = "Mononoki Nerd Font";
  colorscheme = (import ./material_ocean.nix);
in

{
  env.TERM = "xterm-256color";
  colors = colorscheme;

  font = {
    normal = {
      family = font;
      style = "Regular";
    };

    bold = {
      family = font;
      style = "Bold";
    };

    italic = {
      family = font;
      style = "Italic";
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
