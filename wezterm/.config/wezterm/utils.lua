local wezterm = require 'wezterm'
local os = require 'os';


return {
  workspace_projects = {
      'alle-backend-payments',
  },

  dot = function (color)
    return wezterm.format({
      { Foreground = { AnsiColor = color } },
      { Attribute = { Intensity = 'Bold' } },
      { Text = '•' }
    })
  end,

  get_directory = function (window)
    return window:mux_window():active_pane():get_current_working_dir().file_path
  end,

  strip_ansi = function (str)
    return str:gsub("[\27\155][][()#;?%d]*[A-PRZcf-ntqry=><~]", "")
  end,

  workspace_dir = function()
    local ws = wezterm.mux.get_active_workspace()
    if ws == default_workspace then
      return wezterm.home_dir
    else
      return ws
    end
  end
}
