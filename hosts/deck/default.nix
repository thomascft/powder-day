{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ./jovian.nix
  ];

  networking.hostName = "deck";
  hardware.bluetooth.enable = true;

  system.stateVersion = "24.05";
}
