{ pkgs, ... }: {
  system.primaryUser = "beriholic";
  networking.hostName = "JinYuDarwin";
  users = {
    users.beriholic = {
      shell = pkgs.fish;
      ignoreShellProgramCheck = true;
    };
  };

  environment.shells = [ pkgs.fish ];

  programs.fish.enable = true;
}
