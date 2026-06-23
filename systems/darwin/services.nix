{ pkgs, ... }:
{
  services = {
  };

  launchd.daemons.sing-box = {
    command = "${pkgs.sing-box}/bin/sing-box run -c /etc/sing-box/config.json -D /etc/sing-box";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/var/log/sing-box.log";
      StandardErrorPath = "/var/log/sing-box-error.log";
    };
  };
}
