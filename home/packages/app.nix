{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    vscode
    # wechat-uos
    jetbrains-toolbox
    bilibili
    qq
    obs-studio
    wpsoffice-cn
    telegram-desktop
    efile
    vesktop
    hmcl
    lazysql
    nix-search-tv
    meld
    upscayl-ncnn
    zen-browser
    zed-editor
  ];
}
