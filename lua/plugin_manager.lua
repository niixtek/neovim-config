local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
[[
	augroup Packer
	autocmd!
	autocmd BufWritePost init.lua PackerCompile
	augroup end
]],
false)

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	--dependencies
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use { 'm00qek/baleia.nvim', tag = 'v1.2.0' } --color ascii escape string

	--LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'nvim-treesitter/nvim-treesitter'
	
	-- Telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-project.nvim'
	use 'xiyaowong/telescope-emoji.nvim'
	use 'nvim-telescope/telescope-media-files.nvim'

	--Workflow
	use 'natecraddock/workspaces.nvim' 
	use 'natecraddock/sessions.nvim'
	use 'hrsh7th/nvim-compe' -- Autocompletion plugin
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'yaocccc/nvim-hlchunk' -- {} hilight
	use 'p00f/nvim-ts-rainbow' -- Raintbow Parentheses
	use 'gennaro-tedesco/nvim-commaround' -- Comment
	use 'norcalli/nvim-colorizer.lua' -- Color Code Hilight
	use 'phaazon/hop.nvim' -- Jump!
	use 'lukas-reineke/indent-blankline.nvim' -- Indent Line
	use 'mattn/emmet-vim' -- Emmet

	--windows
	use 'beauwilliams/focus.nvim'
	use 'sunjon/shade.nvim' --dim inacvtive window
	use 'petertriho/nvim-scrollbar' --Scrollbar
	use 'yamatsum/nvim-cursorline'
	use 'windwp/nvim-spectre' -- Search Tool
	use 'edluffy/specs.nvim' -- Show Cursor when jumping
	use 'karb94/neoscroll.nvim' -- SmoothScroll
	use 'gorbit99/codewindow.nvim'

	--git
	use 'lewis6991/gitsigns.nvim'
	use 'kdheepak/lazygit.nvim'

	--Tabbar
	use 'nvim-lualine/lualine.nvim' -- Status bar

	--Utilities
	use {'akinsho/toggleterm.nvim', tag = '*'}
	use 'chipsenkbeil/distant.nvim'  --remote
	use 'NTBBloodbath/rest.nvim' --rest api tool
	use 'ellisonleao/glow.nvim' -- markdown preview
	use 'ysl2/nvim-reload' -- Reload Lua Plugins
	use 'samodostal/image.nvim'

	-- Themes;
	use 'rose-pine/neovim'
	use 'chriskempson/base16-vim'
	use 'catppuccin/nvim'
	use 'thedenisnikulin/vim-cyberpunk'
end)
