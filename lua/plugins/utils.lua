--Distant
local actions = require('distant.nav.actions')
require('distant').setup({
	['*'] = require('distant.settings').chip_default(),
})

-- Colorizer
require('colorizer').setup()

--Compe
vim.o.completeopt = 'menuone,noselect'
require('compe').setup({
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = {
		border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	};
	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
		ultisnips = true;
		luasnip = true;
	};
})

--Rest Tool
require('rest-nvim').setup({
	skip_ssl_verification = false,
})
vim.api.nvim_set_keymap('n', '<leader>rr', [[<cmd>lua require('rest-nvim').run()<CR>]], { noremap = true, silent = true })

-- Emmet
vim.g.user_emmet_mode = 'i'

-- nvim-commaround
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>ToggleCommaround', {})

