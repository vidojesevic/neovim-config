-- = = = = = = = = = = = = = --
-- ==       Remaping      == --
-- = = = = = = = = = = = = = --

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

----------------
-- not recommended --
----------------
vim.keymap.set("i", "bb", "<ESC>")
vim.keymap.set("i", "bb", "<ESC>")

----------------
-- toggle foldcolumn --
----------------

vim.keymap.set("n", "<c-x>", ":lua require'core.settings'.toggleFoldColumn()<CR>", {noremap = true, silent = true})
-- vim.keymap.set("n", "<c-z>", "vim.cmpzc<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gml", "<cmd>CellularAutomaton game_of_life<CR>")
vim.keymap.set("n", "<leader>sl", "<cmd>CellularAutomaton slide<CR>")

----------------
-- PHP xdebug --
----------------

-- DAP UI
vim.keymap.set("n", "<Leader>dt", function() require('dapui').toggle() end)
-- Stepping through code
vim.keymap.set("n", "<Leader>1", function() require('dap').step_over() end)
vim.keymap.set("n", "<Leader>2", function() require('dap').step_into() end)
vim.keymap.set("n", "<Leader>3", function() require('dap').step_out() end)
-- Set breakpoint
vim.keymap.set("n", "<Leader>b", function() require('dap').toggle_breakpoint() end)
-- Start debugging
vim.keymap.set("n", "<Leader>dc", function() require('dap').continue() end)
-- Inspecting variables
vim.keymap.set("n", "<F7>", ":lua require'dap'.repl.open()<CR>")
-- Run PHP script
vim.keymap.set("n", "<F8>", ":lua require'dap'.run_last()<CR>")
-- Disconnect
vim.keymap.set("n", "<F9>", ":lua require'dap'.disconnect()<CR>")
