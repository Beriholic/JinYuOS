{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    statix
    go
    thrift
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
