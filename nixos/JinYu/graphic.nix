{ config, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [ "modprobe.blacklist=nouveau" ];
  hardware = {
    graphics = { enable = true; };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
