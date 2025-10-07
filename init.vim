set path+=**

set modelines=0

set autoread

set encoding=utf-8

set visualbell

set backspace=indent,eol,start

set nobackup

set noswapfile

set number

set scrolloff=2

set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set autoindent

set showmode showcmd

set ttyfast lazyredraw

set showmatch

set autochdir

set hidden

"set wildmenu wildmode=list:longest,full

set laststatus=2 statusline=%F

set clipboard=unnamed

set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

set termguicolors
set background=dark

language en_GB.utf8
setlocal spell spelllang=en_gb

let g:netrw_browse_split = 3
" if a tex-file is opened, the filetype should always be set to latex
let g:tex_flavor = "latex"

" Plug section start
call plug#begin()

" Treesitter, for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" COQ, for autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Ok colorschemes
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

" a bar that displays the current mode
Plug 'itchyny/lightline.vim'
" commit message integration in nvim
Plug 'APZelos/blamer.nvim'
" LSP server installer
Plug 'williamboman/mason.nvim'
" LSP server
Plug 'neovim/nvim-lspconfig'
" LSP handshake between Mason and Lspconfig
Plug 'williamboman/mason-lspconfig.nvim'

" Plug section end
call plug#end()

function After_Load()
    " Start Treesitter
    TSToggle highlight
    TSToggle incremental-selection
    TSToggle indent
    " Start COQ
    COQnow --shut-up
    " Start Blamer
    BlamerToggle
endfunction

" Colorscheme

"very dark and slightly cold
"colorscheme sorbet

"matte but not too much contrast, nice colors
"colorscheme edge

"very high contrast, good for C-programming
"colorscheme wildcharm

"matte like edge, but more contrast and brown, looks like christmas
"colorscheme gruvbox-baby

"gruvbox-baby but not too much contrast
colorscheme gruvbox-material

"gruvbox-baby but less red and more like edge, and dark
"colorscheme everforest

" remind nvim that .tex files are used also for latex
autocmd FileType tex setlocal filetype=latex

" Start Treesitter after loading
autocmd VimEnter * ++nested call After_Load()
lua << EOF
    require("mason").setup()
    require("mason-lspconfig").setup()

    require'lspconfig'.clangd.setup{}
    require'lspconfig'.texlab.setup{}
    require'lspconfig'.biome.setup{}
    require'lspconfig'.pyre.setup{}
    require'lspconfig'.pyright.setup{}
    require("lspconfig").ltex.setup({
        settings = {
            ltex = {
                language = "auto"
            }
        },
    })
EOF

" shortcut to display warnings in current line
:noremap <F2> :lua vim.diagnostic.open_float()
