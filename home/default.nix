{config, lib, pkgs, ...}:{
  home.username = "thomas";
  home.homeDirectory = "/home/thomas";

  home.packages = with pkgs; [];

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

# Git
  
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "thomas.croft@proton.me";
    userName = "Thomas Croft";
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

# Helix

  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings.theme = "tokyonight";

    languages.language-server.nil = {
      command = lib.getExe pkgs.nil;
      config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
    };

    extraPackages = with pkgs; [
      rust-analyzer
      nil
      marksman
    ];
  };
  
# Shell
  
  programs.starship = {
    enable = true;
  };

  programs.nushell = {
    enable = true;
    environmentVariables = builtins.mapAttrs (name: value: "\"${builtins.toString value}\"") config.home.sessionVariables;
  };}
