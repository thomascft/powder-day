{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ../anyrun
    ../wezterm
    ../../services/wayland
  ];
}
