{
  pkgs,
  lib,
  inputs,
  ...
}: let 
  spicePkgs = inputs.spicetify-nix.packages.x86_64-linux.default;
  in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  imports = [inputs.spicetify-nix.homeManagerModule];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    enabledExtensions = with spicePkgs.extensions; [
      lastfm
      adblock
    ];
  };
}
