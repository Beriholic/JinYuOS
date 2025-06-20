{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      quickshell
      cava
      gnome-bluetooth
      gammastep
      gnome-control-center
      material-symbols
      material-icons
      matugen
      gsettings-desktop-schemas
      ydotool
      blueberry
      sassc
      material-symbols
      material-icons

      easyeffects
      qt6.qtdeclarative
      kdePackages.qt5compat
      kdePackages.syntax-highlighting
      wlogout
    ];
  };
}
