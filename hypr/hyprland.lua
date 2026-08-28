hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })

local terminal = "wezterm"
local fileManager = "thunar"
local menu = "hyprlauncher"

---@param cmds string[]
local function cmd(cmds)
	for _, command in ipairs(cmds) do
		hl.exec_cmd(command)
	end
end

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
		gaps_in = 1,
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
		shadow = { enabled = true, range = 4, render_power = 3 },
		blur = { enabled = true, size = 3, passes = 1, vibrancy = 0.1696 },
	},
	animations = { enabled = true },
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

---@param perms ({ [1]: string, [2]: string, [3]: string }|HL.PermissionSpec)[]
local function set_permissions(perms)
	for _, perm in ipairs(perms) do
		hl.permission((perm.binary and perm.type and perm.mode) and perm or {
			binary = perm[1],
			type = perm[2],
			mode = perm[3],
		})
	end
end

set_permissions({
	{ "/usr/(bin|local/bin)/grim", "screencopy", "allow" },
	{
		"/usr/(lib|libexec|lib64|local/lib|local/libexec|local/lib64)/xdg-desktop-portal-hyprland",
		"screencopy",
		"allow",
	},
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

---@param animations { leaf?: string, enabled?: boolean, speed?: number, bezier?: string, style?: string }[]
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

---@overload fun(rule_type: "workspace", rules: HL.WorkspaceRuleSpec[])
---@overload fun(rule_type: "window", rules: HL.WindowRuleSpec[])
---@overload fun(rule_type: "layer", rules: HL.LayerRuleSpec[])
local function set_rules(rule_type, rules)
	if rule_type == "workspace" then
		---@cast rules HL.WorkspaceRuleSpec[]
		for _, rule in ipairs(rules) do
			hl.workspace_rule(rule)
		end
	elseif rule_type == "window" then
		---@cast rules HL.WindowRuleSpec[]
		for _, rule in ipairs(rules) do
			hl.window_rule(rule)
		end
	elseif rule_type == "layer" then
		---@cast rules HL.LayerRuleSpec[]
		for _, rule in ipairs(rules) do
			hl.layer_rule(rule)
		end
	end
end

set_rules(
	"workspace",
	{ { workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 }, { workspace = "f[1]", gaps_out = 0, gaps_in = 0 } }
)

set_rules("layer", { { name = "waybar-blur", match = { namespace = "waybar" }, blur = true } })

set_rules("window", {
	{ name = "no-gaps-wtv1", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 },
	{ name = "no-gaps-f1", match = { float = false, workspace = "f[1]" }, border_size = 0, rounding = 0 },
	{ match = { float = false, workspace = "w[tv1]" }, border_size = 0 },
	{ match = { float = false, workspace = "w[tv1]" }, rounding = 0 },
	{ match = { float = false, workspace = "f[1]" }, border_size = 0 },
	{ match = { float = false, workspace = "f[1]" }, rounding = 0 },
	{ name = "suppress-maximize-events", match = { class = ".*" }, suppress_event = "maximize" },
	{
		name = "fix-xwayland-drags",
		match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
		no_focus = true,
	},
	{ name = "move-hyprland-run", match = { class = "hyprland-run" }, move = "20 monitor_h-120", float = true },
	{ name = "firefox-no-blur", match = { class = "firefox" }, no_blur = true },
	{ name = "pinentry-focus", match = { class = "(pinentry-)(.*)" }, stay_focused = true },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

---@class MapSpec
---@field [1] string
---@field [2] HL.Dispatcher
---@field [3]? { prefix?: { main?: boolean }|string[], suffix?: { main?: boolean }|string[], opts?: HL.BindOptions }

---@param specs MapSpec[]
local function map(specs)
	for _, spec in ipairs(specs) do
		local lhs = spec[1]
		local rhs = spec[2]
		local map_opts = spec[3] or { prefix = { main = true } }
		local opts = map_opts.opts or nil
		if map_opts.prefix and type(map_opts.prefix) == "table" then
			for k, v in pairs(map_opts.prefix) do
				lhs = ("%s + %s"):format((k == "main" and v) and mainMod or v, lhs)
			end
		end
		if map_opts.suffix and type(map_opts.suffix) == "table" then
			for k, v in pairs(map_opts.suffix) do
				lhs = ("%s + %s"):format(lhs, (k == "main" and v) and mainMod or v)
			end
		end

		hl.bind(lhs, rhs, opts)
	end
end

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local keys = {
	{ "Q", hl.dsp.exec_cmd(terminal) },
	{ "C", hl.dsp.window.close() },
	{ "W", hl.dsp.exec_cmd("firefox") },
	{
		"M",
		hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
	},
	{ "E", hl.dsp.exec_cmd(fileManager) },
	{ "V", hl.dsp.window.float({ action = "toggle" }) },
	{ "R", hl.dsp.exec_cmd(menu) },
	{ "P", hl.dsp.window.pseudo() },
	{ "J", hl.dsp.layout("togglesplit") },

	{ "left", hl.dsp.focus({ direction = "left" }) },
	{ "right", hl.dsp.focus({ direction = "right" }) },
	{ "up", hl.dsp.focus({ direction = "up" }) },
	{ "down", hl.dsp.focus({ direction = "down" }) },
	{ "S", hl.dsp.workspace.toggle_special("magic") },
	{ "S", hl.dsp.window.move({ workspace = "special:magic" }), { prefix = { main = true, "SHIFT" } } },
}

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	table.insert(keys, { key, hl.dsp.focus({ workspace = i }) })
	table.insert(keys, { "SHIFT + " .. key, hl.dsp.window.move({ workspace = i }) })
end

map(keys)

-- Example special workspace (scratchpad)

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

hl.on("hyprland.start", function()
	cmd({
		"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland",
		"dbus-update-activation-environment --systemd --all",
		"systemctl --user start hyprpolkitagent",
		-- "/usr/lib64/polkit-kde-authentication-agent-1",
		"wl-paste --type text --watch cliphist store",
		"wl-paste --type image --watch cliphist store",
		"waybar",
		"hyprpaper",
		"hyprsunset",
		"hyprlauncher -d",
		"hypridle",
		terminal,
		"hyprlock",
	})
end)

if hl.plugin.hyprglass then
	local hg = hl.plugin.hyprglass

	hg.config({
		default_theme = "dark",
		default_preset = "clear",
		tint_color = 0x8899aa22,

		brightness = 0.9,
		dark = { brightness = 0.82 },
		light = { adaptive_boost = 0.5 },

		layers = { enabled = 1 },
	})

	-- Layer surfaces: each call whitelists the namespace and configures it
	hg.layer("waybar", { preset = "subtle", mask_threshold = 0.05 })
	hg.layer("swaync")
	hg.layer("quickshell:bezel", { preset = "ui", mask_threshold = 0.3 })
	hg.layer("debug-panel", { exclude = true })

	-- Presets
	hg.preset("clear", {
		glass_opacity = 0.8,
		blur_strength = 1.5,
		dark = { brightness = 0.7 },
		light = { brightness = 1.2 },
	})

	hg.preset("contrasted", {
		inherits = "high_contrast",
		contrast = 1.2,
		adaptive_dim = 1.5,
		dark = { tint_color = 0x02142aa9 },
	})
end

if hl.plugin.darkwindow ~= nil then
	-- To modify the uniforms of an already existing shader, create a new shader and set the uniforms you want
	hl.plugin.darkwindow.load_shader("tintRed", {
		from = "tint",
		args = "tintColor=[1 0 0] tintStrength=0.1",

		-- the predefined shaders support animations, but they are disabled by default, so
		-- window rules don't get animated, but you can override the animation speeds here
		fade_in_speed = 3, -- value in ds
		fade_out_speed = 3,
	})

	-- Then to apply the shader to a window you can use window rules
	hl.window_rule({
		match = { class = "pb250.exe" },
		["darkwindow:shade"] = "invert",
	})

	-- Uniforms can also be passed on the fly
	hl.window_rule({
		match = { fullscreen = true },
		["darkwindow:shade"] = hl.plugin.darkwindow.build_rule_effect({
			shader = "tint",
			args = {
				tintColor = { 0, 0.3, 0 },
			},
		}),
	})

	-- Same for layers
	hl.layer_rule({
		match = { namespace = "waybar" },
		["darkwindow:shade"] = hl.plugin.darkwindow.build_rule_effect({
			shader = "tint",
		}),
	})

	-- Or use a dispatcher
	hl.bind(
		mainMod .. " + I",
		hl.plugin.darkwindow.dsp_shade({
			shader = "invert",

			-- see https://wiki.hypr.land/Configuring/Basics/Dispatchers/#window
			-- if no window field is specified, it targets the active window
			window = "class:nemo",
		})
	)

	hl.bind(
		mainMod .. " + O",
		hl.plugin.darkwindow.dsp_shade({
			shader = "chromakey",

			-- also works with on the fly overriding
			args = {
				bkg = { 0.234, 0.234, 0.234 },
				targetOpacity = 0.5,
			},
			fade_in_speed = 3,
			fade_out_speed = 3,
		})
	)
end
