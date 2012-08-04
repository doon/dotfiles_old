" Use Vim settings, rather then Vi settings (much better!).
set nocompatible
" default to utf-8
set encoding=utf-8
" load pathogen
call pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
  " Press Space to turn off highlighting and clear any message already
  " displayed.
   :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " treat json as javascript
  au BufNewFile,BufRead *.json set ft=javascript
  " go to last edit in file unless it is a git commit message
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

  augroup END
endif

" Softtabs, 2 spaces
set tabstop=2 shiftwidth=2
set smarttab
set expandtab
set list listchars=tab:»·,trail:·

" disable cursor keys in normal mode
" #map <Left>  :echo "Bad Doon: use h!"<cr>
"map <Right> :echo "Bad Doon: use l!"<cr>
"map <Up>    :echo "Bad Doon: use k!"<cr>
"map <Down>  :echo "Bad Doon: use j!"<cr>

if has("statusline") && !&cp
" Always display the status line
  set laststatus=2
  set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y\ Buf:#%n
  set statusline+=%=%c,%l/%L\ %P\ 
  set statusline+=%{fugitive#statusline()}\ \ \ 
endif

" , is the leader character
let mapleader = ","

" No Help, please
nmap <F1> <Esc>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Color scheme
colorscheme solarized
set background=dark
set t_Co=256
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

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

" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <silent> <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" set the command height
set cmdheight=2

augroup myfiletypes
  "clear old autocmds in group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
augroup END

"Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif
