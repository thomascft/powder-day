{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/wayland/hyprland
    ./programs/editors/helix
    ./programs/terminal
    ./programs/wezterm
    ./programs/brave
    ./programs/spotify
    ./programs/discord
    ./programs/logseq
    ./programs/gaming
    ./fonts.nix
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
    packages = with pkgs; [];
  };

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userEmail = "thomas.croft@proton.me";
    userName = "Thomas Croft";
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  # Reloads system units when switching
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
