vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ranger<CR>")
vim.keymap.set("n", "<leader>w", "<C-w><C-w>")
vim.keymap.set("n", "<leader>g", ":Neotree git_status toggle<CR>")

vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "l", "k")
vim.keymap.set("n", ";", "l")
vim.keymap.set("n", "h", ";")

vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "l", "k")
vim.keymap.set("v", ";", "l")
vim.keymap.set("v", "h", ";")

vim.keymap.set("n", "<leader>f", ":Format<CR>")
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>")

vim.keymap.set("i", "ff", "<ESC>")

vim.keymap.set("n", "<leader>t", ":tab terminal<CR> | :setlocal nonumber norelativenumber<CR>")
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>N", ":bprev<CR>")
