" ================================
" Basic Settings
" ================================
set number
set title
set ambiwidth=double
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set scrolloff=10
set noswapfile
set nobackup
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set laststatus=2
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set cursorline

filetype plugin indent on
syntax on

" ================================
" Color Scheme
" ================================
set background=dark
colorscheme habamax

" ================================
" Key Mappings
" ================================
inoremap {     {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap (     ()<Left>
inoremap (<CR> (<CR>)<ESC>O
