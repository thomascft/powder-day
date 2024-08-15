{
  inputs,
  config,
  lib,
  ...
}: let
  colorscheme =
    lib.concatStrings (with config.theme.colorscheme; [name "-" variant.dark]);
in {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm-nightly.packages.x86_64-linux.default;
    extraConfig = ''
      local config = {}

      if wezterm.config_builder() then
        config = wezterm.config_builder()
      end

      config.color_scheme = "${colorscheme}"
      config.font = wezterm.font({
        family = "${config.theme.font.family}",
        style = "${config.theme.font.style}",
      })

      config.enable_tab_bar = false
      return config
    '';
  };
}
