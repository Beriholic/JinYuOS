{
  lib,
  pkgs,
  ...
}:
let
  execs = import ./execs.nix { inherit pkgs; };
  general = import ./general.nix;
  keybinds = import ./keybinds.nix;
  rules = import ./rules.nix;
  layout = import ./layout/dwindle.nix;
in
{
  home.packages =  with pkgs; [
    brightnessctl
    cliphist
    fuzzel
    grim
    hyprpicker
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock-effects
    swayidle
    slurp
    swww
    wayshot
    wlsunset
    wl-clipboard
    wf-recorder
    xwayland
    gvfs
    polkit_gnome
    easyeffects
    file-roller
    gnome-text-editor
    gnome-system-monitor
    gnome-control-center
    gnome-tweaks
    ddcutil
    nautilus
    wlogout
    hypridle
    d-spy
    dconf-editor
    hyprlock
    gnome-keyring
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = lib.mkMerge [
      execs.settings
      general.settings
      keybinds.settings
      rules.settings
      layout.settings
      { source = [ "./colors.conf" ]; }
    ];
    extraConfig = ''
      env=XMODIFIERS, @im=fcitx
      env=QT_IM_MODULE, fcitx
      env=SDL_IM_MODULE, fcitx
      env=GDK_BACKEND, wayland,x11
      env=QT_QPA_PLATFORM, wayland;xcb
      env=QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
      env=QT_AUTO_SCREEN_SCALE_FACTOR, 1
      env=CLUTTER_BACKEND, wayland
      env=ADW_DISABLE_PORTAL, 1
      env=XCURSOR_SIZE, 32
      env=HYPRCURSOR_SIZE,32
      env = GDK_SCALE,2
      #env = NIXOS_OZONE_WL, 1
    '';

  };
}
