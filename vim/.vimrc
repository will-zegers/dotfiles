set nocompatible

call matchadd('ColorColumn', '\%101v', 100)

" show trailing whitespaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

" leader key stuff
let mapleader=" "
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>s :vsplit<CR>:w<CR>
nnoremap <leader>i :split<CR>:w<CR>
nnoremap <leader>< :bprevious<CR>
nnoremap <leader>> :bnext<CR>
nnoremap <leader>d :bdel<CR>
nnoremap <leader>. :set invnumber invrelativenumber<CR>
nnoremap <leader>p :set invpaste paste?<CR>

" keep cursor at same spot when appending lines
nnoremap J mzJ`z

" cursor follows lines in visual mode to move highlighted text up and down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" swap role of ; and : (i.e. use ';' to run Ex commands)
nnoremap : ;
nnoremap ; :

nnoremap <C-l> :noh<CR>

" fugitive
nnoremap <leader>gss :Git<CR>
nnoremap <leader>gd  :Git diff<CR>
nnoremap <leader>ga  :Git add %<CR>
nnoremap <leader>gbl :Git blame<CR>

" NERDTree
nnoremap <f2> :NERDTree<CR>
nnoremap <leader>n :NERDTree<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber"

" FZF
nnoremap <leader>ff :FZF<CR>
nnoremap <leader>fb :Buffers<CR>

"show open buffers
nnoremap <f4> :buffers<CR>
nnoremap <leader>b :buffers<CR>

" better looking colorscheme with tmux
colorscheme slate

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
set undofile

" for zsh autocomplete behavior
set wildmenu
set wildmode=full

" netrw
filetype plugin on

" include the initial cwd in the search path
set path+=%:h/**

" auto-indent
filetype plugin indent on

" use ripgrep (rg) instead of native vimgrep
runtime plugin/grepper.vim
let g:grepper.rg = {
    \ 'grepprg': 'rg -H --no-heading --vimgrep --smart-case',
    \ 'grepformat': '%f:%l:%c:%m,%f',
    \ 'escape':     '\^$.*+?()[]{}|',
\}
nnoremap <Leader>g :Grepper -tool rg<CR>
nnoremap <Leader>G :Grepper -tool rg -cword -noprompt<CR>

nnoremap <leader>zr :!zig run %<CR>
nnoremap <leader>zb :!zig build %<CR>
nnoremap <leader>zt :!zig test %<CR>

