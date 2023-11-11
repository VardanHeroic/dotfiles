vim.g.mapleader = ' '

vim.keymap.set('n','<leader>e', ':Neotree toggle<CR>')
vim.keymap.set('n','<leader>w', ':Neotree git_status<CR>')

vim.keymap.set('n','j','h')
vim.keymap.set('n','k','j')
vim.keymap.set('n','l','k')
vim.keymap.set('n',';','l')
vim.keymap.set('n','h',';')

vim.keymap.set('v','j','h')
vim.keymap.set('v','k','j')
vim.keymap.set('v','l','k')
vim.keymap.set('v',';','l')
vim.keymap.set('v','h',';')
