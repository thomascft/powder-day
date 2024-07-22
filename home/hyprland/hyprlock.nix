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
          size = "200, 50";
          position = "0, -200";
          outline_thickness = 0;
          fade_on_empty = false;
          placeholder_text = "<span font_desc='Maple Mono NF Italic'>Input Password...</span>";
          font_color = "rgb(205, 214, 244)";
          inner_color = "rgb(30, 30, 46)";
        }
      ];
      label = [
        {
          text = "$TIME";
          position = "0, 0";
          halign = "center";
          valign = "center";
          font_size = 80;
          font_family = "Maple Mono NF Italic";
          color = "rgb(205, 214, 244)";
        }
      ];
      background = [
        {
          path = "${config.theme.wallpaper}";
          blur_passes = 3;
          blur_size = 4;
        }
      ];
    };
  };
}
