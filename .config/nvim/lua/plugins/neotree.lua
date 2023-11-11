require("neo-tree").setup({
      window = {
          position = "left",
          width = 30,
	    use_default_mappings = false,
            mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
      	    ["l"] = ""
          }
        }

})


--vim.cmd('au Filetype neo-tree nnoremap <buffer> j h')
--vim.cmd('au Filetype neo-tree nnoremap <buffer> k j')
--vim.cmd('au Filetype neo-tree nnoremap <buffer> l k')
--vim.cmd('au Filetype neo-tree nnoremap <buffer> ; l')
--vim.cmd('au Filetype neo-tree nnoremap <buffer> h ;')
--
      vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "󰌵", texthl = "DiagnosticSignHint"})
