vim.cmd(
	" set langmap=яq,шw,еe,рr,тt,ыy,уu,иi,оo,пp,ю[,ж],аa,сs,дd,фf,гg,чh,йj,кk,лl,зz,хx,цc,вv,бb,нn,мm,ЯQ,ШW,ЕE,РR,ТT,ЫY,УU,ИI,ОO,ПP,Ю{,Ж},АA,СS,ДD,ФF,ГG,ЧH,ЙJ,КK,ЛL,ЗZ,ХX,ЦC,ВV,БB,НN,МM"
)
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

vim.keymap.set("n", "й", "h")
vim.keymap.set("n", "к", "j")
vim.keymap.set("n", "л", "k")
vim.keymap.set("n", ";", "l")
vim.keymap.set("n", "ч", ";")

vim.keymap.set("v", "й", "h")
vim.keymap.set("v", "к", "j")
vim.keymap.set("v", "л", "k")
vim.keymap.set("v", ";", "l")
vim.keymap.set("v", "ч", ";")

vim.keymap.set("n", "<leader>f", ":Format<CR>")
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>")

vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set("n", "<leader>t", ":tab terminal<CR> | :setlocal nonumber norelativenumber<CR>")
vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]])
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>N", ":bprev<CR>")
