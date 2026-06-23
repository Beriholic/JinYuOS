{
  programs.starship.enable = true;

  # Source the raw toml shipped next to this module. Keeps the nerd-font
  # powerline glyphs intact instead of round-tripping through a Nix attrset.
  # We deliberately do NOT set programs.starship.settings — that would make
  # home-manager generate its own starship.toml and clash with this one.
  xdg.configFile."starship.toml".source = ./starship.toml;
}