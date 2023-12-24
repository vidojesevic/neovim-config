-- = = = = = = = = = = = = = --
-- ==       Remaping      == --
-- = = = = = = = = = = = = = --
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- not recommended
vim.keymap.set("i", "bb", "<ESC>")
vim.keymap.set("i", "bb", "<ESC>")

-- toggle foldcolumn --
vim.keymap.set("n", "<c-x>", ":lua require'core.settings'.toggleFoldColumn()<CR>", {noremap = true, silent = true})
-- vim.keymap.set("n", "<c-z>", "vim.cmpzc<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gml", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<leader>sl", "<cmd>CellularAutomaton slide<CR>")
