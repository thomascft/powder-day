{lib, pkgs, ...}:{
  imports = [
    ./hardware-configuration.nix
    ./storage.nix
    ./graphics.nix
    ./home.nix
  ] ++ (builtins.map (p: lib.path.append ../../system p) [
      "default.nix"
      "desktop"
  ]);
    
  time.timeZone = "America/Denver";
  
  # Bootloader
  
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["int3404_thermal"]; # Stop ACPI log spam
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # User

  users.users.thomas = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.nushell;
  };

  # Power & Thermal

  services.thermald.enable = true;
  services.tlp.enable = true;
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };

  # Networking

  networking.hostName = "gram";
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # State Version
  
  system.stateVersion = "24.11";
}
