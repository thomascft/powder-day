{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./hyprlock.nix
    ../anyrun
    ../wezterm
    ../../services/wayland
  ];
}
