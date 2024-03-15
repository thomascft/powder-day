{pkgs, ...}:{
  services.pipewire ={
    enable = true;
    audio.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alsa-tools
  ];
  
  systemd.services.audio-fix = {
    description = "Updates HDA verbs to fix speakers";
    after = [ "getty.target" ];
    script = builtins.fetchurl {
      url = "https://github.com/joshuagrisham/galaxy-book2-pro-linux/raw/main/sound/necessary-verbs.sh";
      sha256 = "sha256:030xadxg35hacbw085hbrb86b0m8zr7cl1i1qm6vwxrczqwxqnax";
    };
  };
}
