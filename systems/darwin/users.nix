{ pkgs, ... }:
{
  system.primaryUser = "beriholic";
  networking.hostName = "JinYuDarwin";
  users = {
    users.beriholic = {
      name = "beriholic";
      home = "/Users/beriholic";
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
    };
  };

  environment.shells = [ pkgs.fish ];

  programs.fish.enable = true;
}
