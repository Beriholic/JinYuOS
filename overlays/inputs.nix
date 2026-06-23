{ inputs, ... }:
final: _prev: {
  wpsoffice-cn = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.wpsoffice-cn;
  chinese-fonts = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.chinese-fonts;
  zen-browser = inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
  neovim = inputs.neovim-nightly-overlay.packages.${final.stdenv.hostPlatform.system}.default;
}
