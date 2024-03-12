{...}:{
  imports = [
    ./git.nix
  ];

  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        show_banner: false,
      }
    '';
  };

  programs.starship = {
    enable = true;
  };

  programs.carapace = {
    enable = true;
  };
}
