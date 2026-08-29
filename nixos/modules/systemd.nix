{
  systemd = {
    user.services.niri.enableDefaultPath = false;
    services.turn-off-thinkpad-led = {
      description = "Turn off ThinkPad power LED";

      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
      };

      script = ''
        echo 0 > /sys/devices/platform/thinkpad_acpi/leds/tpacpi::power/brightness
      '';
    };
  };
}
