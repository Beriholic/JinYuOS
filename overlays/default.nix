# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    hyprscroller = inputs.hyprscroller.packages.${final.stdenv.hostPlatform.system}.hyprscroller;
    wpsoffice-cn = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.wpsoffice-cn;
    chinese-fonts = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.chinese-fonts;
    nutil = inputs.nutil.packages.${final.stdenv.hostPlatform.system}.default;
    zen-browser = inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
    efile = inputs.efile.defaultPackage.${final.stdenv.hostPlatform.system};
  };

  # When applied, the stable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
