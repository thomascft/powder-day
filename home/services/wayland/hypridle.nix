{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  services.hypridle = {
    enable = true;
    lockCmd = "${pkgs.procps}/bin/pidof hyprlock || ${config.programs.hyprlock.package}/bin/hyprlock";
    beforeSleepCmd = "${pkgs.systemd}/bin/loginctl lock-session";
    afterSleepCmd = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
    listeners = [
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
}
