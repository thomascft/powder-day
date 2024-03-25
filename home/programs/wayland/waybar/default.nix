{...}:{
   programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        margin = "20px 20px 0px 20px";
        modules-left = [ "hyprland/workspaces"];
        modules-center = [ "hyprland/window" ];
        modules-right = ["upower" "clock"];

        "hyprland/workspaces" = {};
        "hyprland/window" = {};

        "upower" = {};
        "clock" = {};
      };
    };
    style = builtins.readFile ./style.css;
  };
}
