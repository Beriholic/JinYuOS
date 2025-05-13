# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  # You can import other NixOS modules here
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
    ./users.nix
    ./fonts.nix
    ./locate.nix
    ./audio.nix
    ./virtualisation.nix
    ./programs.nix
    ./services.nix
    ./steam.nix
  ];

  boot.loader = {
    timeout = -1;
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
          }
        ];
      };
    };
    efi.canTouchEfiVariables = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
        nix-path = config.nix.nixPath;
        substituters = [
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          # "https://mirrors.cernet.edu.cn/nix-channels/store"
          "https://hyprland.cachix.org"
        ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        auto-optimise-store = true;
      };
      # Opinionated: disable channels
      #channel.enable = false;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1w";
      };
    };

  networking.hostName = "Jiny";
  networking.networkmanager.enable = true;
  security.polkit.enable = true;

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
    starship
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

  users.users = {
    beri = {
      initialPassword = "114514";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };
  };

  system.stateVersion = "24.11";
}
