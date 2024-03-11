{...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../nixos/programs/hyprland.nix
  ];

  networking.hostName = "gram";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
