{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    wechat
    vscode
    jetbrains-toolbox
    bilibili
    qq
    obs-studio
    wpsoffice-cn
    telegram-desktop
    vesktop
    lazysql
    nix-search-tv
    meld
    upscayl-ncnn
    zen-browser
    zed-editor
  ];
}
