{ pkgs, ... }:
{
  # programs.virt-manager.enable = true;
  virtualisation = {
    docker.enable = true;
    # libvirtd.enable = true;
    # spiceUSBRedirection.enable = true;
  };
  # users.groups.libvirtd.members = [ "beriholic" ];
  environment.systemPackages = with pkgs; [ docker-compose ];
}
