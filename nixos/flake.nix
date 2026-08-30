{
  description = "moucheh's flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    unstable.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      unstable,
      ...
    }:
    {
      nixosConfigurations.t495 = nixpkgs.lib.nixosSystem {
        specialArgs =
          let
            system = "x86_64-linux";
          in
          {
            pkgs-unstable = import unstable {
              inherit system;
              config.allowUnfree = true;
            };
          };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.moucheh = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
