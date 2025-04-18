{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # app
    blueberry
    firefox
    kitty
    icon-library
    yad
    vscode

    # tools
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    bat
    fd
    eza
    ripgrep
    fzf
    jq
    gojq
    acpi
    ffmpeg
    libnotify
    zip
    unzip
    glib
    starship
    btop
    pciutils
    usbutils
    btop
    gradience
    mihomo-party
    ranger
    duf
    xdg-user-dirs
    xorg.xrdb
    xorg.xprop
    lazygit
    zoxide

    # dev
    nodejs
    gjs
    bun
    cargo
    go
    gcc
    typescript
    eslint

    # ide
  ];

  services = {
    udiskie.enable = true;
  };
}
