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
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["int3403_thermal"]; # Stops ACPI log spam
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    resumeDevice = "/dev/nvme0n1p2";
    kernelParams = [
      "resume_offset=533760"
    ];
  };

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  services.syncthing = {
    enable = true;
    user = "thomas";
    dataDir = "/home/thomas/Documents/sync";
    configDir = "/home/thomas/Documents/sync/.config/syncthing";
  };
  services.thermald.enable = true;
  services.fwupd.enable = true;
  services.sshd.enable = true;
  services.tailscale.enable = true;
  services.tlp.enable = true;
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
        (self: super: {
      vulkan-validation-layers = super.vulkan-validation-layers.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [pkgs.spirv-tools];
      });
    })
  ];
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
