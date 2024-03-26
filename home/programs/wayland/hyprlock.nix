{
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.hyprlock.homeManagerModules.default
  ];

  programs.hyprlock = {
    enable = true;
    labels = [];
    input-fields = [
      {
        fade_on_empty = false;
        outer_color = "rgb(205, 214, 244)";
        font_color = "rgb(205, 214, 244)";
        inner_color = "rgb(30, 30, 46)";
      }
    ];
    backgrounds = [
      {
        path = "${config.theme.wallpaper}";

        blur_passes = 3;
        blur_size = 12;
      }
    ];
  };
}
