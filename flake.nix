{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/?ref=nixpkgs-unstable";

    anyrun.url = "github:Kirottu/anyrun";
    # anyrun.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    # Don't override hyprland nixpkgs

    wezterm-nightly.url = "github:thomascft/wezterm-nightly-flake";

    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";

    hypridle.url = "github:hyprwm/hypridle";
    hypridle.inputs.nixpkgs.follows = "nixpkgs";

    hyprlock.url = "github:hyprwm/hyprlock";
    hyprlock.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v0.3.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    jovian.url = "github:Jovian-Experiments/Jovian-NixOS";
    jovian.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    homeManagerModules.theme = import ./modules/home/theme.nix;
    nixosConfigurations.gram = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs self;};
      modules = [
        ./system/hosts/gram
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.thomas = ./home/profiles/gram;

          home-manager.extraSpecialArgs = {inherit inputs self;};
        }
      ];
    };
    # homeConfigurations."thomas@gram" = home-manager.lib.homeManagerConfiguration {
    #   pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #   extraSpecialArgs = {inherit inputs self;};
    #   modules = [
    #     ./home/profiles/gram
    #   ];
    # };

    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
