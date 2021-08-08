let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set encoding=utf8
set t_Co=256
syntax off

set nocp
filetype plugin indent on
set completeopt=longest,menuone

au BufNewFile,BufRead *.html set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.js set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.lua set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.rb set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
au BufNewFile,BufRead *.yml set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

