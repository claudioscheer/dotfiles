set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup
set ignorecase
set smartcase
set encoding=UTF-8
set number
set relativenumber
set autoindent
set expandtab
set autoread
set wildmenu
set scrolloff=8
set incsearch
set noerrorbells
set hidden
set guicursor=
set signcolumn=yes
set splitright
set splitbelow
set ttyfast
set lazyredraw
set completeopt=menu,menuone,noselect
set timeout
set timeoutlen=300
set updatetime=50
set mouse=a
set clipboard+=unnamedplus
set shortmess+=c
set cmdheight=1
set tabstop=2
set shiftwidth=0
set wildignore+=*/node_modules/**,*/.git/**,*/__pycache__/
filetype plugin indent on

" leader
let mapleader=" "

" netrw
let netrw_banner=0
let netrw_browse_split=2
" let netrw_winsize=-32
let netrw_browse_split=4
let netrw_altv=1
let netrw_liststyle=3

" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

" gruvbox
colorscheme gruvbox-material
set background=dark

" Airline
let g:airline_theme = 'gruvbox_material'

" packer
lua plugins = require('plugins')

" init language servers
lua require('lsp')

" init general stuffs
lua require('general')

" Configure Neoformat.
let g:neoformat_try_node_exe=1
let g:neoformat_enabled_python=['black']
nnoremap <leader>fo <cmd>Neoformat<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Auto reload file when it changed.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"autocmd Filetype css setlocal tabstop=4

command! ExploreFind let @/=expand("%:t") | execute 'Vexplore' expand("%:h") | normal n

nnoremap f <cmd>Fern . -drawer -reveal=%<cr>

function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
