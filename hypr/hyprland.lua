hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

local terminal = "wezterm"
local fileManager = "thunar"
local menu = "hyprlauncher"

hl.on("hyprland.start", function()
	hl.exec_cmd(
		"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland"
	)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("/usr/lib64/polkit-kde-authentication-agent-1")
	hl.exec_cmd("/usr/bin/hypr_portal")
	hl.exec_cmd("wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store")
	hl.exec_cmd("waybar & hyprpaper & hyprsunset & hyprlauncher -d")
	hl.exec_cmd("hypridle & hyprlock")
	hl.exec_cmd(terminal)
end)

---@param env table<string, string>
local function set_env(env)
	for name, value in pairs(env) do
		hl.env(name, value)
	end
end

set_env({
	LIBVA_DRIVER_NAME = "nvidia",
	GDK_BACKEND = "wayland",
	QT_QPA_PLATFORM = "wayland",
	XDG_SESSION_TYPE = "wayland",
	XDG_CURRENT_DESKTOP = "Hyprland",
	XDG_SESSION_DESKTOP = "Hyprland",
	GBM_BACKEND = "nvidia-drm",
	__GLX_VENDOR_LIBRARY_NAME = "nvidia",
	__GL_VRR_ALLOWED = "0",
	NVD_BACKEND = "direct",
	ELECTRONE_OZONE_PLATFORM_HINT = "auto",
	SDL_VIDEODRIVER = "wayland",
	GTK_THEME = "Sweet-Dark",
	HYPRCURSOR_SIZE = "36",
	XCURSOR_SIZE = "36",
})

hl.config({
	xwayland = { force_zero_scaling = true },
	ecosystem = { enforce_permissions = true },
	general = {
		gaps_in = 2,
		gaps_out = 10,
		border_size = 0,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = true,
		layout = "master",
	},

	decoration = {
		rounding = 10,
		rounding_power = 4,
		active_opacity = 1.0,
		inactive_opacity = 0.9,
		shadow = { enabled = true, range = 4, render_power = 3, color = 0xee1a1a1a },
		blur = { enabled = true, size = 3, passes = 1, vibrancy = 0.1696 },
	},
	animations = { enabled = true },
	master = { new_status = "master" },
	dwindle = { preserve_split = true },
	scrolling = { fullscreen_on_one_column = true },
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
	input = {
		kb_layout = "us",
		kb_variant = "dvorak",
		kb_model = "pc104",
		kb_options = "grp:win_space_toggle",
		kb_rules = "",
		repeat_rate = 52,
		numlock_by_default = false,
		force_no_accel = false,
		natural_scroll = true,
		repeat_delay = 500,
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.,
		touchpad = { natural_scroll = true, disable_while_typing = false },
	},
})

---@overload fun(perms: { [1]: string, [2]: string, [3]: string }[])
---@overload fun(perms: { binary: string, type: string, mode: string }[])
local function set_permissions(perms)
	for _, perm in ipairs(perms) do
		if perm.binary and perm.type and perm.mode then
			---@cast perm { binary: string, type: string, mode: string }
			hl.permission(perm)
		else
			---@cast perm { [1]: string, [2]: string, [3]: string }
			hl.permission({
				binary = perm[1],
				type = perm[2],
				mode = perm[3],
			})
		end
	end
end

set_permissions({
	{ "/usr/(bin|local/bin)/grim", "screencopy", "allow" },
	{ "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/hyprpm", "plugin", "allow" },
	{ "/usr/(bin|local/bin)/grim", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/hypridle", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/hyprcap", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/hyprlock", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/xdg-desktop-portal-hyprland", "screencopy", "allow" },
	{ "/usr/(bin|local/bin)/hyprpm", "plugin", "allow" },
	{ "/usr/(bin|local/bin)/hyprpicker", "screencopy", "allow" },
})

---@param curves table<string, table>
local function set_curve(curves)
	for name, curve in pairs(curves) do
		hl.curve(name, curve)
	end
end

set_curve({
	easeOutQuint = { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } },
	easeInOutCubic = { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } },
	linear = { type = "bezier", points = { { 0, 0 }, { 1, 1 } } },
	almostLinear = { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } },
	quick = { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } },
	easy = { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 },
})

---@param animations table[]
local function set_animations(animations)
	for _, animation in ipairs(animations) do
		hl.animation(animation)
	end
end

set_animations({
	{ leaf = "global", enabled = true, speed = 10, bezier = "default" },
	{ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" },
	{ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" },
	{ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" },
	{ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" },
	{ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" },
	{ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" },
	{ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" },
	{ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" },
	{ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" },
	{ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" },
	{ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" },
	{ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" },
	{ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" },
	{ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" },
	{ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" },
	{ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" },
})

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -z -m region"))

hl.layer_rule({ name = "waybar-blur", match = { namespace = "waybar" }, blur = true })

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
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
hl.window_rule({ name = "firefox-no-blur", match = { class = "firefox" }, no_blur = true })
hl.window_rule({ name = "pinentry-focus", match = { class = "(pinentry-)(.*)" }, stay_focused = true })
