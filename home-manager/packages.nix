{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # app
    kitty
    vscode
    wechat-uos
    jetbrains-toolbox
    bilibili
    qq
    obs-studio
    wpsoffice-cn
    telegram-desktop
    efile
    discord
    geminic
    hmcl
    lazysql
    nix-search-tv
    meld
    upscayl-ncnn

    # tools
    (mpv.override { scripts = [ mpvScripts.mpris ]; })
    imv
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
    upx
    eza
    bc
    ddcutil
    pavucontrol

    # dev
    nodejs
    gjs
    bun
    cargo
    go
    gcc
    typescript
    eslint
    jdk17
    nixfmt-rfc-style
    python312
    minikube
    kubernetes-helm
    kubectl

    # ide
    jetbrains-toolbox
  ];

  services = {
    udiskie.enable = true;
  };
}
