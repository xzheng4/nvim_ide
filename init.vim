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

" global configuration
let g:mapleader = " "
let g:startify_change_to_dir = 0

call plug#begin("~/.vim/plugged")
 Plug 'nvim-lualine/lualine.nvim'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'kyazdani42/nvim-tree.lua'

 Plug 'nvim-lua/plenary.nvim'
 Plug 'mhinz/vim-startify'
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
 Plug 'kdheepak/tabline.nvim'

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
    -- theme = 'gruvbox_light',
    theme = 'onedark',
    },
}
END

lua << END
require("nvim-tree").setup()
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- nnoremap <C-n> <cmd>NvimTreeToggle<cr>
END

lua << END

    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        section_separators = {'', ''},
        component_separators = {'', ''},
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = false, -- shows base filename only instead of relative path in filename
        modified_icon = "+ ", -- change the default modified icon
        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
        show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]

    vim.keymap.set('n', '<Tab>', ':TablineBufferNext<CR>', { noremap = true, silent = true })
END

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fv <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"source ~/.config/nvim/coc.vim
source ~/.config/nvim/nvim-cmp.vim
