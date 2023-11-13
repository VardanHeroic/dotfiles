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
        "kelly-lin/ranger.nvim",
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
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" },
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
    { "lewis6991/gitsigns.nvim" },
    { "windwp/nvim-ts-autotag" },
    { "nvim-lualine/lualine.nvim" },
    { "VardanHeroic/nvim-base16" },
    { "nvim-treesitter/nvim-treesitter" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    { "williamboman/mason.nvim" },
    { "mhartington/formatter.nvim" },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'norcalli/nvim-colorizer.lua' },
    { "xiyaowong/transparent.nvim", lazy = false }
})
