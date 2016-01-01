" Syntax adapted to dark background
set bg=dark
" Tab equals 4 spaces
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4
" Line number
set nu
" Line number in a different color 
highlight LineNr ctermbg=Blue
" Display name of currently opened file
let &titlestring = $USER . "@" . hostname() . "   " . $PWD . "/" . expand("%:t")
if &term == "screen"
 set t_ts=^[k
 set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
 set title
endif