{ inputs, outputs, ... }:
{
  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      beriholic = import ./home/home.nix;
    };
    backupFileExtension = "backup";
  };
}
