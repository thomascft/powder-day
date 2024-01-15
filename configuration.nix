{inputs, config, pkgs, ...}:{
	imports = [
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "deck";
	networking.networkmanager.enable = true;

	time.timeZone = "America/Denver";
	
	environment.systemPackages = with pkgs; [
		neovim
		zellij
	];

	disko.devices = import ./disko.nix;

	system.stateVersion = "24.05";
}
