{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nix4lazyvim.homeModules.default
    ./extras.nix
    ./plugins.nix
  ];

  programs.lazyvim = {
    enable = true;
    configDir = ./config;

    # Pull LSPs / formatters / linters for every enabled extra via
    # source/dependencies.json. Per-extra opt-out with
    # extras.<cat>.<name>.enableDependencies = false.
    enableDependencies = true;
  };

  home.packages = with pkgs; [
    statix
  ];
}
