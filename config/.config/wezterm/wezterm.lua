local wezterm = require("wezterm")
local act = wezterm.action

-- define the Vesper palette
local vesper = {
  background        = "#101010",
  foreground        = "#ffffff",
  cursor_bg         = "#acb1ab",
  cursor_fg         = "#ffffff",
  selection_bg      = "#988049",
  selection_fg      = "#acb1ab",
  ansi = {
    "#101010", "#f5a191", "#90b99f", "#e6b99d",
    "#aca1cf", "#e29eca", "#ea83a5", "#a0a0a0",
  },
  brights = {
    "#7e7e7e", "#ff8080", "#99ffe4", "#ffc799",
    "#b9aeda", "#ecaad6", "#f591b2", "#ffffff",
  },
}

return {
  -- apply our custom scheme
  color_schemes = {
    Vesper = {
      foreground        = vesper.foreground,
      background        = vesper.background,
      cursor_bg         = vesper.cursor_bg,
      cursor_fg         = vesper.cursor_fg,
      selection_bg      = vesper.selection_bg,
      selection_fg      = vesper.selection_fg,
      ansi              = vesper.ansi,
      brights           = vesper.brights,
    },
  },
  color_scheme          = "Vesper",

  -- font
  font                  = wezterm.font("JetBrainsMono Nerd Font"),
  font_size             = 18.0,
  audible_bell          = "Disabled",
  harfbuzz_features     = { 'calt=1', 'clig=1', 'liga=1' },
  enable_tab_bar        = false,

  -- window & cursor
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 1.0,
  window_padding          = {
    left   = 0,
    right  = 0,
    top    = 0,
    bottom = 0,
  },
  -- inactive_pane_hsb     = {
  --   saturation = 1.0,
  --   brightness = 0.0,
  -- },

  -- macOS option-key behavior
  -- macos_option_is_meta  = true,

  -- key assignments
  keys = {
    -- Tabs and splits
    { key = 't', mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
    { key = 'w', mods = "ALT", action = act.CloseCurrentPane({ confirm = false }) },
    { key = 'w', mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
    { key = 'm', mods = "ALT", action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
    { key = 'n', mods = "ALT", action = act.SplitPane({ direction = "Down", size = { Percent = 50 } }) },

    -- Pane navigation
    { key = 'h', mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = 'j', mods = "ALT", action = act.ActivatePaneDirection("Down") },
    { key = 'k', mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = 'l', mods = "ALT", action = act.ActivatePaneDirection("Right") },

    -- Tab navigation with ALT + NUM
    { key = '1', mods = "ALT", action = act.ActivateTab(0) },
    { key = '2', mods = "ALT", action = act.ActivateTab(1) },
    { key = '3', mods = "ALT", action = act.ActivateTab(2) },
    { key = '4', mods = "ALT", action = act.ActivateTab(3) },
    { key = '5', mods = "ALT", action = act.ActivateTab(4) },
    { key = '6', mods = "ALT", action = act.ActivateTab(5) },
    { key = '7', mods = "ALT", action = act.ActivateTab(6) },
    { key = '8', mods = "ALT", action = act.ActivateTab(7) },
    { key = '9', mods = "ALT", action = act.ActivateTab(8) },
    { key = '0', mods = "ALT", action = act.ActivateTab(9) },
  }
}
