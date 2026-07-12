{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
    ];

    casks = [
      "ghostty"
      "obs"
    ];
  };
}
