{
  imports = [
    ./system
    ./home
  ];

  nix = {
    optimise.automatic = true;
    autoOptimiseStore = true;
    useSandbox = false;

    gc = {
      automatic = true;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  system.stateVersion = "21.11";
}
