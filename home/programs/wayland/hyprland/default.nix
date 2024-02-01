{pkgs, ...}:{

	imports = [
		../swww
	];

	wayland.windowManager.hyprland = {
		enable = true;

	/*
		env = [
			"GDK_BACKEND=wayland,x11"
			"SDL_VIDEODRIVER=wayland"

			"XDG_CURRENT_DESKTOP=Hyprland"
			"XDG_SESSION_TYPE=wayland"
			"XDG_SESSION_DESKTOP=Hyprland"

			"QT_AUTO_SCREEN_SCALE_FACTOR=1"
			"QT_QPA_PLATFORM=wayland;xcb"
			"QT_WAYLAND_DISABLE_WINDOWDECORATION=1"
		];
	*/
		
		settings = {
			"$mod" = "SUPER";
			
			"$term" = "wezterm";
			"$runner" = "wofi --show drun";

			monitor = [
					",preferred,auto,auto"
				
					"desc:LG Electronics LG HDR 4K 0x0001D796, highres, 0x0, 1"
					"desc:Valve Corporation ANX7530 U 0x00000001, preferred, 3840x0, 1, transform, 3"
			];

			general = {
				border_size = 2;
				gaps_in = 8;
				gaps_out = 16;
				"col.active_border" = "rgb(a6e3a1)";
				"col.inactive_border" = "rgb(313244)";
			};

			decoration = {
				rounding = 8;
			};

			misc.force_default_wallpaper = 0;

			input.follow_mouse = 1;
			input.mouse_refocus = false;

			windowrulev2 = [
				"float, title: ^( Picture in picture)$"
				"pin, title: ^( Picture in picture)$"
				"stayfocused, title:^()$,class:^(steam)$"
				"minsize 1 1, title:^()$,class:^(steam)$"

				"workspace 5,class:^(genshinimpact.exe)$"
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
				# ", XF86AudioPrev, exec, "
				# ", XF86AudioPlay, exec, "
				# ", XF86AudioNext, exec, "

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
		wofi
		wl-clipboard
		kitty
	];
}
