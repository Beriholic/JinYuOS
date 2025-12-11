{
  outputs,
  pkgs,
  ...
}:
let
  username = "beri";
  homeDirectory = "/home/beri";
in
{
  imports = [
    ./packages.nix
    ./theme.nix
    ./niri
    ./dconf.nix
    ./mimelist.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    inherit username homeDirectory;
    packages = [ pkgs.dconf ];
    sessionPath = [ "$HOME/.local/bin" ];
  };

  gtk = {
    enable = true;
    font.name = "Rubik";
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    gtk3.bookmarks =
      let
        homePath = "file://${homeDirectory}";
      in
      [
        "${homePath}/Downloads"
        "${homePath}/Documents"
        "${homePath}/Pictures"
        "${homePath}/Music"
        "${homePath}/Videos"
      ];
  };

  xdg = {
    portal = {
      enable = true;
      config.niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Access" = "gtk";
        "org.freedesktop.impl.portal.FileChooser" = "gtk";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    # style.name = "kvantum";
  };

  xdg.userDirs = {
    createDirectories = true;
  };

  programs = {
    home-manager.enable = true;
    git.settings.user = {
      enable = true;
      userName = "Beriholic";
      userEmail = "beriholic@petalmail.com";
    };
  };

  home.stateVersion = "24.11";
}
