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
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      gfxmodeEfi = "2560x1600";
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
          common.default = ["gtk"];
          hyprland.default = ["gtk" "hyprland"];
        };
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-hyprland
        ];
      };
    };

    services.greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          user = "beri";
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        };
      };
    };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
