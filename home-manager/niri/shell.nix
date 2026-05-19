{ inputs, ... }:
{
  imports = [
    inputs.dankMaterialShell.homeModules."dank-material-shell"
    inputs.dankMaterialShell.homeModules.niri
  ];

  programs = {
    dankMaterialShell.enable = true;
    niri.settings.layout.border.enable = false;
  };
}
