{config, lib, ...}:{
  programs.kitty= {
    enable = true;
    theme = config.theme.colorscheme.name;

    font.name = lib.concatStrings (with config.theme.font; [family " " style]);
    font.size = 10;
  };
}
