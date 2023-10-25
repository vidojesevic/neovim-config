-- = = = = = = = = = = = = = --
-- ==   toggle function   == --
-- = = = = = = = = = = = = = --

vim.g.matchup_matchparen_deferred = 1

local M = {}
local toBool = {
    ["1"] = true,
    ["0"] = false
}

function M.toggleFoldColumn()
    if toBool[vim.opt.foldcolumn:get()] then
        vim.opt.foldcolumn = "0"
    else
        vim.opt.foldcolumn = "1"
    end
    vim.api.nvim_echo({ {"foldcolumn is set to " .. vim.opt.foldcolumn:get() } }, false, {})
end


return M
