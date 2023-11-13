local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup({
    defaults = {
        layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },    -- other defaults configuration here
    },
    -- other configuration values here
})

local TelescopePrompt = {
    TelescopeBorder = {
        bg = nil,
    },
    TelescopePromptNormal = {
        bg = nil,
    },
    TelescopePromptBorder = {
        bg = nil,
    },
    TelescopePromptTitle = {
        fg = nil,
        bg = nil,
    },
    TelescopePreviewTitle = {
        fg = nil,
        bg = nil,
    },
    TelescopeResultsTitle = {
        fg = nil,
        bg = nil,
    },
}
for hl, col in pairs(TelescopePrompt) do
    vim.api.nvim_set_hl(0, hl, col)
end

