{self, pkgs, ...}: {
  imports = [
    self.homeManagerModules.theme
  ];

  theme = {
    colorscheme = {
      name = "catppuccin";
      variant = "mocha";
    };
    font = {
      package = pkgs.maple-mono-NF;
      family = "Maple Mono NF";
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
  ];
}
