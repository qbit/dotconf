autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

nmap <Leader>bi :PaqInstall<CR>
nmap <Leader>bu :PaqUpdate<CR>
nmap <Leader>bc :PaqClean<CR>

noremap <silent> <Leader>g :GitGutterBufferToggle<CR>
" Open files in horizontal split
nnoremap <silent> <Leader>S :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

command! -bang -nargs=? -complete=dir Files
	\ call fzf#vim#files(<q-args>, {'options': ['--no-color']}, <bang>0)
nmap <C-p> :Files<cr>

highlight OverLength ctermfg=red
match OverLength /\%79v.\+/

set dir=~/.swaps
set nolist
set ruler
set mouse-=a


au User lsp_setup call lsp#register_server({
	\ 'name': 'rust-analyzer',
	\ 'cmd': ["rust-analyzer"],
	\ 'allowlist': ['rust'],
\ })

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop26'],
\}

" GitGutter
let g:gitgutter_realtime = 1

nmap <silent> ,/ :let @/=""<CR>

let g:go_fmt_command = "goimports"
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

nnoremap ,o :Files<cr>

nmap <leader>2 :set list!<CR>
nmap <leader>3 :set nu!<CR>
nmap <leader>4 :set paste!<CR>

au BufNewFile,BufRead *.md set noai noshowmatch tw=79
au BufNewFile,BufRead *.md setlocal spell spelllang=en_us tw=79

" text & mutt files
au BufNewFile,BufRead /tmp/*mutt*,/tmp/cvs*,*.txt set noai noshowmatch tw=79
au BufNewFile,BufRead /tmp/*mutt*,/tmp/cvs*,*.txt setlocal spell spelllang=en_us tw=79

au BufNewFile,BufRead /private/var/*/*mutt* set noai noshowmatch tw=79
au BufNewFile,BufRead /private/var/*/*mutt* setlocal spell spelllang=en_us tw=79

" git commits
au BufNewFile,BufRead *.git/COMMIT_EDITMSG set noai noshowmatch tw=79
au BufNewFile,BufRead *.git/COMMIT_EDITMSG setlocal spell spelllang=en_us tw=79

"autocmd BufWritePre * %s/\s\+$//e
nmap <Leader>s :%s/\s\+$//e

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" Restore cursor position
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

