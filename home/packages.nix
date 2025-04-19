{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # app
    firefox
    kitty
    vscode
    wechat-uos
    jetbrains-toolbox
    bilibili
    qq

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
    typos-lsp
    cmake
    gnumake
    tlrc

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
