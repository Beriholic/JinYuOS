# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
# pkgs: {
{ pkgs ? import <nixpkgs> { }, ... }: rec {
  wpsoffice-cn = pkgs.callPackage ./wspoffice-cn.nix { };
  efile = pkgs.callPackage ./efile.nix { };
  hyprscroller = pkgs.callPackage ./hyprscroller.nix { };
  mihomo-alpha = pkgs.callPackage ./mihomo-alpha.nix { };
}
