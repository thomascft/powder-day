{home-manager, pkgs, ...}:{
 imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./nvidia.nix

    ../../base
    ../../hyprland
  ];

  time.timeZone = "America/Denver";

  users.users.thomas = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.nushell;
  };


  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["int3404_thermal"];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    resumeDevice = "/dev/nvme0n1p2";
    kernelParams = [
      "resume_offset=533760"
    ];
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  services.thermald.enable = true;
  services.tlp.enable = true;
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };
 
  networking.hostName = "gram";

  system.stateVersion = "24.05";
}
