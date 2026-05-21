{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    thrift
    bun
    pnpm
    uv
    neovim
    nixfmt
    docker
    docker-compose
    nodejs_24
    nix-init
    rustup
  ];
}
