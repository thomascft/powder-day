{...}: {
  flake.homeManagerModules = {
    theme = import ./theme.nix;
  };
}
