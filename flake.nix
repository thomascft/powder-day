{
  description = "Powder Day ~ A NixOS configuration with flakes!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt-nix.url = "github:numtide/treefmt-nix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    jovian.url = "github:Jovian-Experiments/Jovian-NixOS/e2c026d8efea340d2a2dcc56775212979dd51ef2";
    jovian.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.treefmt-nix.flakeModule
        ./hosts
      ];

      flake = {
        homeConfigurations."thomas@deck" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = {inherit inputs;};

          modules = [
            ./home
          ];
        };
      };

      systems = [
        "x86_64-linux"
      ];

      perSystem = {...}: {
        treefmt = {
          projectRootFile = "flake.nix";

          programs.alejandra.enable = true;
        };
      };
    };
  /*
    outputs = inputs@{self, nixpkgs, home-manager, disko, jovian, aagl, ...}:{
  	nixosConfigurations.deck = nixpkgs.lib.nixosSystem {
  		system = "x86_64-linux";

  		modules = [
  			./configuration.nix
  			./aagl.nix
  			disko.nixosModules.disko
  			jovian.nixosModules.default
  			aagl.nixosModules.default
  		];
  	};
  };
  */
}
