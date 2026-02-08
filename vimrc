" Minimal server vimrc
" No plugins, works everywhere

" Basics
set nocompatible
syntax on
filetype plugin indent on

" Line numbers
set number
set relativenumber

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation (4 spaces)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Display
set showmatch
set cursorline
set showcmd
set laststatus=2
set ruler
set wildmenu
set scrolloff=5

" Status line
set statusline=%f\ %m%r%h%w\ [%{&ff}]\ [%Y]\ %=[%l/%L,\ %c]\ %p%%

" Behavior
set backspace=indent,eol,start
set hidden
set autoread
set encoding=utf-8

" No annoying sounds
set noerrorbells
set novisualbell

" No swap/backup (optional - comment out if you want them)
set noswapfile
set nobackup
set nowritebackup

" Better splits
set splitbelow
set splitright

" Quick pairs (leader is \)
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i
inoremap <leader>{ {}<ESC>i

" Clear search highlight with Escape
nnoremap <silent> <Esc> :nohlsearch<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
