{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    uv
    neovim
    docker
    docker-compose
    nodejs_24
    nix-init
    rustup
  ];
}
