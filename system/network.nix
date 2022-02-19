{ ... }:

{
  networking = {
    hostName = "nixos";
    # wireless.enable = true;
    # useDHCP = false;

    # interfaces.ens33 = {
    #   useDHCP = true;
    # };

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
    };
  };
}
