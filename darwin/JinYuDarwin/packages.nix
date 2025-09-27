{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    lazygit
    lazydocker
    bat
    duf
    btop
    go
    thrift
    bun
    pnpm
    chsrc
    uv
    zoxide
    neovim
    ripgrep
    bat
    eza
    go-musicfox
    nix-search-tv
    fzf
    jdk24
    nixfmt-rfc-style
    nutil
    tldr
    geminic
    docker
    docker-compose
    colima
    ranger
    wget
    fd
    nodejs_24
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [ ];

    brews = [ ];

    casks = [
      "apifox"
      "kitty"
      "wechat"
    ];
  };
}
