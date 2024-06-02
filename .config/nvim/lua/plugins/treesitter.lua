require("nvim-treesitter.configs").setup({
	sync_install = false,
	auto_install = true,
	ensure_installed = { "typescript", "javascript", "tsx", "lua", "bash", "html", "css", "scss", "xml", "json" },
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = false,
	},
})
