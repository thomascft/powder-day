{inputs, config, pkgs, ...}:{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;

    settings = {
      "$mod" = "SUPER";

      "$term" = "${config.programs.wezterm.package}/bin/wezterm";
      "$runner" = "${config.programs.anyrun.package}/bin/anyrun";

      monitor = [
        ",preferred,auto,auto"

        "desc:LG Display 0x075B, preferred, 0x0, 1"
        "desc:LG Electronics LG HDR 4K 0x0001D796, preferred, 2560x0, 1"
        "desc:HP Inc. HP Z24n G2 6CM9171S6F, preferred, 1920x-400, 1"
      ];

      general = {
        border_size = 2;
        gaps_in = 8;
        gaps_out = 16;

        "col.active_border" = "rgb(FFFFFF)";
        "col.inactive_border" = "rgb(000000)";
      };

      decoration = {
        rounding = 4;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      input.follow_mouse = 1;
      input.mouse_refocus = false;

      workspace = [
        "10, monitor:eDP-1, default:true"
        "1, monitor:DP-1, default:true"
     ];

      bindm = [
        "SUPER,mouse:273,resizewindow"
        "SUPER,mouse:272,movewindow"
      ];

      bind = [
        "$mod, Return, exec, $term"
        "$mod, Space, exec, $runner"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl s +5%"
        ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 5%-"
        ", Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output -o ~/Pictures/screenshots"
        "SHIFT, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o ~/Pictures/screenshots"

        "$mod, Escape, exec, ${pkgs.systemd}/bin/loginctl lock-session"

        "$mod, f, fullscreen"

        "$mod, w, killactive"
        "$mod SHIFT, q, exit"
        "$mod, s, togglefloating"
        "$mod, p, pin"

        "$mod CTRL SHIFT, h, movecurrentworkspacetomonitor, -1"
        "$mod CTRL SHIFT, l, movecurrentworkspacetomonitor, +1"

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"
     ] ++ (
      builtins.concatLists (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in [
          "$mod, ${ws}, workspace, ${toString (x + 1)}"
          "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        ]
      ) 10 )
    );
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
