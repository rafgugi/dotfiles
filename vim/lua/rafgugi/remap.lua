-- move horizontal clears search highlighting
vim.keymap.set("n", "h", "h:noh<CR>", { silent = true })
vim.keymap.set("n", "l", "l:noh<CR>", { silent = true })

-- Temporary map from learning.
vim.keymap.set("i", "<Esc>", "<Esc>:echo 'Press jk to escape'<CR>gi")
