{
  self,
  pkgs,
  ...
}: {
  imports = [
    # ../modules/home/theme.nix
    self.homeManagerModules.theme
  ];

  theme = {
    colorscheme = {
      name = "catppuccin";
      variant.dark = "mocha";
    };
    font = {
      family = "JetBrains Mono";
      style = "Italic";
    };
    wallpaper = ../wallpaper.png;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    maple-mono-NF
    fira-code
    noto-fonts
    jetbrains-mono
    cozette
  ];
}
