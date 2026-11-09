{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];

  # dms 新版删掉了 dgop.package 选项（系统监控组件改为内置，但 dgop 仍是运行时依赖），
  # 所以直接把它塞进 home.packages。
  home.packages = [ inputs.dgop.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  programs = {
    dank-material-shell = {
      enable = true;
      enableSystemMonitoring = true;
      niri = {
        includes.enable = false;
        enableKeybinds = false; # Sets static preset keybinds
        enableSpawn = false; # Auto-start DMS with niri, if enabled
      };
    };
  };
}
