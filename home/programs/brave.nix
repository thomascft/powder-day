{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      "bkkmolkhemgaeaeggcmfbghljjjoofoh" # Catppuccin Mocha
    ];
  };
}
