# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
# pkgs: {
{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  surge = pkgs.callPackage ./surge.nix { };
}
