call matchadd('ColorColumn', '\%81v', 100)

" show trailing whitespaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

nnoremap : ;
nnoremap ; :

set cursorline
set expandtab
set hlsearch
set history=200
set list
set nrformats-=octal
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set smartcase

" for zsh autocomplete behavior
set wildmenu
set wildmode=full

" netrw
set nocompatible
filetype plugin on

" include the initial cwd in the search path
set path+=%:h/**

" auto-indent
filetype plugin indent on
