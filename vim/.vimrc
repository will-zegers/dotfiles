call matchadd('ColorColumn', '\%101v', 100)

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
nnoremap <leader>i :split<CR>:w<CR>
nnoremap <leader>< :bprevious<CR>
nnoremap <leader>> :bnext<CR>
nnoremap <leader>d :bdel<CR>
nnoremap <leader>. :set invnumber invrelativenumber<CR>
nnoremap <leader>p :set invpaste paste?<CR>

" swap role of ; and : (i.e. use ';' to run Ex commands)
nnoremap : ;
nnoremap ; :

nnoremap  :noh<CR>

" Neovim
nnoremap <C-a> :terminal<CR>i
if has('nvim')
    tnoremap <Esc> <C-\><C-N>
    tnoremap <C-[> <C-\><C-N>
endif

" NERDTree
nnoremap <f2> :NERDTree<CR>
nnoremap <leader>n :NERDTree<CR>
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber"

" FZF
nnoremap <C-f> :FZF<CR>
nnoremap <C-b> :Buffers<CR>

" open git blame on current file with F3
nnoremap <f3> :!git blame %<CR>
nnoremap <Leader>gbl :!git blame %<CR>

"show open buffers
nnoremap <f4> :buffers<CR>
nnoremap <leader>b :buffers<CR>

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
runtime plugin/grepper.vim
let g:grepper.rg = {
    \ 'grepprg': 'rg -H --no-heading --vimgrep --smart-case',
    \ 'grepformat': '%f:%l:%c:%m,%f',
    \ 'escape':     '\^$.*+?()[]{}|',
\}
nnoremap <Leader>g :Grepper -tool rg<CR>
nnoremap <Leader>G :Grepper -tool rg -cword -noprompt<CR>

