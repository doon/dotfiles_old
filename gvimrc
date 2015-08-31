" Font
if has("gui_macvim")
  set guifont=Hack:h14
elseif has("gui_gtk2")
  set guifont=Mensch\ 10
endif
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
