---------------------------------
--       Magento remaps        --
---------------------------------

_G.magento = {}

local function explode(div, str) -- like php
    if div == '' then return false end
    local arr = {}
    local pattern = string.format("([^%s]+)", div)
    str:gsub(pattern, function(c) arr[#arr + 1] = c end)
    return arr
end

function GetModule(buffer)
    local filepath = vim.api.nvim_buf_get_name(buffer)
    local path = explode('/', filepath)
    local comp
    if path ~= nil then
        comp = path[#path-2] .. "_" .. path[#path - 1]
    end
    return comp
end

function magento.AppendXml()
    local lines = {
        "<?xml version=\"1.0\"?>",
        "<config xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"urn:magento:framework:Module/etc/module.xsd\">",
        "    <module name=\"Vendor_ComponentName\"/>",
        "</config>"
    }
    local current_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_lines(current_buf, -1, -1, true, lines)
end

function magento.RegisterPHP()
    local bufnr = vim.api.nvim_get_current_buf()
    local comp = GetModule(bufnr)
    local lines = {"<?php",
        "",
        "declare(strict_types=1);",
        "",
        "use Magento\\Framework\\Component\\ComponentRegistrar;",
        "",
        "Component::register(",
        "\tComponentRegistrar::MODULE,",
        "\t'" .. comp .. "',",
        "\t__DIR__,",
        ");"
    }
    vim.api.nvim_buf_set_lines(bufnr, -1, -1, true, lines)
end

return magento
