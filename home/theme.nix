{
  pkgs,
  ...
}:
let
  cursor-theme = "Bibata-Modern-Classic";
  cursor-package = pkgs.bibata-cursors;
in
{

  home = {
    packages = with pkgs; [
      adwaita-qt6
      adw-gtk3
      bibata-cursors
      morewaita-icon-theme
    ];
    sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 24;
      gtk.enable = true;
    };
  };
}
