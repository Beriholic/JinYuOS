{
  ...
}:
{
  imports = [
    ./packages/app.nix
    ./packages/tools.nix
    ./packages/dev.nix
  ];

  services = {
    udiskie.enable = true;
  };
}
