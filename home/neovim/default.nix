{ inputs, ... }:
{
  imports = [
    inputs.lazyvim.homeManagerModules.default
    ./theme.nix
    ./keybinds.nix
    ./dashboard.nix
    ./plugins.nix
    ./options.nix
    ./autocmds.nix
    ./extras.nix
    ./treesitter.nix
  ];
  programs.lazyvim.enable = true;

}
