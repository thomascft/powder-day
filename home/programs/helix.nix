{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "catppuccin_override";
    };
    themes.catppuccin_override = {
      "editor.indent-guides" = {
        render = true;
      };
      "inherits" = "catppuccin_mocha";
      "ui.background" = "none";
    };

    extraPackages = with pkgs; [
      nil
    ];
    
  };
}
