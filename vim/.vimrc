call matchadd('ColorColumn', '\%81v', 100)

" show trailing whitespaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" leader key stuff
let mapleader=","
inoremap <leader>w <Esc>:wa<CR>
nnoremap <leader>w :wa<CR>
inoremap <leader>q <Esc>:q<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>t :tabnew<CR>:NERDTree<CR>
nnoremap <leader>s :vsplit<CR>:w<CR>
noremap <leader>i :split<CR>:w<CR>
nnoremap <leader>b :buffers<CR>
nnoremap <leader>d :bdel<CR>
nnoremap <leader>. :set nonumber norelativenumber<CR>
nnoremap <leader>/ :set number relativenumber<CR>

" swap role of ; and : (i.e. use ';' to run Ex commands)
nnoremap : ;
nnoremap ; :

nnoremap  :noh<CR>

" NERDTree
nnoremap <f2> :NERDTree<CR>
nnoremap <leader>n :NERDTree<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber"

" open git blame on current file with F3
nnoremap <f3> :!git blame %<CR>

"show open buffers
nnoremap <f4> :buffers<CR>

" better looking colorscheme with tmux
colorscheme desert

set cursorline
set encoding=utf-8
set expandtab
set hidden
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

" use ripgrep (rg) instead of native vimgrep
set grepprg=rg\ --vimgrep\ --smart-case
