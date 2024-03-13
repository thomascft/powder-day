{inputs, pkgs, lib, ...}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];

  time.timeZone = "America/Denver";

  users.users.thomas = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.nushell;
  };

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    loader.systemd-boot.enable = lib.mkForce false;
    loader.efi.canTouchEfiVariables = true;
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  services.sshd.enable = true;

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
