{ pkgs, config, ... }:
{
  boot.kernelParams = ["modprobe.blacklist=nouveau"];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    i2c.enable = true;
    graphics = {
      enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
     };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
