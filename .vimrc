set nocompatible
filetype off

"=============================================
" Plugins
"=============================================

call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree'
"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
if executable('fzf')
  " <C-p> to search files
  nnoremap <silent> <C-p> :FZF -m<cr>
end


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" use tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Polyglot loads language support on demand!
Plug 'sheerun/vim-polyglot'

Plug 'neomake/neomake'
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
let g:neomake_markdown_enabled_makers = []

let g:neomake_elixir_enabled_makers = ['mycredo']
function! NeomakeCredoErrorType(entry)
  if a:entry.type ==# 'F'      " Refactoring opportunities
    let l:type = 'W'
  elseif a:entry.type ==# 'D'  " Software design suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'W'  " Warnings
    let l:type = 'W'
  elseif a:entry.type ==# 'R'  " Readability suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'C'  " Convention violation
    let l:type = 'W'
  else
    let l:type = 'M'           " Everything else is a message
  endif
  let a:entry.type = l:type
endfunction

let g:neomake_elixir_mycredo_maker = {
      \ 'exe': 'mix',
      \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
      \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
      \ 'postprocess': function('NeomakeCredoErrorType')
      \ }

Plug 'slashmili/alchemist.vim'

Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

let base16colorspace=256

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

set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :noh<CR>

set cursorline
set cursorcolumn

set title
