{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  programs = {
    dank-material-shell = {
      enable = true;
      enableSystemMonitoring = true;
      dgop.package = inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default;
      niri = {
        includes.enable = false;
        enableKeybinds = false; # Sets static preset keybinds
        enableSpawn = false; # Auto-start DMS with niri, if enabled
      };
    };
  };
}
