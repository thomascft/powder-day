{aagl, ...}: {
  nix.settings = {
    extra-substituters = ["https://ezkea.cachix.org"];
    extra-trusted-public-keys = ["ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
  };

  networking.mihoyo-telemetry.block = true;

  # programs.anime-game-launcher.enable = true;
}
