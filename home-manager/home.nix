{ inputs, outputs, pkgs, ... }:
let
  username = "beri";
  homeDirectory = "/home/beri";
in {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./ags.nix
    ./mimelist.nix
    ./packages.nix
    ./theme.nix
    ./hyprland
    ./dconf.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = { allowUnfree = true; };
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
    gtk3.bookmarks = let homePath = "file://${homeDirectory}";
    in [
      "${homePath}/Downloads"
      "${homePath}/Documents"
      "${homePath}/Pictures"
      "${homePath}/Music"
      "${homePath}/Videos"
    ];
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };

  xdg.userDirs = { createDirectories = true; };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Beriholic";
    userEmail = "beriholic@petalmail.com";
  };

  #systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
