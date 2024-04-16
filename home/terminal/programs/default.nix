{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    gdb
    ripgrep
    unzip
  ];
}
