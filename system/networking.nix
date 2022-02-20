{
  networking = {
    hostName = "nixos";
    useDHCP = false;

    # interfaces.ens33 = {
    #   useDHCP = true;
    # };

    wireless = {
      enable = false;
      iwd.enable = true;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}
