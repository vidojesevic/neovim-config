require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'horizon',
        component_separators = { left = ' | ', right = ' | '},
        section_separators = { left = ' ', right = ' '},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'filetype', 'fileformat', 'encoding'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    }
}
