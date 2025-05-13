{ pkgs, ... }:
{
  users = {
    users.beri = {
      initialPassword = "114514";
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
}
