{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "bkkmolkhemgaeaeggcmfbghljjjoofoh" # Catppuccin Mocha
    ];
  };
}
