syntax on
syntax enable
filetype plugin indent on
filetype on

set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup
set ignorecase
set smartcase
set encoding=utf-8
set number
set relativenumber
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set autoread
set wildmenu
set wildmode=longest,list
set scrolloff=8
set incsearch
set noerrorbells
set shortmess=I
set hidden
set termguicolors
set conceallevel=0
set spell spelllang=en_us
set ttimeoutlen=100
set nohlsearch
set guicursor=
set signcolumn=yes

" Disable mouse.
set mouse=

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Give more space for displaying messages.
"set cmdheight=1

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Configure netrw.
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=-32
let g:netrw_browse_split=4
let g:netrw_altv=1

" Keys mapping.
let mapleader=" "
let g:mapleader=" "

nmap Y yy
nmap <leader>w :wa<CR>
nmap <leader>q :q<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :Neoformat<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup trimwhitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup end
