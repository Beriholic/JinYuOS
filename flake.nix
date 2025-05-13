{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    ags.url = "github:Aylur/ags/v1";
    matugen.url = "github:/InioX/Matugen";
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        # "aarch64-linux"
        # "i686-linux"
        "x86_64-linux"
        # "aarch64-darwin"
        # "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

      overlays = import ./overlays { inherit inputs; };
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      nixosConfigurations = {
        Jiny = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs hyprland; };
          modules = [
            ./nixos/configuration.nix
            inputs.minegrub-world-sel-theme.nixosModules.default
            hyprland.nixosModules.default
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
