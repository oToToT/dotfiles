""" Custom config
set number
set tabstop=4
set shiftwidth=4
set noshowmode
set showtabline=1
set autoindent
set autoread
set expandtab
set hlsearch
set incsearch
set cinoptions+=j1
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
filetype indent on
filetype plugin on
autocmd FileType c,cpp let c_no_curly_error=1
autocmd FileType c,cpp setl cin
"""

""" Custom Mapping
let mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>nn :NERDTreeToggle<cr>
nmap <leader>r :Rename 
nmap gd :ALEGoToDefinition<cr>
nmap gr :ALEFindReferences<cr>
nnoremap <leader>xx :cclose<cr>
nnoremap <leader>xc :cle<cr>
nnoremap <leader>e :tabe 
nnoremap <leader>q :q 
nnoremap <leader>p :set invpaste<cr>
nnoremap <leader>t :retab<cr>
nnoremap <leader>d :let @/ = ""<cr>
nnoremap <leader>u :set invnumber<cr>
nmap <Leader>F :let g:ale_fix_on_save=!g:ale_fix_on_save<CR>:echo "fix on save" g:ale_fix_on_save?"enabled":"disabled"<CR>
autocmd FileType c,cpp nnoremap <buffer><Leader>ca :<C-u>ALECodeAction<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>ca :ALECodeAction<CR>
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
Plug 'othree/html5.vim'
Plug 'kern/vim-es7'
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-pug'
Plug 'steve-kaufman/ejs-syntax'
Plug 'groenewege/vim-less'
Plug 'posva/vim-vue'
Plug 'tomlion/vim-solidity'
Plug 'dag/vim-fish'
Plug 'petRUShka/vim-sage'
Plug 'zirrostig/vim-jack-syntax'
Plug 'bfrg/vim-cpp-modern'
Plug 'bfrg/vim-cuda-syntax'
Plug 'derekelkins/agda-vim'
Plug 'udalov/kotlin-vim'

" tool
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdcommenter'
Plug 'danro/rename.vim'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-obsession'
"Plug 'mg979/vim-visual-multi'
"Plug 'jiangmiao/auto-pairs'

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
au FileType markdown let g:indentLine_setConceal = 0
"""

""" vim-markdown config
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
"""

""" ale config
call ale#Set('cuda_nvcc_options', '-std=c++17')
let g:ale_fixers = {
\    'cpp': ['clang-format'],
\    'c':  ['clang-format'],
\    'cuda': ['clang-format'],
\    'rust': ['rustfmt']
\}
let g:ale_linters = {
\   'cpp': ['clangd'],
\   'rust': ['analyzer'],
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
