{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.jovian.nixosModules.default
  ];

  jovian.steam = {
    enable = true;
    user = "thomas";
    desktopSession = "hyprland";
    autoStart = true;
  };
  jovian.devices.steamdeck.enable = true;
}
