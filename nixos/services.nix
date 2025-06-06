{ pkgs, ... }: {
  services = {
    udisks2.enable = true;
    upower.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    displayManager.sessionPackages = [ pkgs.hyprland ];
    flatpak.enable = true;

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
    };
  };
}
