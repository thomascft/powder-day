{inputs, config, pkgs, ...}:{
	imports = [
		./hardware-configuration.nix
		../../aagl.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "deck";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Denver";

	users.users.thomas = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
		shell = pkgs.nushell;
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
		helix
		zellij
		cachix
	];

	services.xserver.enable = true;
	services.xserver.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};

	jovian.steam = {
		enable = true;
		user = "thomas";
		autoStart = false; # Can't return to gamescope-session from Hyprland
		desktopSession = "hyprland";
	};
	jovian.decky-loader = {
		enable = true;
		user = "thomas";
	};
	jovian.devices.steamdeck.enable = true;

	disko.devices = import ./disko.nix;

	system.stateVersion = "24.05";
}
