{pkgs, ...}:{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  home.sessionVariables = {
    "HYPRCURSOR_THEME" = "catppuccin-mocha-dark-cursors";
    "HYPRCURSOR_SIZE" = 24;
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    iosevka
  ];
}
