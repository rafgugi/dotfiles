local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', function()
  local search = vim.fn.input('Grep > ')
  if search ~= '' then
    builtin.grep_string({ search = search })
  end
end)

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ['<C-c>'] = actions.close,
        ['q'] = actions.close,
      }
    }
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          -- your custom insert mode mappings
        },
        ['n'] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

require('telescope').load_extension 'file_browser'


-- open file_browser with the path of the current buffer
-- vim.api.nvim_set_keymap('n', '<space>pv', ':Telescope file_browser', { noremap = true })
vim.api.nvim_set_keymap('n', '<space>pv', ':Telescope file_browser path=%:p:h select_buffer=true hidden=true grouped=true respect_gitignore=false<CR>', { noremap = true })
