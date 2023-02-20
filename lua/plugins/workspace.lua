-- Workspace 
require('workspaces').setup({
	hooks = {
		open = {
			'Telescope find_files',
--[[ 			function()
				require('sessions').load(nil, { silent = true })
			end, ]]
		},
	}
})

--Session
--[[ require('sessions').setup({
	events = { 'VimLeavePre' },
	session_filepath = vim.fn.stdpath("data") .. "/sessions",
	absolute = true,
	hooks = {
		open = { 'Telescope find_files' },
	}
}) ]]
