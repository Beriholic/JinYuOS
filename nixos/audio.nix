{
  services.pipewire = {
    enable = true;
    #pulseaudio.enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
}
