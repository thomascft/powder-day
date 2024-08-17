{config, lib, pkgs, ...}:{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };
  services.xserver.videoDrivers = ["nvidia"];

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    powerManagement.enable = true; # Experimental may interfere with suspend
    powerManagement.finegrained = true;

    open = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
