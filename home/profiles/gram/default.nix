{...}: {
  imports = [
    ../../services/wayland

    ../../programs/helix.nix

    ../../terminal/shell
    ../../terminal/emulators/wezterm

    ../../programs/brave.nix
    ../../programs/wayland
    ../../programs/logseq.nix
    ../../programs/spicetify.nix
    ../../programs/webcord.nix
  ];
}
