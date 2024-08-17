{inputs, lib, pkgs, ...}:{
  nix.registry.nixpkgs.flake = inputs.nixpkgs; # Make nix commands use the same version of nixpkgs
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.overlays = [
    (self: super: {
      vulkan-validation-layers = super.vulkan-validation-layers.overrideAttrs (oldAttrs: {
        buildInputs = oldAttrs.buildInputs ++ [pkgs.spirv-tools];
      });
    })
  ];
  
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
      "nvidia-settings"
      "nvidia-x11"
      "android-studio"
  ];

  environment.systemPackages = with pkgs; [
    git
    helix
  ];
}
