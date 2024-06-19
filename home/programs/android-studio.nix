{pkgs, lib, ...}:{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "android-studio-stable"
    ];
  home.packages = with pkgs; [
    android-studio
  ];
}
