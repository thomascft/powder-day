{...}: {
  imports = [
    ../../services/wayland

    ../../programs/helix.nix

    ../../terminal/shell
    ../../terminal/programs
    ../../terminal/emulators/wezterm
    ../../terminal/emulators/kitty.nix

    ../../programs/brave.nix
    ../../programs/wayland
    ../../programs/logseq.nix
    ../../programs/spicetify.nix
    ../../programs/webcord.nix
  ];
}
