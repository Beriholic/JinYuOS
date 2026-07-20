{ config, lib, ... }:
let
  files = [
    "cn_dicts"
    "en_dicts"
    "lua"
    "opencc"
    "custom_phrase.txt"
    "default.yaml"
    "double_pinyin.schema.yaml"
    "double_pinyin_abc.schema.yaml"
    "double_pinyin_flypy.schema.yaml"
    "double_pinyin_jiajia.schema.yaml"
    "double_pinyin_mspy.schema.yaml"
    "double_pinyin_sogou.schema.yaml"
    "double_pinyin_ziguang.schema.yaml"
    "melt_eng.dict.yaml"
    "melt_eng.schema.yaml"
    "radical_pinyin.dict.yaml"
    "radical_pinyin.schema.yaml"
    "rime_ice.dict.yaml"
    "rime_ice.schema.yaml"
    "squirrel.yaml"
    "symbols_caps_v.yaml"
    "symbols_v.yaml"
    "t9.schema.yaml"
    "weasel.yaml"
  ];
in
{
  options.libs.rimePath = lib.mkOption {
    type = lib.types.str;
    default = ".local/share/fcitx5/rime";
    description = "RIME configuration path";
  };

  config.home.file = builtins.listToAttrs (
    map (file: {
      name = "${config.libs.rimePath}/${file}";
      value.source = ./config/${file};
    }) files
  );
}
