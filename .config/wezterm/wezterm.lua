-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = {}
config.hyperlink_rules = wezterm.default_hyperlink_rules()
local mux = wezterm.mux
local act = wezterm.action


-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

-- Make the default program fish
config.default_prog = { '/usr/bin/fish' }

config.launch_menu = {
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'Bash',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = {'bash'},
    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
  {
   label = 'Fish',
  }
}

config.keys = { 
  {
  key = "Space",
  mods = "CTRL",
  action = wezterm.action.ShowLauncherArgs { flags = 'LAUNCH_MENU_ITEMS' },
},
}

-- UNUSED, function show launch menu when wezterm opens
--wezterm.on("gui-startup", function(cmd)
--  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
--  window
--    :gui_window()
--    :perform_action(
--      wezterm.action.ShowLauncherArgs({ flags = 'LAUNCH_MENU_ITEMS' }),
--      pane
--    )
--end)

config.force_reverse_video_cursor = true
config.use_dead_keys = false
config.font = wezterm.font 'Fira Code'
config.use_fancy_tab_bar = true

config.window_background_opacity = 0.9
config.enable_scroll_bar = true
config.colors = {
	scrollbar_thumb = 'silver'
}

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-macchiato'
--config.color_scheme = 'BirdsOfParadise'   --Brown theme, old one I used.

-- Stop wezterm from giving an annoying warning regarding fonts
config.warn_about_missing_glyphs=false

-- and finally, return the configuration to wezterm
return config

