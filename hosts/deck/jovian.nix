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
    autoStart = true;
  };
  jovian.devices.steamdeck.enable = true;
}
