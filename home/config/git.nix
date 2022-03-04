{
  userEmail = "jx11r@hotmail.com";
  userName  = "jx11r";

  extraConfig = {
    init = {
      defaultBranch = "master";
    };
  };

  aliases = {
    # co = "checkout";
    # s  = "status";
  };

  ignores = [
    "*~"
    "*.swp"
    "*.tmp"
  ];
}
