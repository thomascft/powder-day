{pkgs, ...}:{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    iosevka
  ];
}
