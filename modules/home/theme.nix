{lib, ...}:{
  options.theme = {
    colorscheme = {
      name = lib.mkOption {
        type = lib.types.str;
        description = ''
          The name of the colorscheme you'd like to use within your home configuration
        '';
      };
      variant = lib.mkOption {
        type = lib.types.str;
        description = ''
          The colorscheme variant that should be used
        '';
      };
    };
    font = {
      package = lib.mkOption {
        type = lib.types.package;
        description = ''
          The main font package
        '';
      };
      family = lib.mkOption {
        type = lib.types.str;
        description =  ''
          The name of the main font family
        '';
      };
      style = lib.mkOption {
        type = lib.types.str;
        description = ''
          The font style to use
        '';
      };
    };
    wallpaper = lib.mkOption {
      type = lib.types.path;
      description = ''
        The wallpaper that you'd like to use within your home configuration
      '';
    };
  };
}
