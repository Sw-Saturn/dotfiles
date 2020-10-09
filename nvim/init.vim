set number
set title
set ambiwidth=double
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set lazyredraw                  " マクロやコマンドを実行する間、画面を再描画しない(スクロールが重くなる対策) 
set ttyfast                     " 高速ターミナル接続を行う(スクロールが重くなる対策)
set scrolloff=10                " 編集中の箇所の周辺のテキストを見ることができる(スクロールする時に下が見える)
set noswapfile                  " スワップファイルを作成しない 
set nobackup
set whichwrap=b,s,[,],<,>,h,l
set backspace=indent,eol,start
set wildmenu
set laststatus=2
set cindent
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set cursorline
set hls
set clipboard=unnamed
set termguicolors
set guifont=JetBrainsMono\ 16
filetype plugin indent on
set background=dark

if &compatible
    set nocompatible " Be iMproved
endif

if 0 | endif
" プラグインが実際にインストールされるディレクトリ
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let s:toml_dir = expand('~/.config/nvim')

" Required:
execute 'set runtimepath^=' . s:dein_repo_dir

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " 起動時に読み込むプラグイン群
    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})

    " 利用時に読み込むプラグイン群
    call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Dein install check
if dein#check_install()
    call dein#install()
endif

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Required:
filetype plugin indent on
colorscheme shades_of_purple
let g:solarized_termcolors=256
syntax on
set t_Co=256

inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
nnoremap <F3> :noh<CR>

set conceallevel=0
let g:vim_json_syntax_conceal = 0

