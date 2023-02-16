--LazyGit
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap = true, silent = true })

-- Gitsigns
require('gitsigns').setup({
	signs = {
		add = { hl = 'GitGutterAdd', text = '+' },
		change = { hl = 'GitGutterChange', text = '~' },
		delete = { hl = 'GitGutterDelete', text = '_' },
		topdelete = { hl = 'GitGutterDelete', text = '‾' },
		changedelete = { hl = 'GitGutterChange', text = '~' },
	},
})
