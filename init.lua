-- packer Installer command from https://github.com/mjlbach/defaults.nvim/blob/master/init.lua
--
-- Install packer
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
false
)

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	--LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'nvim-treesitter/nvim-treesitter'

	use 'nvim-telescope/telescope.nvim'
	use {'akinsho/bufferline.nvim', tag = 'v2.*'} -- Buffer Tab
	use 'lukas-reineke/indent-blankline.nvim' -- Indent Line
	use 'karb94/neoscroll.nvim' -- SmoothScroll
	use 'dstein64/nvim-scrollview' --Scrollbar
	use 'edluffy/specs.nvim' -- Show Cursor when jumping
	use 'famiu/nvim-reload' -- Reload Lua Plugins
	use 'mattn/emmet-vim' -- Emmet
	use 'mhartington/formatter.nvim' -- Formatter
	use 'kyazdani42/nvim-tree.lua'
	use {'akinsho/toggleterm.nvim', tag = 'v1.*'}
	use  'NTBBloodbath/rest.nvim'
	use 'm4xshen/autoclose.nvim'
	use 'beauwilliams/focus.nvim'
	-- Git Command
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	use 'lewis6991/gitsigns.nvim'
	use 'windwp/nvim-spectre' -- Search Tool
	use 'gennaro-tedesco/nvim-commaround' -- Comment
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	--Syntax
	use 'Joorem/vim-haproxy'
	use 'jidn/vim-dbml'
	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	-- Status bar
	use 'nvim-lualine/lualine.nvim'
	use 'hrsh7th/nvim-compe' -- Autocompletion plugin
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use 'p00f/nvim-ts-rainbow' -- Raintbow Parentheses
	use 'norcalli/nvim-colorizer.lua'
	-- remote
	use 'chipsenkbeil/distant.nvim'
	-- Themes;
	use 'averak/laserwave.vim'
	use 'chriskempson/base16-vim'
end)

-- Vim Options
vim.o.encoding = 'utf-8'
vim.o.relativenumber = true
vim.o.ai = true
vim.o.ruler = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
--vim.o.hidden = true --Do not save when swap buffer
vim.o.hlsearch = true
vim.o.breakindent = true
vim.wo.signcolumn = 'yes'
vim.wo.number = true
--vim.wo.cursorcolumn = true
vim.wo.cursorline = true
--vim.cmd [[set undofile]]

-- Show Space Tab and EOL Symbol
vim.opt.list = true
vim.opt.listchars:append('space:·')
vim.opt.listchars:append('tab:▸ ')
vim.opt.listchars:append('eol:↴')

-- Blank Line
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
require('indent_blankline').setup {
	show_end_of_line = true,
	space_char_blankline = ' ',
	char_highlight_list = {
		'IndentBlanklineIndent1',
		'IndentBlanklineIndent2',
		'IndentBlanklineIndent3',
		'IndentBlanklineIndent4',
		'IndentBlanklineIndent5',
		'IndentBlanklineIndent6',
},

}

--Smooth Scroll
require('neoscroll').setup()

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Icons
require'nvim-web-devicons'.has_loaded()
require'nvim-web-devicons'.get_icons()

-- Theme
vim.wo.t_Co = '256'
vim.o.termguicolors = true

vim.o.background = 'dark'
vim.cmd('colorscheme base16-outrun-dark')

-- Colorizer
require'colorizer'.setup()

-- Status Bar
require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'FugitiveHead'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}

-- Tabline Config
require('bufferline').setup{
	options = {
		tab_size = 15,
		show_buffer_close_icons = false,
		separator_style = 'slant',
		show_tab_indicators = true
	}
}
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferLineCycleNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferLinePick<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A->>', ':BufferLineMoveNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferLineMovePrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<A-w>', ':bdelete<CR>', { silent = true })

--File Browser
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_show_icons = {
	git= 1,
	folders= 1,
	files= 1,
	folder_arrows= 1,
}
require 'nvim-tree'.setup {
	auto_reload_on_write = true, 
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	filters = {
		dotfiles = true,
		exclude = { 'run.sh', '.env', '.env.local', '.gitignore', '.dockerignore' },
	},
}

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { silent = true })

-- ScrollBar
vim.api.nvim_exec(
[[
	augroup ScrollbarInit
	autocmd!
	autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
	autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
	autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()
	augroup end
]],
false
)

-- Specs
require('specs').setup{
	show_jumps  = true,
	min_jump = 30,
	popup = {
		delay_ms = 0, -- delay before popup displays
		inc_ms = 20, -- time increments used for fade/resize effects
		blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
		width = 20,
		winhl = 'PMenu',
		fader = require('specs').pulse_fader,
		resizer = require('specs').shrink_resizer
	},
	ignore_filetypes = {},
	ignore_buftypes = {
		nofile = true,
	},
}

--Focus
require('focus').setup()
vim.api.nvim_set_keymap('n', '<c-l>', ':FocusSplitNicely<CR>', { silent = true })


--Distant
local actions = require('distant.nav.actions')
require('distant').setup{
	['*'] = require('distant.settings').chip_default(),
}

--ToggleTerm
require('toggleterm').setup{
  -- size can be a number or function which is passed the current terminal
--[[   size = 20 | function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end, ]]
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border =  'curved',
--[[     width = <value>,
    height = <value>, ]]
    winblend = 3,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    }
  }
}

-- TeleScope
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = '> ',
		selection_caret = '> ',
		entry_prefix = '  ',
		initial_mode = 'insert',
		selection_strategy = 'reset',
		sorting_strategy = 'descending',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	}
}
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').file_browser()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gg', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>//', ':Telescope<CR>', { noremap = true, silent = true })

--Compe
vim.o.completeopt = 'menuone,noselect'
require'compe'.setup {
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
}

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { hl = 'GitGutterAdd', text = '+' },
		change = { hl = 'GitGutterChange', text = '~' },
		delete = { hl = 'GitGutterDelete', text = '_' },
		topdelete = { hl = 'GitGutterDelete', text = '‾' },
		changedelete = { hl = 'GitGutterChange', text = '~' },
	},
}

--Rest Tool
require('rest-nvim').setup({
	skip_ssl_verification = false,
})
vim.api.nvim_set_keymap('n', '<leader>rr', [[<cmd>lua require('rest-nvim').run()<CR>]], { noremap = true, silent = true })

-- Emmet
vim.g.user_emmet_mode = 'i'
vim.g.user_emmet_leader_key = ','

--Lsp
vim.api.nvim_set_keymap('n', '<leader>f', '[[<cmd>lua vim.lsp.buf.formatting()<CR>]]', { silent = true })

require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
	init_options = {
		typescript = {
      serverPath = '/home/ron/node_modules/typescript/lib/tsserverlibrary.js'
    }
	}
}

require'lspconfig'.html.setup{}

require'lspconfig'.csharp_ls.setup{}

require'lspconfig'.jsonls.setup{
	init_options = {
		provideFormatter = true
	},
--	cmd = { 'vscode-json-languageserver', '--stdio' }
}

require'lspconfig'.pyright.setup{}

require'lspconfig'.sumneko_lua.setup{}

--Treesitter
require'nvim-treesitter.configs'.setup {
	ensure_installed = { 'c', 'python', 'lua', 'rust', 'http', 'html', 'json', 'css', 'scss', 'c_sharp', 'javascript' },
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

-- nvim-commaround
vim.api.nvim_set_keymap('v', '<leader>c', '<Plug>ToggleCommaround', {})

