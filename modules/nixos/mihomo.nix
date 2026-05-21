{ pkgs, ... }:
{
  #   networking.firewall.enable = false;
  networking = {
    firewall = {
      trustedInterfaces = [ "Meta" ];
    };
  };
  services = {
    mihomo = {
      enable = true;
      tunMode = true;
      configFile = "/home/beriholic/.config/mihomo/config.yaml";
      webui = pkgs.metacubexd;
    };
  };
}
