{pkgs, ...}:{
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
    fira-code
    noto-fonts
  ];
}
