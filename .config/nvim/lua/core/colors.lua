-- To disable highlights for supported plugin(s), call the `with_config` function **before** setting the colorscheme.
-- These are the defaults.
vim.cmd.colorscheme("base16-default-dark")
vim.cmd("set termguicolors")

vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
--au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

--vim.cmd('highlight Normal ctermbg=none')
--vim.cmd('highlight NonText ctermbg=none')
--vim.cmd('highlight Normal guibg=none')
--vim.cmd('highlight NonText guibg=none')
