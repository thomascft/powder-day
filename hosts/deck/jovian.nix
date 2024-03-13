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
    desktopSession = "Hyprland";
    autoStart = true;
  };
  jovian.devices.steamdeck.enable = true;
}
