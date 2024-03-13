{...}: {
  imports = [
    ./theme.nix
  ];
  home = {
    username = "thomas";
    homeDirectory = "/home/thomas";
    stateVersion = "24.05";
  };
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  programs.home-manager.enable = true;
}
