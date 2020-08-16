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
set expandtab
set tabstop=4
set scroll=16
set autoread
set wildmenu
set splitbelow
set splitright
set termguicolors
set scrolloff=16 
set incsearch
filetype plugin indent on
filetype on

" Disable mouse.
set mouse=

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'

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

" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" https://github.com/mbbill/undotree
Plug 'mbbill/undotree'

call plug#end()

" Configure vim-polyglot for go.
let g:go_highlight_build_constraints=1
let g:go_highlight_extra_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_types=1
let g:go_highlight_function_parameters=1
let g:go_highlight_function_calls=1
let g:go_highlight_generate_tags=1
let g:go_highlight_format_strings=1
let g:go_highlight_variable_declarations=1
let g:go_auto_sameids=1

" Configure gruvbox-material plugin.
let g:gruvbox_contrast_dark='hard'
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
let g:gruvbox_contrast_dark='hard'

" Configure fzf.vim plugin.
let $FZF_DEFAULT_OPTS='--reverse'

" Configure netrw.
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=-32
let g:netrw_browse_split=4
let g:netrw_altv=1

" Change the style.
colorscheme gruvbox
set background=dark

" Keys mapping.
let mapleader=" "
let g:mapleader=" "
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :BLines<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>
nnoremap <leader>a ggVG
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap j gj
nnoremap k gk
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <C-n> <C-W><
nnoremap <C-m> <C-W>>

" Use <C-space> for trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

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

au FocusGained,BufEnter * :checktime
