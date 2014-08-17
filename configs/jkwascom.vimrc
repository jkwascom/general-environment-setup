set nocompatible
set directory=~/.vim/swaps
set wildmenu
set autoindent
set tabstop=2
set expandtab
set smartindent
set smarttab
set shiftwidth=0
set nowrap
set nu
set smartcase
set hlsearch 
set incsearch 
set bs=2
set history=5000
set ignorecase
set relativenumber

syntax enable

"don't forget about the ':opt' command
colo elflord
"let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
"if &term == "screen"
  "set t_ts=k
  "set t_fs=\
"endif
"if &term == "screen" || &term == "xterm"
  "set title
"endif


"set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
"hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

"set statusline=%t       "tail of the filename
set statusline=%f       "relative filename with path
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set ls=2

"here on taken from https://github.com/slashbeast/things/tree/master/configs
map <F2> :set nu!<CR>
imap <F2> <C-O>:set nu!<CR>
map <F3> :nohl<CR>
imap <F3> <C-O>:nohl<CR>
map <F4> :set relativenumber!<CR>
imap <F4> <C-O>:set relativenumber!<CR>
set pastetoggle=<F5>
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc') && bufnr(@%) == bufnr($HOME.'/.vimrc') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc'<CR>endif<CR><CR>
nmap <silent> <F11> :Unite -vertical file<CR>
nmap <silent> <C-E> :Unite -vertical file<CR>

nmap <C-W>t <C-W>T
nmap <C-W><C-T> <C-W>t
nmap <C-,> /\.csp/€kh/\.cspbvEyV/"zf
imap  <C-O>:set nu!<CR>
map  :nohl<CR>
inoremap X^H# X^HX^H#
"buffer-stuff
nmap <silent> <C-B>b :bn<CR>
nmap <silent> <C-B>c :bd<CR>
nmap <silent> <C-B>l :ls<CR>
nmap <silent> <C-B>s :w<CR>
nmap <silent> <C-B>z :w<CR>:bn<CR>
nmap <silent> <C-B>q :bd!<CR>
nmap <silent> <C-B><C-Q> :bd!<CR>
imap <TAB> <C-X><C-P>
"syntax on
"colorscheme ron
"set autoindent

" Treat .inc files as .php.
au BufReadPost *.inc set syntax=php

" Comment or uncomment current/selected lines.
map <silent> C :s/^/#/<CR>:nohlsearch<CR>
map <silent> U :s/^#/<CR>:nohlsearch<CR>
" Trim all tralling whitespaces
map <silent> W :s/^\s\+//e<CR>:nohlsearch<CR>

" 4 spaces tabs.
"set tabstop=4

" make \d delete (for real, not cut)
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
	\ if ! exists("g:leave_my_cursor_position_alone") |
	\     if line("'\"") > 0 && line ("'\"") <= line("$") |
	\         exe "normal g'\"" |
	\     endif |
	\ endif

set viminfo=\'100,f1,\"1000,:100,%,<1000
set wrapscan

set rtp+=$POWERLINE_HOME/bindings/vim

call neobundle#rc()
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vinarise.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'Shougo/vesting'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

filetype plugin indent on
" Go ahead and kill any prior search i guess
nohl
