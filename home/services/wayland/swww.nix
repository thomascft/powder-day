{pkgs, ...}: {
  home.packages = with pkgs; [
    swww
  ];
  systemd.user.services = {
    swww-daemon = {
      Unit = {
        Description = "swww, A salution to your Wayland Wallpaper Woes";
        Documentation = "https://github.com/Hourus645/swww";
        PartOf = ["hyprland-session.target"];
        After = ["hyprland-session.target"];
      };

      Service = {
        ExecStart = "${pkgs.swww}/bin/swww-daemon";
        ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
        Restart = "on-failure";
        KillMode = "mixed";
      };
      Install = {
        WantedBy = ["hyprland-session.target"];
        Also = ["swww-wallpaper.service"];
      };
    };
    swww-wallpaper = {
      Unit = {
        Description = "Default wallpaper for swww";
        PartOf = ["hyprland-session.target"];
        After = ["swww-daemon.service"];
      };

      Service = {
        ExecStart = "${pkgs.swww}/bin/swww img /home/thomas/powder-day/wallpaper.png";
        ExecReload = "${pkgs.swww}/bin/swww img /home/thomas/powder-day/wallpaper.png";
        Restart = "on-failure";
        KillMode = "mixed";
      };
      Install = {
        WantedBy = ["swww-daemon.service"];
      };
    };
  };
}
