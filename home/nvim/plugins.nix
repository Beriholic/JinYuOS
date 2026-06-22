{ pkgs, ... }:
{
  programs.lazyvim.extraPlugins =
    with pkgs.vimPlugins;
    [
      diffview-nvim
    ];
}
