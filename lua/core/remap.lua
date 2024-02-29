-- = = = = = = = = = = = = = --
-- ==       Remaping      == --
-- = = = = = = = = = = = = = --

local remap = vim.keymap.set

vim.g.mapleader = " "
remap("n", "<leader>n", vim.cmd.Ex)

remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")
remap("n", "<leader>s", ":vs<CR>")

-----------------------
--  not recommended  --
-----------------------

-- remap("i", "gg", "<ESC>")
-- remap("i", "gg", "<ESC>")

-----------------------
-- toggle foldcolumn --
-----------------------

remap("n", "<c-x>", ":lua require'core.settings'.toggleFoldColumn()<CR>", {noremap = true, silent = true})
-- remap("n", "<c-z>", "vim.cmpzc<CR>", {noremap = true, silent = true})
remap("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
remap("n", "<leader>gml", "<cmd>CellularAutomaton game_of_life<CR>")
remap("n", "<leader>sl", "<cmd>CellularAutomaton slide<CR>")

-----------------------
--    PHP xdebug     --
-----------------------

-- DAP UI
remap("n", "<Leader>dt", function() require('dapui').toggle() end)
-- Stepping through code
remap("n", "<Leader>1", function() require('dap').step_over() end)
remap("n", "<Leader>2", function() require('dap').step_into() end)
remap("n", "<Leader>3", function() require('dap').step_out() end)
-- Set breakpoint
remap("n", "<Leader>b", function() require('dap').toggle_breakpoint() end)
-- Start debugging
remap("n", "<Leader>dc", function() require('dap').continue() end)
-- Inspecting variables
remap("n", "<F7>", ":lua require'dap'.repl.open()<CR>")
-- Run PHP script
remap("n", "<F8>", ":lua require'dap'.run_last()<CR>")
-- Disconnect
remap("n", "<F9>", ":lua require'dap'.disconnect()<CR>")

-----------------------
-- Disable arrow key --
-----------------------

-- normal mode
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

-- insert mode
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })

----------------------
-- Magento 2 remaps --
----------------------

remap("n", "<leader>m", ":lua magento.AppendXml()<CR>", {noremap = true})
remap("n", "<leader>r", ":lua magento.RegisterPHP()<CR>", {noremap = true})
remap("n", "<leader>fr", ":lua magento.Routes()<CR>", {noremap = true})
remap("n", "<leader>di", ":lua magento.DI()<CR>", {noremap = true})
remap("n", "<leader>lr", ":lua magento.LayoutReferenceContainer()<CR>", {noremap = true})

-- DocBlock
remap("n", "<leader>pd", ":PHPDocBlocks<CR>")


-- Telecasten | notes --
-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
