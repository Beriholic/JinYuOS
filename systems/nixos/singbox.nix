{ pkgs, lib, ... }:
{
  # 启用 sing-box 服务
  services.sing-box = {
    enable = true;
    package = pkgs.sing-box; # 或指定版本 pkgs.sing-box_1_13_12
  };

  systemd.services.sing-box.serviceConfig = {
    ExecStartPre = lib.mkForce [ ];
    ExecStart = lib.mkForce [
      ""
      "${lib.getExe pkgs.sing-box} run -c /etc/sing-box/config.json"
    ];
  };

  # 确保 tun 设备权限
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  networking = {
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];

    firewall = {
      trustedInterfaces = [ "tun0" ];
    };
  };
}
