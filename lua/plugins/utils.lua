--Distant
local actions = require('distant.nav.actions')
require('distant').setup({
	['*'] = require('distant.settings').chip_default(),
})

-- Colorizer
require('colorizer').setup()
--Rest Tool
require('rest-nvim').setup({
	skip_ssl_verification = false,
})
vim.api.nvim_set_keymap('n', '<leader>rr', [[<cmd>lua require('rest-nvim').run()<CR>]], { noremap = true, silent = true })

-- Emmet
vim.g.user_emmet_mode = 'i'

-- nvim-commaround
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>ToggleCommaround', {})

