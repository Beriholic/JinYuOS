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
    statix
    python312
    uv
    pnpm
    fnm
  ];
}
