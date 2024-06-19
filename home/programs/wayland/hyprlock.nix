{
  inputs,
  config,
  ...
}: {
  imports = [];

  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = [
        {
          fade_on_empty = false;
          outer_color = "rgb(205, 214, 244)";
          font_color = "rgb(205, 214, 244)";
          inner_color = "rgb(30, 30, 46)";
        }
      ];
      background = [
        {
          path = "${config.theme.wallpaper}";
          blur_passes = 3;
          blur_size = 12;
        }
      ];
    };
  };
}
