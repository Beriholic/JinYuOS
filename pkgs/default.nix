# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
# pkgs: {
{
  pkgs ? import <nixpkgs> { },
  ...
}:
rec {
  # example = pkgs.callPackage ./example { };
  # wpsoffice-cn = pkgs.callPackage ./wps-office.nix { };
  wpsoffice-cn = pkgs.callPackage ./wspoffice-cn.nix {};
}
