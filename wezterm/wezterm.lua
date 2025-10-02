---Pull in the wezterm API
---@type Wezterm
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

---@param fg_procc_name string
---@return boolean
local function is_shell(fg_procc_name)
    local shell_names =  {
        "bash",
        "zsh",
        "fish",
        "sh",
        "ksh",
        "dash",
    }

    ---@type string
    local process = fg_procc_name:match("[^/\\]+$") or fg_procc_name
    for _, shell in ipairs(shell_names) do
        if process == shell then
            return true
        end
    end

    return false
end

wezterm.on("user-var-changed", function(window, _, name, value)
    ---@diagnostic disable:undefined-global
    if not wezterm_config_nvim then
        return
    end

    local overrides = window:get_config_overrides() or {}
    overrides = wezterm_config_nvim.override_user_var(overrides, name, value)
    window:set_config_overrides(overrides)
    ---@diagnostic enable:undefined-global
end)

wezterm.on("format-tab-title", function(tab)
    local prog = tab.active_pane.user_vars.PROG
    return ("%s [%s]"):format(tab.active_pane.title, (prog or ""))
end)

wezterm.on("open-uri", function(_, pane, uri)
    local editor = "nvim"

    if uri:find("^file:") ~= 1 or pane:is_alt_screen_active() then
        return
    end

    ---We're processing an hyperlink and the uri format should be:
    ---`file://[HOSTNAME]/PATH[#linenr]`
    ---Also the pane is not in an alternate screen (an editor, less, etc)
    local url = wezterm.url.parse(uri)

    if not url then
        return
    end

    if not is_shell(pane:get_foreground_process_name()) then
        -- No shell detected, we're probably connected with SSH, use fallback command
        local edit_cmd = (url.fragment ~= nil and (editor .. " +" .. url.fragment) or editor)
        .. ' "$_f"'

        local cmd = '_f="'
        .. url.file_path
        .. '"; { test -d "$_f" && { cd "$_f" ; ls -a -p --hyperlink --group-directories-first; }; } '
        .. '|| { test "$(file --brief --mime-type "$_f" | cut -d/ -f1 || true)" = "text" && '
        .. edit_cmd
        .. "; }; echo"

        pane:send_text(cmd .. "\r")
        return false
    end

    -- A shell has been detected. Wezterm can check the file type directly
    -- figure out what kind of file we're dealing with
    local success, stdout = wezterm.run_child_process({
        "file",
        "--brief",
        "--mime-type",
        url.file_path,
    })

    if not success then
        return
    end

    if stdout:find("directory") then
        pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
        pane:send_text(wezterm.shell_join_args({"ls", "-A", "-p", "--group-directories-first"})
            .. "\r")

        return false
    end

    if stdout:find("text") then
        local text = not url.fragment
            and wezterm.shell_join_args({ editor, url.file_path })
            or wezterm.shell_join_args({editor, "+" .. url.fragment, url.file_path })
            .. "\r"

        pane:send_text(text)
        return false
    end

    -- without a return value, we allow default actions
end)

