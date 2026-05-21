{
  networking = {
    networkmanager = {
      enable = true;
    };
  };
  environment.etc."resolv.conf".text = ''
    nameserver 8.8.8.8
    nameserver 8.8.4.4
    options edns0
  '';
}
