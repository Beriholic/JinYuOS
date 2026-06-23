{
  imports = [
    ../libs.nix
  ];

  home.stateVersion = "26.05";

  programs = {
    home-manager.enable = true;
    git.settings.user = {
      enable = true;
      userName = "Beriholic";
      userEmail = "hi@beriholic.cv";
    };
  };
}
