{ inputs, pkgs, ... }:
{

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  services = {
    udisks2.enable = true;
    upower.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    displayManager.sessionPackages = [ pkgs.niri-unstable ];
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    flatpak.enable = true;
    sysprof.enable = true;
  };
}
