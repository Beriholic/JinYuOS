{ inputs, pkgs, ... }:
{
  programs = {
    fish.enable = true;
    nix-ld.enable = true;
    nh = {
      enable = true;
      package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.default;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
    };
  };
}
