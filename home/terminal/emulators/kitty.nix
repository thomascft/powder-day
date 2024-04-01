{
  config,
  lib,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";

    settings = {
      window_opacity = "0.8";
      dynamic_background_opacity = "yes";
    };

    font.name = lib.concatStrings (with config.theme.font; [family " " style]);
    font.size = 10;
  };
}
