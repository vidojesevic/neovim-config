local dap = require'dap'
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. "/.config/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9000',
        log = true,
        serverSourceRoot = '/srv/www/',
        localSourceRoot = '/home/www/VVV/www/',
    },
}

require("nvim-dap-virtual-text").setup()
require("dapui").setup()
