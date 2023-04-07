local mode_map = {
  ['NORMAL'] = 'N',
  ['O-PENDING'] = 'N?',
  ['INSERT'] = 'I',
  ['VISUAL'] = 'V',
  ['V-BLOCK'] = 'VB',
  ['V-LINE'] = 'VL',
  ['V-REPLACE'] = 'VR',
  ['REPLACE'] = 'R',
  ['COMMAND'] = 'C',
  ['SHELL'] = 'SH',
  ['TERMINAL'] = 'T',
  ['EX'] = 'EX',
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

-- Add separator before s if s not empty
local function beforeSeparator(s)
  return (s == '' and '' or '| ') .. s
end

local function trim(s)
  return s:match "^%s*(.-)%s*$"
end

require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    globalstatus = true,
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
  tabline = {
    lualine_a = {{
      'tabs',
      mode = 2,
      max_length = vim.o.columns,
      use_mode_colors = true,
      section_separators = { left = '', right = ''},
      component_separators = { left = '|', right = '|'},
      fmt = function(name, context)
        -- Show + if buffer is modified in tab
        local buflist = vim.fn.tabpagebuflist(context.tabnr)
        local winnr = vim.fn.tabpagewinnr(context.tabnr)
        local bufnr = buflist[winnr]
        local mod = vim.fn.getbufvar(bufnr, '&mod')

        return name .. (mod == 1 and '+' or '')
      end
    }},
  },
  inactive_winbar = {
    lualine_a = {
      {'filename', symbols = { unnamed = '' , readonly = '' }, fmt = trim },
      {'diff', padding = { left = 0, right = 1 }, fmt = beforeSeparator },
      {'diagnostics', padding = { left = 0, right = 1 }, fmt = beforeSeparator },
    },
  },
  extensions = {}
}

-- Remove default status bar because we already have custom line
vim.opt.showmode = false
