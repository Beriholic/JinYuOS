{ pkgs, ... }:
{
  programs.lazyvim.treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
    thrift
    http
    graphql
  ];
}
