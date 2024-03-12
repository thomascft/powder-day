{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";

    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    jovian.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";

    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.treefmt-nix.flakeModule
        ./hosts
        ./home/profiles
      ];
      flake = {
      };
      systems = [
        "x86_64-linux"
      ];
      perSystem = {config, ...}: {
        treefmt = {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
        };
      };
    };
}
