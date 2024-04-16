{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      "$term" = "${config.programs.kitty.package}/bin/kitty";
      "$runner" = "${config.programs.anyrun.package}/bin/anyrun";

      exec-once = [
        "${config.programs.hyprlock.package}/bin/hyprlock"
      ];

      monitor = [
        ",preferred,auto,auto"

        "desc:LG Electronics LG HDR 4K 0x0001D796, highres, 0x0, 1"
        "desc:HP Inc. HP Z24n G2 6CM9171S6F, preferred, 1920x-400, 1"
        "desc:Valve Corporation ANX7530 U 0x00000001, preferred, 3840x0, 1, transform, 3"
      ];

      general = {
        border_size = 4;
        gaps_in = 10;
        gaps_out = 20;
        "col.active_border" = "rgb(a6e3a1)";
        "col.inactive_border" = "rgb(11111b)";
      };

      decoration = {
        rounding = 12;

        shadow_render_power = 2;
        shadow_range = 16;
        "col.shadow" = "rgba(11111b4d)";

        blur = {
          enabled = "yes";
          size = 12;
          passes = 3;
          ignore_opacity = true;
        };
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        # force_default_wallpaper = 0;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      input.follow_mouse = 1;
      input.mouse_refocus = false;

      windowrulev2 = [
        # -- Fix odd behaviors in IntelliJ IDEs --
        # Fix focus issues when dialogs are opened or closed
        # "windowdance,class:^(jetbrains-.*)$,floating:1"
        # Fix splash screen showing in weird places and prevent annoying focus takeovers"
        "nofocus,class:^jetbrains-(?!toolbox),floating:1,title:^win\d+$"
        "noinitialfocus,class:^jetbrains-(?!toolbox),floating:1"

        "center,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        "nofocus,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"
        "noborder,class:^(jetbrains-.*)$,title:^(splash)$,floating:1"

        "float, title: ^( Picture in picture)$"
        "pin, title: ^( Picture in picture)$"
        "stayfocused, title:^()$,class:^(steam)$"
        "minsize 1 1, title:^()$,class:^(steam)$"

        "workspace 5,class:^(genshinimpact.exe)$"

        "opacity 0.8 override 0.8 override,class:(Logseq)"
      ];

      workspace = [
        "10, monitor:eDP-1, default:true"
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
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

        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];
    };
  };

  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark-Cursors";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 16;
  };

  home.packages = with pkgs; [
    wl-clipboard
    playerctl
  ];
}
