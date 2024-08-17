{...}: {
  imports = [
    ../../. # home/default.nix
    ../../hyprland

    ../../programs/helix.nix

    ../../terminal/shells/nushell
    ../../terminal/programs
    ../../terminal/emulators/wezterm
    ../../terminal/emulators/kitty.nix

    ../../programs/firefox
    ../../programs/brave.nix
    # ../../programs/logseq.nix
    ../../programs/spicetify.nix
    ../../programs/webcord.nix
    ../../programs/gaming.nix
    # ../../programs/android-studio.nix
  ];
}
