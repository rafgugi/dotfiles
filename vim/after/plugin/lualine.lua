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

-- lion scroll bar as progress bar
local function lionScroll(_)
  local sbar = { '█', '▇', '▆', '▅', '▄', '▃', '▂', '▁', ' ' }
  -- local sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  local cur = vim.fn.line('.')
  local total = vim.fn.line('$')
  local i = math.floor((cur - 1) / total * #sbar) + 1
  return string.rep(sbar[i], 2)
end

-- Add separator before s if s not empty
local function beforeSeparator(s)
  return (s == '' and '' or '| ') .. s
end

local function trim(s)
  return s:match "^%s*(.-)%s*$"
end

local padding_right = {left = 0, right = 1}
local padding_left = {left = 1, right = 0}

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
      {'branch'},
      {'diff', padding = padding_right},
    },
    lualine_y = {
      {'filetype', colored = true, icon_only = false},
      {'diagnostics', symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, padding = padding_right},
    },
    lualine_z = {
      {'searchcount', padding = padding_left},
      {'encoding', fmt = myLocation, padding = padding_left},
      {'encoding', fmt = myProgress, padding = padding_left},
      {'filename', fmt = lionScroll},
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
      {'filename', symbols = {unnamed = '', readonly = ''}, fmt = trim},
      {'diff', padding = padding_right, fmt = beforeSeparator},
      {'diagnostics', padding = padding_right, fmt = beforeSeparator},
    },
  },
  extensions = {}
}

-- Remove default status bar
vim.opt.showmode = false
-- Remove default search count
vim.opt.shortmess:append({ S = true })
