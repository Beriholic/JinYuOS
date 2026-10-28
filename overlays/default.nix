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
    (import ./inputs.nix { inherit inputs; })
    (import ./ghostty.nix)
  ];

  # When applied, the stable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.stable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };

  # When applied, the nixpkgs-pre set (declared in the flake inputs) will
  # be accessible through 'pkgs.pre'
  pre-packages = final: _prev: {
    pre = import inputs.nixpkgs-pre {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
