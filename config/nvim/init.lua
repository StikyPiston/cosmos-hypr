-- Shorthands
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Options
vim.o.signcolumn     = "yes"
vim.o.wrap           = false
vim.o.tabstop        = 4
vim.o.number         = true
vim.o.smartindent    = true
vim.o.swapfile       = false
vim.o.winborder      = "rounded"
vim.o.clipboard      = "unnamedplus"
vim.o.mousemoveevent = true
vim.o.number         = true

-- Bindings
map('n', ';',         'i', opts)
map('i', '<A-o>',     '<C-x><C-o>', opts)
map('n', 'tT',        ':Oil<CR>')
map('n', 'fF',        ':Pick files<CR>')
map('n', 'dD',        ':Dashboard<CR>')
map('n', 'pP',        ':RenderMarkdown toggle<CR>')
map('n', 'hH',        ':tabNext<CR>')
map('n', 'hE',        ':tabedit ')
map('n', 'gO',        ':Obsidian')
map('n', 'hK',        vim.cmd.split)
map('n', 'hL',        vim.cmd.vsplit)
map('n', '<C-Up>',    '<C-w>k')
map('n', '<C-Down>',  '<C-w>j')
map('n', '<C-Left>',  '<C-w>h')
map('n', '<C-Right>', '<C-w>l')
map('n', '<C-s>',     function() require('flash').jump() end)
map('n', '<C-i>',     ':FzfNerdfont<CR>')
map('n', '<C-4>',     vim.pack.update())

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
		"https://github.com/soulis-1256/eagle.nvim",
		"https://github.com/stephansama/fzf-nerdfont.nvim",
		"https://github.com/ibhagwan/fzf-lua",
		"https://github.com/StikyPiston/gelpen.nvim"
})

-- Treesitter Setup
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

-- Theming
vim.cmd.colorscheme "catppuccin-mocha"
vim.g.airline_theme = "catppuccin"
vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC",    { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr",      { bg = "#1e2030" })
vim.api.nvim_set_hl(0, "SignColumn",  { bg = "#1e2030" })

require 'colorizer'.setup({
		'*';
}, { mode = "background" })

-- Plugin Setup
require("mason").setup()
require("mini.icons").setup()
require("mini.pick").setup()
require("mini.tabline").setup()
require("oil").setup()
require("render-markdown").setup()
require('ibl').setup()
require('store').setup()
require('eagle').setup({
		keyboard_mode = true,
		mouse_mode    = true
})

-- Hijinks in LSP land

-- > Lua language server
vim.lsp.config("lua_ls", {
		cmd = { '/usr/sbin/lua-language-server' },
		filetypes = { 'lua' },
		root_markers = {
				'.luarc.json',
				'.luarc.jsonc',
				'.luacheckrc',
				'.stylua.toml',
				'stylua.toml',
				'selene.toml',
				'selene.yml',
				'.git',
		},
})
vim.lsp.enable("lua_ls")

-- > Ruby LSP
vim.lsp.config("ruby-lsp", {
		cmd          = { "ruby-lsp" },
		filetypes    = { 'ruby', 'eruby' },
		root_markers = { 'Gemfile', '.git' },
		init_options = { formatter = 'auto', },
		reuse_client = function(client, config)
				config.cmd_cwd               =  config.root_dir
				return client.config.cmd_cwd == config.cmd_cwd
		end,
})
vim.lsp.enable("ruby-lsp")

-- > Crystal LSP
vim.lsp.config("crystalline", {
		cmd          = { 'crystalline' },
		filetypes    = { 'crystal' },
		root_markers = { 'shard.yml', '.git' }
})
vim.lsp.enable("crystalline")

-- > Hyprlang LSP
vim.lsp.config('hyprls', {
		cmd          = { 'hyprls', '--stdio' },
		filetypes    = { 'hyprlang' },
		root_markers = { '.git' }
})
vim.lsp.enable("hyprls")

-- > Fish LSP
vim.lsp.config("fish-lsp", {
		cmd          = { 'fish-lsp', 'start' },
		filetypes    = { 'fish' },
		root_markers = { 'config.fish', '.git' },
})
vim.lsp.enable("fish-lsp")

-- > CoffeeScript LSP
vim.lsp.config("coffeesense", {
		cmd          = { 'coffeesense-language-server', '--stdio' },
		filetypes    = { 'coffee' },
		root_markers = { 'package.json' },
})
vim.lsp.enable("coffeesense")

-- > Rust LSP
vim.lsp.enable("rust_analyzer")

-- > Zig LSP
vim.lsp.enable("zls")

-- > MCFunction LSP
vim.lsp.enable("spyglassmc_language_server")
