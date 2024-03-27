{...}: {
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
    settings = {
      format = ''
        [](fg:green)[](bold fg:black bg:green)[](fg:green)
      '';
      character = {
        success_symbol = "";
      };
    };
  };

  programs.carapace = {
    enable = true;
  };
}
