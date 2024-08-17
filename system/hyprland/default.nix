{
  inputs,
  config,
  pkgs,
  ...
}: {
  environment.variables.NIXOS_OZONE_WL = "true";
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.hyprland.package}/bin/Hyprland";
        user = "thomas";
      };
    };
  };

  security.pam.services.hyprlock.text = "auth include login";
}
