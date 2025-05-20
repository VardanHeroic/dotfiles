local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"VardanHeroic/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({ replace_netrw = true })
			vim.api.nvim_set_keymap("n", "<leader>ef", "", {
				noremap = true,
				callback = function()
					require("ranger-nvim").open(true)
				end,
			})
		end,
	},
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
        event = "VeryLazy",
},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},-- Lazy
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --     require("chatgpt").setup()
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "folke/trouble.nvim", -- optional
    --         "nvim-telescope/telescope.nvim"
    --     }
    -- },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require('treesj').setup({max_join_length = 140})
        end,
    },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	{ 
        "williamboman/mason.nvim",
        opts = {
            ensure_installed ={
                "emmet-language-server",
                "typescript-language-server",
                "eslint-lsp",
                "css-lsp",
                "html-lsp",
                "prettierd",
				"tailwindcss-language-server"
            }
        }
    },
	{ "lewis6991/gitsigns.nvim" },
	{ "windwp/nvim-ts-autotag" },
	{ "nvim-lualine/lualine.nvim" },
	{ "RRethy/nvim-base16" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
    { "nvimtools/none-ls.nvim" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "stevearc/vim-vscode-snippets" },
	{ "wakatime/vim-wakatime" },
	{ "lambdalisue/vim-suda" },
    { "xiyaowong/transparent.nvim" }
})
