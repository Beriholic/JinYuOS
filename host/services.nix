{pkgs,...}:
{
  services = {
    udisks2.enable = true;
    upower.enable = true;
    mihomo = {
      enable = true;
      tunMode = true;
      configFile = "/home/beri/mihomo/config.yaml";
      webui = pkgs.metacubexd;
    };
  };
}
