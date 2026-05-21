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
    bat
    eza
    go-musicfox
    nix-search-tv
    fzf
    nixfmt
    tlrc
    docker
    docker-compose
    yazi
    wget
    fd
    nodejs_24
    nh
    localsend
    nix-init
    rustup
    atool
    ripgrep
    gh
    lazyssh
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
    ];

    brews = [
      "domcyrus/rustnet/rustnet"
    ];

    casks = [
      "ghostty"
      "obs"
    ];
  };
}
