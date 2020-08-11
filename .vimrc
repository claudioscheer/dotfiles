call plug#begin('~/.vim/plugged')

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

" https://github.com/ycm-core/YouCompleteMe
Plug 'ycm-core/YouCompleteMe'

call plug#end()

" Persistent undo.
if !isdirectory($HOME."/.dotfiles/vim/undodir")
    call mkdir($HOME."/.dotfiles/vim/undodir", "p")
endif

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 " Maximum number of changes that can be undone.
set undoreload=10000 " Maximum number lines to save for undo on a buffer reload.

set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
colorscheme gruvbox
set background=dark
set relativenumber
syntax enable
set autoindent
set shiftwidth=4
set tabstop=4
set mouse=a
filetype plugin indent on
filetype on
let mapleader = " "
let g:mapleader = " "

" Keys mapping.
nnoremap <C-p> :GFiles<CR> " Find for file.
nnoremap <C-f> :BLines<CR> " Find for line.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nnoremap <leader>a ggVG " Select all.
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>