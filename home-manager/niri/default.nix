{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
    ./packages.nix
  ];
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    dankMaterialShell.enable = true;
  };
}
