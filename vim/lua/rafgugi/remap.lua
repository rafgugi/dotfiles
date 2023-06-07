-- move horizontal clears search highlighting
vim.keymap.set("n", "<C-c>", "<C-c>:noh<CR>", { silent = true })

-- Temporary map from learning.
vim.keymap.set("i", "<Esc>", "<Esc>:echo 'Press jk to escape'<CR>gi")

-- buffer navigation
vim.keymap.set('n', '[b', function() vim.cmd.bprev({ count = vim.v.count1 }) end)
vim.keymap.set('n', ']b', function() vim.cmd.bnext({ count = vim.v.count1 }) end)

-- go to buffer by number using lualine
vim.keymap.set("n", "<leader>1", ":LualineBuffersJump 1<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", ":LualineBuffersJump 2<CR>", { silent = true })
vim.keymap.set("n", "<leader>3", ":LualineBuffersJump 3<CR>", { silent = true })
vim.keymap.set("n", "<leader>4", ":LualineBuffersJump 4<CR>", { silent = true })
vim.keymap.set("n", "<leader>5", ":LualineBuffersJump 5<CR>", { silent = true })
vim.keymap.set("n", "<leader>6", ":LualineBuffersJump 6<CR>", { silent = true })
vim.keymap.set("n", "<leader>7", ":LualineBuffersJump 7<CR>", { silent = true })
vim.keymap.set("n", "<leader>8", ":LualineBuffersJump 8<CR>", { silent = true })
vim.keymap.set("n", "<leader>9", ":LualineBuffersJump 9<CR>", { silent = true })
