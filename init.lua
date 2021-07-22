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
	use 'neovim/nvim-lspconfig' -- LSP
	use 'romgrk/barbar.nvim'
  use 'karb94/neoscroll.nvim' -- SmoothScroll
	use 'Xuyuanp/scrollbar.nvim' --Scrollbar
	use {'edluffy/specs.nvim'} -- Show Cursor when jumping 
	use 'mattn/emmet-vim' -- Emmet
	use { 'NTBBloodbath/rest.nvim', requires = { 'nvim-lua/plenary.nvim' } } 
  use 'tpope/vim-fugitive' -- Git Command 
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
	use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use({ 'rose-pine/neovim', as = 'rose-pine' }) --Theme
	use 'kyazdani42/nvim-web-devicons'
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } } -- Telescope Manage Files Search
  use 'itchyny/lightline.vim' -- Fancier statusline
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
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

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Theme
vim.o.termguicolors = true
vim.cmd [[colorscheme rose-pine ]]
--require('rose-pine').set()
vim.g.rose_pine_variant = 'moon'
vim.g.rose_pine_enable_italics = true

-- Set statusbar
vim.g.lightline = {
--  colorscheme = 'rose-pine',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'fugitive#head' },
}

-- Barbar Config
vim.g.bufferline = {closable = false}
vim.api.nvim_set_keymap('n', '<A-,>', ':BufferPrevious<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-.>', ':BufferNext<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A->>', ':BufferMoveNext<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-c>', ':BufferClose<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<A-s>', ':BufferPick<CR>', { silent = true})

-- NeoScroll
require('neoscroll').setup()

-- ScrollBar
vim.api.nvim_exec(
	[[
	augroup ScrollbarInit
		autocmd!
		autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
		autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
		autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
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
        winhl = "PMenu",
        fader = require('specs').pulse_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
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
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
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
vim.o.completeopt = "menuone,noselect"
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
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
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
require('rest-nvim').setup()
-- Emmet
vim.g["user_emmet_leader_key"] = ','
