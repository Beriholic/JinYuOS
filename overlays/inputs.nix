{ inputs, ... }:
final: _prev: {
  # 上游 nix-wpsoffice-cn 有三个跟不上的地方：
  #   1. buildInputs 里还在写 libsForQt5.qt5.qtbase，而 nixpkgs 自 2026-06 起把这个
  #      别名改成直接 throw（要求改用顶层 qt5.*）；
  #   2. 它自己 import nixpkgs 并写死 config，拿不到我们配置里的 problems 处理规则
  #      （gtk2 已被标记为 broken，求值阶段就拒绝）；
  #   3. buildInputs 里用的还是 xorg.* 这套已废弃的别名，而 nixpkgs 自 2026-01 起
  #      对 xorg 的每个属性都发 deprecation 警告（libXdamage → libxdamage 等）。
  # 所以这里用本仓库的 pkgs 重新 callPackage 它的包定义，补齐上面这些别名。
  wpsoffice-cn =
    final.callPackage "${inputs.nix-wpsoffice-cn.outPath}/pkgs/wpsoffice-cn.nix" {
      libsForQt5 = final.libsForQt5 // {
        qt5 = final.libsForQt5;
      };
      # // 是惰性的：被覆盖掉的旧属性不会被求值，警告也就不会触发。
      xorg = final.xorg // {
        libXdamage = final.libxdamage;
        libXtst = final.libxtst;
        libXv = final.libxv;
        libXScrnSaver = final.libxscrnsaver;
        libXxf86vm = final.libxxf86vm;
      };
    };
  chinese-fonts = inputs.nix-wpsoffice-cn.packages.${final.stdenv.hostPlatform.system}.chinese-fonts;
  zen-browser = inputs.zen-browser.packages.${final.stdenv.hostPlatform.system}.default;
  neovim = inputs.neovim-nightly-overlay.packages.${final.stdenv.hostPlatform.system}.default;
}
