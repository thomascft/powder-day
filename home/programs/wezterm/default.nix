{pkgs, ...}:{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local config  = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.color_scheme = "catppuccin-mocha"
      config.font = wezterm.font({
        family = "Iosevka",
        style = "Italic",
      })
      
      config.enable_tab_bar = false
      
      return config
    '';
  };
  
}
