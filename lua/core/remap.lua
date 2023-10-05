vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- toggle foldcolumn --
vim.keymap.set("n", "<c-x>", ":lua require'core.settings'.toggleFoldColumn()<CR>", {noremap = true, silent = true})
-- 19:55
-- cmdline center I hope
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
