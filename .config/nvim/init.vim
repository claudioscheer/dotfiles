syntax enable
filetype plugin indent on
filetype on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'nvim-lua/completion-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

Plug 'neovim/nvim-lsp'
Plug 'lervag/vimtex', { 'for' : ['tex', 'latex', 'plaintex']}
call plug#end()

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
set splitbelow
set splitright
set scrolloff=8 
set incsearch
set noerrorbells
set shortmess=I
set hidden
set termguicolors
set conceallevel=0
set spell spelllang=en_us

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

" Configure gruvbox plugin.
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" Configure vimtex plugin.
let g:tex_flavor='latex'

" Configure vim-airline plugin.
let g:airline#extensions#tabline#enabled=1

" Configure fzf.vim plugin.
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:vim_markdown_conceal=0

" Keys mapping.
let mapleader=" "
let g:mapleader=" "

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>o :Files<CR>
nnoremap <leader>i :BLines<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <leader><CR> :terminal<CR>

nnoremap <silent> gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0 <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

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

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

tnoremap <Esc> <C-\><C-n>

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

" Configure nvim-lsp.
lua << END
local nvim_lsp = require'nvim_lsp'
local util = require 'nvim_lsp/util'

nvim_lsp.clangd.setup{}
nvim_lsp.pyls.setup{}
nvim_lsp.gopls.setup{}
nvim_lsp.texlab.setup{}
END

au FocusGained,BufEnter * :checktime
autocmd BufEnter * lua require'completion'.on_attach()
