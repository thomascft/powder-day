{config, lib, ...}: {
  programs.wezterm = {
    enable = true;
    extraConfig = let colorscheme =  
      lib.concatStrings (with config.theme.colorscheme; [name "-" variant.dark]);
      in ''
      local config = {}

      if wezterm.config_builder() then
        config = wezterm.config_builder()
      end

      config.enable_wayland = false
      config.color_scheme = "${colorscheme}"
      config.font = wezterm.font({
        family = "${config.theme.font.family}",
        style = "${config.theme.font.style}",
      })

      config.enable_tab_bar = false
      config.window_background_opacity = 0.8

      return config
    '';
  };
}
