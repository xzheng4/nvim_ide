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
 Plug 'kyazdani42/nvim-tree.lua'

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

 " tab
 Plug 'akinsho/bufferline.nvim'

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "cuda", "c", "lua", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
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

lua << END
require("nvim-tree").setup()
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

END
"nnoremap <C-n> <cmd>NvimTreeToggle<cr>

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
