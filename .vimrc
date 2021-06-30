syntax on
syntax enable
filetype plugin indent on
filetype on

" Settings.
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

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Configure gruvbox plugin.
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
set background=dark

" Configure netrw.
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=-32
let g:netrw_browse_split=4
let g:netrw_altv=1

" Keys mapping.
let mapleader=" "
let g:mapleader=" "

nmap <leader>w :wa<CR>
nmap <leader>q :q<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <leader><CR> :terminal<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

tnoremap <Esc> <C-\><C-n>

" Configure completion.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
" Open completion when pressing TAB.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ completion#trigger_completion()

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

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup trimwhitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup end
