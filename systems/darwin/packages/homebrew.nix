{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    taps = [
      "jipika/waifux"
    ];

    casks = [
      "ghostty"
      "obs"
      "jipika/waifux/waifux"
    ];
  };
}
