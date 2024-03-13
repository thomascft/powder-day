{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        cursorline = true;
        indent-guides = {
          render = true;
        };
      };
       theme = "catppuccin_override";
    };
    themes.catppuccin_override = {
     "inherits" = "catppuccin_mocha";
      "ui.background" = "none";
    };

    extraPackages = with pkgs; [
      nil
    ];
  };
}
