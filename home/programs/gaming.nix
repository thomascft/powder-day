{lib, pkgs, ...}:{
  home.packages = with pkgs; [
    # steam is enabled system-level
    heroic
  ];
}
