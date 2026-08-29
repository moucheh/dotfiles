{
  security = {
    polkit.enable = true;
    pam = {
      services = {
        greetd.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
        login.fprintAuth = false;
        greetd.fprintAuth = false;
        sudo.fprintAuth = true;
        polkit-1.fprintAuth = true;
      };
    };
  };
}
