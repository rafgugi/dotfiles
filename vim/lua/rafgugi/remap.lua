-- move horizontal clears search highlighting
vim.keymap.set("n", "<C-c>", "<C-c>:noh<CR>", { silent = true })

-- Temporary map from learning.
vim.keymap.set("i", "<Esc>", "<Esc>:echo 'Press jk to escape'<CR>gi")
