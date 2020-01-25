syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set number
filetype indent on
set autoindent
set cursorline

" Plugins
call plug#begin('~/.vim/plugged')

" Python autocomplete
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

call plug#end()