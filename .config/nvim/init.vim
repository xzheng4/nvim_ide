set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"source ~/.vimrc

set et
set ci
set sw=4
set ts=4
set hls
set incsearch
set ruler

call plug#begin("~/.vim/plugged")
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'kyazdani42/nvim-web-devicons'

 Plug 'nvim-lua/plenary.nvim'
 Plug 'mhinz/vim-startify'
 "Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'

 " For vsnip users.
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "cpp", "cuda", "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

}

EOF

lua << END

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_light',
    },
}
END

let maplocalleader = "\\"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fv <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:startify_change_to_dir = 0

"source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvim-cmp.vim
