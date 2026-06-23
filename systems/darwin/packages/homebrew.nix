{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    casks = [
      "ghostty"
      "obs"
    ];
  };
}
