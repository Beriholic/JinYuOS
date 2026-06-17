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

  launchd.daemons.surge-server = {
    command = "${pkgs.surge}/bin/surge server";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      UserName = "beriholic";
      StandardOutPath = "/Users/beriholic/Library/Logs/surge-server.log";
      StandardErrorPath = "/Users/beriholic/Library/Logs/surge-server-error.log";
    };
  };
}