---Create a default window but makes it maximize on startup
wezterm.on("gui-startup", function(cmd)
    local _, _, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

---Maximize all displayed windows on startup
wezterm.on("gui-attached", function(_)
    local workspace = mux.get_active_workspace()

    for _, window in ipairs(mux.all_windows()) do
        if window:get_workspace() == workspace then
            window:gui_window():maximize()
        end
    end
end)

wezterm.on("window-focus-changed", function(window, _)
    local id, focused = window:window_id(), window:is_focused()
    wezterm.log_info(("the focus state of %s changed to %s"):format(id, focused))
end)

wezterm.on("window-config-reloaded", function(window, _)
    wezterm.log_info(("the config was reloaded for window %s"):format(window:window_id()))
end)

local config = wezterm.config_builder()

config.launch_menu = {
    { args = { "top" } },
    { label = "Bash", args = { "bash", "-l" } },
}

config.window_background_opacity = 1.0
config.kde_window_background_blur = true

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.webgpu_force_fallback_adapter = false

config.mouse_bindings = {
    -- Scrolling up while holding CTRL increases the font size
    {
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        mods = "CTRL",
        action = act.IncreaseFontSize,
    },

    -- Scrolling down while holding CTRL decreases the font size
    {
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        mods = "CTRL",
        action = act.DecreaseFontSize,
    },

    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = act.OpenLinkAtMouseCursor,
    },

    -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
    {
        event = { Down = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = act.Nop,
    },
}

config.hide_mouse_cursor_when_typing = false
config.mouse_wheel_scrolls_tabs = false

config.launcher_alphabet = "1234567890abcdefghilmnopqrstuvwxyz"
config.quick_select_alphabet = "aoeuqjkxpyhtnsgcrlmwvzfidb"

config.font_size = 20
config.font = wezterm.font({
    family = "FiraCode Nerd Font Mono",

    stretch = "Normal",
    style = "Normal",
    weight = "Regular",

    harfbuzz_features = {
        "calt=1",
        "clig=1",
        "liga=1",
        "zero",
        -- 'onum',
        -- 'cv01', -- `a`
        -- 'cv02', -- `g`
        -- 'cv03', -- `i`
        -- 'cv04', -- `i`
        -- 'cv05', -- `i`
        "cv06", -- `i`
        -- 'cv07',
        -- 'cv08',
        -- 'cv09',
        -- 'cv10',
        "cv11", -- numbers
        "cv12", -- numbers
        "cv13", -- numbers
        "cv14", -- numbers
        "cv15", -- `*`
        "cv16", -- `*`
        "cv17", -- `~`
        "cv18", -- `%`
        "cv19", -- `<=`
        "cv20", -- `<=`
        "cv21",
        "cv22",
        "cv23", -- `>=`
        "cv24", -- `/=`
        "cv25", -- `.-`
        "cv26", -- `:-`
        "cv27", -- `[]`
        "cv28", -- `{. .}`
        "cv29", -- `{}`
        "cv30", -- `|`
        "cv31", -- `()`
        "cv32", -- `.=`
        "ss01",
        "ss02", -- `<=`, `>=`
        "ss03", -- `&`
        "ss04", -- `$`
        "ss05", -- `@`
        "ss06", -- `\\`
        "ss07", -- `=~`, `!~`
        "ss08", -- `==`, `===`, `!=`, `!==`
        "ss09", -- `>>=`, `<<=`, `||=`, `|=`
        "ss10",
    },
})

config.use_dead_keys = false
config.use_fancy_tab_bar = true

config.webgpu_force_fallback_adapter = false
config.warn_about_missing_glyphs = false

config.audible_bell = "Disabled"
config.scrollback_lines = 64500
config.exit_behavior = "Close"
config.animation_fps = 144
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.default_cursor_style = "BlinkingBlock"

config.color_scheme = "Tokyo Night Storm (Gogh)"

config.enable_kitty_graphics = true
config.enable_scroll_bar = false
config.enable_wayland = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_title_reporting = true

config.adjust_window_size_when_changing_font_size = true
config.automatically_reload_config = true
config.anti_alias_custom_block_glyphs = true
config.bold_brightens_ansi_colors = "BrightAndBold"
config.detect_password_input = true
config.exit_behavior = "Close"

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- make task numbers clickable
-- the first matched regex group is captured in $1.
table.insert(config.hyperlink_rules, {
    regex = [[\b[tt](\d+)\b]],
    format = "https://example.com/tasks/?t=$1",
})

-- make username/project paths clickable. this implies paths like the following are for github.
-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wezterm/wezterm | "wezterm/wezterm.git" )
-- as long as a full url hyperlink regex exists above this it should not match a full url to
-- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
table.insert(config.hyperlink_rules, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = "https://www.github.com/$1/$3",
})

config.check_for_updates = false

return config

---vim:ts=4:sts=4:sw=4:et:ai:si:sta:noci:nopi:ft=lua:
