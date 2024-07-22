{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = ["${config.theme.wallpaper}"];
      wallpaper = [
        "eDP-1,${config.theme.wallpaper}"
        "DP-1,${config.theme.wallpaper}"
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        lock_cmd = "${pkgs.procps}/bin/pidof hyprlock || ${config.programs.hyprlock.package}/bin/hyprlock";
      };
      listener = [
        {
          timeout = 150;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 300;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 330;
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
  services.mako = {
    enable = true;
  };
}
