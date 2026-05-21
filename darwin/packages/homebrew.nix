{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
    ];

    brews = [
      "domcyrus/rustnet/rustnet"
    ];

    casks = [
      "ghostty"
      "obs"
    ];
  };
}
