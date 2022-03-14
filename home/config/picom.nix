{ }:

''
  # --==[ Animations ]==--
  # transition-length = 300
  # transition-pow-x = 0.1
  # transition-pow-y = 0.1
  # transition-pow-w = 0.1
  # transition-pow-h = 0.1
  # size-transition = true


  # --==[ Corners ]==--
  corner-radius = 7.5;
  rounded-corners-exclude = [
    # "window_type = 'normal'",
    # "class_g = 'awesome'",
    # "class_g = 'URxvt'",
    # "class_g = 'XTerm'",
    # "class_g = 'kitty'",
    # "class_g = 'Alacritty'",
    # "class_g = 'st-256color'",
    # "class_g = 'Polybar'",
    # "class_g = 'code-oss'",
    # "class_g = 'TelegramDesktop'",
    # "class_g = 'firefox'",
    # "class_g = 'Thunderbird'"
  ];
  round-borders = 1;
  round-borders-exclude = [
    # "class_g = 'TelegramDesktop'",
  ];


  # --==[ Shadows ]==--
  shadow = false;
  # shadow-radius = 7;
  # shadow-opacity = .75
  # shadow-offset-x = -7;
  # shadow-offset-y = -7;
  # shadow-exclude = [
  #   "name = 'Notification'",
  #   "class_g = 'Conky'",
  #   "class_g ?= 'Notify-osd'",
  #   "class_g = 'Cairo-clock'",
  #   "class_g = 'slop'",
  #   "class_g = 'Polybar'",
  #   "_GTK_FRAME_EXTENTS@:c"
  # ];


  # --==[ Fading ]==--
  fading = false;
  # fade-in-step = 0.05;
  # fade-out-step = 0.05;
  # fade-exclude = [
      # "class_g = 'slop'"
  # ]
  # no-fading-openclose = false
  # no-fading-destroyed-argb = false


  # --==[ Transparency / Opacity ]==--
  inactive-opacity = 1.0;
  active-opacity = 1.0;
  frame-opacity = 0.8;
  popup_menu = { opacity = 0.8; }
  dropdown_menu = { opacity = 0.8; }
  inactive-opacity-override = false;
  # inactive-dim = 0.0
  # focus-exclude = [
  #   "class_g = 'Cairo-clock'",
  #   "class_g = 'Bar'",
  #   "class_g = 'slop'"
  # ];
  # inactive-dim-fixed = 1.0
  # opacity-rule = [
  #   "80:class_g     = 'Bar'",
  #   "100:class_g    = 'slop'",
  #   "100:class_g    = 'XTerm'",
  #   "100:class_g    = 'URxvt'",
  #   "100:class_g    = 'kitty'",
  #   "100:class_g    = 'Alacritty'",
  #   "80:class_g     = 'Polybar'",
  #   "100:class_g    = 'code-oss'",
  #   "100:class_g    = 'Meld'",
  #   "70:class_g     = 'TelegramDesktop'",
  #   "90:class_g     = 'Joplin'",
  #   "100:class_g    = 'firefox'",
  #   "100:class_g    = 'Thunderbird'"
  # ];


  # --==[ Background-Blurring ]==--
  # blur-method =
  # blur-size = 12
  # blur-deviation = false
  # blur-background = true;
  # blur-background-frame = false;
  # blur-background-fixed = false;
  # blur-kern = ""
  # blur-kern = "3x3box";
  # blur: {
  #   method = "kawase";
  #   strength = 5;
      # deviation = 1.0;
      # kernel = "11x11gaussian";
  #   background = false;
  #   background-frame = false;
  #   background-fixed = false;
  #   kern = "3x3box";
  # }
  # blur-background-exclude = [
      # "window_type = 'dock'",
      # "window_type = 'desktop'",
      # "class_g = 'URxvt'",
      #
      # prevents picom from blurring the background
  #   "class_g = 'slop'",
  #   "_GTK_FRAME_EXTENTS@:c"
  # ];


  # --==[ General Settings ]==--
  # daemon = false
  # Specify the backend to use: `xrender`, `glx`, or `xr_glx_hybrid`.
  experimental-backends = true;
  backend = "glx";
  vsync = true
  # dbus = false
  mark-wmwin-focused = true;
  mark-ovredir-focused = true;
  detect-rounded-corners = true;
  detect-client-opacity = true;
  refresh-rate = 0
  # use-ewmh-active-win = false
  # unredir-if-possible = false
  # unredir-if-possible-delay = 0
  # unredir-if-possible-exclude = []
  detect-transient = true
  detect-client-leader = true
  use-damage = false
  # xrender-sync-fence = false
  # glx-fshader-win = ""
  # force-win-blend = false
  # no-ewmh-fullscreen = false
  # max-brightness = 1.0
  # transparent-clipping = false
  log-level = "info";
  # log-file = '/path/to/your/log/file'
  # show-all-xerrors = false
  # write-pid-path = '/path/to/your/log/file'
  wintypes: {
    normal = { fade = false; shadow = false; }
    tooltip = { fade = true; shadow = true; opacity = 0.75; focus = true; full-shadow = false; };
    dock = { shadow = false; }
    dnd = { shadow = false; }
    popup_menu = { opacity = 0.8; }
    dropdown_menu = { opacity = 0.8; }
  };
''
