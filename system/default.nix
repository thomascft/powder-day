{inputs, lib, pkgs, ...}:{

  environment.systemPackages = with pkgs; [
    helix
    git
    w3m
  ];

  # Nix Settings
  
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-settings"
      "nvidia-x11"  
      "anytype"
  ];

  nixpkgs.overlays = [
    (self: super: {
      vulkan-validation-layers = super.vulkan-validation-layers.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [pkgs.spirv-tools];
      });
    })
  ];

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
