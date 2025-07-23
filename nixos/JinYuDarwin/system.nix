{
  system = {
    stateVersion = 6;

    defaults = {
      menuExtraClock.Show24Hour = true;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
