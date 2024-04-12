{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
  ];

  time.timeZone = "America/Denver";

  users.users.thomas = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.nushell;
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  services.sshd.enable = true;
  services.tailscale.enable = true;
  services.udisks2.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    settings.auto-optimise-store = true;
  };

  environment.systemPackages = with pkgs; [
    git
    helix
    zellij
    sbctl # FIXME for temporary use with lanzaboote
  ];
}
