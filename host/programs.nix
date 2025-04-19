{pkgs,...}:
{
  programs = {
    fish.enable = true;

    clash-verge = {
      enable = true;
      tunMode = true;
      package = pkgs.clash-verge-rev;
   };
  };
}
