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

" fix the clipboard
set clipboard+=unnamedplus

language en_GB.utf8
setlocal spell spelllang=en_gb

let g:netrw_browse_split = 3
" if a tex-file is opened, the filetype should always be set to latex
let g:tex_flavor = "latex"

" Plug section start
call plug#begin()

" COQ, for autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Colorscheme
Plug 'sainnhe/gruvbox-material'

" a bar that displays the current mode
Plug 'itchyny/lightline.vim'
" commit message integration in nvim
Plug 'APZelos/blamer.nvim'

" live tex rendering
Plug 'let-def/texpresso.vim'

" Better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug section end
call plug#end()

" Colorscheme
colorscheme gruvbox-material


function After_Load()
    " Start COQ
    COQnow --shut-up
    " Start Blamer
    BlamerToggle
    " Start tree-sitter
    lua vim.treesitter.start()
endfunction
autocmd VimEnter * ++nested call After_Load()

" remind nvim that .tex files are used also for latex
autocmd BufRead,BufNewFile *.tex setfiletype latex

" shortcut to display warnings in current line
:noremap <F2> :lua vim.diagnostic.open_float()
