{
  imports = [
    ./neovim
  ];

  home.stateVersion = "25.11";

  programs = {
    home-manager.enable = true;
    git.settings.user = {
      enable = true;
      userName = "Beriholic";
      userEmail = "hi@beriholic.cv";
    };
  };
}
