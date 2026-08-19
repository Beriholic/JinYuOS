{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    go
    uv
    docker
    docker-compose
    rust-analyzer
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
