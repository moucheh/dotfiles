{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/environment.nix
    ./modules/fonts.nix
    ./modules/programs.nix
    ./modules/networking.nix
    ./modules/services.nix
    ./modules/security.nix
    ./modules/systemd.nix
    ./modules/hardware.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  users.users."moucheh" = {
    isNormalUser = true;
    description = "moucheh";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };

  system.stateVersion = "26.05";
}
