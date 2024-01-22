{pkgs, ...}:{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = "catppuccin_mocha"
      };
    '';
  };
  
}
