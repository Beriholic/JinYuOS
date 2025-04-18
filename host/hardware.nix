{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelParams = [
    "modprobe.blacklist=nouveau"
  ];

  hardware = {
    i2c.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-media-driver
        libvdpau-va-gl
        libva
      ];
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
    nvidia = {
      prime = {
        offload ={
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:2:0:0";
      };
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
    };
  };
}
