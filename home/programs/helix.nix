{
  config,
  lib,
  pkgs,
  ...
}: let
  colorscheme = lib.concatStrings (with config.theme.colorscheme; [name "_" variant.dark]);
in {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        cursorline = true;
        color-modes = true;
        popup-border = "menu";
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
      rust-analyzer
      clang-tools
      nil
    ];
  };
}
