{ inputs, ... }:
{
  imports = [
    inputs.nix4lazyvim.homeModules.default
    ./extras.nix
    ./lang.nix
    ./plugins.nix
  ];

  programs.lazyvim = {
    enable = true;
    configDir = ./config;
  };
}
