" Font
set guifont=Mensch\ Regular:h11
"set guifont=Inconsolata\ Medium\ 12
" No audible bell
set vb

" No toolbar
set guioptions-=T

" Use console dialogs
set guioptions+=c

" Local config
if filereadable(".gvimrc.local")
  source .gvimrc.local
endif
