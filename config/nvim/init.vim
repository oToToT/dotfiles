set number
set fsync
set hlsearch
set encoding=utf-8
set t_Co=256


let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>e :tabe
nnoremap <leader>q :q
nnoremap <leader>xx :cclose<cr>
nnoremap <leader>xc :cle<cr>
nnoremap <leader>p :set invpaste<cr>
nnoremap <leader>t :retab<cr>
nnoremap <leader>d :let @/ = ""<cr>
nnoremap <leader>u :set invnumber<cr>



call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'itchyny/lightline.vim'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:tokyonight_style = "night"
syntax enable
colorscheme tokyonight
let g:lightline = {'colorscheme': 'tokyonight'}


set completeopt=menu,menuone,noselect
luafile $HOME/.config/nvim/nvim-cmp.lua
luafile $HOME/.config/nvim/lsp-config.lua


"autocmd FileType c,cpp call SetupCpp()

function SetupCpp()
  set cindent
  set tabstop=2
  set softtabstop=2
  set cinoptions+=j1
  set shiftwidth=2
  set expandtab
endfunction
