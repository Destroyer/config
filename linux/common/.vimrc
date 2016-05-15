set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/Sift'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()            " required
filetype plugin indent on    " required
" ---------------------------------------------------------------
"  Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ---------------------------------------------------------------
" Custom config
" Make backspace behaving normally(allow delete line break)
set backspace=indent,eol,start
" Disable swapfile
set noswapfile
" Search during typing
set incsearch
" Ignore case in search
set smartcase
" Syntax adapted to dark background
" set bg=dark
" Color scheme
colorscheme sift
" Tab equals 4 spaces
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
" Line number
set nu
" Line number size
set numberwidth=6
" Line number in a different color 
highlight LineNr ctermbg=Blue
" See current line
set cursorline
" Set font of the current line 
hi CursorLine term=bold cterm=bold guibg=Grey40
" Command line complation
set wildmenu
" Identation
set autoindent
set smartindent
" Allow mouse use
set mouse=a
" Status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Display name of currently opened file
let &titlestring = $USER . "@" . hostname() . "   " . $PWD . "/" . expand("%:t")
if &term == "screen"
 set t_ts=^[k
 set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
 set title
endif