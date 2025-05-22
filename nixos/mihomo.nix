{ pkgs, ... }: {
  #   networking.firewall.enable = false;
  networking = { firewall = { trustedInterfaces = [ "Mihomo" ]; }; };
  services = {
    mihomo = {
      enable = true;
      tunMode = true;
      configFile = "/home/beri/.config/mihomo/config.yaml";
      webui = pkgs.metacubexd;
    };
  };
}
