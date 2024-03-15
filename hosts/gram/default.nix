{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../system/services/greetd.nix
    ../../system/programs/hyprland.nix
    ../../system/services/upower.nix
    ../../system/services/tlp.nix
    ../../system/services/sound.nix
    ../../system/lanzaboote.nix
  ];

  networking.hostName = "gram";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
