{pkgs, ...}:{
	wayland.windowManager.hyprland = {
		enable = true;
		settings = {
			"$mod" = "SUPER";
			
			"$term" = "kitty";
			"$runner" = "wofi --show drun";

			monitor = ",preferred,auto,auto";

			misc.force_default_wallpaper = 0;

			bind = [
				"$mod, Return, exec, $term"
				"$mod, Space, exec, $runner"

				"$mod, f, fullscreen"

				"$mod, w, killactive"
				"$mod SHIFT, q, exit"

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

	home.packages = [
		pkgs.wofi
		pkgs.wl-clipboard
		pkgs.kitty
	];
}
