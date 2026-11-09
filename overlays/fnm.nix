# nixpkgs 的 fnm 1.39.0 通过 zip crate 间接引入 zstd-sys，
# 而 zstd-sys 的 build.rs 在 darwin 上会走 pkg-config 分支探测 libzstd；
# 构建环境里既没有 pkg-config 也没有 zstd，于是报
# "Can't probe for zstd in pkg-config: The pkg-config command could not be found"。
# 这里补上 pkg-config 与 zstd，让 fnm 直接链接 nixpkgs 的 libzstd。
final: prev: {
  fnm = prev.fnm.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ final.pkg-config ];
    buildInputs = (old.buildInputs or [ ]) ++ [ final.zstd ];
  });
}
