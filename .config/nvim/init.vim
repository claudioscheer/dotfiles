syntax on
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
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
" Plug 'steelsojka/completion-buffers'
Plug 'neovim/nvim-lspconfig'
Plug 'lervag/vimtex', { 'for' : ['tex', 'latex', 'plaintex']}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sbdchd/neoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
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

" Configure gruvbox plugin.
let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" Configure netrw.
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize=-32
let g:netrw_browse_split=4
let g:netrw_altv=1

" Configure vimtex plugin.
let g:tex_flavor='latex'
let g:vimtex_view_skim_activate=1
let g:Tex_GotoError=0

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
nmap <leader>w :wa<CR>
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
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :Neoformat<CR>

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

" Configure nvim-lsp.
lua << END
require'lspconfig'.clangd.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.gopls.setup {
cmd = {"gopls", "serve"},
settings = {
gopls = {
analyses = {
unusedparams = true,
},
staticcheck = true,
},
},
}
END

let g:completion_chain_complete_list = [
            \{'complete_items': ['lsp']},
            \{'mode': '<c-p>'},
            \{'mode': '<c-n>'}
            \]
let g:completion_matching_ignore_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Configure neoformat.
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_jsx = ['prettier']
let g:neoformat_enabled_java = ['clangformat']
let g:neoformat_enabled_python = ['black']

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

lua <<EOF
function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
        local result = resp[1].result
        if result and result[1] then
            local edit = result[1].edit
            vim.lsp.util.apply_workspace_edit(edit)
        end
    end

    vim.lsp.buf.formatting()
end
EOF

au FocusGained,BufEnter * :checktime
autocmd BufEnter * lua require'completion'.on_attach()

augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l* lwindow
augroup END

" fun! TrimWhiteSpace()
"     let l:save = winsaveview()
"     keeppatterns %s/\s\+$//e
"     call winrestview(l:save)
" endfun

" augroup trimwhitespace
"     autocmd!
"     autocmd BufWritePre * :call TrimWhiteSpace()
" augroup end
