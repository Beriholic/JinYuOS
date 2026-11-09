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

  # home-manager 26.05 起 withPython3 默认值改成 false，这里显式保留旧行为。
  programs.neovim.withPython3 = true;
}
