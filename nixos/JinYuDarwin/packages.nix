{ pkgs, ... }:
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
    jdk17
    nixfmt-rfc-style
    nutil
    tldr
    docker
    docker-compose
    colima
    ranger
    wget
    fd
    nodejs_24
    nh
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
      "kitty"
      "obs"
    ];
  };
}
