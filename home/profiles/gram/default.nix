{...}: {
  imports = [
    ../../services/wayland

    ../../programs/helix.nix

    ../../terminal/shells/nushell
    ../../terminal/programs
    ../../terminal/emulators/wezterm
    ../../terminal/emulators/kitty.nix

    ../../programs/brave.nix
    ../../programs/wayland
    ../../programs/logseq.nix
    ../../programs/spicetify.nix
    ../../programs/webcord.nix
    ../../programs/gaming.nix
  ];
}
