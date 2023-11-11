:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set nowrap


set clipboard+=unnamedplus


call plug#begin()

Plug 'wakatime/vim-wakatime'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'neovim/nvim-lspconfig'
Plug 'pedro757/emmet'
Plug 'stevearc/vim-vscode-snippets'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/paradigm/vim-multicursor'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/Pocco81/auto-save.nvim'
Plug 'mlaursen/vim-react-snippets'
Plug 'RRethy/nvim-base16'
Plug 'https://github.com/nvim-neo-tree/neo-tree.nvim'

"autocmd FileType apache setlocal commentstring=#\ %s
set encoding=UTF-8

let base16colorspace=256 
autocmd vimenter * highlight Normal guibg=NONE ctermbg=NONE
 
:set completeopt-=preview


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


call plug#end()

let nerdtreeshowlinenumbers=0

let g:syntastic_stl_format ='[%E{E:%e(#%fe)}%B{,}%W{W:%w(#%fw)}]' 
let g:syntastic_javascript_checkers = ['jshint']

 " or light if you want light mode
colorscheme base16-default-dark

:nnoremap j h
:nnoremap k j
:nnoremap l k
:nnoremap ; l
:nnoremap h ;

:vnoremap j h
:vnoremap k j
:vnoremap l k
:vnoremap ; l
:vnoremap h ;
nnoremap <A-w> <C-w><C-w>
nnoremap <A-t> :enew<CR>
nnoremap <A-tab> :bnext<CR>
nnoremap <A-S-tab> :bprevious<CR>
nnoremap <A-e> :NERDTreeToggle<CR>
nnoremap <A-q> :bd<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
" Change an option
nnoremap <Leader>f :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
"inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : 
"'\<tab>' "


lua <<EOF


local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = {
        'html',
        'css',
        'scss',
        'javascriptreact',
        'typescriptreact',
        'haml',
        'xml',
        'xsl',
        'pug',
        'slim',
        'sass',
        'stylus',
        'less',
        'sss',
        'hbs',
        'handlebars',
      };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }



 local cmp = require'cmp'
	
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = false,
    },
    ensure_installed = {'javascript','html','css','bash','json'}


}
EOF

if exists("g:neovide")
    set guifont=SauceCodePro\ Nerd\ Font:h12
    let g:neovide_transparency = 0.3 
endif


