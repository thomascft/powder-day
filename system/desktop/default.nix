{inputs, config, pkgs, ...}:{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  
  # Auto-login

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${config.programs.hyprland.package}/bin/Hyprland";
        user = "thomas";
      };
    };
  };
}
