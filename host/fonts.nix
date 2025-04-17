{
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    nerdfonts
    # nerd-fonts.agave  
    # nerd-fonts._0xproto
    material-symbols
    google-fonts
    jetbrains-mono
    google-fonts
    cascadia-code
    material-symbols
  ];
}
