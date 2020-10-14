call matchadd('ColorColumn', '\%81v', 100)

" show trailing whitespaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" swap role of ; and : (i.e. use ';' to run Ex commands)
nnoremap : ;
nnoremap ; :

" (re)generate ctags by pressing F5
nnoremap <f5> :!ctags -R<CR> --languages=C++,Python

" better looking colorscheme with tmux
colorscheme desert

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
