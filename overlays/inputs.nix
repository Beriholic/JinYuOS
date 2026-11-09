{ inputs, ... }:
final: _prev: {
  # 上游 nix-wpsoffice-cn 有两个跟不上的地方：
  #   1. buildInputs 里还在写 libsForQt5.qt5.qtbase，而 nixpkgs 自 2026-06 起把这个
  #      别名改成直接 throw（要求改用顶层 qt5.*）；
  #   2. 它自己 import nixpkgs 并写死 config，拿不到我们配置里的 problems 处理规则
  #      （gtk2 已被标记为 broken，求值阶段就拒绝）。
  # 所以这里用本仓库的 pkgs 重新 callPackage 它的包定义，只补上 qt5 这个别名。
  wpsoffice-cn =
    final.callPackage "${inputs.nix-wpsoffice-cn.outPath}/pkgs/wpsoffice-cn.nix" {
      libsForQt5 = final.libsForQt5 // {
        qt5 = final.libsForQt5;
      };
    };
  chinese-fonts = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.chinese-fonts;
  zen-browser = inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
  neovim = inputs.neovim-nightly-overlay.packages.${final.stdenv.hostPlatform.system}.default;
}
