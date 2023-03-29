vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1

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
        colored = true,   -- Displays filetype icon in color if set to true
        icon_only = true, -- Display only an icon for filetype
        icon = {align='right'}
      }
    },
    lualine_z = {
      {'progress', padding = { right = 0, left = 1 } },
      {'location', padding = { right = 0, left = 0 } },
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

-- Remove default status bar because we already have custom line
vim.opt.showmode = false

function ColorMyPencil(color)
  color = color or "sonokai"
  vim.cmd.colorscheme(color)
end

ColorMyPencil()
