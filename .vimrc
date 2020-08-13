syntax on
syntax enable

" Settings.
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 " Maximum number of changes that can be undone.
set undoreload=10000 " Maximum number lines to save for undo on a buffer reload.
set noswapfile
set nobackup
set ignorecase
set smartcase
set encoding=utf-8
set number
set relativenumber
set autoindent
set shiftwidth=4
set tabstop=4
filetype plugin indent on
filetype on

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

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

" https://github.com/lervag/vimtex
Plug 'lervag/vimtex', { 'for' : ['tex', 'latex', 'plaintex']}

" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" https://github.com/sainnhe/gruvbox-material
Plug 'sainnhe/gruvbox-material'

call plug#end()

" Configure gruvbox-material plugin.
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" Configure vimtex plugin.
let g:tex_flavor='latex'

" Configure vim-airline plugin.
let g:airline#extensions#tabline#enabled=1

" Configure gruvbox plugin.
let g:gruvbox_contrast_dark = 'hard'

" Configure fzf.vim plugin.
let $FZF_DEFAULT_OPTS='--reverse'

" Change the style.
colorscheme gruvbox
set background=dark

" Keys mapping.
let mapleader=" "
let g:mapleader=" "
nnoremap <C-p> :GFiles<CR> " Find for file.
nnoremap <C-f> :BLines<CR> " Find for line.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nnoremap <leader>a ggVG " Select all.
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap j gj
nnoremap k gk

" Toggle between UPPER CASE, lower case and Title Case.
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
