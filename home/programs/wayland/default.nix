{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ./waybar
    ../anyrun
    ../alacritty.nix
    ../../services/wayland
  ];
}
