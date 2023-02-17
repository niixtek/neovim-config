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

