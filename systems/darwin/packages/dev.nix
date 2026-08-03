{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    uv
    docker
    docker-compose
    nix-init
    rustup
    fnm
    unar
  ];

  homebrew = {
    brews = [
      "python@3.13"
    ];
  };
}
