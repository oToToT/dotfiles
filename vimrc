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
nnoremap <leader>e :tabe 
nnoremap <leader>q :q 
nnoremap <leader>p :set invpaste<cr>
nnoremap <leader>t :retab<cr>
nnoremap <leader>d :let @/ = ""<cr>
nnoremap <leader>u :set invnumber<cr>
nmap <Leader>F :let g:ale_fix_on_save=!g:ale_fix_on_save<CR>
autocmd FileType c,cpp nnoremap <buffer><Leader>ff :<C-u>ALEFix<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>ff :ALEFix<CR>
"""

""" VimPlug - A minimalist Vim plugin manager.
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

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
Plug 'derekelkins/agda-vim'
Plug 'posva/vim-vue'
Plug 'tomlion/vim-solidity'
" tool
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'tpope/vim-sleuth'
Plug 'mg979/vim-visual-multi'
Plug 'editorconfig/editorconfig-vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'yggdroot/indentline'
" theme
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'maximbaz/lightline-ale'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

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
let g:indentLine_char = '⎸'
let g:indentLine_enabled = 1
let g:tex_conceal=''
"""

""" vim-markdown config
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
"""

""" ale config
call ale#Set('cpp_cc_options', '-std=c++17 -Wall -Wextra -Wshadow -Wconversion -Wwrite-strings')
call ale#Set('cpp_clangcheck_options', '-std=c++17 -Wall -Wextra -Wshadow -Wconversion -Wwrite-strings')
call ale#Set('cpp_clangtidy_extra_options', '-extra-arg=-std=c++17')
let g:ale_fixers = {
\    'cpp': ['clang-format'],
\    'c':  ['clang-format'],
\}
let g:ale_echo_msg_format = '[%linter%] %s'
"""


"""lightline-ale
let g:lightline#ale#indicator_checking = "linting..."

let g:lightline.component_expand = {
\     'linter_checking': 'lightline#ale#checking',
\     'linter_infos': 'lightline#ale#infos',
\     'linter_warnings': 'lightline#ale#warnings',
\     'linter_errors': 'lightline#ale#errors',
\     'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\ }

let g:lightline.active = {
\     'left' : [
\         [ 'mode', 'paste' ],
\         [ 'gitbranch', 'readonly', 'filename', 'modified', 'linter_infos' ]
\     ],
\     'right': [
\          [ 'linter_errors', 'linter_warnings', 'lineinfo' ],
\          [ 'percent' ],
\          [ 'linter_checking',  'fileformat', 'fileencoding', 'filetype' ]
\     ]
\ }
"""
