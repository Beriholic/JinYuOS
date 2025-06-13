# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
# pkgs: {
{ pkgs ? import <nixpkgs> { }, ... }: rec {
  efile = pkgs.callPackage ./efile.nix { };
  mihomo-alpha = pkgs.callPackage ./mihomo-alpha.nix { };
  geminic = pkgs.callPackage ./geminic.nix { };
  hmcl = pkgs.callPackage ./hmcl.nix { };
}
