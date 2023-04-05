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
        colored = true,    -- Displays filetype icon in color if set to true
        icon_only = false, -- Display only an icon for filetype
      }
    },
    lualine_z = {
      {'searchcount', padding = { left = 1, right = 0 } },
      {'encoding', fmt = myLocation, padding = { left = 1, right = 0 } },
      {'encoding', fmt = myProgress, padding = { left = 1, right = 1 } },
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
