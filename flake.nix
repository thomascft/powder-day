{
  description = "It just snowed, time to enjoy the fresh pow";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://anyrun.cachix.org"
      "https://hyprland.cachix.org"
      "https://wezterm-nightly.cachix.org"
    ];
    extra-trusted-public-keys = [
      "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "wezterm-nightly.cachix.org-1:zsTr51TeTCRg+bHwUr0KfW3XIIb7Avisrj/hXwVzC2c="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # System Inputs

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    # Desktop Inputs

    hyprland.url = "git+https://github.com/hyprwm/hyprland?submodules=1";

    wezterm.url = "github:thomascft/wezterm-nightly-flake";

    anyrun.url = "github:anyrun-org/anyrun";

    firefox-nightly.url = "github:nix-community/flake-firefox-nightly";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations.gram = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;};
      modules = [
        ./hosts/gram
      ];
    };
  };
}
