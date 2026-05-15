--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Hyprland Default Rules

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Custom Rules

hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
})

hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
})

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
})
