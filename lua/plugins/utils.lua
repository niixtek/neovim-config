--Distant
require('distant.nav.actions')
require('distant').setup({
	['*'] = require('distant.settings').chip_default(),
})

-- Colorizer
require('colorizer').setup()

--Rest Tool
require('rest-nvim').setup({
	skip_ssl_verification = false,
})

-- Emmet
vim.g.user_emmet_mode = 'i'
