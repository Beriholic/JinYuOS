{ inputs, pkgs, ... }:
{

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  services = {
    udisks2.enable = true;
    upower.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    # niri-flake 的包仍锁着 libdisplay-info 0.2（nixpkgs 已删掉该版本），
    # 而 home 侧本来就用 pkgs.niri，这里保持一致。
    displayManager.sessionPackages = [ pkgs.niri ];
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    flatpak.enable = true;
    sysprof.enable = true;
  };
}
