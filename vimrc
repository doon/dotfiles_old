packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tsaleh/vim-align')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('lifepillar/vim-solarized8')
call minpac#add('rust-lang/rust.vim')

" default to utf-8
set encoding=utf-8
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

let mapleader = "\<Space>"

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backup
set history=50    " keep 50 lines of command line history
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set ignorecase    " ignore case when searching
set smartcase     " unless we have at least 1 cap
set title         " set our title when running in term
set showmatch

syntax on
set hlsearch
" Press Space to turn off highlighting and clear any message already
" displayed.
:nnoremap <leader> <leader> :nohlsearch<Bar>:echo<CR>

" Softtabs, 2 spaces
set tabstop=2 shiftwidth=2
set smarttab
set expandtab
set list listchars=tab:»·,trail:·
set autoindent

" No Help, please
nmap <F1> <Esc>

" Color scheme
set termguicolors
set background=dark
colorscheme solarized8
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" Numbers
set numberwidth=4
if exists("&relativenumber")
  set relativenumber
else
  set number
endif

" allow background buffers w/o saving
set hidden

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" set the command height
set cmdheight=2


" cleanup whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" avoid escape
inoremap jk <Esc>
inoremap kj <Esc>

"Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
