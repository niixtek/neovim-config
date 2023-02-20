require('lspconfig').volar.setup({
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
	init_options = {
		typescript = {
      serverPath = '/home/ron/node_modules/typescript/lib/tsserverlibrary.js'
    }
	}
})

require('lspconfig').html.setup({})

require('lspconfig').csharp_ls.setup({})

require('lspconfig').jsonls.setup({
	init_options = {
		provideFormatter = true
	},
--	cmd = { 'vscode-json-languageserver', '--stdio' }
})

require('lspconfig').pyright.setup({})

--require('lspconfig').sumneko_lua.setup({})

--Treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = { 'c', 'python', 'lua', 'rust', 'http', 'html', 'json', 'css', 'scss', 'c_sharp', 'javascript', 'yaml', 'markdown'},
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
		colors = {}, -- table of hex strings
		termcolors = {} -- table of colour name strings
	}
}
