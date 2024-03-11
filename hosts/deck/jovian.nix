{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.jovian.nixosModules.default
  ];
  # TODO Replace sddm with Jovian autostart
  services.xserver.enable = true;
  services.xserver.displayManager.sddm = {
    enable = true;
    package = pkgs.kdePackages.sddm;
    theme = "breeze";
    extraPackages = with pkgs.kdePackages; [
      breeze-icons
      kirigami
      plasma5support
      qtsvg
      qtvirtualkeyboard
    ];
    settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };

  jovian.steam = {
    enable = true;
    autoStart = false;
  };
  jovian.devices.steamdeck.enable = true;
}
