{...}: {
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
}
