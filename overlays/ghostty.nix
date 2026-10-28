# nixpkgs 的 ghostty-bin 只跟到 1.3.1，这里直接把 src/version 覆盖成上游最新 release。
# 升级方式：改 version 与 hash（nix store prefetch-file https://release.files.ghostty.org/<ver>/Ghostty.dmg）
final: prev: {
  ghostty-bin = prev.ghostty-bin.overrideAttrs (_old: {
    version = "1.4.0";
    src = final.fetchurl {
      url = "https://release.files.ghostty.org/1.4.0/Ghostty.dmg";
      hash = "sha256-OgIHXb0kMY13hCavQd7lUH1T7MRXjt6WkS7Jzm0Y0+g=";
    };
  });
}
