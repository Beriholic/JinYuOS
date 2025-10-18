{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./shell.nix
    ./packages.nix
  ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };
}
