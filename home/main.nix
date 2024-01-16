{inputs, lib, config, pkgs, ...}:{

	imports = [
		./hyprland.nix
	];

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = _:true;
		};
	};

	home = {
		username = "thomas";
		homeDirectory = "/home/thomas";
		packages = with pkgs; [
			brave
			steam
		];
	};

	programs.home-manager.enable = true;
	programs.git.enable = true;

	# Reloads system units when switching
	systemd.user.startServices = "sd-switch";

	home.stateVersion = "24.05";
}
