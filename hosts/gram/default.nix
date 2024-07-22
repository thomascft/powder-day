{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./nvidia.nix

    ../../system/hyprland
    ../../system/programs/steam.nix
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

  services.syncthing = {
    enable = true;
    user = "thomas";
    dataDir = "/home/thomas/Documents/sync";
    configDir = "/home/thomas/Documents/sync/.config/syncthing";
  };
  services.sshd.enable = true;
  services.tailscale.enable = true;
  services.upower.enable = true;
  services.tlp.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    settings.auto-optimise-store = true;
  };

  environment.systemPackages = with pkgs; [
    git
    helix
  ];
  networking.hostName = "gram";

  system.stateVersion = "24.05";
}
