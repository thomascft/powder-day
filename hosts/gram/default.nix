{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../system/services/greetd.nix
    ../../system/programs/hyprland.nix
    ../../system/services/upower.nix
  ];

  networking.hostName = "gram";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
