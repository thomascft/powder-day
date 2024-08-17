{
  pkgs,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.x86_64-linux;
in {

  imports = [inputs.spicetify-nix.homeManagerModules.default];

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
