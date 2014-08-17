""
"" Basic Setup
""
set nocompatible      " Use vim, no vi defaults
set encoding=utf-8    " Set default encoding to UTF-8
set history=1000      " Store lots of :cmdline history
set syntax=on         " Enable syntax highlighting


""
"" Indentation
""
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""
"" Backups
""
set noswapfile
set nobackup
set nowb


""
"" Editor
""
set nowrap                   " don't wrap lines
set number                   " Show line numbers
set ruler                    " Show line and column number
syntax enable                " Turn on syntax highlighting allowing local overrides
set listchars=""             " Reset the listchars
set listchars=tab:\ \        " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.       " show trailing spaces as dots
set listchars+=extends:>     " The character to show in the last column when wrap is
                             " off and the line continues beyond the right of the screen
set listchars+=precedes:<    " The character to show in the last column when wrap is
                             " off and the line continues beyond the left of the screen


""
"" File Type Settings
""
autocmd FileType markdown setlocal textwidth=80

""
"" Hotkey Functions
""
" - Edit .vimrc
nmap <silent> <F12> :if bufloaded($HOME . '/.vimrc') && bufnr(@%) == bufnr($HOME.'/.vimrc') <CR>w<CR>execute 'source ' . $HOME . '/.vimrc'<CR>bd<CR>else<CR>execute 'tabe ' . $HOME . '/.vimrc'<CR>endif<CR><CR>

" - Run Ruby file
nmap <silent> <F10> :w<CR> :!ruby %<CR>

" - Switch off highlighting
nmap <silent> <F9> :nohl<CR>

" - Prettify punctuation
nmap <silent> <F8> :%s/\v"(.*)"/“\1”/ge<CR> :%s/'/’/ge<CR> :%s/\v--([^-])/—\1/ge<CR>


""
"" NeoBundle
""
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-rails.git'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'Shougo/unite.vim'

call neobundle#end()
filetype off
filetype plugin indent on

NeoBundleCheck


""
"" Colors
""
syntax on
set background=dark
colorscheme base16-default


""
"" Powerline
""
py from powerline.vim import setup as powerline_setup
py powerline_setup()
py del powerline_setup


""
"" NERDTree
""
let NERDTreeShowHidden=1
