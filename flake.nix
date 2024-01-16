{
	description = "Powder Day ~ A NixOS configuration with flakes!";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";

		jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
		jovian.inputs.nixpkgs.follows = "nixpkgs";

		aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    		aagl.inputs.nixpkgs.follows = "nixpkgs";
	};
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
		homeConfigurations."thomas@deck" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.x86_64-linux;
			extraSpecialArgs = {inherit inputs;};

			modules = [
				./home/main.nix
			];	
		};
	};
}
