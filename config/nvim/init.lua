-- Shorthands
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.o.number = true

-- Map insert key
map('n', ';', 'i', opts)

-- Options
vim.o.signcolumn  = "yes"
vim.o.wrap        = false
vim.o.tabstop     = 4
vim.o.number      = true
vim.o.smartindent = true
vim.o.swapfile    = false
vim.o.winborder   = "rounded"
vim.o.clipboard   = "unnamedplus"

-- Packing it up in here :P
vim.pack.add({
		"https://github.com/catppuccin/nvim",
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/neovim/nvim-lspconfig",
		"https://github.com/mason-org/mason.nvim",
		"https://github.com/L3MON4D3/LuaSnip",
		"https://github.com/nvim-tree/nvim-web-devicons",
		"https://github.com/smolck/command-completion.nvim",
		"https://github.com/hrsh7th/nvim-cmp",
		"https://github.com/vim-airline/vim-airline",
		"https://github.com/vim-airline/vim-airline-themes",
		"https://github.com/norcalli/nvim-colorizer.lua",
		"https://github.com/nvim-lua/plenary.nvim",
		"https://github.com/stevearc/oil.nvim",
		"https://github.com/nvim-mini/mini.nvim",
		"https://github.com/MeanderingProgrammer/render-markdown.nvim",
		"https://github.com/charmbracelet/tree-sitter-vhs",
		"https://github.com/folke/flash.nvim",
		"https://github.com/gisketch/triforce.nvim",
		"https://github.com/nvzone/volt",
		"https://github.com/apple/pkl-neovim",
		"https://github.com/lukas-reineke/indent-blankline.nvim",
		"https://github.com/MunifTanjim/nui.nvim",
		"https://github.com/alex-popov-tech/store.nvim",
		"https://github.com/soulis-1256/eagle.nvim"
})

require("nvim-treesitter.configs").setup({
		ensure_installed = { "c", "lua", "swift", "ruby", "hyprlang", "bash", "go", "gomod", "gosum", "kdl", "pkl", "markdown", "markdown_inline", "python", "vhs", "html", "latex", "yaml" },

		sync_install = false,

		auto_install = true,

		highlight = {
				enable = true,
		},

		incremental_selection = {
				enable = true,
		},

		indent = {
				enable = true,
		},
})

require("mason").setup()

vim.lsp.enable({ "nixd", "ruby-lsp" })

vim.cmd.colorscheme "catppuccin-mocha"

map('i', '<A-o>', "<C-x><C-o>", opts)

vim.g.airline_theme = "catppuccin"

require 'colorizer'.setup({
		'*';
}, { mode = "background" })

require("mini.icons").setup()
require("mini.pick").setup()
require("mini.tabline").setup()
require("oil").setup()

require("render-markdown").setup()

map('n', 'tT', ':Oil<CR>')
map('n', 'fF', ':Pick files<CR>')
map('n', 'dD', ':Dashboard<CR>')
map('n', 'pP', ':RenderMarkdown toggle<CR>')
map('n', 'hH', ':tabNext<CR>')
map('n', 'hE', ":tabedit ")
map('n', 'gO', ":Obsidian")

-- Translucent background go brrr
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Make the gutter opaque
vim.api.nvim_set_hl(0, "LineNr",      { bg = "#1e2030" })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = "#1e2030" })

-- Set up splits
map('n', 'hK', vim.cmd.split)
map('n', 'hL', vim.cmd.vsplit)

-- Change focus
map('n', '<C-Up>', '<C-w>k')
map('n', '<C-Down>', '<C-w>j')
map('n', '<C-Left>', '<C-w>h')
map('n', '<C-Right>', '<C-w>l')

-- Set up flash.nvim
map('n', '<C-s>', function() require('flash').jump() end)

-- Set up indent-blankline.nvim
require('ibl').setup()

-- Set up store.nvim
require('store').setup()

-- Set up eagle.nvim
require('eagle').setup()
