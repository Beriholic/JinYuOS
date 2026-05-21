{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    gjs
    bun
    rustup
    go
    gcc
    typescript
    eslint
    jdk17
    nixfmt
    python312
    minikube
    kubernetes-helm
    kubectl
    uv
    nix-init
  ];
}
