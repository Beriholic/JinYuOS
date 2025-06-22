{ lib, pkgs, ... }:
let
  execs = import ./execs.nix { inherit pkgs; };
  general = import ./general.nix;
  keybinds = import ./keybinds.nix;
  rules = import ./rules.nix;
  layout = import ./layout/scroll.nix;
  env = import ./env.nix;
in {
  imports = [ ./shell/quickshell.nix ];

  home.packages = with pkgs; [
    blueberry
    icon-library
    yad
    hyprutils
    hyprpicker
    hyprlang
    hypridle
    hyprland-qt-support
    hyprland-qtutils
    hyprlock
    hyprcursor
    hyprshot
    hyprwayland-scanner
    wl-clipboard
    brightnessctl
    cliphist
    fuzzel
    grim
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock-effects
    swayidle
    slurp
    swww
    wlsunset
    wl-clipboard
    wf-recorder
    xwayland
    gvfs
    polkit_gnome
    file-roller
    gnome-text-editor
    gnome-system-monitor
    gnome-control-center
    gnome-tweaks
    ddcutil
    nautilus
    d-spy
    dconf-editor
    gnome-keyring
    font-manager
    mpvpaper
    w3m
    loupe
    libsForQt5.qtstyleplugin-kvantum
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = lib.mkMerge [
      execs.settings
      general.settings
      keybinds.settings
      rules.settings
      layout.settings
      env.settings
      { source = [ "./colors.conf" ]; }
    ];
    plugins = [ pkgs.hyprscroller ];
  };
}
