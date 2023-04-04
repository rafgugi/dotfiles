vim.keymap.set("n", "<leader>gst", vim.cmd.Git)

-- Git
vim.keymap.set("n", "<leader>com", ":G commit -v<CR>")
vim.keymap.set("n", "<leader>dif", ":G diff<CR>")
-- " Stage or unstage current file
vim.keymap.set("n", "<leader>add", ":Gw<CR>")
vim.keymap.set("n", "<leader>res", ":G reset <C-r>%<CR>")
-- " Push and pull current branch
vim.keymap.set("n", "<leader>pus", ":G push origin <C-r>=fugitive#Head()<CR><CR>")
vim.keymap.set("n", "<leader>pul", ":G pull origin <C-r>=fugitive#Head()<CR><CR>")
-- " Checkout
vim.keymap.set("n", "<leader>gco", ":GBranches<CR>")
