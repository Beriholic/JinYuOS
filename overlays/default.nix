# This file defines overlays
{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
in
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # Per-package modifications, split into sub-files for readability.
  # Each sub-file is an overlay: final: prev: { ... }
  modifications = lib.composeManyExtensions [
    (import ./bun.nix)
    (import ./inputs.nix { inherit inputs; })
  ];

  # When applied, the stable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
