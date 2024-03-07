local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
-- vim.keymap.set("n", "<F5>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<F6>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<F7>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<F8>", function() ui.nav_file(4) end)

