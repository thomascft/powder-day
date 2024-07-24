{config, ...}: {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
        environmentVariables = builtins.mapAttrs (name: value: "\"${builtins.toString value}\"") config.home.sessionVariables;
  };
}
