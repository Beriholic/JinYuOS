{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty-bin
    qbittorrent
    keka
    orbstack
    qq
    wechat
    google-chrome
    obsidian
    mos
  ];

  homebrew = {
    taps = [
    ];

    brews = [
    ];

    casks = [
      "obs"
      "telegram"
      "bilibili"
      "tencent-meeting"
      "feishu"
      "vesktop"
      "dingtalk"
      "zed"
    ];
  };
}
