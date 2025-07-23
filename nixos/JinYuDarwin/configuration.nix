{
  pkgs,
  lib,
  outputs,
  ...
}:
{

  nix = {
    enable = true;

    package = pkgs.nix;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
      ];

      trusted-users = [ "beriholic" ];
      trusted-public-keys = [ ];
    };

    optimise.automatic = true;

    gc = {
      automatic = lib.mkDefault true;
      options = lib.mkDefault "--delete-older-than 3d";
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };
}
