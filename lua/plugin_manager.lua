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

--local use = require('packer').use
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	--dependencies
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'kyazdani42/nvim-web-devicons'

	--LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'nvim-treesitter/nvim-treesitter'

	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-project.nvim'
	use 'xiyaowong/telescope-emoji.nvim'
	use 'nvim-telescope/telescope-media-files.nvim'

	use 'lukas-reineke/indent-blankline.nvim' -- Indent Line

	use 'karb94/neoscroll.nvim' -- SmoothScroll
	use 'dstein64/nvim-scrollview' --Scrollbar
	use 'yamatsum/nvim-cursorline'

	use 'edluffy/specs.nvim' -- Show Cursor when jumping

	use 'famiu/nvim-reload' -- Reload Lua Plugins

	use 'mattn/emmet-vim' -- Emmet

	--use 'mhartington/formatter.nvim' -- Formatter

	use 'kyazdani42/nvim-tree.lua'

	use {'akinsho/toggleterm.nvim', tag = 'v1.*'}

	use 'natecraddock/workspaces.nvim' 
	use 'natecraddock/sessions.nvim'

	use 'NTBBloodbath/rest.nvim'
	use 'beauwilliams/focus.nvim'
	use 'sunjon/shade.nvim' --dim inavtive window

	use 'phaazon/hop.nvim'
	use 'ellisonleao/glow.nvim'

	use 'lewis6991/gitsigns.nvim'
	use 'kdheepak/lazygit.nvim'

	use 'windwp/nvim-spectre' -- Search Tool

	use 'gennaro-tedesco/nvim-commaround' -- Comment



	use 'gorbit99/codewindow.nvim'

	--Syntax
	--use 'Joorem/vim-haproxy'
	--use 'jidn/vim-dbml'
	--use 'chrisbra/csv.vim'
	-- Icons
	-- Status bar
	use 'nvim-lualine/lualine.nvim'
	
	use 'hrsh7th/nvim-compe' -- Autocompletion plugin

	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'p00f/nvim-ts-rainbow' -- Raintbow Parentheses

	use 'norcalli/nvim-colorizer.lua' --Color Code Hilight
	-- remote
	use 'chipsenkbeil/distant.nvim'
	-- Themes;
	use 'rose-pine/neovim'
	use 'averak/laserwave.vim'
	use 'chriskempson/base16-vim'
	use 'akai54/2077.nvim'
	use 'catppuccin/nvim'
	use 'shaunsingh/nord.nvim'
	use 'thedenisnikulin/vim-cyberpunk'
end)