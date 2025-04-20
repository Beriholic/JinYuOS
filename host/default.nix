{
  imports = [
    ./hardware.nix
    ./users.nix
    ./fonts.nix
    ./locate.nix
    ./audio.nix
    ./virtualisation.nix
    ./programs.nix
    ./services.nix
    ./steam.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        # "https://mirrors.cernet.edu.cn/nix-channels/store"
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };
}
