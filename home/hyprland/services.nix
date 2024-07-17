{config, pkgs, ...}:{
  
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [ "${config.theme.wallpaper}" ];
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
          onTimeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 10";
          onResume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }
        {
          timeout = 300;
          onTimeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
      ];
    };
  };
  services.mako = {
    enable = true;
  };
}
