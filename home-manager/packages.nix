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
    obs-studio

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
    go-musicfox
    lazydocker
    pandoc
    neovide

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
    android-studio
  ];

  services = {
    udiskie.enable = true;
  };
}
