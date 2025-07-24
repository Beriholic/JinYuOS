{
  description = "Beriholic's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    nix-darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    hyprland.url = "github:hyprwm/Hyprland?rev=9958d297641b5c84dcff93f9039d80a5ad37ab00";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    hyprscroller = {
      url = "github:cpiber/hyprscroller";
      inputs.hyprland.follows = "hyprland";
    };
    fcitx5-simple-theme.url = "github:Beriholic/fcitx5-simple-theme";
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    nix-wpsoffice-cn.url = "github:Beriholic/nix-wpsoffice-cn";
    quickshell = {
      url = "github:quickshell-mirror/quickshell?rev=20c3da01f1b2bc038582eee831e4f5055b4f71ff";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nutil.url = "github:Beriholic/nutil";
    geminic.url = "github:Beriholic/geminic";
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      system = "x86_64-linux";
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        JinYu = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };
          modules = [
            ./nixos/JinYu
            inputs.minegrub-world-sel-theme.nixosModules.default
            inputs.hyprland.nixosModules.default
          ];
        };
        JinYuLite = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };
          modules = [
            ./nixos/JinYuLite
            inputs.minegrub-world-sel-theme.nixosModules.default
            inputs.hyprland.nixosModules.default
          ];
        };
      };
      darwinConfigurations = {
        JinYuDarwin = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos/JinYuDarwin ];
        };
      };
    };
}
