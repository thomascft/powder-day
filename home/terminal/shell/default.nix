{...}: {
  imports = [];

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
        $directory $character
      '';
      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };
      directory = {
        format = "[](fg:green)[$path](bold fg:black bg:green)[](fg:green)";
      };
    };
  };

  programs.carapace = {
    enable = true;
  };
}
