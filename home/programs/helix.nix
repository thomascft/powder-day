{config, lib, pkgs, ...}: let 
  colorscheme = lib.concatStrings (with config.theme.colorscheme; [name "_" variant.dark]);
in {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        cursorline = true;
        indent-guides = {
          render = true;
        };
      };
      theme = "catppuccin_override";
    };
    themes.catppuccin_override = {
      "inherits" = "${colorscheme}";
      "ui.background" = "none";
    };

    extraPackages = with pkgs; [
      nil
    ];
  };
}
