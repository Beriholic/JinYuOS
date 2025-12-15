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
    inputs.home-manager.nixosModules.home-manager
    ./hardware.nix
    ./network.nix
    ./fonts.nix
    ./locate.nix
    ./audio.nix
    ./virtualisation.nix
    ./programs.nix
    ./services.nix
    ./steam.nix
    ./mihomo.nix
    ./nix-ld.nix
  ];

  boot = {
    tmp.useTmpfs = true;

    loader = {
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
    kernelPackages = pkgs.linuxPackages_zen;
  };

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
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://mirrors.ustc.edu.cn/nix-channels/store"
          "https://mirrors.cernet.edu.cn/nix-channels/store"
        ];
        auto-optimise-store = true;
      };
      # Opinionated: disable channels
      #channel.enable = false;
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  security.polkit.enable = true;

  environment = {
    systemPackages = with pkgs; [
      git
      vim
      neovim
      curl
      wget
      fastfetch
      nixfmt-rfc-style
      upower
      kitty
      starship
    ];
    sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
      NH_OS_FLAKE = "/etc/nixos";
    };
  };

  users = {
    users.beri = {
      initialPassword = "114514";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };
    defaultUserShell = pkgs.fish;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      beri = import ../home-manager/home.nix;
    };
    backupFileExtension = "backup";
  };

  system.stateVersion = "24.11";
}
