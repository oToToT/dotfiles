""" Custom config
se nu ts=4 sw=4 sta ai ar et hls is
if !&scrolloff
    se scrolloff=1
endif
if !&sidescrolloff
    se sidescrolloff=5
endif
filetype indent on
filetype plugin on
au FileType python setl ts=4
"""

""" Custom Mapping
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>nn :NERDTreeToggle<cr>
nmap <leader>r :Rename 
nnoremap <leader>p :set invpaste<cr>
nnoremap <leader>t :retab<cr>
nnoremap <leader>d :let @/ = ""<cr>
nnoremap <leader>u :set invnumber<cr>
"""

""" VimPlug - A minimalist Vim plugin manager.

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
"
" language support
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'chr4/nginx.vim'
Plug 'digitaltoad/vim-pug'
Plug 'steve-kaufman/ejs-syntax'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'petRUShka/vim-sage'
Plug 'kern/vim-es7'
Plug 'dag/vim-fish'
Plug 'zirrostig/vim-jack-syntax'
Plug 'bfrg/vim-cuda-syntax'
" theme
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
" tool
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'yggdroot/indentline'

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

""" indentLine config
let g:indentLine_char = '┊'
let g:indentLine_enabled = 1
let g:tex_conceal=''
"""

""" vim-markdown config
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
"""

""" ale config
call ale#Set('cpp_gcc_options', '-std=c++17 -Wall -Wextra -Wshadow -Wconversion')
"""
