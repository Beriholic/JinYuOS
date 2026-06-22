{ inputs, ... }:
final: _prev: {
  neovim = inputs.neovim-nightly-overlay.packages.${final.stdenv.hostPlatform.system}.default;
}
