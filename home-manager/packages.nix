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
    vesktop
    hmcl
    lazysql
    nix-search-tv
    meld
    upscayl-ncnn
    zen-browser
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
    nutil
    ripgrep

    # dev
    nodejs
    gjs
    bun
    rustup
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
    uv

    # ide
    jetbrains-toolbox
  ];

  services = {
    udiskie.enable = true;
  };
}
