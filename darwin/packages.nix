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
    jdk21
    nixfmt-rfc-style
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
    neovide
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
      "steipete/tap"
      "yakitrak/yakitrak"
    ];

    brews = [
      "steipete/tap/remindctl"
      "steipete/tap/summarize"
      "yakitrak/yakitrak/obsidian-cli"
      "gh"
      "ripgrep"
      "mole"
    ];

    casks = [
      "ghostty"
      "obs"
    ];
  };
}
