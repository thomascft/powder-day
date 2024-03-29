{
  inputs,
  self,
  ...
}: {
  flake.homeConfigurations = let
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    extraSpecialArgs = {inherit inputs self;};
  in {
    "thomas@deck" = inputs.home-manager.lib.homeManagerConfiguration {
      modules = [
        ../.
        ./deck
      ];
      inherit pkgs extraSpecialArgs;
    };
    "thomas@gram" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs extraSpecialArgs;
      modules = [
        ../.
        ./gram
      ];
    };
  };
}
