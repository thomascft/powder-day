{pkgs, ...}:{
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    gdb
    ripgrep
    unzip
  ];
}
