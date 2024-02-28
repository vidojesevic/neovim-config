---------------------------------
--       Magento remaps        --
---------------------------------

_G.magento = {}

local getName = vim.api.nvim_buf_get_name
local current = vim.api.nvim_get_current_buf
local setLines = vim.api.nvim_buf_set_lines

local function explode(div, str) -- like php
    if div == '' then return false end
    local arr = {}
    local pattern = string.format("([^%s]+)", div)
    str:gsub(pattern, function(c) arr[#arr + 1] = c end)
    return arr
end

function GetModule(buffer, i, j)
    local filepath = getName(buffer)
    local path = explode('/', filepath)
    local comp
    if path ~= nil then
        comp = path[#path-i] .. "_" .. path[#path - j]
    end
    return comp
end

-- this remap is for generating boiler plate xml --
function magento.AppendXml()
    local bufnr = current()
    local comp = GetModule(bufnr, 3, 2)
    local lines = {
        "<?xml version=\"1.0\"?>",
        "<config xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"urn:magento:framework:Module/etc/module.xsd\">",
        "\t<module name='" .. comp .. "'/>",
        "</config>"
    }
    setLines(bufnr, -1, -1, true, lines)
end

-- generating routes.xml --
function magento.Routes()
    local bufnr = current()
    local comp = GetModule(bufnr, 4, 3)
    local id = explode('_',comp)
    local lines = {}
    if id ~= nil then
        lines = {
            '<?xml version="1.0" ?>',
            '<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">',
            '\t<router id="standard">',
            --<!--Define a custom route with id and frontName-->
            '\t\t<route frontName="'.. string.lower(id[#id]) ..'" id="' .. string.lower(id[#id]) .. '">',
            --    <!--The module which this route match to-->
            '\t\t\t<module name="' .. comp .. '"/>',
            '\t\t</route>',
            '\t</router>',
            '</config>'
        }
    end
    setLines(bufnr, -1, -1, true, lines)
end

-- generating di.xml // Dependncy injhection --
function magento.DI()
    local lines = {
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:ObjectManager/etc/config.xsd">',
        '\t<preference for="" type="" />',
        '</config>'
    }
    local current_buf = current()
    setLines(current_buf, -1, -1, true, lines)
end

-- generating layoutReferenceContainer --
function magento.LayoutReferenceContainer()
    local lines = {
        '<?xml version="1.0"?>',
        '<page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" layout="1column" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">',
        '\t<body>',
        '\t\t<referenceBlock name="content">',
        '\t\t\t<block name="tribadelic_jumpstart_welcome" template="Tribadelic_Jumpstart::welcome.phtml"/>',
        '\t\t</referenceBlock>',
        '\t</body>',
        '</page>'
    }
    local current_buf = current()
    setLines(current_buf, -1, -1, true, lines)
end

-- this remap is for registration.php --
function magento.RegisterPHP()
    local bufnr = current()
    local comp = GetModule(bufnr, 2, 1)
    local lines = {"<?php",
        "",
        "declare(strict_types=1);",
        "",
        "use Magento\\Framework\\Component\\ComponentRegistrar;",
        "",
        "ComponentRegistrar::register(",
        "\tComponentRegistrar::MODULE,",
        "\t'" .. comp .. "',",
        "\t__DIR__,",
        ");"
    }
    setLines(bufnr, -1, -1, true, lines)
end

return magento
