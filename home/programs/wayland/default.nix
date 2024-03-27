{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar
    ../anyrun
  ];
}
