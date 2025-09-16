{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    flake-parts,
    systems,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import systems;

      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.callPackage ./shell.nix {};
      };
    };
}
