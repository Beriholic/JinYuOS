{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./host
  ];

  boot.loader = {
    timeout= -1;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      minegrub-world-sel = {
        enable = true;
        customIcons = [
          {
            name = "NixOS";
            lineTop = "NixOS (23/11/2023, 23:03)";
            lineBottom = "Survival Mode, No Cheats, Version: 24.11";
            imgName = "nixos";
             # customImg = builtins.path {
             #   path = ./nixos-logo.png;
             #   name = "nixos-img";
             # };
          }
        ];
      };
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.hostName = "Jiny";
  networking.networkmanager.enable = true;
  security.polkit.enable = true;
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    neovim
    curl
    wget
    fastfetch
    nixfmt-rfc-style
    upower
    firefox
    kitty
  ];

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common.default = [ "gtk" ];
        hyprland.default = [
          "gtk"
          "hyprland"
        ];
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  programs.nix-ld.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
