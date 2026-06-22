{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    uv
    docker
    docker-compose
    nodejs_24
    nix-init
    rustup
  ];
}
