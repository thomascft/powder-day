{pkgs, ...}: {
  imports = [
    ./git.nix
    ./zellij.nix
    ./starship.nix
    ./carapace.nix
  ];

  home.packages = with pkgs; [
    gdb
    ripgrep
    unzip
    glow
  ];
}
