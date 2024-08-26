local wezterm = require 'wezterm'
local utils = require 'utils'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--config.color_scheme = 'Dracula+'

config.font = wezterm.font('Monaco')
config.font_size = 16.0
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.enable_scroll_bar = true
config.scrollback_lines = 10000

config.default_cwd = wezterm.home_dir

config.window_padding = {
  bottom = 0
}

local act = wezterm.action

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace() .. '  ')
end)

--config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000}
config.keys = {
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendString '\x01',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(1)
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  -- Prompt for a name to use for a new workspace and switch to it.
  {
    key = 'W',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },

  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = 's',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette
  },
  {
    key = '|',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)
      local current_directory = utils.get_directory(window)
      window:perform_action(
	wezterm.action.SplitHorizontal { cwd = current_directory },
	pane
      )
    end)
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)
      local current_directory = utils.get_directory(window)
      window:perform_action(
	wezterm.action.SplitVertical { cwd = current_directory },
	pane
      )
    end)
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'j',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)
      local current_directory = utils.get_directory(window)
      window:perform_action(
	wezterm.action.SpawnCommandInNewTab { cwd = current_directory },
	pane
      )
    end)
  },
  {
    key = ' ',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)

      local names = utils.workspace_projects

      local choices = { }
      for _, name in ipairs(names) do
	choices[#choices + 1] = { label = name, id = wezterm.home_dir .. '/projects/' .. name }
      end

      window:perform_action(
	wezterm.action.InputSelector {
	  title = 'Select a Workspace',
	  action = wezterm.action_callback(function(_, _, id, _)
	    if id then
	      window:perform_action(
		wezterm.action.SwitchToWorkspace {
		  name = id,
		  spawn = {
		    cwd = id,
		  }
		},
		pane
	      )
	    end
	  end),
	  choices = choices,
	},
	pane
      )
    end),
  },
  {
    key = '.',
    mods = 'LEADER',
    action = wezterm.action_callback(function (window, pane)
      local workspace_name = utils.get_directory(window)

      window:perform_action(
	wezterm.action.SwitchToWorkspace {
	  name = workspace_name,
	  spawn = {
	    cwd = workspace_name
	  }
	},
	pane
	  )
    end)
  },
}

for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i-1),
  })
end

wezterm.on('format-tab-title', function(tab_info, tabs, panes, effective_config)
  local tab = wezterm.mux.get_tab(tab_info.tab_id)
  local proc_info = tab:active_pane():get_foreground_process_info()
  if proc_info == nil then
    return ''
  end

  local base_name
  if tab:get_title() ~= '' then
    base_name = tab:get_title()
  else
    base_name = proc_info.name
  end
  wezterm.log_info(base_name)

  local prefix
  if tab:window():active_tab():tab_id() == tab:tab_id() then
    prefix = utils.dot('Green')
  else
    prefix = utils.dot('Yellow')
  end

  local base_text = prefix .. ' ' .. tab_info.tab_index .. ':' .. base_name
  local padded_text = base_text
  return ' ' .. padded_text .. '  '
end)

return config
