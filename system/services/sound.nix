{pkgs, ...}: {
  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
  };

  systemd.services.audio-fix = {
    description = "Updates HDA verbs to fix speakers";
    path = with pkgs; [
      alsa-tools
    ];
    after = ["getty.target"];
    script = builtins.readFile (
      builtins.fetchurl {
        url = "https://github.com/joshuagrisham/galaxy-book2-pro-linux/raw/main/sound/necessary-verbs.sh";
        sha256 = "sha256:030xadxg35hacbw085hbrb86b0m8zr7cl1i1qm6vwxrczqwxqnax";
      }
    );
  };
}
