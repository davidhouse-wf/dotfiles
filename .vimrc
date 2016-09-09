let mapleader=","
inoremap jk <Esc>

set backspace=indent,eol,start
noremap <leader>W :w !sudo tee % > /dev/null<CR>

nnoremap gb :ls<CR>:b<Space>
set switchbuf=useopen

noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

nnoremap / /\v
vnoremap / /\v
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nnoremap n nzzzv
nnoremap N Nzzzv

" ignore arrows
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

" No startup text
set shortmess=atI

set ruler
set nostartofline
set visualbell
set noerrorbells
set laststatus=2
set nowrap
set formatoptions=qrn1
set textwidth=80
set colorcolumn=+1

set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly

set title
set titleold=
set showcmd

set numberwidth=3
set cpoptions+=n
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set relativenumber
set number
set scrolloff=3

set showmatch
set endofline

set cursorline

set backup
set noswapfile
set undofile
set undolevels=3000
set undoreload=10000

set nocompatible

" tabs as spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftround
set autoindent                 " set on the auto-indent

" default OS clipboard
set clipboard=unnamed

set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildignore+=*.pyc,*.bak
set wildignore+=tags
set wildignorecase

set dictionary=/usr/share/dict/words

set showmode

set fillchars+=vert:│           " better looking for windows separator

" Optimize for fast terminal connections
set ttyfast

" search options
set showmatch
set smartcase
set ignorecase
set gdefault
set hlsearch
set incsearch

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" No empty newlines at file end
set binary
set noeol

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set modeline
set modelines=4

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" Show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set showbreak=↪
set list

" per-directory .vimrc files
set exrc
set secure

" Enable syntax highlighting
" syntax on
if exists("&syntax")
	syntax on
endif

" Enable mouse in all modes
"if exists("&mouse")
"	set mouse=a
"endif

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

if !filereadable(expand("%:p:h")."/Makefile")
	setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
endif

autocmd FileType python setlocal makeprg=python\ %
set autowrite
autocmd FileType python nmap <buffer> <F5> :w<Esc>mwG:r!python %<CR>`.
autocmd FileType python set ai sw=4 sts=4 ts=4 et

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Packages : Vundle
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'tpope/vim-fugitive'

    Bundle 'Lokaltog/vim-distinguished'
    Bundle 'sjl/badwolf'

    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    " Python
    Bundle 'nvie/vim-flake8'
call vundle#end()
filetype plugin indent on

set diffopt+=vertical

set background=dark
try
    colorscheme distinguished
catch /^Vim\%((\a\+)\)\=:E185/
    silent! colorscheme badwolf
    " deal with it
endtry

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11
