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
    jdk8
    jdk17
    nixfmt-rfc-style
    nutil
    tldr
    geminic
    docker
    docker-compose
    colima
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
