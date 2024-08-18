{self, config, inputs, lib, ...}:{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = {inherit self inputs;};
  home-manager.users.thomas = {
    imports = (builtins.map (p: lib.path.append ../../home p) [
      "default.nix"
      "desktop"
    ]);

    home.stateVersion = config.system.stateVersion;
  };
}
