{inputs, ...}: {
  flake.nixosConfigurations.gram = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      ./shared
      ./gram
    ];
  };
  flake.nixosConfigurations.deck = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {inherit inputs;};
    modules = [
      ./shared
      ./deck
    ];
  };
}
