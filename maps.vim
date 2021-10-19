" Disable :wq because I keep accidentally typing it when saving
cmap wq w

" I frequently mistype this:
nmap :W :w

" Visual select the recently psted-in area
nmap ,gp '[v']

" emacs-like motion keys for insert mode
imap <C-A> <ESC>0i
imap <C-E> <ESC>$a
imap <C-B> <ESC>bi
imap <C-F> <ESC>wi

" buffer next, previous, list + goto <buffer>
nmap ,bn :bn<CR>
nmap ,bp :bp<CR>
nmap ,bl :buffers<CR>:e #

" F1: alternate 'esc'
nnoremap <F1> <ESC>

" F3: buffer list
map <f3> :buffers<CR>:e #

" F5: toggle paste mode
nnoremap \tp :set invpaste paste?<cr>
nmap <F5> \tp
imap <F5> <C-O>\tp
set pastetoggle=<F5>

" F7: toggle list mode (aka. visible whitespace)
set listchars=tab:>-,trail:·,eol:$
nnoremap \tl :set invlist list?<CR>
nmap <F7> \tl

" F8: Toggle highlighting of search results
map <silent> <F8> :nohl<CR>

" F9: syntax check (filetype dependent)
autocmd FileType ruby          nnoremap <buffer> <f9> :RuboCop<CR>
autocmd FileType sh            nnoremap <buffer> <f9> :ShellCheck!<CR>
" F10: Save
map <F10> :w<CR>

" Abbreviations
iab YDT <C-R>=strftime("%Y-%m-%d")<CR>
iab YDTT <C-R>=strftime("%F %H:%M:%S")<CR>

""" " Type ,v to edit your ~/.vimrc
nnoremap ,v :edit ~/.config/nvim/init.vim<CR><CR>

" Start nnn in the current file's directory
nnoremap ,n :NnnPicker '%:p:h'<CR>
""" autocmd BufRead,BufNewFile *.json set nowrap
""" 
""" " golang/vim-go: write and format imports on save
""let g:go_fmt_command = "goimports"  " NOT WORKING 2020-09-09  -- goimports removes required imports
let g:go_fmt_command = "gofmt"

nnoremap <silent> ]q :cnext <CR>
nnoremap <silent> [q :cprevious <CR>

" When RuboCop runs, apply new cops since the last point release instead of
" warning about them.
" https://docs.rubocop.org/en/latest/versioning/
let g:vimrubocop_extra_args = "--enable-pending-cops"
