{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../system/services/greetd.nix
    ../../system/programs/hyprland.nix
  ];

  networking.hostName = "gram";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}