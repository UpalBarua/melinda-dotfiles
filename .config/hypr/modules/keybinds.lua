---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local terminal = "kitty --single-instance"
local screenshotDir = "~/Pictures/screenshots"
local screenshotFile = "screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"

-- Mster layout
hl.bind(mainMod .. " + L", hl.dsp.layout("mfact +0.1"))
hl.bind(mainMod .. " + H", hl.dsp.layout("mfact -0.1"))

hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))

hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev"))

hl.bind(mainMod .. " + Period", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. " + Comma", hl.dsp.focus({ monitor = "-1" }))
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ last = true }))

hl.bind(mainMod .. " + SHIFT + Period", hl.dsp.window.move({ monitor = "+1" }))
hl.bind(mainMod .. " + SHIFT + Comma", hl.dsp.window.move({ monitor = "-1" }))

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.layout("swapwithmaster"))

hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + D", hl.dsp.layout("removemaster"))

hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.pin())

hl.bind(mainMod .. " + M", function()
	hl.config({ general = { layout = "monocle" } })
end)
hl.bind(mainMod .. " + T", function()
	hl.config({ general = { layout = "master" } })
end)
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + Grave", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Grave", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- GUI Programs
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("$BROWSER"))
hl.bind(mainMod .. " + SHIFT + CTRL + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/autostart.sh"))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd("obsidian"))

-- TUI Programs
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("$TERMINAL -e lf"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("$TERMINAL -e btop"))

-- Webapps
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("$BROWSER --app=https://web.whatsapp.com"))
hl.bind(mainMod .. " + CTRL + G", hl.dsp.exec_cmd("$BROWSER --app=https://gemini.google.com"))

-- Rofi
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("rofi -show emoji -modi emoji"))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-session.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-quick-toggles.sh"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-music.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/rofi/scripts/rofi-bluetooth.sh"))
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p 'Clipboard' -display-columns 2 | cliphist decode | wl-copy")
)

-- Volume and Brightness
hl.bind(mainMod .. " + BracketRight", hl.dsp.exec_cmd("volume.sh -i"))
hl.bind(mainMod .. " + BracketLeft", hl.dsp.exec_cmd("volume.sh -d"))
hl.bind(mainMod .. " + BackSlash", hl.dsp.exec_cmd("volume.sh -m"))
hl.bind(mainMod .. " + SHIFT + BracketRight", hl.dsp.exec_cmd("brightness.sh -i"))
hl.bind(mainMod .. " + SHIFT + BracketLeft", hl.dsp.exec_cmd("brightness.sh -d"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m active -m output -o " .. screenshotDir .. " -f " .. screenshotFile))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region -o " .. screenshotDir .. " -f " .. screenshotFile))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprpicker -a -n"))
hl.bind(
	mainMod .. " + SHIFT + Print",
	hl.dsp.exec_cmd("hyprshot -m region -o" .. screenshotDir .. " -f " .. screenshotFile)
)

hl.bind(mainMod .. " + CTRL + Space", hl.dsp.exec_cmd("awww-randbg.sh"))
