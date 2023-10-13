filetype plugin indent on
syntax enable

set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup
set ignorecase
set smartcase
set encoding=UTF-8
set number
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

nmap Y yy
nnoremap <silent> j gj
nnoremap <silent> k gk

" vim-fugitive
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

" leader
let mapleader=" "
let maplocalleader=" "

" vimtex
" let g:vimtex_compiler_method = 'lualatex'
let g:tex_flavor = 'latex'

" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

" gruvbox
colorscheme gruvbox-material
set background=dark

" Airline
let g:airline_theme = 'gruvbox_material'

" fern.vim
let g:fern#default_hidden=1

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
nnoremap <leader>fr <cmd>Telescope resume<cr>

" Auto reload file when it changed.
autocmd FocusGained * checktime

command! ExploreFind let @/=expand("%:t") | execute 'Vexplore' expand("%:h") | normal n

nnoremap <C-f> <cmd>Fern . -drawer -reveal=%<cr>

function! s:fern_settings() abort
  if !exists("b:fern_is_preview")
    let b:fern_is_preview = 0
  endif
  function! FernPreviewToggle()
    if b:fern_is_preview
      :execute "normal \<Plug>(fern-action-preview:close)"
      :execute "normal \<Plug>(fern-action-preview:auto:disable)"
      nunmap <buffer> <C-d>
      nunmap <buffer> <C-u>
      let b:fern_is_preview = 0
    else
      :execute "normal \<Plug>(fern-action-preview:open)"
      :execute "normal \<Plug>(fern-action-preview:auto:enable)<Plug>(fern-action-preview:open)"
      nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
      nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
      let b:fern_is_preview = 1
    endif
  endfunction

  nmap <silent> <buffer> p :call FernPreviewToggle()<CR>
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

au BufRead,BufNewFile *.tfvars set filetype=terraform
au BufRead,BufNewFile *.tfstate set filetype=json
