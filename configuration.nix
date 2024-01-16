{inputs, config, pkgs, ...}:{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "deck";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Denver";

	users.users.thomas = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
	};

	programs.hyprland.enable = true;
	
	nix = {
		package = pkgs.nixFlakes;
		extraOptions = ''
			experimental-features = nix-command flakes
		'';
	};

	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		git
		neovim
		zellij
		kitty
		brave
	];

	jovian.steam = {
		enable = true;
		user = "thomas";
		autoStart = true;
		desktopSession = "hyprland";
	};
	jovian.devices.steamdeck.enable = true;

	disko.devices = import ./disko.nix;

	system.stateVersion = "24.05";
}
