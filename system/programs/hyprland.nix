{...}: {
  environment.variables.NIXOS_OZONE_WL = "true";
  programs.hyprland.enable = true;

  security.pam.services.hyprlock.text = "auth include login";
}
