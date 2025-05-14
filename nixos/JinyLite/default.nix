{
  imports = [
    ../configuration.nix
    ./graphic.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "JinyLite";
}
