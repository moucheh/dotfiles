{
  description = "moucheh's flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    unstable.url = "nixpkgs/nixos-unstable";
    nixpkgs-btop.url = "github:NixOS/nixpkgs/c27cdad491a991b11ed731760aa2ef8db0cb0410";
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
      nixpkgs-btop,
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

            pinnedBtop = import nixpkgs-btop {
              inherit system;
              config.rocmSupport = true;
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
