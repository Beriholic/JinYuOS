{
  description = "Beriholic's NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url =
      "github:hyprwm/Hyprland?rev=9958d297641b5c84dcff93f9039d80a5ad37ab00";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags/v1";
    matugen.url = "github:/InioX/Matugen";
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    hyprscroller = {
      url = "github:cpiber/hyprscroller";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      # systems = [
      #   "aarch64-linux"
      #   "i686-linux"
      #   "x86_64-linux"
      #   "aarch64-darwin"
      #   "x86_64-darwin"
      # ];
      # forAllSystems = nixpkgs.lib.genAttrs systems;
      system = "x86_64-linux";
    in {
      #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      #formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
      packages = import ./pkgs nixpkgs.legacyPackages.${system};
      formatter = nixpkgs.legacyPackages.${system}.alejandra;

      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        Jiny = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };
          modules = [
            ./nixos/Jiny
            inputs.minegrub-world-sel-theme.nixosModules.default
            inputs.hyprland.nixosModules.default
          ];
        };
        JinyLite = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };
          modules = [
            ./nixos/JinyLite
            inputs.minegrub-world-sel-theme.nixosModules.default
            inputs.hyprland.nixosModules.default
          ];
        };
      };

      # homeConfigurations = {
      #   "beri@Jiny" = home-manager.lib.homeManagerConfiguration {
      #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #     extraSpecialArgs = { inherit inputs outputs hyprland; };
      #     modules = [
      #       hyprland.homeManagerModules.default
      #       ./home-manager/home.nix
      #     ];
      #   };
      # };
    };
}
