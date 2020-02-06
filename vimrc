set nu ts=4 sw=4 smarttab ai autoread expandtab
if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
filetype indent on
filetype plugin on

""" CustomMapping
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>p :set invpaste<CR> 
nmap <leader>rt :retab<cr>
"""

""" VimPlug - A minimalist Vim plugin manager.

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'
Plug 'digitaltoad/vim-pug'
Plug 'kern/vim-es7'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'jacoborus/tender.vim'
"Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'zirrostig/vim-jack-syntax'
" Plug 'terryma/vim-multiple-cursors'
Plug 'dag/vim-fish'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()
"""

""" enable lightline
set laststatus=2
"""

""" Theme tender Config
if (has("termguicolors"))
		set termguicolors
endif
" Theme
syntax enable
colorscheme tender
" set lighline theme inside lightline config
let g:lightline = { 'colorscheme': 'tender' }
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
"""

""" indentLine Config
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
let g:tex_conceal=''
"""

""" Custom Filetype
autocmd BufRead,BufNewFile *.zenv set filetype=zsh syntax=zsh
"""
