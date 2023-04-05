vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_diagnostic_virtual_text = 'colored'

vim.cmd.colorscheme('sonokai')

-- Patch color palette for sonokai
local palette = vim.fn['sonokai#get_palette'](vim.g.sonokai_style, vim.empty_dict())
vim.fn['sonokai#highlight']('Visual', palette.none, palette.grey_dim)
vim.fn['sonokai#highlight']('IncSearch', palette.bg0, palette.yellow)
vim.fn['sonokai#highlight']('Search', palette.none, palette.diff_yellow)
