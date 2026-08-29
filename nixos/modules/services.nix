{
  services = {
    auto-cpufreq.enable = true;

    acpid = {
      enable = true;
      handlers.lid-open = {
        event = "button/lid.*open";
        action = ''
          echo 0 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
        '';
      };
    };

    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "/run/current-system/sw/bin/noctalia-greeter-session -- --session niri";
          user = "greeter";
        };
      };
    };

    gnome.gnome-keyring.enable = true;
    openssh.enable = true;
    fprintd.enable = true;
    upower.enable = true;
    flatpak.enable = true;
  };
}
