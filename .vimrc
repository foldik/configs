set nocompatible
filetype off

"=============================================
" Plugins
"=============================================

call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Completion sources 
Plug 'slashmili/alchemist.vim' " Elixir
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'} " JS
Plug 'ncm2/ncm2-racer' " Rust
Plug 'ncm2/ncm2-cssomni' " Css
Plug 'pbogut/ncm2-alchemist' " Elixir
Plug 'ncm2/ncm2-jedi' " Python
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']} " Java
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']} " Java

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'w0rp/ale'

Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

let base16colorspace=256

" Linter
let g:ale_sign_column_always = 1
" only lint on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_rust_cargo_use_check = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_virtualtext_cursor = 0

"=============================================
" Editor
"=============================================

" size of a hard tabstop
set tabstop=2

" always uses spaces instead of tab characters
set expandtab

" size of an "indent"
set shiftwidth=2

set number
set encoding=utf-8
colorscheme base16-atelier-dune
set termguicolors

