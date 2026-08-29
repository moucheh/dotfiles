{ lib, ... }:

{
  networking = {
    hostName = "t495";
    wireless.enable = true;
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = lib.range 1714 1764;
      allowedUDPPorts = lib.range 1714 1764;
    };
  };
}
