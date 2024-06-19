{...}: {
  services.syncthing = {
    enable = true;
    user = "thomas";
    dataDir = "/home/thomas/Documents/sync";
    configDir = "/home/thomas/Documents/sync/.config/syncthing";
  };
}
