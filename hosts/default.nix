{inputs, ...}:{
	flake.nixosConfigurations.deck = inputs.nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		modules = [
			./deck
			inputs.disko.nixosModules.disko
			inputs.jovian.nixosModules.jovian
		];
	};
}
