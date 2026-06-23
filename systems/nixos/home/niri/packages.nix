{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xwayland-satellite
    gnome-text-editor
    gnome-system-monitor
    gnome-control-center
    gnome-tweaks
  ];
}
