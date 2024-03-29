{config, ...}: let
  theme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.toml";
    sha256 = "061yalrzpqivr67k2f8hsqixr77srgd8y47xvhp5vg0sjmh5lrcy";
  };
in {
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        theme
      ];
      window = {
        opacity = 0.8;
        padding = {
          x = 4;
          y = 4;
        };
      };
      font = {
        size = 12;
        normal = {
          family = config.theme.font.family;
          style = config.theme.font.style;
        };
      };
    };
  };
}
