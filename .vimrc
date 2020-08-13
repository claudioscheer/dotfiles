syntax on

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
syntax enable
set autoindent
set shiftwidth=4
set tabstop=4
set mouse=a
"set textwidth=80
"set formatoptions-=t
filetype plugin indent on
filetype on

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"augroup vimrc_autocmds
	"autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
	"autocmd BufEnter * match OverLength /\%81v.*/
"augroup END

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

call plug#end()

let g:tex_flavor='latex'

" Style.
let g:airline#extensions#tabline#enabled=1
"let g:airline_theme='deus'
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

let $FZF_DEFAULT_OPTS='--reverse'

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
