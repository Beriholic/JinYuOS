{ pkgs, ... }:
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

    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "beri";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };
    auto-cpufreq.enable = true;
    auto-cpufreq.settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
}
