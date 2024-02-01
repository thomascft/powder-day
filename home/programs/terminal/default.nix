{pkgs, ...}:{
  imports = [
    ./shells/nushell.nix
    #./shells/bash.nix # Shell
    ./starship.nix # Prompt
    ./carapace.nix # Completion
    ./zellij.nix # Multiplexer
  ];
}
