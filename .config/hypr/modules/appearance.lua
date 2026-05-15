-----------------------
---- APPEARANCE ----
-----------------------

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 6,

		border_size = 1,

		col = {
			active_border = "rgb(524f67)",
			inactive_border = "rgb(21202e)",
		},

		resize_on_border = false,
		allow_tearing = false,

		layout = "master",
	},
	decoration = {
		rounding = 10,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(191724ee)",
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
})
