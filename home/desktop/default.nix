{inputs, config, pkgs, ...}:{
  imports = [
    ./hyprland.nix
    ./firefox.nix
    ./wezterm.nix
    ./anyrun.nix
    ./theme.nix
  ];

  services.gnome-keyring.enable = true;
}
