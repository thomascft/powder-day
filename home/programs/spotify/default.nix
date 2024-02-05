{pkgs, lib, inputs, ...}:{ 
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  imports = [inputs.spicetify-nix.homeManagerModule];

  programs.spicetify = {
    enable = true;
    theme = inputs.spicetify-nix.packages.x86_64-linux.default.themes.catppuccin;
    colorScheme = "mocha";
  };
}
