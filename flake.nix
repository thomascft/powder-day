{
	description = "Powder Day ~ A NixOS configuration with flakes!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixpkgs-unstable";

		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";

		jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
		jovian.inputs.nixpkgs.follows = "nixpkgs";
	};
	outputs = inputs@{self, nixpkgs, disko, jovian, ...}:{
		nixosConfigurations.deck = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			modules = [
				./configuration.nix
				disko.nixosModules.disko
				jovian.nixosModules.jovian
			];
		};
	};
}
