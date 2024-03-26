{lib, ...}: {
  options.theme = {
    colorscheme = {
      name = lib.mkOption {
        type = lib.types.str;
      };
      variant = {
        dark = lib.mkOption {
          type = lib.types.str;
        };
        light = lib.mkOption {
          type = lib.types.str;
        };
      };
    };
    font = {
      family = lib.mkOption {
        type = lib.types.str;
      };
      style = lib.mkOption {
        type = lib.types.str;
      };
    };
    wallpaper = lib.mkOption {
      type = lib.types.path;
    };
  };
}
