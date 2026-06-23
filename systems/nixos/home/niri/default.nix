{ inputs, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./packages.nix
  ];
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
  };
}
