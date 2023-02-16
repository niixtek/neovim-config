require('telescope').setup({
	defaults = {
		file_ignore_patterns = { 
			'node_modules',
			'__pycache__' 
		},
		initial_mode = 'normal',
		set_env = { ['COLORTERM'] = 'truecolor' },
		
		extensions = {
			workspaces = {
				keep_insert = true,
			},
			media_files = {
				filetypes = {'png', 'webp', 'jpg', 'jpeg'},
				find_cmd = 'rg'
			},
			file_browser = {
				theme = 'ivy'
			},
		},
	}
})
--load Telescope plugins
require('telescope').load_extension('file_browser')
require('telescope').load_extension('workspaces')
require('telescope').load_extension('project')
require('telescope').load_extension('media_files')
require('telescope').load_extension('emoji')

vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gd', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pp', [[<cmd>lua require'telescope'.extensions.project.project()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ww', [[<cmd>lua require'telescope'.extensions.workspaces.workspaces()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ge', [[<cmd>lua require'telescope'.extensions.emoji.emoji()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>//', ':Telescope<CR>', { noremap = true, silent = true })
