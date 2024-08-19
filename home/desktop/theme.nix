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
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    iosevka
  ];
}
