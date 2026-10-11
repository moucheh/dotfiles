{ pkgs, ... }:

{
  programs = {
    kdeconnect.enable = true;
    niri.enable = true;
    virt-manager.enable = true;
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamemode.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };
}
