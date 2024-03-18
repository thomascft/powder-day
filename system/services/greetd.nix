{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      /*default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };*/
      default_session = {
        command = "Hyprland";
        user = "thomas";
      };
    };
  };
}
