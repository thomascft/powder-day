{
  config,
  pkgs,
  ...
}: {
  imports = [];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        after_sleep_cmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
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
        {
          timeout = 900;
          onTimeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
