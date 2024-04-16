{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./nvidia.nix

    ../../system/services/greetd.nix
    ../../system/programs/hyprland.nix
    ../../system/programs/steam.nix
    ../../system/services/upower.nix
    ../../system/services/tlp.nix
    ../../system/services/sound.nix
    ../../system/services/syncthing.nix
    ../../system/lanzaboote.nix
  ];

  networking.hostName = "gram";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
