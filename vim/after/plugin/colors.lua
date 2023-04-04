vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1

require('nvim-web-devicons').setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true;
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    }
  };
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  }
}

local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = '!',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'X',
  ['S-BLOCK'] = 'SB',
  ['S-LINE'] = 'SL',
  ['SELECT'] = 'S',
  ['CONFIRM'] = 'Y?',
  ['MORE'] = 'M',
}

-- lualine location without padding
local function myLocation(_)
  local line = vim.fn.line('.')
  local col = vim.fn.virtcol('.')
  return string.format('%d:%d', line, col)
end

-- lualine progress without padding
local function myProgress(_)
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')
  if cur == 1 then
    return 'Top'
  elseif cur == total then
    return 'Bot'
  else
    return string.format('%d%%%%', math.floor(cur / total * 100))
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {''},
    section_separators = {''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { {'mode', fmt = function(s) return mode_map[s] or s end} },
    lualine_b = { {'filename', path = 1} },
    lualine_c = {},
    lualine_x = {
      'branch',
      {'diff', padding = { right = 1, left = 0 } },
      'diagnostics',
    },
    lualine_y = {
      {
        'filetype',
        colored = false,   -- Displays filetype icon in color if set to true
        icon_only = false, -- Display only an icon for filetype
      }
    },
    lualine_z = {
      {'encoding', fmt = myProgress, padding = { left = 1, right = 1 } },
      {'encoding', fmt = myLocation, padding = { left = 0, right = 1 } },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    -- lualine_a = {'tabs'},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

vim.g.lightline = {
  enable = {statusline = 0, tabline = 1},
  colorscheme = 'sonokai'
}

-- Remove default status bar because we already have custom line
vim.opt.showmode = false

vim.cmd.colorscheme('sonokai')

-- Patch color palette for sonokai
local configuration = vim.fn['sonokai#get_configuration']()
local palette = vim.fn['sonokai#get_palette'](configuration.style, configuration.colors_override)
vim.fn['sonokai#highlight']('Visual', palette.none, palette.grey_dim)
vim.fn['sonokai#highlight']('IncSearch', palette.bg0, palette.yellow)
vim.fn['sonokai#highlight']('Search', palette.none, palette.diff_yellow)
