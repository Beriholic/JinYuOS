{ pkgs, ... }: {
  services = {
    udisks2.enable = true;
    upower.enable = true;

    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "beri";
          command =
            "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
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
